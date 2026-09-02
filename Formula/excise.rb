# typed: strict
# frozen_string_literal: true

# Excise binary formula for the first-party tap.
class Excise < Formula
  desc "Surgical terminal storage navigator"
  homepage "https://github.com/findyourexit/excise"
  license "MIT"
  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/findyourexit/excise/releases/download/v1.2.0/excise-aarch64-apple-darwin-v1.2.0.tar.gz"
      sha256 "49d2197d3ce0c3fa46d54af095d999137d59adfede1de9f30dd7fb1f8e21ceaf"
    else
      url "https://github.com/findyourexit/excise/releases/download/v1.2.0/excise-x86_64-apple-darwin-v1.2.0.tar.gz"
      sha256 "ca6ca79f0c5ddeaaab9032f0f00b7239e3901238761d56bb829ef55208dd1a8d"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/findyourexit/excise/releases/download/v1.2.0/excise-aarch64-unknown-linux-gnu-v1.2.0.tar.gz"
      sha256 "e70fb2a9b40144a5df7d01e6d8499021b688bdfd7c45019c2d25dbbfac9115df"
    else
      url "https://github.com/findyourexit/excise/releases/download/v1.2.0/excise-x86_64-unknown-linux-gnu-v1.2.0.tar.gz"
      sha256 "0cf4f1be84d38c6d1443b6c1f38c375b4ffe2e349cc4a4f35764e05226935331"
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
