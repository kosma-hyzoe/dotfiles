#!/bin/bash
#
# by eggbean and tachoknight https://gist.github.com/tachoknight/b57da58a3ddb4f3f52f8480a90757a9f

help() {
    cat << EOF
  Options:
   -1  one file per line
   -k  bytes
   -F  classify
   -R  recurse
   -r  reverse
   -d  don't list directory contents
   -G  group directories first *
   -I  ignore [GLOBS]
   -i  show inodes
   -S  sort by file size
   -t  sort by modified time
   -u  sort by accessed time
   -U  sort by created time *
   -X  sort by extension
   -T  tree *
   -L  level [DEPTH] *
   -s  file system blocks
   -g  git status of files *
   -x  list by lines, not columns
   -H  help
    * not used in ls
EOF
    exit
}

exa_opts=()
rev=0

while getopts ':aAt1lFRrdIiTkLsuUSrghxXG' arg; do
  case $arg in
    a) exa_opts+=(-a -a) ;;
    A) exa_opts+=(-a) ;;
    t) exa_opts+=(-s modified); ((++rev)) ;;
    u) exa_opts+=(-us accessed); ((++rev)) ;;
    U) exa_opts+=(-Us created); ((++rev)) ;;
    S) exa_opts+=(-s size); ((++rev)) ;;
    G) exa_opts+=( --group-directories-first) ;;
    r) ((++rev)) ;;
    k) exa_opts+=( -B) ;;
    g) exa_opts+=(--git) ;;
    s) exa_opts+=( -S) ;;
    X) exa_opts+=( -s extension) ;;
    1|l|F|R|d|I|i|T|L|x|h) exa_opts+=(-"$arg") ;;
    H) help ;;
    *) printf 'Error: exa-wrapper\n       -H for help\n' >&2; exit 1
    ;;
  esac
done

shift "$((OPTIND - 1))"

if (( rev == 1 )); then
    exa_opts+=(-r)
fi

if [[ $(git rev-parse --is-inside-work-tree 2> /dev/null) == true ]]; then
  exa --color-scale --color=always --git -gH "${exa_opts[@]}" "$@"
else
  exa --color-scale --color=always -gH "${exa_opts[@]}" "$@"
fi
