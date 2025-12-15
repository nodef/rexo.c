#!/usr/bin/env bash
URL="https://raw.githubusercontent.com/christophercrouzet/rexo/refs/heads/main/include/rexo.h"

# Build the project
build() {
# Download the release
if [ ! -f "rexo.h" ]; then
  echo "Downloading rexo.h from $URL ..."
  curl -L "$URL" -o "rexo.h"
  echo ""
fi
}

# Test the project
test() {
clang -I. -o test.exe examples/01-minimal.c && ./test && echo -e "\n\n"
clang -I. -o test.exe examples/02-fixture.c && ./test && echo -e "\n\n"
}

# Main script
if [[ "$1" == "test" ]]; then test; else build; fi
