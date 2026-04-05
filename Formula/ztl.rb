class Ztl < Formula
  desc "A terminal UI for comparing multiple time zones side by side"
  homepage "https://github.com/findyourexit/zonetimeline-tui"
  license "MIT"
  version "0.1.0"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/findyourexit/zonetimeline-tui/releases/download/v0.1.0/ztl-0.1.0-aarch64-apple-darwin.tar.gz"
      sha256 "1db063886327368a3f904aa6f0de8d8ebc40903fe41689352fc45d4f902e51e5"
    else
      url "https://github.com/findyourexit/zonetimeline-tui/releases/download/v0.1.0/ztl-0.1.0-x86_64-apple-darwin.tar.gz"
      sha256 "6b7392dd2698f1d3ab366fbd91ba5f13bd5ddb5baafb6b586620bad05a03fa5b"
    end
  end

  def install
    bin.install "ztl"
  end

  test do
    assert_match "ztl", shell_output("#{bin}/ztl --version")
  end
end
