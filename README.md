Rexo
====

Rexo is a neat single-file cross-platform unit testing framework for C/C++.

It offers the same [xUnit][xunit]-like structure than most other unit testing
frameworks but aims at providing a _truly_ polished API.


## Features

* **sleek**: polished API with great attention to details.
* **easy**: no learning curve, it's yet another framework based on xUnit
  with test suites, test cases, and fixtures.
* **convenient**: automatic registration of tests.
* **granular**: high level or low level API? You choose.
* **portable**: compatible with C89 (ANSI C) and C++.
* **cross-platform**: tested on Linux, macOS, and Windows.
* **simple**: straightforward implementation—KISS all the things!
* **cascading configuration**: configure a whole test suite at once and/or tweak
  specific options for each test case.
* **painless**: deployment couldn't be easier—it all fits into a single
  header file and has no external dependencies.


But also...

* fully standard compliant minus the optional automatic registration of tests
  that relies on a widespread compiler-specific feature.
* designated initializer-like syntax to all C and C++ versions.


## Roadmap

* implement a command-line option parser (e.g.: for filtering test cases).
* allow choosing the output format of the summary (e.g.: jUnit XML).
* support more assertion macros (e.g.: array comparison, signal handling).
* improve failure messages to be more visual (e.g.: an arrow pointing
  where strings differ).


## Installation

Run:

```sh
$ npm i rexo.c
```

And then include `rexo.h` as follows:

```c
// main.c
#include <rexo.h>

int main() { /* ... */ }
```

Finally, compile while adding the path `node_modules/rexo.c` to your compiler's include paths.

```bash
$ clang -I./node_modules/rexo.c main.c  # or, use gcc
$ gcc   -I./node_modules/rexo.c main.c
```

You may also use a simpler approach with the [cpoach](https://www.npmjs.com/package/cpoach.sh) tool, which automatically adds the necessary include paths of all the installed dependencies for your project.

```bash
$ cpoach clang main.c  # or, use gcc
$ cpoach gcc   main.c
```


## Usage

### Minimal

```c
#include <rexo.h>

RX_TEST_CASE(foo, bar)
{
    RX_INT_REQUIRE_EQUAL(2 * 3 * 7, 42);
}

int
main(int argc, const char **argv)
{
    return rx_main(0, NULL, argc, argv) == RX_SUCCESS ? 0 : 1;
}
```

<!-- ![passed](./img/passed.png) -->


### Fixture

```c
#include <rexo.h>

struct foo_data {
    const char *value;
};

RX_SET_UP(foo_set_up)
{
    struct foo_data *data;

    data = (struct foo_data *)RX_DATA;
    data->value = "world!";
    return RX_SUCCESS;
}

RX_FIXTURE(foo_fixture, struct foo_data, .set_up = foo_set_up);

RX_TEST_CASE(foo, bar, .fixture = foo_fixture)
{
    struct foo_data *data;

    data = (struct foo_data *)RX_DATA;
    RX_STR_REQUIRE_EQUAL("Hello", data->value);
}

int
main(int argc, const char **argv)
{
    return rx_main(0, NULL, argc, argv) == RX_SUCCESS ? 0 : 1;
}
```

<!-- ![failed](img/failed.png) -->


## Documentation

<https://christophercrouzet.github.io/rexo>


## Repository

<https://github.com/christophercrouzet/rexo>


## License

[Unlicense][unlicense].


[badge-test]: https://github.com/christophercrouzet/rexo/workflows/Test/badge.svg
[unlicense]: https://unlicense.org
[xunit]: https://en.wikipedia.org/wiki/XUnit

<br>
<br>


[![](https://raw.githubusercontent.com/qb40/designs/gh-pages/0/image/11.png)](https://wolfram77.github.io)<br>
[![SRC](https://img.shields.io/badge/src-repo-green?logo=Org)](https://github.com/christophercrouzet/rexo)
[![ORG](https://img.shields.io/badge/org-nodef-green?logo=Org)](https://nodef.github.io)
![](https://ga-beacon.deno.dev/G-RC63DPBH3P:SH3Eq-NoQ9mwgYeHWxu7cw/github.com/nodef/rexo.c)
