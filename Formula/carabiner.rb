class Carabiner < Formula
  desc "Unified AI rules management CLI"
  homepage "https://github.com/findyourexit/carabiner"
  license "MIT"
  version "0.1.3"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/findyourexit/carabiner/releases/download/v0.1.3/carabiner-0.1.3-aarch64-apple-darwin.tar.gz"
      sha256 "a04792728ec58e911bae20ff2c96b17c1474fefa27a72987aa0df271ca65c963"
    else
      url "https://github.com/findyourexit/carabiner/releases/download/v0.1.3/carabiner-0.1.3-x86_64-apple-darwin.tar.gz"
      sha256 "4ff869d97be6333d382668ebcc49381f4d41fe1605d14504a4871eddc729165b"
    end
  end

  def install
    bin.install "carabiner"
  end

  test do
    assert_match "carabiner", shell_output("#{bin}/carabiner --version")
  end
end
