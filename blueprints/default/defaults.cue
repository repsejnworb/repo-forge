package project

import (
	workflows "github.com/repsejnworb/repo-forge/templates/workflows"
	lefthook "github.com/repsejnworb/repo-forge/templates/lefthook"
	cog "github.com/repsejnworb/repo-forge/templates/cog"
	mise "github.com/repsejnworb/repo-forge/templates/mise"
)

// Project-level knobs you can override per repo.
// You can expand this as your standards grow.
Params: {
	defaultBranch: *"master" | string
	pythonVersion: *"3.12" | string
	repoDesc:      *"Generated from repo-forge" | string
}

// Bind those params into templates as needed later. For now we keep it simple.

// Logical outputs (used by mise tasks to export file-by-file)
Outputs: {
	".github/workflows/ci.yml":      workflows.CI
	".github/workflows/release.yml": workflows.Release
	"lefthook.yml":                  lefthook.Lefthook
	"cog.toml":                      cog.Cog
	"mise.toml":                     mise.MISE
}
