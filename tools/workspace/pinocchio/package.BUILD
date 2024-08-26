# -*- python -*-
#
# Custom build file to use the package with Bazel.

package(default_visibility = ["//visibility:public"])

load("@rules_foreign_cc//foreign_cc:defs.bzl", "cmake")

filegroup(
    name = "srcs",
    srcs = glob(["**"]),
)

cmake(
    name = "pinocchio",
    lib_source = ":srcs",
    cache_entries = {
        "BUILD_PYTHON_INTERFACE": "OFF",
        "BUILD_TESTING": "OFF",
        "CMAKE_BUILD_TYPE": "Release",
        "INSTALL_DOCUMENTATION": "OFF",
    },
    deps = [
        "@eigen",
    ],
    out_include_dir = "include",
    out_shared_libs = [
        "libpinocchio.so.3.0.0",
    ],
)
