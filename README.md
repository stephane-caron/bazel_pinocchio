# Bazel rules for Pinocchio

Workspace rules for building C++ targets that depend on [Pinocchio](https://github.com/stack-of-tasks/pinocchio).

## Prerequisites

You will need the build dependencies of Pinocchio for your operating system. For instance, on Ubuntu 22.04:

```console
sudo apt install libboost-filesystem-dev libboost-serialization-dev libboost-system-dev libeigen3-dev liburdfdom-dev
```

## Setup

Add to your `WORKSPACE` file the `http_archive` instruction from the [release page](https://github.com/stephane-caron/bazel_pinocchio/releases/tag/v3.6.0).

You can then define C++ targets that depend on ``@pinocchio``:

```python
cc_binary(
    name = "overview-simple",
    srcs = ["overview-simple.cpp"],
    deps = ["@pinocchio"],
)
```

Check out [`pinocchio/package.BUILD`](tools/workspace/pinocchio/package.BUILD) for feature toggles and build-time arguments.

## Example

From this repository, run:

```console
./tools/bazelisk run //examples/cpp:overview-simple
```

This example should output ``tau = 0 0 0 0 0 0``.
