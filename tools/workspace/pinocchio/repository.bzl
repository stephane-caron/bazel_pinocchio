# -*- python -*-

load("@bazel_tools//tools/build_defs/repo:http.bzl", "http_archive")

def pinocchio_repository(
        version = "2.7.0",
        sha256 = "fbc8de46b3296c8bf7d4d9b03392c04809a1bca52930fab243749eeef39db406"):
    """
    Clone repository from GitHub and make its targets available for binding.

    Args:
        version: version of the library to get.
        sha256: SHA-256 checksum of the downloaded archive.
    """
    http_archive(
        name = "pinocchio",
        urls = [
            "https://github.com/stack-of-tasks/pinocchio/releases/download/v{}/pinocchio-{}.tar.gz".format(version, version),
        ],
        sha256 = sha256,
        strip_prefix = "pinocchio-{}".format(version),
        build_file = Label("//tools/workspace/pinocchio:package.BUILD"),
    )
