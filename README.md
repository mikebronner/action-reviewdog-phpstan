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
        -   name: Install dependencies for PHPStan
            uses: php-actions/composer@v5
            with:
                php_version: 7.4
                version: 2
                level: 3
                command: install --no-scripts --ignore-platform-reqs
        -   name: Run php check code with reviewdog
            uses: GeneaLabs/action-reviewdog-phpstan@1.0.0
            with:
                github_token: '${{ github.token }}'
                level: 'error'
                phpstan_level: 4
                reporter: 'github-pr-review'
                target_directory: 'src'
```
