> [!IMPORTANT]
> [Use an rsync github action instead](https://pico.sh/faq#how-can-i-use-git-to-sync-my-content)

# scp-publish-action

Action to publish posts to [pico.sh](https://pico.sh) apps.

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
will only have access to your account if there is a breach on github.

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

      - name: publish to prose
        uses: neurosnap/scp-publish-action@main
        with: 
          user: erock 
          key: ${{ secrets.PRIVATE_KEY }}
          src: '*.txt'
          host: prose.sh 
          port: 2323 
```
