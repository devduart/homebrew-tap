# typed: strict
# frozen_string_literal: true

# Homebrew formula for http-tui, built from source.
#
# This file is versioned here for testing; it is published (as
# Formula/http-tui.rb) to the tap repo devduart/homebrew-tap by the
# update-homebrew-tap job in .github/workflows/release.yml on each v* tag.
#
# The sha256 is the digest of the source tarball for the current tag. On each
# release the update-homebrew-tap job recomputes it and rewrites the url/sha256
# for the new tag, so this versioned copy only needs to match the tag it points
# at. To recompute by hand:
#   shasum -a 256 <(curl -sL https://github.com/devduart/http-tui/archive/refs/tags/v1.0.0.tar.gz)
class HttpTui < Formula
  desc "Terminal user interface (TUI) HTTP client"
  homepage "https://github.com/devduart/http-tui"
  url "https://github.com/devduart/http-tui/archive/refs/tags/v1.0.0.tar.gz"
  sha256 "0cf070b81f5411110c2848779b8b7a6cd83d3304a1c38f6ea370b00ad49a90d8"
  license "MIT"

  depends_on "rust" => :build

  def install
    system "cargo", "install", *std_cargo_args
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/http-tui --version")
  end
end
