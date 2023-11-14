class Isotope < Formula
  desc "Isotope scans AWS services and makes suggestions on how to improve them using Artificial Intelligence."
  if Hardware::CPU.type == :arm
    url "https://github.com/isotope-rs/isotope/releases/download/0.0.8/isotope-aarch64-apple-darwin.tar.xz"
    sha256 "77503f32f816a32c9b90a57e19b3fd18d52c574d088cc2e229b9bce6b6755745"
  else
    url "https://github.com/isotope-rs/isotope/releases/download/0.0.8/isotope-x86_64-apple-darwin.tar.xz"
    sha256 "45f4574bf906dfac208247dc0dc7f4129190d3774d64e2d2af435dff68de67ae"
  end
  version "0.0.8"
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
