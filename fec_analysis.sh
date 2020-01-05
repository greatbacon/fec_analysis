#!/bin/sh

union="$1"

`ruby strip.ru "$union" >> "$union"_clean.csv`
`ruby count.ru "$union"`
