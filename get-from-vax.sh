#!/bin/sh

set -e

vax_path=/mnt/hans/rasselbock
repo_path=$(pwd)

if ! [ -z "$(git status -s)" ]
then
    echo repository not clean, please commit first
    exit 1
fi


df > /dev/null

cd $vax_path

if ! [ -z "$(find . -name '*.lsp.*')" ]
then
    echo multiple .lsp file versions found, please purge first
    exit 1
fi

find . -name '*.lsp' | while read file
do
    perl -pe 's/\0//g' < $file > $repo_path/$file
done

cd $repo_dir
git status
