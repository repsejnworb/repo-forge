package project

import (
	forge "github.com/repsejnworb/repoforger/forge"
	workflows "github.com/repsejnworb/repoforger/forge/workflows"
)

// Per-repo params (override here or in extra files later if needed)
Params: {
	defaultBranch: *"main" | string
	pythonVersion: *"3.12" | string
	repoDesc:      *"Generated from repoforger" | string
}

// Map logical outputs to concrete files; the bootstrap init task will export each key.
Outputs: {
	".github/workflows/ci.yml":      workflows.CI
	".github/workflows/release.yml": workflows.Release
	"lefthook.yml":                  forge.Lefthook
	"cog.toml":                      forge.Cog
	"mise.toml":                     forge.MISE
}

mise: forge.MISE
