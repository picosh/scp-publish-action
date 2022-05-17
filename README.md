# lists-publish-action

Action to publish posts to [lists.sh](https://lists.sh)

## Required params

- `user`: SSH User name
- `key`: Private key

## Optional params

- `src`: Source dir to deploy
- `host`: SSH address
- `port`: SSH Port

## To publish

You will need to copy your ssh private key into a secret in your github repo.
This means your key will be accessible from github.  It is highly recommended
that you create a separate key specifically for github that way the private key
will only have access to your [lists.sh](https://lists.sh) account if there is a breach on github.

### Example

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
          user: erock 
          key: ${{ secrets.PRIVATE_KEY }}
          src: '*.txt'
          host: lists.sh 
          port: 2323 
```
