#!/usr/bin/env python3
from __future__ import annotations

import argparse
import os
import re
import subprocess
import sys
from dataclasses import dataclass
from pathlib import Path


@dataclass(frozen=True)
class RunResult:
    page: str
    returncode: int
    timed_out: bool
    output: str


def repo_root() -> Path:
    return Path(__file__).resolve().parents[2]


def extract_pages_from_navigation_config(path: Path) -> list[str]:
    text = path.read_text(encoding="utf-8")
    pages: list[str] = []
    for match in re.finditer(r'\bpage\s*:\s*"([^"]+)"', text):
        pages.append(match.group(1))
    # Preserve order but de-duplicate.
    seen: set[str] = set()
    out: list[str] = []
    for p in pages:
        if p in seen:
            continue
        seen.add(p)
        out.append(p)
    return out


def should_skip(page: str) -> bool:
    if not page:
        return True
    if page == "unexist/page":
        return True
    # Our app expects a page key like "HomePage" (not a URL/path).
    if "/" in page or page.endswith(".qml"):
        return True
    return False


def build_binary(cwd: Path) -> Path:
    subprocess.run(["cargo", "build"], cwd=cwd, check=True)
    binary = cwd / "target" / "debug" / "simple-cxx-qt-app"
    if not binary.exists():
        raise FileNotFoundError(f"Binary not found at {binary}")
    return binary


def run_page(binary: Path, page: str, timeout_s: float) -> RunResult:
    env = dict(os.environ)
    # Keep styling consistent.
    env.setdefault("QT_QUICK_CONTROLS_STYLE", "Basic")
    try:
        proc = subprocess.run(
            [str(binary), page],
            cwd=binary.parent.parent.parent,  # CxxQtFluentUI/
            env=env,
            stdout=subprocess.PIPE,
            stderr=subprocess.STDOUT,
            text=True,
            timeout=timeout_s,
        )
        return RunResult(page=page, returncode=proc.returncode, timed_out=False, output=proc.stdout)
    except subprocess.TimeoutExpired as e:
        def _to_text(v: object) -> str:
            if v is None:
                return ""
            if isinstance(v, str):
                return v
            if isinstance(v, (bytes, bytearray)):
                return bytes(v).decode(errors="replace")
            return str(v)

        return RunResult(
            page=page,
            returncode=124,
            timed_out=True,
            output=_to_text(e.stdout) + _to_text(e.stderr),
        )


def looks_like_qml_error(output: str) -> bool:
    needles = [
        "Failed to load page:",
        "Failed to load ErrorPage:",
        "QQmlComponent: Component is not ready",
        "TypeError:",
        "ReferenceError:",
        "Type ",
        "is not a type",
        "Type ",
        "unavailable",
        "Unable to assign",
        "Binding loop detected",
        "Invalid alias target location",
    ]
    # "Type ..." is too broad; only treat as error if paired with known phrasing.
    strong_needles = [
        "TypeError:",
        "ReferenceError:",
        "Unable to assign",
        "Binding loop detected",
        "Invalid alias target location",
        "Component is not ready",
        "Failed to load page:",
        "unavailable",
        "is not a type",
    ]
    if any(n in output for n in strong_needles):
        return True
    # Fallback: a few specific Qt error prefixes.
    if "file:///" in output and (" error " in output.lower() or "No such file or directory" in output):
        return True
    return False


def main() -> int:
    parser = argparse.ArgumentParser(description="Smoke-test gallery pages by launching the app with an initial page.")
    parser.add_argument(
        "--config",
        default="CxxQtFluentUI/qml/RinUI/components/NavigationConfig.qml",
        help="Path to NavigationConfig.qml (relative to repo root).",
    )
    parser.add_argument("--timeout", type=float, default=6.0, help="Seconds to run each page before killing it.")
    parser.add_argument("--page", action="append", default=[], help="Run only a specific page key (repeatable).")
    args = parser.parse_args()

    root = repo_root()
    config_path = (root / args.config).resolve()
    if not config_path.exists():
        print(f"NavigationConfig not found: {config_path}", file=sys.stderr)
        return 2

    project_dir = root / "CxxQtFluentUI"
    binary = build_binary(project_dir)

    pages = args.page or extract_pages_from_navigation_config(config_path)
    pages = [p for p in pages if not should_skip(p)]
    if not pages:
        print("No pages found to test.", file=sys.stderr)
        return 2

    failures: list[RunResult] = []
    for page in pages:
        result = run_page(binary, page, args.timeout)
        if looks_like_qml_error(result.output):
            failures.append(result)
            print(f"[FAIL] {page}")
        else:
            print(f"[ OK ] {page}")

    if failures:
        print("\nFailures:")
        for f in failures:
            print(f"\n--- {f.page} ---")
            print(f.output.strip())
        return 1

    return 0


if __name__ == "__main__":
    raise SystemExit(main())
