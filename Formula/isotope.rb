class Isotope < Formula
  desc "Isotope scans AWS services and makes suggestions on how to improve them using Artificial Intelligence."
  if Hardware::CPU.type == :arm
    url "https://github.com/isotope-rs/isotope/releases/download/0.0.6/isotope-aarch64-apple-darwin.tar.xz"
    sha256 "bfcb647b19b6488c3cd4fa5c775dcebcc853c4fa267061112de961de259231b7"
  else
    url "https://github.com/isotope-rs/isotope/releases/download/0.0.6/isotope-x86_64-apple-darwin.tar.xz"
    sha256 "c084ed97e0662c0c3d81e34d1a5e56af6f0c56e15adaafe61e8dbef805a51b14"
  end
  version "0.0.6"
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
