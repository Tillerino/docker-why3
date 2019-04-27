#!/bin/bash

ARGS="$@"

CONFIG=
if [ -d /conf ]; then
  echo Using config from host system
  if [ ! -f /conf/.why3.conf ]; then
    cp $HOME/.why3.conf /conf/
  fi
  CONFIG="-C /conf/.why3.conf"
fi

eval $(opam env) && why3 $CONFIG $ARGS
