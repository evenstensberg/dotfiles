#!/bin/sh

# nvm
curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.35.3/install.sh | bash

# node 10
nvm install 10

# homebrew
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install.sh)"

# google chrome
temp=$TMPDIR$(uuidgen)
mkdir -p $temp/mount
curl https://dl.google.com/chrome/mac/stable/GGRO/googlechrome.dmg > $temp/1.dmg
yes | hdiutil attach -noverify -nobrowse -mountpoint $temp/mount $temp/1.dmg
cp -r $temp/mount/*.app /Applications
hdiutil detach $temp/mount
rm -r $temp

# vscode

temp=$TMPDIR$(uuidgen)
mkdir -p $temp/mount
curl https://go.microsoft.com/fwlink/?LinkID=620882 > $temp/1.dmg
yes | hdiutil attach -noverify -nobrowse -mountpoint $temp/mount $temp/1.dmg
cp -r $temp/mount/*.app /Applications
hdiutil detach $temp/mount
rm -r $temp

# zsh
sh -c "$(curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"

# bash profiles

# add vscode to bash profile
cat << EOF >> ~/.bash_profile
source ~/.profile

# OPAM configuration
. /Users/myName/.opam/opam-init/init.sh > /dev/null 2> /dev/null || true
if which rbenv > /dev/null; then eval "$(rbenv init -)"; fi

export PATH="\$PATH:/Applications/Visual Studio Code.app/Contents/Resources/app/bin"
EOF


cat << EOF >> ~/.bash_prompt
default_username=evenstensberg

# Automatically trim long paths in the prompt (requires Bash 4.x)
PROMPT_DIRTRIM=2

set_prompts() {

    local black="" blue="" bold="" cyan="" green="" orange="" \
          purple="" red="" reset="" white="" yellow=""

    local dateCmd=""

        tput sgr0 # Reset colors

        bold=$(tput bold)
        reset=$(tput sgr0)

        # Solarized colors
        # (https://github.com/altercation/solarized/tree/master/iterm2-colors-solarized#the-values)
        black=$(tput setaf 0)
        blue=$(tput setaf 33)
        cyan=$(tput setaf 37)
        green=$(tput setaf 190)
        orange=$(tput setaf 172)
        purple=$(tput setaf 141)
        red=$(tput setaf 124)
        violet=$(tput setaf 61)
        magenta=$(tput setaf 9)
        white=$(tput setaf 255)
        yellow=$(tput setaf 136)

    # Only show username/host if not default
    function usernamehost() {
	userStyle="${orange}";
        userhost=""
        userhost+="\[${userStyle}\]$USER "
        userhost+="${white}at "
        userhost+="${orange}$HOSTNAME "
        userhost+="${white}in"

        if [ $USER != "$default_username" ]; then echo $userhost ""; fi
    }


 
	light="${orange}\e[5m∆ \e[25m ${orange}${reset}"

    # ------------------------------------------------------------------
    # | Prompt string                                                  |
    # ------------------------------------------------------------------
    PS1="\[\033]0;\w\007\]"
    PS1+="\n\[$bold\]"
    PS1+="\[$(usernamehost)\]"                              # username at host
    PS1+="\[$green\]\w"                                     # working directory
    PS1+="\n"
    PS1+="\[$reset$white\]\\$ \[$reset\]"
    export PS1

    # ------------------------------------------------------------------
    # | Subshell prompt string                                         |
    # ------------------------------------------------------------------

    export PS2="⚡ "

    # ------------------------------------------------------------------
    # | Debug prompt string  (when using `set -x`)                     |
    # ------------------------------------------------------------------

    # When debugging a shell script via `set -x` this tricked-out prompt is used.

    # The first character (+) is used and repeated for stack depth
    # Then, we log the current time, filename and line number, followed by function name, followed by actual source line

    # FWIW, I have spent hours attempting to get time-per-command in here, but it's not possible. ~paul
    export PS4='+ \011\e[1;30m\t\011\e[1;34m${BASH_SOURCE}\e[0m:\e[1;36m${LINENO}\e[0m \011 ${FUNCNAME[0]:+\e[0;35m${FUNCNAME[0]}\e[1;30m()\e[0m:\011\011 }'


    # shoutouts:
    #   https://github.com/dholm/dotshell/blob/master/.local/lib/sh/profile.sh is quite nice.
    #   zprof is also hot.

}

set_prompts
unset set_prompts
EOF


cat << EOF >> ~/.bashrc
export PATH=$HOME/depot_tools:$PATH
export ANDROID_HOME=$HOME/Library/Android/sdk
export PATH=$PATH:$ANDROID_HOME/tools
export PATH=$PATH:$ANDROID_HOME/platform-tools
export GMAIL_USERNAME=«evenstensberg@gmail.com»
export LD_LIBRARY_PATH=$HOME/usr/local/include
export PATH="/usr/local/opt/python/libexec/bin:$PATH"

alias npm-offline="npm --cache-min 9999999 "
EOF

cat << EOF >> ~/.zshrc
# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:/usr/local/bin:$PATH

export GOOGLE_APPLICATION_CREDENTIALS=/foo/bar
export PROJECT_ID=yourbar

# Path to your oh-my-zsh installation.
export ZSH="/Users/evenstensberg/.oh-my-zsh"

# Set name of the theme to load --- if set to "random", it will
# load a random theme each time oh-my-zsh is loaded, in which case,
# to know which specific one was loaded, run: echo $RANDOM_THEME
# See https://github.com/robbyrussell/oh-my-zsh/wiki/Themes
ZSH_THEME="robbyrussell"

# Set list of themes to pick from when loading at random
# Setting this variable when ZSH_THEME=random will cause zsh to load
# a theme from this variable instead of looking in ~/.oh-my-zsh/themes/
# If set to an empty array, this variable will have no effect.
# ZSH_THEME_RANDOM_CANDIDATES=( "robbyrussell" "agnoster" )

# Uncomment the following line to use case-sensitive completion.
# CASE_SENSITIVE="true"

# Uncomment the following line to use hyphen-insensitive completion.
# Case-sensitive completion must be off. _ and - will be interchangeable.
# HYPHEN_INSENSITIVE="true"

# Uncomment the following line to disable bi-weekly auto-update checks.
# DISABLE_AUTO_UPDATE="true"

# Uncomment the following line to change how often to auto-update (in days).
# export UPDATE_ZSH_DAYS=13

# Uncomment the following line to disable colors in ls.
# DISABLE_LS_COLORS="true"

# Uncomment the following line to disable auto-setting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment the following line to enable command auto-correction.
# ENABLE_CORRECTION="true"

# Uncomment the following line to display red dots whilst waiting for completion.
# COMPLETION_WAITING_DOTS="true"

# Uncomment the following line if you want to disable marking untracked files
# under VCS as dirty. This makes repository status check for large repositories
# much, much faster.
# DISABLE_UNTRACKED_FILES_DIRTY="true"

# Uncomment the following line if you want to change the command execution time
# stamp shown in the history command output.
# You can set one of the optional three formats:
# "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd"
# or set a custom format using the strftime function format specifications,
# see 'man strftime' for details.
# HIST_STAMPS="mm/dd/yyyy"

# Would you like to use another custom folder than $ZSH/custom?
# ZSH_CUSTOM=/path/to/new-custom-folder

# Which plugins would you like to load?
# Standard plugins can be found in ~/.oh-my-zsh/plugins/*
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(git osx tmux web-search wd)

source $ZSH/oh-my-zsh.sh

# User configuration

# export MANPATH="/usr/local/man:$MANPATH"

# You may need to manually set your language environment
# export LANG=en_US.UTF-8

# Preferred editor for local and remote sessions
# if [[ -n $SSH_CONNECTION ]]; then
#   export EDITOR='vim'
# else
#   export EDITOR='mvim'
# fi

# Compilation flags
# export ARCHFLAGS="-arch x86_64"

# Set personal aliases, overriding those provided by oh-my-zsh libs,
# plugins, and themes. Aliases can be placed here, though oh-my-zsh
# users are encouraged to define aliases within the ZSH_CUSTOM folder.
# For a full list of active aliases, run `alias`.
#
# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"

# The next line updates PATH for the Google Cloud SDK.
if [ -f '/Users/foo/bar' ]; then . '/Users/foo/bar'; fi

# The next line enables shell command completion for gcloud.
if [ -f '/Users/foo/bar' ]; then . '/Users/foo/bar'; fi

EOF

cat << EOF >> ~/.profile
for file in ~/.{extra,bashrc,bash_prompt,exports,aliases,functions}; do
    [ -r "$file" ] && source "$file"
done
unset file
EOF

cat << EOF >> ~/.npmrc
;;;;
; npm userconfig file
; this is a simple ini-formatted file
; lines that start with semi-colons are comments.
; read `npm help config` for help on the various options
;;;;

//registry.npmjs.org/myAuthToken
license=MIT
author=Even
prefix=/usr/local
init-license=MIT

;;;;
; all options with default values
;;;;
; access=null
; allow-same-version=false
; always-auth=false
; also=null
; audit=true
; audit-level=low
; auth-type=legacy
; bin-links=true
; browser=null
; ca=null
; cafile=undefined
; cache=/Users/myName/.npm
; cache-lock-stale=60000
; cache-lock-retries=10
; cache-lock-wait=10000
; cache-max=null
; cache-min=10
; cert=null
; cidr=null
; color=true
; depth=null
; description=true
; dev=false
; dry-run=false
; editor=vi
; engine-strict=false
; force=false
; fetch-retries=2
; fetch-retry-factor=10
; fetch-retry-mintimeout=10000
; fetch-retry-maxtimeout=60000
; git=git
; git-tag-version=true
; commit-hooks=true
; global=false
; globalconfig=/usr/local/etc/npmrc
; global-style=false
; group=20
; ham-it-up=false
; heading=npm
; if-present=false
; ignore-prepublish=false
; ignore-scripts=false
; init-module=/Users/myName/.npm-init.js
; init-author-name=
; init-author-email=
; init-author-url=
; init-version=1.0.0
; init-license=MIT
; json=false
; key=null
; legacy-bundling=false
; link=false
; local-address=undefined
; loglevel=notice
; logs-max=10
; long=false
; maxsockets=50
; message=%s
; metrics-registry=null
; node-options=null
; node-version=10.4.1
; offline=false
; onload-script=null
; only=null
; optional=true
; otp=null
; package-lock=true
; package-lock-only=false
; parseable=false
; prefer-offline=false
; prefer-online=false
; prefix=/usr/local/Cellar/node/10.4.1
; preid=
; production=false
; progress=true
; proxy=null
; https-proxy=null
; noproxy=null
; user-agent=npm/{npm-version} node/{node-version} {platform} {arch}
; read-only=false
; rebuild-bundle=true
; registry=https://registry.npmjs.org/
; rollback=true
; save=true
; save-bundle=false
; save-dev=false
; save-exact=false
; save-optional=false
; save-prefix=^
; save-prod=false
; scope=
; script-shell=null
; scripts-prepend-node-path=warn-only
; searchopts=
; searchexclude=null
; searchlimit=20
; searchstaleness=900
; send-metrics=false
; shell=/bin/bash
; shrinkwrap=true
; sign-git-commit=false
; sign-git-tag=false
; sso-poll-frequency=500
; sso-type=oauth
; strict-ssl=true
; tag=latest
; tag-version-prefix=v
; timing=false
; tmp=/var/folders/tg/ly8lmnpj0_b81w6dl0p4s8d80000gn/T
; unicode=true
; unsafe-perm=true
; update-notifier=true
; usage=false
; user=0
; userconfig=/Users/myName/.npmrc
; umask=18
; version=false
; versions=false
; viewer=man
; _exit=true
; globalignorefile=/usr/local/etc/npmignore

EOF


brew install git

brew install tree

echo "Done! Now install Slack https://slack.com/intl/en-no/
