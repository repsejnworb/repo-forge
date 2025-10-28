package mise

MISE: {
  tools: {
    cue:       "latest"
    gh:        "latest"
    cocogitto: "latest"
    lefthook:  "latest"
    // Add language/tool pins per stack (python/go/node) in specific repos
  }

  env: {
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

    // Wait for CI of current HEAD to pass (uses gh)
    "ci:watch": {
      description: "Watch latest push-run for HEAD until success"
      usage: """
flag "--workflow <wf>" help="Workflow name/file (defaults to env MISE_CI_WORKFLOW)" default=""
flag "--timeout <dur>" help="Timeout like 15m/45m" default=""
"""
      run: [
        '''
        set -euo pipefail
        sha=$(git rev-parse HEAD)
        wf="${usage_workflow:-${MISE_CI_WORKFLOW}}"
        to="${usage_timeout:-${MISE_CI_TIMEOUT}}"
        args=(-c "$sha" -e push -L 1 --json databaseId -q '.[0].databaseId')
        if [ -n "$wf" ]; then args=(-w "$wf" "${args[@]}"); fi
        id=$(gh run list "${args[@]}" || true)
        [ -n "$id" ] || { echo "No push-run found for $sha"; exit 2; }
        gh run watch "$id" --timeout "$to" --exit-status --compact
        gh run view  "$id" --json headSha,conclusion -q '
          if .conclusion=="success" and .headSha=="'"$(git rev-parse HEAD)"'" then
            "ok"
          else
            halt_error(1)
          end' >/dev/null
        echo "✅ CI green for $(git rev-parse --short HEAD)"
        '''
      ]
    }

    "ci:push-watch": {
      description: "Push current branch then watch CI for HEAD"
      run: ["git push", "mise run ci:watch"]
    }

    // Manual, controlled release flow
    release: {
      description: "Bump version from Conventional Commits and push tag"
      run: [
        // If you want a hard gate, call: "mise run ci:watch"
        "cog bump --auto",
        "git push && git push --tags"
      ]
    }
  }
}