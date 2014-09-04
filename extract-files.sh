#!/bin/sh

set -e

export VENDOR=samsung
export DEVICE=hltekdi
./../../$VENDOR/hlte-common/extract-files.sh $@
