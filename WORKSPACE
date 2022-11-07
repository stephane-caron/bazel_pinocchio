# -*- python -*-
#
# Copyright 2022 Stéphane Caron

workspace(name = "bazel_pinocchio")

load("//tools/workspace:default.bzl", "add_default_repositories")
add_default_repositories()

load("@rules_foreign_cc//foreign_cc:repositories.bzl", "rules_foreign_cc_dependencies")
rules_foreign_cc_dependencies()

# Python
# ======

load("@rules_python//python:pip.bzl", "pip_parse")

pip_parse(
    name = "pip_bazel_pinocchio",
    requirements_lock = "//tools/workspace/pip_bazel_pinocchio:requirements_lock.txt",
)

load("@pip_bazel_pinocchio//:requirements.bzl", "install_deps")
install_deps()
