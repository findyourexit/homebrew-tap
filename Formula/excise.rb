# typed: strict
# frozen_string_literal: true

# Excise binary formula for the first-party tap.
class Excise < Formula
  desc "Surgical terminal storage navigator"
  homepage "https://github.com/findyourexit/excise"
  license "MIT"
  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/findyourexit/excise/releases/download/v1.2.2/excise-aarch64-apple-darwin-v1.2.2.tar.gz"
      sha256 "4174ac76f790f4a836de6466ec94668c5bfa29820e384af9eca7335581ae5b33"
    else
      url "https://github.com/findyourexit/excise/releases/download/v1.2.2/excise-x86_64-apple-darwin-v1.2.2.tar.gz"
      sha256 "22384591022f998de51e85dc9bffacaec6aefc16307f0d83e69e01d4b8d52219"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/findyourexit/excise/releases/download/v1.2.2/excise-aarch64-unknown-linux-gnu-v1.2.2.tar.gz"
      sha256 "97f1c065d59fe6641365fb22550cff9737dc4c3902f3873a178eba8c652947fe"
    else
      url "https://github.com/findyourexit/excise/releases/download/v1.2.2/excise-x86_64-unknown-linux-gnu-v1.2.2.tar.gz"
      sha256 "98b2de6a7364473336fbe3dc51e42ef47e4d0cf641ec663d24890c44350944aa"
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
