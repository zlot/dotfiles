#!/bin/bash

cd "$(dirname "${BASH_SOURCE[0]}")" \
    && . "../utils.sh"

# - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

install_npm_package() {

    execute \
        ". $HOME/.bash.local \
            && npm install --global --silent $2" \
        "$1"

}

# - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

main() {

    print_in_purple "\n   npm\n\n"

    install_npm_package "npm (update)" "npm"
    printf "\n"
    install_npm_package "!nstant-markdown-d" "instant-markdown-d"
    install_npm_package "Babel" "babel-cli"
    install_npm_package "Browserify" "browserify"
    install_npm_package "http-serve" "http-serve"
    install_npm_package "optipng" "optipng"
    install_npm_package "ESlint" "eslint"

}

main
