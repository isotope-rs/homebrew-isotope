class Isotope < Formula
  desc "Isotope scans AWS services and makes suggestions on how to improve them using Artificial Intelligence."
  if Hardware::CPU.type == :arm
    url "https://github.com/isotope-rs/isotope/releases/download/0.0.4/isotope-aarch64-apple-darwin.tar.xz"
    sha256 "50958171f5ebac6ca82f4e2395ad80109c9f8f5072c294a94095f95e56c64bfd"
  else
    url "https://github.com/isotope-rs/isotope/releases/download/0.0.4/isotope-x86_64-apple-darwin.tar.xz"
    sha256 "54ad690e98a18e9d09d64a0c376f20b3d49fe81dd499f9e85b2c326867231c66"
  end
  version "0.0.4"
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
