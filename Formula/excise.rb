# typed: strict
# frozen_string_literal: true

# Excise binary formula for the first-party tap.
class Excise < Formula
  desc "Surgical terminal storage navigator"
  homepage "https://github.com/findyourexit/excise"
  license "MIT"
  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/findyourexit/excise/releases/download/v1.2.4/excise-aarch64-apple-darwin-v1.2.4.tar.gz"
      sha256 "4918316d34038c8e763b2f15137e4c3e10fede3d583665a51155c5a50512a5ee"
    else
      url "https://github.com/findyourexit/excise/releases/download/v1.2.4/excise-x86_64-apple-darwin-v1.2.4.tar.gz"
      sha256 "b2a7e230260d7019b289dd1a6997afc72f6f0b593b4cf9e947e63bb94df28385"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/findyourexit/excise/releases/download/v1.2.4/excise-aarch64-unknown-linux-gnu-v1.2.4.tar.gz"
      sha256 "d7029b20fc0c203cbd2b94ac2c1f2ceefeb519846f7569fdf769a5dc651a37b6"
    else
      url "https://github.com/findyourexit/excise/releases/download/v1.2.4/excise-x86_64-unknown-linux-gnu-v1.2.4.tar.gz"
      sha256 "ddca197c2af3e639db0a5d81cec267903462194709765a5ce38e1291a17232c5"
    end
  end

  def install
    bin.install "excise"
    man1.install "generated/man/excise.1"
    bash_completion.install "generated/completions/excise.bash" => "excise"
    zsh_completion.install "generated/completions/_excise"
    fish_completion.install "generated/completions/excise.fish"
    pkgshare.install "schemas"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/excise --version")
    assert_match "scan-report", shell_output("#{bin}/excise --format json #{testpath}")
  end
end
