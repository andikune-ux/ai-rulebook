# Project Discovery Workflow — V3

1. Inspect repository status, branch, recent changes, and instruction files before editing.
2. Check `.aiignore` and equivalent exclusions before opening files.
3. Detect project types from actual manifests, lockfiles, project files, source layout, build configuration, and CI. A repository may contain multiple platforms.
4. Record languages, frameworks, runtime/toolchain versions, package manager, databases, deployment targets, and legacy constraints.
5. Load all applicable `core/` rules and only the relevant `platforms/<platform>/RULES.md` files.
6. Identify existing architecture, conventions, test commands, build commands, and release process.
7. Use `templates/project-profile.yml` when a durable profile will help.
8. State uncertainty rather than guessing. Ask only when uncertainty blocks safe work.
