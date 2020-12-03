#!/bin/zsh

set -ev

Crowin_Latest_Build="https://crowdin.com/backend/download/project/twidere-x.zip"

if [[ -d input ]]; then
    rm -rf input
fi

if [[ -d output ]]; then
    rm -rf output
fi
mkdir output

curl -o twidere-x.zip -L ${Crowin_Latest_Build}
unzip -o -q twidere-x.zip -d input
rm -rf twidere-x.zip

swift run