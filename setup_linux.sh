#!/bin/bash
cat << "EOF"
              _        _           _   
   __ _ _   _| |_ ___ | |__   ___ | |_ 
  / _` | | | | __/ _ \| '_ \ / _ \| __|
 | (_| | |_| | || (_) | |_) | (_) | |_ 
  \__,_|\__,_|\__\___/|_.__/ \___/ \__|
EOF

set -e
source ~/.bashrc

# Ensure we are in the project directory
cd "$(dirname "$0")"
export PATH=$HOME/.rbenv/bin:$HOME/.rbenv/shims:$PATH
rbenv init -

# Install ruby if not found
command -v ruby >/dev/null 2>&1 || {
  rm -rf ~/.rbenv
  git clone https://github.com/sstephenson/rbenv.git ~/.rbenv
  export PATH="$HOME/.rbenv/bin:$HOME/.rbenv/shims:$PATH"
  eval "$(rbenv init -)"
  git clone https://github.com/sstephenson/ruby-build.git ~/.rbenv/plugins/ruby-build
  rbenv install 2.1.0
}

echo setting ruby version to 2.1.0
cd "$(dirname "$0")"
rbenv init -
rbenv global 2.1.0
rbenv local 2.1.0
gem install bundle
rbenv rehash
bundle install
rbenv rehash
