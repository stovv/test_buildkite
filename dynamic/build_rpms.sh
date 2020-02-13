#!/bin/bash

# exit immediately on failure, or if an undefined variable is used
set -eu

# begin the pipeline.yml file
echo "steps:"

names=($1 $2 $3)
TMP="test"

for rpmname in "${names[@]}"; do
  echo "
  - label: \":box: Build RPM ${rpmname}\"
    key: \"build_rpm_${rpmname}\"
    plugins:
    - ./plugins/rpmbuild:
        spec: \"./hello_world.spec\"
        share: \"test\"
    agents:
      - \"rpmbuild=true\"

    "
done

