class Isotope < Formula
  desc "Isotope scans AWS services and makes suggestions on how to improve them using Artificial Intelligence."
  if Hardware::CPU.type == :arm
    url "https://github.com/isotope-rs/isotope/releases/download/0.0.7/isotope-aarch64-apple-darwin.tar.xz"
    sha256 "0ee0aed76f73157bae9f7ace40279ba7dac66fdcccfab3b6c21ac6cd3a72e08f"
  else
    url "https://github.com/isotope-rs/isotope/releases/download/0.0.7/isotope-x86_64-apple-darwin.tar.xz"
    sha256 "4fc1158d39a743658ab65a78bc350273d7c0ee02e45d7d64ea1b146fbc74b465"
  end
  version "0.0.7"
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
