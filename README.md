# Bazel rules for Pinocchio

Rules for building C++ targets that depend on [Pinocchio](https://github.com/stack-of-tasks/pinocchio).

## Build dependencies

You will need the build dependencies of Pinocchio for your operating system, for instance on Ubuntu 22.04:

```console
sudo apt install libboost-filesystem-dev libboost-serialization-dev libboost-system-dev libeigen3-dev liburdfdom-dev
```

## Setup

Add the following to your ``WORKSPACE`` file:

```python
load("@bazel_tools//tools/build_defs/repo:http.bzl", "http_archive")

http_archive(
    name = "bazel_pinocchio",
    url = "https://github.com/stephane-caron/bazel_pinocchio/archive/refs/tags/v3.0.0.tar.gz",
    sha256 = "7892586120f1eddf904676d9107c688a4b48e291aaaf82f6e3db0254bb141d0b",
    strip_prefix = "bazel_pinocchio-3.0.0",
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
