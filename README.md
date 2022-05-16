# SSH-SCP Deploy action

Action to send  dist files to a remote server with  scp command

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
name: MasterCI

on:
  push:
    branches:
      - master

jobs:
  build:
    runs-on: ubuntu-latest
    name: Build and Deploy

    steps:
      - uses: actions/checkout@master

      - name: Bucket actions
        uses: actions/setup-node@v1
        with:
          node-version: 8
      - run: npm i
      - run: npm run test
      - run: npm run generate
      
      - name: Publish
        uses: nogsantos/scp-deploy@master
        with:
          src: ./dist/*
          host: ${{ secrets.SSH_HOST }}
          port: ${{ secrets.SSH_PORT }}
          user: ${{ secrets.SSH_USER }}
          key: ${{ secrets.SSH_KEY }}
```
