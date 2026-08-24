# Dotfiles 🌍

A collection of my various dotfiles.


### Linking


- `csrutil disable` in bootmode (Hold Cmd+R on startup, navigate to rootshell) (Optional when symlinking `/usr/bin`)

- `cp /usr/local/<script>`

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

# exit-server.sh

Find PID and exit server at given port

# do-command.sh

Execute a command n times

# now.sh

Ls with date modified

# donation.sh

Donate script every Monday


# Ignore error in stdout(stderr)

```sh
$ cat /etc/ssh/ssh_host_dsa_key 2< /dev/null
```

# delete-attri.sh 
Remove json prop from a list of json files
```sh
$ sh ./delete-attri.sh ./folder/ mainObject.property
```

# mv-prop.sh 
move json prop from an object to its parent
```sh
$ sh ./mv-prop.sh ./myFolder mainObject objectProp
```

## unzip.sh

Unzips all zips in cwd.

```sh
$ sh ./unzip.sh
```

## restart-cron.sh

Restarts cron/stops current ones

```sh
$ sh ./restart-cron.sh
```

## check-certs.sh

Checks for outdated certificates

```sh
$ sh ./check-certs.sh
```

## count-files.sh

Counts number of files in a folder

```sh
$ sh ./count-files.sh
```

## fireplace.sh

Nice cozy fireplace in the terminal

```sh
$ sh ./fireplace.sh
```

## master-to-main.sh

Migration command to change default branch

```sh
$ sh ./master-to-main.sh
```

## check-pypi-taken.sh

Check if pypi package name is taken

```sh
$ check-pypi-taken.sh evenstensberg
```

## fix-corruption.sh

Fix system corruption on windows

```sh
$ sh ./windows/fix-corruption.sh
```

## webpack-backup.sh

Clone all repositories (public and private) from the webpack GitHub org into a local `backup` directory. Requires the `gh` CLI to be authenticated.

```sh
$ sh ./webpack-backup.sh
```

## webpack-pull.sh

Pull the latest changes from remote for every repository inside the `backup` directory.

```sh
$ sh ./webpack-pull.sh
```


## org-workflows-on-main.sh

Check the CI status of every repository in a GitHub org, on each repo's own default branch. Requires the `gh` CLI to be authenticated.

```sh
$ bash ./org-workflows-on-main.sh
```

Repositories are checked in parallel and each verdict is printed the moment it lands, so the report fills in as it goes rather than appearing all at once. Lines are therefore in completion order, which is what the `[n/total]` counter is for.

```
[ 1/50] ✔ webpack/sass-loader          main         success    https://github.com/webpack/sass-loader
[ 3/50] ✖ webpack/webpack-dev-server   main         failure    2 failing (Test - windows-latest …) | https://github.com/webpack/webpack-dev-server
[41/50] ✔ webpack/analyse              master       success    https://github.com/webpack/analyse
[48/50] – webpack/hackathon            main         no-ci      no CI configured | https://github.com/webpack/hackathon
```

A summary at the end lists the failing repositories, the ones that could not be verified, and the ones that neither passed nor failed. Exit status is 0 only when every scanned repository was confirmed green.

### States

| State | Meaning |
| --- | --- |
| `success` | Every check on the head commit passed. |
| `failure` | At least one check concluded `failure`, `timed_out`, `startup_failure`, `action_required` or `stale`. |
| `pending` | Checks are still running. |
| `cancelled` | Checks were cancelled and nothing failed — inconclusive, not green. |
| `no-checks` | The repo has active workflows but none ran on the head commit. |
| `no-ci` | No CI configured, or Actions is disabled. |
| `empty` | No default branch. |
| `api-error` / `truncated` / `unknown` | The repo could not be verified. Counted against the exit status. |

### How a verdict is reached

Verdicts are fail-closed: a repository is reported green only when it was actually confirmed green, never because nothing was found to say otherwise.

- The head SHA is resolved once and every subsequent request is pinned to it, so a push landing mid-scan cannot mix checks from two commits.
- Three sources are consulted and merged: legacy commit statuses, check runs, and workflow runs. Workflow runs catch failures that emit no check run at all — a workflow whose YAML fails to parse reports `startup_failure` and nothing on the commit.
- Check runs are paginated in full. A page holds 30 and repos like `webpack/webpack` have 50+, so reading a single page hides real failures behind a green tick.
- Check runs are deduplicated by (app, name), newest first, so a re-run supersedes the attempt it replaced instead of both counting.
- Dependabot's `dynamic/` security-update jobs are ignored — they attach check runs to the head commit but are not the project's CI. Set `INCLUDE_DYNAMIC_RUNS=1` to count them.
- Anything unverifiable — an API error, a short response, a check conclusion the script does not model — is reported as such rather than counted as a pass. A 404 from `/actions/` is recognised as "Actions disabled" and distinguished from a real failure.

### Environment

| Variable | Default | Effect |
| --- | --- | --- |
| `ORG` | `webpack` | Organisation to scan. |
| `INCLUDE_ARCHIVED` | `0` | Scan archived repositories too. |
| `INCLUDE_FORKS` | `0` | Scan forks too. |
| `CANCELLED_IS_FAIL` | `0` | Count cancelled checks as failures. |
| `INCLUDE_DYNAMIC_RUNS` | `0` | Count Dependabot `dynamic/` runs. |
| `JOBS` | `8` | Repositories checked in parallel. |
| `REPO_LIMIT` | `1000` | Max repositories to list; warns if hit. |

Archived repositories and forks are skipped by default, which is usually most of the org — of webpack's 92 repositories, 42 are archived and only 50 are scanned. An archived repo is read-only, so its CI can never be fixed and most would report `no-checks` forever.

```sh
$ ORG=webpack JOBS=8 INCLUDE_ARCHIVED=1 CANCELLED_IS_FAIL=1 bash ./org-workflows-on-main.sh
```

To check a single repository, bypassing the org listing:

```sh
$ bash ./org-workflows-on-main.sh --worker webpack main
```
