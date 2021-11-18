# GitHub Action: Run PHPSTAN with ReviewDog
This action runs [PHP Static Analyzer](https://phpstan.org) with [ReviewDog](https://github.com/reviewdog/reviewdog).

## Inputs
### `github_token`
**Required** Must be in form of `github_token: ${{ secrets.github_token }}`

### `level`
Report level for reviewdog [info,warning,error]. It's same as `-level` flag of reviewdog.
**Default** `warning`

### `phpstan_level`
Report level for phpstan.
**Default** `4`

### `reporter`
Reporter of reviewdog command [github-pr-check,github-check,github-pr-review]. It's same as `-reporter` flag of reviewdog.
**Default** `github-pr-check`

### `target_directory`
**Default** `src`

### `fail_on_error`
Fail on error.
**Default** `false`

### `args`
This is a catch-all for any other commandline arguments you want to add to PHPStan.
**Default** ''

## Usage
```yml

phpstan-linter:
    name: PHPStan
    runs-on: ubuntu-latest
    steps:
        -   name: Check out code into the workspace
            uses: actions/checkout@v2
        -   name: Run php check code with reviewdog
            uses: GeneaLabs/action-reviewdog-phpstan@1.0.0
            with:
                github_token: '${{ github.token }}'
                level: 'error'
                fail_on_error: 'false'
                phpstan_level: 4
                reporter: 'github-pr-review'
                target_directory: 'src'
```
