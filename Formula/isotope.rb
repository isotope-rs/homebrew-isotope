class Isotope < Formula
  desc "Isotope scans AWS services and makes suggestions on how to improve them using Artificial Intelligence."
  if Hardware::CPU.type == :arm
    url "https://github.com/isotope-rs/isotope/releases/download/0.1.0/isotope-aarch64-apple-darwin.tar.xz"
    sha256 "d1bb73bf101441484a4f0920f617e0581f6baeafa2dd85c886f0b79cffcd3a5f"
  else
    url "https://github.com/isotope-rs/isotope/releases/download/0.1.0/isotope-x86_64-apple-darwin.tar.xz"
    sha256 "47b61a3c3f3b4ea2ef09efaf7628787b557d7af6a490b526b3e1b7ea7dc65e66"
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
