class Gpr < Formula
  desc "Keyboard-driven terminal UI for triaging and reviewing GitHub PRs"
  homepage "https://github.com/findyourexit/git-pr-tui"
  license "MIT"
  version "0.1.0"

  # gpr delegates all GitHub auth to the gh CLI (`gh auth token`).
  depends_on "gh"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/findyourexit/git-pr-tui/releases/download/v0.1.0/gpr-0.1.0-aarch64-apple-darwin.tar.gz"
      sha256 "7b6844832e60c2f1f5c1b8a0cec2147e4402319e4554fa3f57adec0e8679c586"
    else
      url "https://github.com/findyourexit/git-pr-tui/releases/download/v0.1.0/gpr-0.1.0-x86_64-apple-darwin.tar.gz"
      sha256 "db127ee57856d0e36edb57db48882fa1cc725fa825bf14a17ccd795d64860167"
    end
  end

  def install
    bin.install "gpr"
  end

  test do
    assert_match "gpr", shell_output("#{bin}/gpr --version")
  end
end
