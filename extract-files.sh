#!/bin/sh

set -e

export DEVICE=hltekdi
export VENDOR=samsung
./../hlte-common/extract-files.sh $@
