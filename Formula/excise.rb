# typed: strict
# frozen_string_literal: true

# Excise binary formula for the first-party tap.
class Excise < Formula
  desc "Surgical terminal storage navigator"
  homepage "https://github.com/findyourexit/excise"
  license "MIT"
  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/findyourexit/excise/releases/download/v1.0.0/excise-aarch64-apple-darwin-v1.0.0.tar.gz"
      sha256 "75a4f176360182fedc68cb3cb2594cec65cff8bbe96851e94c0852276d446eb8"
    else
      url "https://github.com/findyourexit/excise/releases/download/v1.0.0/excise-x86_64-apple-darwin-v1.0.0.tar.gz"
      sha256 "7e562a9268aaf30f38e0cb2684d6411bd533c89fd05e58344c83848fdad37d0c"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/findyourexit/excise/releases/download/v1.0.0/excise-aarch64-unknown-linux-gnu-v1.0.0.tar.gz"
      sha256 "fd6972b1ca0d8902f3825b105169246e9a5a4f8d6972904325dbb169a836bced"
    else
      url "https://github.com/findyourexit/excise/releases/download/v1.0.0/excise-x86_64-unknown-linux-gnu-v1.0.0.tar.gz"
      sha256 "9d005a2890a5cf9e35847c2c226640714dde3e024fe5a85ad75349f13a2a35a0"
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
