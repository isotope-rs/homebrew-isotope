class Isotope < Formula
  desc "Isotope scans AWS services and makes suggestions on how to improve them using Artificial Intelligence."
  if Hardware::CPU.type == :arm
    url "https://github.com/isotope-rs/isotope/releases/download/0.1.0/isotope-aarch64-apple-darwin.tar.xz"
    sha256 "dda8b816dc20b14fe886ed60de1e5b7401c82ee7df9cd5f29960a49b4a7ee400"
  else
    url "https://github.com/isotope-rs/isotope/releases/download/0.1.0/isotope-x86_64-apple-darwin.tar.xz"
    sha256 "d96b7cd9491fc9e7eda1a0ffd66ecc646ad7a84a0963d39bbcaeab9bba6e39a7"
  end
  version "0.1.0"
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
