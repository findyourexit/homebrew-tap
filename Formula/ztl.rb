class Ztl < Formula
  desc "A terminal UI for comparing multiple time zones side by side"
  homepage "https://github.com/findyourexit/zonetimeline-tui"
  license "MIT"
  version "0.3.0"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/findyourexit/zonetimeline-tui/releases/download/v0.3.0/ztl-0.3.0-aarch64-apple-darwin.tar.gz"
      sha256 "03e2645581a32a843de2910af7b2698e12c5a84d5c03c872a45f4612bd1fee78"
    else
      url "https://github.com/findyourexit/zonetimeline-tui/releases/download/v0.3.0/ztl-0.3.0-x86_64-apple-darwin.tar.gz"
      sha256 "b997364cd506fbea9cbbb048bdabe824bedfc34b9ab3a0e565e18f7ae372c581"
    end
  end

  def install
    bin.install "ztl"
  end

  test do
    assert_match "ztl", shell_output("#{bin}/ztl --version")
  end
end
