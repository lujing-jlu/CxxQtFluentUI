# CxxQtFluentUI

Rust + CXX-Qt demo app shipping a Fluent-like QML component library (based on the Rin-UI gallery structure).

## Run
- `cargo run`
- Run a specific page directly: `cargo run -- ListViewPage`

## Smoke test (QML runtime errors)
- Run all pages from navigation config: `python3 CxxQtFluentUI/tools/page_smoke_test.py --timeout 2`
- Run a single page: `python3 CxxQtFluentUI/tools/page_smoke_test.py --page ToastPage --timeout 2`
