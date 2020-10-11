# GitHub Action: Run PHPMD with ReviewDog
This action runs [PHP Mess Detector](https://phpmd.org) with [ReviewDog](https://github.com/reviewdog/reviewdog).

## Inputs
### `github_token`
**Required** Must be in form of `github_token: ${{ secrets.github_token }}`

### `level`
Report level for reviewdog [info,warning,error]. It's same as `-level` flag of reviewdog.
**Default** `warning`

### `reporter`
Reporter of reviewdog command [github-pr-check,github-check,github-pr-review]. It's same as `-reporter` flag of reviewdog.
**Default** `github-pr-check`

### `standard`
Can be any one or more of (in a comma-separated list without spaces):
- `cleancode`
- `codesize`
- `controversial`
- `design`
- `naming`
- `unusedcode`
or a custom rules configuration file path.
**Default** `cleancode,codesize,controversial,design,naming,unusedcode`

### `target_directory`
**Default** `src`

## Usage
```yml
# name: Laravel Package Tests

# on:
#   push:
#     branches: [ master, develop ]
#   pull_request:
#     branches: [ master, develop ]

# jobs:
  phpmd-linter:
    name: PHPMD
    runs-on: ubuntu-latest
    steps:
        - name: Check out code into the workspace
            uses: actions/checkout@v2
        - name: Run php check code with reviewdog
            uses: GeneaLabs/action-reviewdog-phpmd@1.0.0
            with:
                github_token: '${{ github.token }}'
                level: 'warning'
                reporter: 'github-pr-check'
                standard: 'cleancode,codesize,controversial,design,naming,unusedcode'
                target_directory: 'src'
```
