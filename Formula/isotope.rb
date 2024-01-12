class Isotope < Formula
  desc "Isotope scans AWS services and makes suggestions on how to improve them using Artificial Intelligence."
  if Hardware::CPU.type == :arm
    url "https://github.com/isotope-rs/isotope/releases/download/0.1.2/isotope-aarch64-apple-darwin.tar.xz"
    sha256 "22669316fdb52d441e6ee80075ae3ce2d990e84e1f9a9e9294e7a6abeb5358e5"
  else
    url "https://github.com/isotope-rs/isotope/releases/download/0.1.2/isotope-x86_64-apple-darwin.tar.xz"
    sha256 "8842359dafdbe54f32ad37a17c8b1d06903bdb6eacb6af6056faa6e45a0b6f53"
  end
  version "0.1.2"
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
