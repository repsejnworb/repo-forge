package forge

MISE: {
	tools: {
		cue:       "latest"
		gh:        "latest"
		cocogitto: "latest"
		lefthook:  "latest"
		// Add language/tool pins per stack (python/go/node) in specific repos
	}

	env: {
		CUE_REGISTRY:     "ghcr.io/repsejnworb"
		MISE_CI_WORKFLOW: "ci.yml"
		MISE_CI_TIMEOUT:  "30m"
	}

	// Core tasks every generated repo gets.
	tasks: {
		test: {
			description: "Run test suite (customize per language)"
			run: ["echo 'TODO: replace with real tests'"]
		}

		fmt: {
			description: "Format sources (customize per language)"
			run: ["echo 'TODO: replace with formatter'"]
		}

		lint: {
			description: "Lint sources (customize per language)"
			run: ["echo 'TODO: replace with linter'"]
		}

		// Manual, controlled release flow
		release: {
			description: "Bump version from Conventional Commits and push tag"
			run: [
				// If you want a hard gate, call: "mise run ci:watch"
				"cog bump --auto",
				"git push && git push --tags",
			]
		}
	}
}
