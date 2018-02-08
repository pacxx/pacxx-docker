#!/bin/sh

set -e
tmp=
trap 'rm -rf "$tmp"' 0
tmp=$(mktemp -d) || exit 2

gpg --homedir="$tmp" --import rocm.gpg.key
gpg --homedir="$tmp" --export 9386B48A1A693C5C >rocm.gpg
	
