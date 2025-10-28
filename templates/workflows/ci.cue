package workflows

// CI is a reusable workflow definition.
// You can parameterize it later with fields like `language`, `matrix`, etc.
CI: {
	name: "ci"
	on: {
		push: {branches: ["main"]}
		pull_request: {}
	}
	jobs: {
		test: {
			"runs-on": "ubuntu-latest"
			steps: [
				{uses: "actions/checkout@v4"},
				{
					name: "Set up mise"
					uses: "jdx/mise-action@v2"
				},
				{
					name: "Install tools"
					run:  "mise install"
				},
				{
					name: "Run tests"
					run:  "mise run test"
				},
			]
		}
	}
}
