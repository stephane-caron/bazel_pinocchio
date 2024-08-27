# -*- python -*-

load("@bazel_tools//tools/build_defs/repo:http.bzl", "http_archive")

def pinocchio_repository(
        version = "3.1.0",
        sha256 = "e624484077eee3183e20443ab0373205bb832a2597241531705116fa9f07016a"):
    """
    Download release archive from GitHub.

    Args:
        version: Version of the library to download.
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
