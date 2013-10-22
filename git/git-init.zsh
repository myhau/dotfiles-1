function git-init-more () {
  git init .
  curl -o  .gitignore --fail --show-error --silent https://raw.github.com/github/gitignore/master/$1.gitignore
}
