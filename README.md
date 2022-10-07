# Bazel rules for Pinocchio

Rules for building C++ projects with ``@pinocchio`` as a dependency.

## Installation

Add the following to your WORKSPACE file:

```
load("@bazel_tools//tools/build_defs/repo:http.bzl", "http_archive")

http_archive(
    name = "bazel_pinocchio",
    url = "https://github.com/stephane-caron/bazel_pinocchio/archive/refs/tags/0.1.0.tar.gz",
    sha256 = "...",
    strip_prefix = "bazel_pinocchio-0.1.0",
)

load("@bazel_pinocchio//tools/workspace:default.bzl", add_bazel_pinocchio = "add_default_repositories")

# This creates the @eigen and @pinocchio dependencies
add_bazel_pinocchio()
```

## Example

From this repository, run:

```console
$ bazel run //examples:overview-simple
```

This example should output ``tau = 0 0 0 0 0 0``.
