# -*- python -*-
#
# Copyright 2022 Stéphane Caron

load("//tools/workspace/eigen:repository.bzl", "eigen_repository")

def add_default_repositories():
    """
    Declares workspace repositories for all dependencies. This is intended to
    be loaded and called from a WORKSPACE file.
    """
    eigen_repository()
