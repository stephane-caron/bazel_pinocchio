# -*- python -*-
#
# SPDX-License-Identifier: Apache-2.0

package(default_visibility = ["//visibility:public"])

load("@pip_bazel_pinocchio//:requirements.bzl", "requirement")

py_binary(
    name = "overview-simple",
    srcs = ["overview-simple.py"],
    main = "overview-simple.py",
    deps = [
        requirement("pin"),
    ],
)
