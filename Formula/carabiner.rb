class Carabiner < Formula
  desc "Unified AI rules management CLI"
  homepage "https://github.com/findyourexit/carabiner"
  license "MIT"
  version "0.1.0"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/findyourexit/carabiner/releases/download/v0.1.0/carabiner-0.1.0-aarch64-apple-darwin.tar.gz"
      sha256 "c8ca43f246c809b9369c1a9b3e473f0cf7aafefd4d38cb317f5ea6855b56c3b2"
    else
      url "https://github.com/findyourexit/carabiner/releases/download/v0.1.0/carabiner-0.1.0-x86_64-apple-darwin.tar.gz"
      sha256 "b22827cb740f139e3f3515265d721d6be8a3928a523615cfc374be0dc3261966"
    end
  end

  def install
    bin.install "carabiner"
  end

  test do
    assert_match "carabiner", shell_output("#{bin}/carabiner --version")
  end
end
