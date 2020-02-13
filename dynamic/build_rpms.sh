#!/bin/bash

# exit immediately on failure, or if an undefined variable is used
set -eu

# begin the pipeline.yml file
echo "steps:"

names=($1 $2 $2)
TMP="test"

for rpmname in "${names[@]}"; do
  echo "  - label: \":Build RPM: ${rpmname}\"
  key: \"build_rpm_${rpmname}\"
  plugins:
    - ./plugins/rpmbuild:
        spec: \"./hello_world.spec\"
        share: \"${TMP}\"
  agents:
    - \"rpmbuild=true\"

    "
done

