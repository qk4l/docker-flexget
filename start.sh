#!/bin/bash
CONFIG_LOCK=~/.flexget/.config-lock
if [[ -f $CONFIG_LOCK ]]; then
    rm $CONFIG_LOCK
fi
flexget $@
