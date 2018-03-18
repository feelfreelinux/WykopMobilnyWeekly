#!/bin/sh

setup_git() {
  git config --global user.email "travis@travis-ci.org"
  git config --global user.name "Travis CI"
}

commit_website_files() {
  git commit -a --message "Autodump version"
}

upload_files() {
  git remote add origin https://${GHPT}@github.com/feelfreelinux/WykopMobilny.git > /dev/null 2>&1
  git push origin master -fq> / dev / null 
  echo -e" Done \ n "
}

setup_git
commit_website_files
upload_files
