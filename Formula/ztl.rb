class Ztl < Formula
  desc "A terminal UI for comparing multiple time zones side by side"
  homepage "https://github.com/findyourexit/zonetimeline-tui"
  license "MIT"
  version "0.4.0"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/findyourexit/zonetimeline-tui/releases/download/v0.4.0/ztl-0.4.0-aarch64-apple-darwin.tar.gz"
      sha256 "9a0957bad512c9bf1f0d13b82f545e61639b1ff7b493564f5ed6b906a807eec8"
    else
      url "https://github.com/findyourexit/zonetimeline-tui/releases/download/v0.4.0/ztl-0.4.0-x86_64-apple-darwin.tar.gz"
      sha256 "2e17233ee55214814bbb8cb0c32c479d634d162f9e09fa97dd6dfab28551d698"
    end
  end

  def install
    bin.install "ztl"
  end

  test do
    assert_match "ztl", shell_output("#{bin}/ztl --version")
  end
end
