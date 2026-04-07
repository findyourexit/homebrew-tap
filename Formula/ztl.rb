class Ztl < Formula
  desc "A terminal UI for comparing multiple time zones side by side"
  homepage "https://github.com/findyourexit/zonetimeline-tui"
  license "MIT"
  version "0.2.0"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/findyourexit/zonetimeline-tui/releases/download/v0.2.0/ztl-0.2.0-aarch64-apple-darwin.tar.gz"
      sha256 "3029174a789a6f1fc68720cc1ecd9f50152cbeb8d30986617186187df04a5911"
    else
      url "https://github.com/findyourexit/zonetimeline-tui/releases/download/v0.2.0/ztl-0.2.0-x86_64-apple-darwin.tar.gz"
      sha256 "bb4e157310d53a451eeff0283214f1a693d84b85386cf3c78d76e813e77cf663"
    end
  end

  def install
    bin.install "ztl"
  end

  test do
    assert_match "ztl", shell_output("#{bin}/ztl --version")
  end
end
