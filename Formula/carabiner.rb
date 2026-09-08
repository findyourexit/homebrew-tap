class Carabiner < Formula
  desc "Unified AI rules management CLI"
  homepage "https://github.com/findyourexit/carabiner"
  license "MIT"
  version "0.1.5"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/findyourexit/carabiner/releases/download/v0.1.5/carabiner-0.1.5-aarch64-apple-darwin.tar.gz"
      sha256 "877f818fdc6526d7b9a38d80ebb0cf161de0cebb7590fcf14838a03e41980e73"
    else
      url "https://github.com/findyourexit/carabiner/releases/download/v0.1.5/carabiner-0.1.5-x86_64-apple-darwin.tar.gz"
      sha256 "4bf533cba36a8737404316667c5ea15cb38ca9871b87a9322f1d1e9f34c47465"
    end
  end

  def install
    bin.install "carabiner"
  end

  test do
    assert_match "carabiner", shell_output("#{bin}/carabiner --version")
  end
end
