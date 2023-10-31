class Isotope < Formula
  desc "Isotope scans AWS services and makes suggestions on how to improve them using Artificial Intelligence."
  if Hardware::CPU.type == :arm
    url "https://github.com/isotope-rs/isotope/releases/download/0.0.3/isotope-aarch64-apple-darwin.tar.xz"
    sha256 "473af09e7d8e29bc7511a0f852ef5ea6a061353207c92a90888a1aff004f989e"
  else
    url "https://github.com/isotope-rs/isotope/releases/download/0.0.3/isotope-x86_64-apple-darwin.tar.xz"
    sha256 "bfb5d099f6e0d521cf5343d17509b398e4758bb82c8c726220a562c0da5afa21"
  end
  version "0.0.3"
  license "MIT"

  def install
    bin.install "isotope"

    # Homebrew will automatically install these, so we don't need to do that
    doc_files = Dir["README.*", "readme.*", "LICENSE", "LICENSE.*", "CHANGELOG.*"]
    leftover_contents = Dir["*"] - doc_files

    # Install any leftover files in pkgshare; these are probably config or
    # sample files.
    pkgshare.install *leftover_contents unless leftover_contents.empty?
  end
end
