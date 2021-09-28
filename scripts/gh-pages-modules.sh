# config
git config user.name github-actions
git config user.email github-actions@github.com

get_repo_name() {
  echo $1 | tr '/' '\n' | tail -n 1 | tr '.' '\n' | head -n 1
}
# parse
page_name=$(get_repo_name ${{github.event.inputs.url}})
page_url=${{github.event.inputs.url}}

# register
test -d $page_name || git submodule add -f -b gh-pages $page_url $page_name
git submodule update --init --remote $page_name

# deploy
page_url=${{github.event.inputs.url}}
git add .
git commit -a -m "feat: deploy subpage from $page_url"
git push origin gh-pages