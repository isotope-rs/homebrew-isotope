class Isotope < Formula
  desc "Isotope scans AWS services and makes suggestions on how to improve them using Artificial Intelligence."
  if Hardware::CPU.type == :arm
    url "https://github.com/isotope-rs/isotope/releases/download/0.0.2/isotope-aarch64-apple-darwin.tar.xz"
    sha256 "215f041dd3c10539a6f8f741f1a8bde358c4620d0084f13953493776a5eec533"
  else
    url "https://github.com/isotope-rs/isotope/releases/download/0.0.2/isotope-x86_64-apple-darwin.tar.xz"
    sha256 "f9ffc912f6522ddf8b7ca82f7d6b0b9eb77fecedbdd9f0a5a1370641de53bbe3"
  end
  version "0.0.2"
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
