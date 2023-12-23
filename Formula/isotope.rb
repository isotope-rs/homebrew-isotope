class Isotope < Formula
  desc "Isotope scans AWS services and makes suggestions on how to improve them using Artificial Intelligence."
  if Hardware::CPU.type == :arm
    url "https://github.com/isotope-rs/isotope/releases/download/0.1.1/isotope-aarch64-apple-darwin.tar.xz"
    sha256 "4d7dd339a520d411697a8b72b114e1faab9c0a98bb349de21ec99bf1cad081ac"
  else
    url "https://github.com/isotope-rs/isotope/releases/download/0.1.1/isotope-x86_64-apple-darwin.tar.xz"
    sha256 "b980e992269d848c21f043601c461173bc26b514c576ec9b7f613b54fea86acb"
  end
  version "0.1.1"
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
