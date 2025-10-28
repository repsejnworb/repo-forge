package lefthook

Lefthook: {
	"commit-msg": {
		commands: {
			conventional: {
				run:  "cog check -i {commit_msg_file}"
				skip: false
			}
		}
	}

	// Optional: enable later if you want local fmt/lint/test before commit
	// `pre-commit`: {
	//   parallel: true
	//   commands: {
	//     fmt:  { run: "mise run fmt" }
	//     lint: { run: "mise run lint" }
	//     test: { run: "mise run test" }
	//   }
	// }
}
