package mise

MISE: {
	tools: {
		// Pin concrete versions later; start with latest during development
		cue:       "latest"
		gh:        "latest"
		cocogitto: "latest"
		lefthook:  "latest"
		// python:   "3.12"
		// node:     "20"
		// go:       "1.23"
	}

	// Minimal tasks for a generated repo; you’ll extend from repo-forge later
	tasks: {
		test: {
			description: "Run test suite"
			run: ["pytest", "-q"] // replace with your stack’s default
		}
		fmt: {
			description: "Format sources"
			run: ["ruff", "format", "."]
		}
		lint: {
			description: "Lint sources"
			run: ["ruff", "check", "."]
		}
	}
}
