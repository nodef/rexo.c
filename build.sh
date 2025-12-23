#!/usr/bin/env bash
# Fetch the latest version of the library
fetch() {
if [ -f "rexo.h" ]; then return; fi
URL="https://raw.githubusercontent.com/christophercrouzet/rexo/refs/heads/main/include/rexo.h"

# Download the release
echo "Downloading rexo.h from $URL ..."
curl -L "$URL" -o "rexo.h"
echo ""
}

# Test the project
test() {
echo "Running 01-minimal.c ..."
clang -I. -o 01.exe examples/01-minimal.c && ./01 && echo -e "\n\n"
echo "Running 02-fixture.c ..."
clang -I. -o 02.exe examples/02-fixture.c && ./02 && echo -e "\n\n"
}


# Main script
if [[ "$1" == "test" ]]; then test
elif [[ "$1" == "fetch" ]]; then fetch
else echo "Usage: $0 {fetch|test}"; fi
