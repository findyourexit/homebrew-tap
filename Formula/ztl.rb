class Ztl < Formula
  desc "Terminal UI for comparing multiple time zones side by side"
  homepage "https://github.com/findyourexit/zonetimeline-tui"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/findyourexit/zonetimeline-tui/releases/download/v0.4.1/ztl-0.4.1-aarch64-apple-darwin.tar.gz"
      sha256 "ddfddd6a3d78a1289f04e045fa7bdd33d9cd873ec1b8d95637ea6e29efdd7334"
    else
      url "https://github.com/findyourexit/zonetimeline-tui/releases/download/v0.4.1/ztl-0.4.1-x86_64-apple-darwin.tar.gz"
      sha256 "ccc42ab276dd6620064f186950bcd476416567384d908b0acf3397b63a821489"
    end
  end

  def install
    bin.install "ztl"
  end

  test do
    assert_match "ztl", shell_output("#{bin}/ztl --version")
  end
end
