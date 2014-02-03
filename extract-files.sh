#!/bin/sh

set -e

export DEVICE=hltekdi
export VENDOR=samsung
./../hlte/extract-files.sh $@
