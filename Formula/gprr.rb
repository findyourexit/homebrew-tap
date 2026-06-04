class Gprr < Formula
  desc "Keyboard-driven terminal UI for triaging and reviewing GitHub PRs"
  homepage "https://github.com/findyourexit/git-pr-tui"
  license "MIT"
  version "0.2.0"

  # gprr delegates all GitHub auth to the gh CLI (`gh auth token`).
  depends_on "gh"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/findyourexit/git-pr-tui/releases/download/v0.2.0/gprr-0.2.0-aarch64-apple-darwin.tar.gz"
      sha256 "0656107f2b5e11f72e6a84c1fc73d1966b52d49bf0b208337e064a7447df4ed2"
    else
      url "https://github.com/findyourexit/git-pr-tui/releases/download/v0.2.0/gprr-0.2.0-x86_64-apple-darwin.tar.gz"
      sha256 "ec34502820c85492594099121565ca57a8748e7417ef6cabde2aa4c75fb60e25"
    end
  end

  def install
    bin.install "gprr"
  end

  test do
    assert_match "gprr", shell_output("#{bin}/gprr --version")
  end
end
