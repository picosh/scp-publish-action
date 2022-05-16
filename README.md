# lists-publish-action

Action to publish posts to [lists.sh](https://lists.sh)

## Required params

- `user`: SSH User name
- `key`: Private key

## Optional params

- `src`: Source dir to deploy
- `host`: SSH address
- `remote`: Remote dir path
- `port`: SSH Port

### To publish

## Example

```yml
name: ci

on:
  push:
    branches:
      - main

jobs:
  build:
    runs-on: ubuntu-latest
    name: Build and Deploy

    steps:
      - uses: actions/checkout@master

      - name: publish to lists.sh
        uses: neurosnap/lists-publish-action@main
        with:
          src: '*.txt'
          host: ${{ secrets.SSH_HOST }}
          port: ${{ secrets.SSH_PORT }}
          user: ${{ secrets.SSH_USER }}
          key: ${{ secrets.SSH_KEY }}
```
