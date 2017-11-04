#!/bin/bash
##
##
cat *.ftl  | egrep -o "\\$\{([a-zA-Z0-9._-]+)" | sed 's/\${//g'

