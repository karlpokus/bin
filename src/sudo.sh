#!/bin/bash

# Pull user system pwd for sudo ops
#
# Requires 1p and SUDO_ASKPASS to point to this file
op read --account <account> "op://vault/item/field"
