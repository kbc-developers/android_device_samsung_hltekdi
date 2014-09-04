#!/bin/sh

set -e

export VENDOR=samsung
export DEVICE=hltekdi
./../../$VENDOR/hlte-common/setup-makefiles.sh $@
