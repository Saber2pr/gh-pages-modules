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

if used with `peaceiris/actions-gh-pages`, should set that `keep_files: true`:

```yml
- name: Deploy
  uses: peaceiris/actions-gh-pages@v3
  with:
    keep_files: true # set true to keep submodules
```