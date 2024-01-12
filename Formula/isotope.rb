class Isotope < Formula
  desc "Isotope scans AWS services and makes suggestions on how to improve them using Artificial Intelligence."
  if Hardware::CPU.type == :arm
    url "https://github.com/isotope-rs/isotope/releases/download/0.1.2/isotope-aarch64-apple-darwin.tar.xz"
    sha256 "901a456d45671425e628e05baeab7e7101632a1616fc436741e2b44685b2c128"
  else
    url "https://github.com/isotope-rs/isotope/releases/download/0.1.2/isotope-x86_64-apple-darwin.tar.xz"
    sha256 "14fcca4b6036ce769e8f43a2eba9faf28dd7d1961f0d01d026b255952fc8c797"
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
