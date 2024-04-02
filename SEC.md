CTF

## Nyttige kommandoer

- egrep 'string' <fil.txt>
- unzip folder.zip
- find . -name fil.txt
- fls -o <bytes> disk
- icat -o 0000360448 disk.flag.img 2371

## Finne human readable format

- find . -type f -size 1033c ! -executable -exec file {} + | grep ASCII
- find . -type f -size 33c -group bandit6 -user bandit7 ! -executable -exec file {} + 2< /dev/null
- grep \\word\\ /tmp/example.txt | cut -d ':' -f 2
