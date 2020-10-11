# GitHub Action: Run PHPSTAN with ReviewDog
This action runs [PHP Static Analyzer](https://phpstan.org) with [ReviewDog](https://github.com/reviewdog/reviewdog).

## Inputs
### `github_token`
**Required** Must be in form of `github_token: ${{ secrets.github_token }}`

### `level`
Report level for reviewdog [info,warning,error]. It's same as `-level` flag of reviewdog.
**Default** `warning`

### `reporter`
Reporter of reviewdog command [github-pr-check,github-check,github-pr-review]. It's same as `-reporter` flag of reviewdog.
**Default** `github-pr-check`

### `target_directory`
**Default** `src`

### `args`
This is a catch-all for any other commandline arguments you want to add to PHPStan.
**Default** ''

## Usage
```yml
# name: Laravel Package Tests

# on:
#   push:
#     branches: [ master, develop ]
#   pull_request:
#     branches: [ master, develop ]

# jobs:
  phpstan-linter:
    name: PHPStan
    runs-on: ubuntu-latest
    steps:
      - name: Check out code into the workspace
        uses: actions/checkout@v2
      - name: Run php check code with reviewdog
        uses: GeneaLabs/action-reviewdog-phpstan
```
