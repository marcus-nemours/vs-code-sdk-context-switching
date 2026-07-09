# Research: IDE SDK Context Switching

## 1. Seamless Intellisense via Containers
**Is it possible?** Yes. 
When using Dev Containers, VS Code injects the Language Server (e.g., RedHat Java) *inside* the container. It uses the container's `JAVA_HOME` and `PATH`.
- **Finding:** Intellisense is scoped to the container's JDK. If the container has Java 21, the IDE uses Java 21 APIs. Switching containers triggers a reload, updating the entire SDK context automatically.

## 2. Local vs. Container-Based Workflow
**Can a developer write/test inside a container?**
- **Yes.** This is the primary use case for Dev Containers. Performance is near-native on Linux/WSL2.
- **Comparison:**
  - **Local:** Requires installing JDKs, setting `JAVA_HOME`, and managing conflicts.
  - **Container:** Environment is "disposable" and consistent across the team. No "it works on my machine" issues.

## 3. Multiple Java Versions & Instances
**Can multiple versions run at once?**
- **Local:** Yes, but difficult. Requires tools like `SDKMAN!` or manual `PATH` manipulation to ensure processes use the correct binary.
- **VS Code Instances:**
  - **Local Mode:** You can open two windows, but they share the same machine settings. You often have to manually set `java.configuration.runtimes` for each project.
  - **Container Mode:** **Seamless.** You can open Window A in a Java 17 container and Window B in a Java 21 container simultaneously. Each window has its own isolated SDK context.

## Summary Table
| Feature | Local Machine | Dev Containers |
| :--- | :--- | :--- |
| **Intellisense** | Needs local JDK config | Automatic from image |
| **Isolation** | Shared environment | Fully isolated |
| **Multi-version** | Manual (SDKMAN/Path) | Automatic (per window) |
| **Machine Bloat** | High | None |

## 4. Sharing Images vs. Building from Code
**How should developers share environments?**

### Option A: Shared Registry (Pre-built Images)
- **Workflow:** One person creates a `Dockerfile`, builds an image (e.g., `my-company/java-dev:21`), and pushes it to a registry (Docker Hub, GHCR, Azure ACR).
- **Pros:** Fast startup (pulling is faster than building); Absolute consistency.
- **Cons:** Requires a registry; harder to make small "on-the-fly" tweaks.

### Option B: Infrastructure as Code (Local Build)
- **Workflow:** You share the `.devcontainer` folder (including `Dockerfile` or `devcontainer.json`). Each developer's machine builds the image locally.
- **Pros:** No registry needed; transparency (you see exactly what's being installed); easy to customize via Git branches.
- **Cons:** First-time build takes 2-5 minutes.

**Recommendation:** 
Use **Option B** (sharing the code) for development. It allows the environment to evolve alongside the source code. Use **Option A** for CI/CD pipelines to ensure speed.
