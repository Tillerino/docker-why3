#!/bin/bash

ARGS="$@"
eval $(opam env) && why3 $ARGS
