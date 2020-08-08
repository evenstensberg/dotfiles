# Dotfiles 🌍

A collection of my various dotfiles. Most of the bash scripts I have is based on [this](https://github.com/paulirish/dotfiles) from [Paul Irish](https://twitter.com/paul_irish). ♥️

## gitconfig 📈

I'm using Git with GPG (RSA 4096 bit encryption), for a walkthrough on how it is done, [this is the place](https://help.github.com/articles/signing-commits/).

## bash profile files 📊

Most of these are written by Paul, so I can't take any credit for them. I've customized my terminal to make it look esthetic from my point of view.

![alt text](https://raw.githubusercontent.com/ev1stensberg/dotfiles/master/image.png)

## perf.sh 🔥

Benchmarks a node application using v8 compile cache versus not using it, tested to measure v8 + std/esm modules

## regression.sh 🚀

Used to search and stop test suites running in infinite trying to find a regression bug or for smoketests for a specific error message.

# hexdumpi.sh ☄️

Used for util in my [OS](https://github.com/uit-inf-2201-s19/uit-inf-2201-s19.github.io) course to get diffs of boot sectors in RAM in byteformat.

# curl-files.sh 🤯

Does a curl of a base url together with names of files supplied as a path to a text file and downloads the files


# imagesnap.sh

Takes snapshot when mac wakes up, install through `brew install sleepwatcher` and run launch utils after that. 

# OpenSSL (/cert/*.sh)

Bypasses issue with self-signed certificates in Chrome and Safari, heavily copy pasta from [here](https://stackoverflow.com/questions/7580508/getting-chrome-to-accept-self-signed-localhost-certificate/43666288#43666288) but I like my scripts stacked one place, all attribution goes to author there.

##### change pwd

`cd cert`
##### create a root authority cert
`./cert/create_root_cert_and_key.sh`

##### create a wildcard cert for mysite.com
`./cert/create_certificate_for_domain.sh mysite.com`

##### or create a cert for www.mysite.com, no wildcards
`./cert/create_certificate_for_domain.sh www.mysite.com www.mysite.com`

> Additional Resource: https://www.freecodecamp.org/news/openssl-command-cheatsheet-b441be1e8c4a/

> chrome://flags/#allow-insecure-localhost

# rm-node-modules.sh

Removes node modules on mac

# list-io-devices.sh

Lists currently active io devices on OSX.

# airport.sh

Outputs metadata about the network you are in, such as frequency and channels.

# windows-scripts

Scripts used for windows env

# apple-scripts

Scripts used for OSX

# screen.sh

Ssh but with session interrupts 

# entitlements.xml

[Gdb code-signing on OSX](https://superuser.com/a/1454510)

# remove-sigh.sh

Remove a ssh key


# backup.sh

Backup of dotfile in home folder

# new-mac.sh


Setup env for new macbook

