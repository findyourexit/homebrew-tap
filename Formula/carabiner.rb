class Carabiner < Formula
  desc "Unified AI rules management CLI"
  homepage "https://github.com/findyourexit/carabiner"
  license "MIT"
  version "0.1.1"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/findyourexit/carabiner/releases/download/v0.1.1/carabiner-0.1.1-aarch64-apple-darwin.tar.gz"
      sha256 "69c488eb453f6ef932a5ee43440326ec3fc5643eec3ad0912f9b9ce941b99e3a"
    else
      url "https://github.com/findyourexit/carabiner/releases/download/v0.1.1/carabiner-0.1.1-x86_64-apple-darwin.tar.gz"
      sha256 "91fcceaa191c7c108e4dc47b0d1cab59e0cf0abd2e637aa70b39f0a387ce2f85"
    end
  end

  def install
    bin.install "carabiner"
  end

  test do
    assert_match "carabiner", shell_output("#{bin}/carabiner --version")
  end
end
