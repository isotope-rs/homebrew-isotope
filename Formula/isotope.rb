class Isotope < Formula
  desc "Isotope scans AWS services and makes suggestions on how to improve them using Artificial Intelligence."
  if Hardware::CPU.type == :arm
    url "https://github.com/isotope-rs/isotope/releases/download/0.0.5/isotope-aarch64-apple-darwin.tar.xz"
    sha256 "70e066622d5f2811031fcb5ffe8dfe285e78a536fdbfce78b3647966e32c4637"
  else
    url "https://github.com/isotope-rs/isotope/releases/download/0.0.5/isotope-x86_64-apple-darwin.tar.xz"
    sha256 "b5ea6b6456948edff7645786013840f437936970cb36fadb0bc21b5f2b66a0bc"
  end
  version "0.0.5"
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
