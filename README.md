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

## Quick start
1. Ensure Rancher Desktop (or Docker runtime) is running.
2. Open this repo in VS Code with Dev Containers extension installed.
3. Run:

```powershell
./launch-demo.ps1
```

4. In each window terminal, run:

```bash
java -version
```

## IntelliSense validation test
Use this line in both windows:

```java
List.of(1,2,3).reversed();
```

Expected behavior:
- Older example version (Java 17): `reversed()` is undefined.
- Newer example version (Java 21): `reversed()` is supported.

## Documentation
- Runbook: [DEVCONTAINER_SIDE_BY_SIDE_RUNBOOK.md](DEVCONTAINER_SIDE_BY_SIDE_RUNBOOK.md)
- HTML report: [RESEARCH_REPORT.html](RESEARCH_REPORT.html)
