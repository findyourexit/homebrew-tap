class Carabiner < Formula
  desc "Unified AI rules management CLI"
  homepage "https://github.com/findyourexit/carabiner"
  license "MIT"
  version "0.1.6"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/findyourexit/carabiner/releases/download/v0.1.6/carabiner-0.1.6-aarch64-apple-darwin.tar.gz"
      sha256 "6841490dee1053b2dbbd1c62635b9fd16cf291a94f209bd051d6c4a5f630a6ce"
    else
      url "https://github.com/findyourexit/carabiner/releases/download/v0.1.6/carabiner-0.1.6-x86_64-apple-darwin.tar.gz"
      sha256 "594a781fe02396689666aba7ae9f2d1a23d7bbfd499b92365768b6ced58fca44"
    end
  end

  def install
    bin.install "carabiner"
  end

  test do
    assert_match "carabiner", shell_output("#{bin}/carabiner --version")
  end
end
