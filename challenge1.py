#!/usr/bin/env python3
# encoding: utf-8

import sys

xs = [0]

for l in sys.stdin.readlines():
    y = 0
    for c in l:
        y = y ^ ord(c)
    xs[-1] = xs[-1] ^ y
    xs.append(y)

for x in xs:
    print( format(x, "02x"), end="" )
