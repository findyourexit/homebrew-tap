# typed: strict
# frozen_string_literal: true

# Excise binary formula for the first-party tap.
class Excise < Formula
  desc "Surgical terminal storage navigator"
  homepage "https://github.com/findyourexit/excise"
  license "MIT"
  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/findyourexit/excise/releases/download/v0.1.1/excise-aarch64-apple-darwin-v0.1.1.tar.gz"
      sha256 "e9d5998a0cab0bb46c0bf1d792137b047d862e3aecb80af118cc6da12ddc2969"
    else
      url "https://github.com/findyourexit/excise/releases/download/v0.1.1/excise-x86_64-apple-darwin-v0.1.1.tar.gz"
      sha256 "88edffc17616cad4d8f2b036491bcc620d59a3c376ff1f78a03a19115a7d56ce"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/findyourexit/excise/releases/download/v0.1.1/excise-aarch64-unknown-linux-gnu-v0.1.1.tar.gz"
      sha256 "78405535dc81a86f47c980a041400be3da0c180e3d3410a962037f66ea9c23cf"
    else
      url "https://github.com/findyourexit/excise/releases/download/v0.1.1/excise-x86_64-unknown-linux-gnu-v0.1.1.tar.gz"
      sha256 "d2733c0598f200d9bc27ac0de93e7fab7f7def2f687841d4a56589e949d83946"
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
