# typed: strict
# frozen_string_literal: true

# Excise binary formula for the first-party tap.
class Excise < Formula
  desc "Surgical terminal storage navigator"
  homepage "https://github.com/findyourexit/excise"
  license "MIT"
  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/findyourexit/excise/releases/download/v1.2.3/excise-aarch64-apple-darwin-v1.2.3.tar.gz"
      sha256 "7c3bd279f26274369505da5ddaa3aba87268f1119fc8f37acce9505155cf85b9"
    else
      url "https://github.com/findyourexit/excise/releases/download/v1.2.3/excise-x86_64-apple-darwin-v1.2.3.tar.gz"
      sha256 "4e8486ff2df7d70b71d4511e06d8ea4d7765002c4d913f14b4f7a3071d8e4fff"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/findyourexit/excise/releases/download/v1.2.3/excise-aarch64-unknown-linux-gnu-v1.2.3.tar.gz"
      sha256 "3bda839a86a6b5756eafa736b4aed9fcb4b53cdcca0ad9045cb921cf86947b5a"
    else
      url "https://github.com/findyourexit/excise/releases/download/v1.2.3/excise-x86_64-unknown-linux-gnu-v1.2.3.tar.gz"
      sha256 "5c0344b933e43a4fba1a3b0acc4eb42af6eff9a542d59dee3b406076222e5035"
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
