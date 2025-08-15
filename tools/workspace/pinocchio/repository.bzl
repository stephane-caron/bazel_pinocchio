# -*- python -*-

load("@bazel_tools//tools/build_defs/repo:http.bzl", "http_archive")

def pinocchio_repository(
        version = "3.6.0",
        sha256 = "3008e313e3d3321fa0a74d1c35a667c368953def040d74ca5a9b98f43ea50342"):
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
        patch_cmds = [
            "find . -name '_unittests' -type l -exec rm -rf {} + || true",
            "find . -path '*/cmake/_unittests' -exec rm -rf {} + || true",
        ],
    )
