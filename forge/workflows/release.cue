package workflows

Release: {
	name: "release"
	on: {push: {tags: ["v*"]}}
	jobs: {
		publish: {
			"runs-on": "ubuntu-latest"
			steps: [
				{uses: "actions/checkout@v4"},
				{name: "Generate changelog"
					id:   "changelog"
					uses: "cocogitto/cocogitto-action@v3"
					with: {command: "changelog", args: "--at ${GITHUB_REF_NAME}"}},
				{name: "Publish GitHub Release"
					uses: "softprops/action-gh-release@v2"
					with: {body: "${{ steps.changelog.outputs.changelog }}"}},
			]
		}
	}
}
