# VS Code SDK Context Switching (Java)

Reference project showing how to run different Java versions side-by-side in VS Code Dev Containers with IntelliSense synchronized to each container version.

## Why this matters
- No host JDK install required.
- Build/run/IntelliSense use the JDK inside each container.
- Different versions can run in parallel in separate VS Code windows.

## Demo examples in this repo
- Java 17 context
- Java 21 context

These are examples only; the approach is version-agnostic.

## Quick Start
1. **Clone** the repo.
2. **Ensure** Rancher Desktop (or Docker runtime) is running.
3. **Run** the launcher script in PowerShell:
   ```powershell
   ./launch-demo.ps1
   ```
4. **Watch** two isolated Java worlds appear!

Each window will attach to its own container with its own Java version (17 and 21) automatically.

## Validation Test (Isolation Check)
Use this line in both windows:
```java
List.of(1,2,3).reversed();
```
- **Java 17 Window:** `reversed()` shows a red squiggle (deprecated/unsupported).
- **Java 21 Window:** Works perfectly.

## Documentation
- Runbook: [DEVCONTAINER_SIDE_BY_SIDE_RUNBOOK.md](DEVCONTAINER_SIDE_BY_SIDE_RUNBOOK.md)
- HTML report: [RESEARCH_REPORT.html](RESEARCH_REPORT.html)
