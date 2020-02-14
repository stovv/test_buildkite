#!/bin/bash

# exit immediately on failure, or if an undefined variable is used
set -eu

# begin the pipeline.yml file
echo "steps:"

phoenix_json="$1/$2"
names=("rpm1" "rpm2" "rpm3")

for rpmname in "${names[@]}"; do
  echo "
  - label: \":package: Build RPM ${rpmname}\"
    key: \"build_rpm_${rpmname}\"
    plugins:
    - ./plugins/rpmbuild:
        spec: \"./hello_world.spec\"
        share: \"${1}\"
        name: \"${rpmname}\"
    agents:
      - \"rpmbuild=true\"

    "
done

