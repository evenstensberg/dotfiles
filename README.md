# Dotfiles

A collection of my various dotfiles. Most of the bash scripts I have is based on [this](https://github.com/paulirish/dotfiles) from [Paul Irish](https://twitter.com/paul_irish).

## gitconfig

I'm using Git with GPG (RSA 4096 bit encryption), for a walkthrough on how it is done, [this is the place](https://help.github.com/articles/signing-commits/).

## bash profile files

Most of these are written by Paul, so I can't take any credit for them. I've customized my terminal to make it look esthetic from my point of view.

## perf.sh

Benchmarks a node application using v8 compile cache versus not using it, tested to measure v8 + std/esm modules

## regression.sh

Used to search and stop test suites running in infinite trying to find a regression bug or for smoketests for a specific error message.