#!/usr/bin/env bash
set -euo pipefail

repo_root="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"
work_dir="$(mktemp -d)"
trap 'rm -rf "$work_dir"' EXIT

copy_package() {
  local package_path="$1"
  local package_name="$2"

  cp -R "$repo_root/$package_path" "$work_dir/$package_name"
  rm -rf "$work_dir/$package_name/.dart_tool"
  rm -f "$work_dir/$package_name/pubspec_overrides.yaml"
  rm -f "$work_dir/$package_name/pubspec.lock"
}

resolved_package_version() {
  local package_name="$1"
  local deps_output

  deps_output="$(dart pub deps --style=list)"
  awk -v package_name="$package_name" '$2 == package_name {print $3; exit}' <<<"$deps_output"
}

verify_package() {
  local package_dir="$1"
  local package_name="$2"

  echo "Verifying $package_name with downgraded dependencies"
  (
    cd "$package_dir"
    dart pub downgrade

    local analyzer_version
    analyzer_version="$(resolved_package_version analyzer)"
    echo "$package_name resolved analyzer $analyzer_version"

    dart analyze --fatal-warnings

    if [ -d test ]; then
      dart test
    fi
  )
}

copy_package "codegen/gql_code_builder" "gql_code_builder"
copy_package "codegen/gql_build" "gql_build"

perl -0pi -e 's/  gql_code_builder: \^[^\n]+/  gql_code_builder:\n    path: ..\/gql_code_builder/' \
  "$work_dir/gql_build/pubspec.yaml"
perl -0pi -e 's/name: gql_build\n/name: gql_build\npublish_to: none\n/' \
  "$work_dir/gql_build/pubspec.yaml"

verify_package "$work_dir/gql_code_builder" "gql_code_builder"
verify_package "$work_dir/gql_build" "gql_build"
