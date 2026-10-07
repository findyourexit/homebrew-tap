# typed: strict
# frozen_string_literal: true

# Excise binary formula for the first-party tap.
class Excise < Formula
  desc "Surgical terminal storage navigator"
  homepage "https://github.com/findyourexit/excise"
  license "MIT"
  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/findyourexit/excise/releases/download/v1.4.0/excise-aarch64-apple-darwin-v1.4.0.tar.gz"
      sha256 "99d6217cdd74fb8c4a83a8d6472357b4bd182d60e9c76ee9eb030d32562f2a23"
    else
      url "https://github.com/findyourexit/excise/releases/download/v1.4.0/excise-x86_64-apple-darwin-v1.4.0.tar.gz"
      sha256 "1c71c91b47b0de7245ed46b9812bebf2dfde4cb9bc93595c7addfe7a5a25515d"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/findyourexit/excise/releases/download/v1.4.0/excise-aarch64-unknown-linux-gnu-v1.4.0.tar.gz"
      sha256 "881cde0dbe238ee1c738420209048cc05285ce4ef43c1ebf5f52cf033e7e6521"
    else
      url "https://github.com/findyourexit/excise/releases/download/v1.4.0/excise-x86_64-unknown-linux-gnu-v1.4.0.tar.gz"
      sha256 "38857c3e466cb3909030a1de09dad2a3bd5029dc14c8733fc39d97628a9863b8"
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
