#!/usr/bin/env python3
from __future__ import annotations

import argparse
import pathlib
import sys
from dataclasses import dataclass


@dataclass(frozen=True)
class QmlDirEntry:
    kind: str  # "type" | "singleton"
    name: str
    path: str


def parse_qmldir(text: str) -> list[QmlDirEntry]:
    entries: list[QmlDirEntry] = []
    for raw in text.splitlines():
        line = raw.strip()
        if not line or line.startswith("#") or line.startswith("module "):
            continue

        parts = line.split()
        if parts[0] == "singleton":
            if len(parts) < 4:
                continue
            entries.append(QmlDirEntry(kind="singleton", name=parts[1], path=parts[-1]))
            continue

        if len(parts) < 3:
            continue
        entries.append(QmlDirEntry(kind="type", name=parts[0], path=parts[-1]))
    return entries


def main() -> int:
    parser = argparse.ArgumentParser(description="Compare our exported QML types against Rin-UI reference.")
    parser.add_argument(
        "--reference-qmldir",
        default="reference_code/Rin-UI/RinUI/components/qmldir",
        help="Path to reference qmldir",
    )
    parser.add_argument(
        "--our-qmldir",
        default="CxxQtFluentUI/qml/RinUI/components/qmldir",
        help="Path to our qmldir",
    )
    parser.add_argument("--check-files", action="store_true", help="Check that exported paths exist on disk.")
    parser.add_argument("--show-extra", action="store_true", help="Also show extra exports we have.")
    args = parser.parse_args()

    repo_root = pathlib.Path(__file__).resolve().parents[2]
    ref_path = (repo_root / args.reference_qmldir).resolve()
    our_path = (repo_root / args.our_qmldir).resolve()

    if not ref_path.exists():
        print(f"Reference qmldir not found: {ref_path}", file=sys.stderr)
        return 2
    if not our_path.exists():
        print(f"Our qmldir not found: {our_path}", file=sys.stderr)
        return 2

    ref_entries = parse_qmldir(ref_path.read_text(encoding="utf-8"))
    our_entries = parse_qmldir(our_path.read_text(encoding="utf-8"))

    ref_types = {e.name for e in ref_entries if e.kind == "type"}
    our_types = {e.name for e in our_entries if e.kind == "type"}
    ref_singletons = {e.name for e in ref_entries if e.kind == "singleton"}
    our_singletons = {e.name for e in our_entries if e.kind == "singleton"}

    missing_types = sorted(ref_types - our_types)
    missing_singletons = sorted(ref_singletons - our_singletons)

    if missing_types:
        print("Missing types (present in Rin-UI, not exported by us):")
        for name in missing_types:
            print(f"  - {name}")

    if missing_singletons:
        print("Missing singletons (present in Rin-UI, not exported by us):")
        for name in missing_singletons:
            print(f"  - {name}")

    if args.show_extra:
        extra_types = sorted(our_types - ref_types)
        extra_singletons = sorted(our_singletons - ref_singletons)
        if extra_types:
            print("Extra types (exported by us, not in Rin-UI qmldir):")
            for name in extra_types:
                print(f"  - {name}")
        if extra_singletons:
            print("Extra singletons (exported by us, not in Rin-UI qmldir):")
            for name in extra_singletons:
                print(f"  - {name}")

    if args.check_files:
        our_base = our_path.parent
        bad: list[str] = []
        for entry in our_entries:
            # Allow exporting singletons from outside the components dir (../utils etc).
            p = (our_base / entry.path).resolve()
            if not p.exists():
                bad.append(f"{entry.kind} {entry.name}: {entry.path}")
        if bad:
            print("Broken exports (path does not exist):")
            for item in bad:
                print(f"  - {item}")
            return 1

    return 0 if not (missing_types or missing_singletons) else 1


if __name__ == "__main__":
    raise SystemExit(main())

