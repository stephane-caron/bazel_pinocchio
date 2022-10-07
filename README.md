# Bazel rules for Pinocchio

Rules for building C++ projects with ``@pinocchio`` as a dependency.

## Setup

Add the following to your ``WORKSPACE`` file:

```python
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

You can build C++ targets that depend on Pinocchio as follows:

```python
cc_binary(
    name = "overview-simple",
    srcs = ["overview-simple.cpp"],
    deps = ["@pinocchio"],
)
```

From this repository, run this example by:

```console
$ bazel run //examples:overview-simple
```

It should output ``tau = 0 0 0 0 0 0``.
