# repo-forge

> Centralized repository for bootstrapping and maintaining all **repsejnworb** projects.

`repo-forge` defines and generates sane defaults for:
- ⚙️ Development tooling — [Lefthook](https://github.com/evilmartians/lefthook), [Cocogitto](https://github.com/cocogitto/cocogitto), [mise](https://github.com/jdx/mise), [CUE](https://cuelang.org)
- 🚀 CI & release workflows — [`cocogitto-action`](https://github.com/cocogitto/cocogitto-action), [`softprops/action-gh-release`](https://github.com/softprops/action-gh-release)

### Usage
```bash
# Create a new repo
mise run new myproject
# Rebuild blueprints after editing templates/
mise run build:blueprints
# Sync existing repos to latest module version
mise run sync
```
