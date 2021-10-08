### gh-pages-modules

```yml
name: SubPages-Ci

on:
  workflow_dispatch:
    inputs:
      url:
        description: 'SubPage Clone Url'
        required: true
        
jobs:
  build:
    runs-on: ubuntu-latest
    steps:
      - uses: Saber2pr/gh-pages-modules@v0.0.7
        with:
          url: ${{github.event.inputs.url}} # repo clone url (repo should have branch gh-pages)

```