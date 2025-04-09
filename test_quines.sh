#!/bin/bash

gcc -O3 -g -std=c99 -Wall -Wextra -Wmissing-prototypes \
  -Wstrict-prototypes -Wold-style-definition quine.c -o quine

./quine | diff quine.c -

ruby quine.rb | diff quine.rb -

