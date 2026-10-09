# typed: strict
# frozen_string_literal: true

# Excise binary formula for the first-party tap.
class Excise < Formula
  desc "Surgical terminal storage navigator"
  homepage "https://github.com/findyourexit/excise"
  license "MIT"
  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/findyourexit/excise/releases/download/v1.4.1/excise-aarch64-apple-darwin-v1.4.1.tar.gz"
      sha256 "6febcd7f3602d763376afd46b0160c87360a187dc5eeab653739e0767111a856"
    else
      url "https://github.com/findyourexit/excise/releases/download/v1.4.1/excise-x86_64-apple-darwin-v1.4.1.tar.gz"
      sha256 "4a12be14d0ea282a6838c0bc7ec5ca38a3969283fa96d2e27a45a51c548861b8"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/findyourexit/excise/releases/download/v1.4.1/excise-aarch64-unknown-linux-gnu-v1.4.1.tar.gz"
      sha256 "8f9d14c3daf1d595872bff34c3d087052d7ae8ff32a015c972a641418c84e450"
    else
      url "https://github.com/findyourexit/excise/releases/download/v1.4.1/excise-x86_64-unknown-linux-gnu-v1.4.1.tar.gz"
      sha256 "c3647b2dfaf24f6d30dab0e509aebd248784ce7fb104bb6dda7fc7a87d263e59"
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
