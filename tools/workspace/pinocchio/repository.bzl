# -*- python -*-

load("@bazel_tools//tools/build_defs/repo:http.bzl", "http_archive")

def pinocchio_repository(
        version = "3.5.0",
        sha256 = "5a1d521c5f885768075016455d3f9eb50bfb258db540c2f2c681ad251e25736c"):
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
