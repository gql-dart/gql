#!/bin/bash

set -e
set -u

mkdir -p  svgs_hash

INFO=$(multipack info)

for i in {1..5000}
do
  echo $INFO | dot -Tsvg -x > svgs_hash/gql_pre.svg
  HASH=$(cat svgs_hash/gql_pre.svg | shasum | cut -f 1 -d " ")
  mv "svgs_hash/gql_pre.svg" "svgs_hash/$HASH.svg"
done

SVG_FILE_NAME=$(ls svgs_hash | sort | head  -n 1)

cp svgs_hash/$SVG_FILE_NAME docs/gql.svg



