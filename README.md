# Bazel rules for Pinocchio

Rules for building C++ targets that depend on [Pinocchio](https://github.com/stack-of-tasks/pinocchio).

## Setup

Pick the [release version](https://github.com/stephane-caron/bazel_pinocchio/releases) that corresponds to the Pinocchio version you want to use. In what follows we assume v2.7.0.

Add the following to your ``WORKSPACE`` file:

```python
load("@bazel_tools//tools/build_defs/repo:http.bzl", "http_archive")

http_archive(
    name = "bazel_pinocchio",
    url = "https://github.com/stephane-caron/bazel_pinocchio/archive/refs/tags/v2.7.0.tar.gz",
    sha256 = "83eb99d021e5f5844bb377ac556713d1006ae4039216cc1e71f14ae3cfad5bae",
    strip_prefix = "bazel_pinocchio-2.7.0",
)

load("@bazel_pinocchio//tools/workspace:default.bzl", add_bazel_pinocchio = "add_default_repositories")

# This creates the @eigen and @pinocchio dependencies
add_bazel_pinocchio()
```

You can then build C++ targets that depend on ``@pinocchio``:

```python
cc_binary(
    name = "overview-simple",
    srcs = ["overview-simple.cpp"],
    deps = ["@pinocchio"],
)
```

## Example

From this repository, run:

```console
./tools/bazelisk run //examples/cpp:overview-simple
```

This example should output ``tau = 0 0 0 0 0 0``.
