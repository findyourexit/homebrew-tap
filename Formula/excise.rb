# typed: strict
# frozen_string_literal: true

# Excise binary formula for the first-party tap.
class Excise < Formula
  desc "Surgical terminal storage navigator"
  homepage "https://github.com/findyourexit/excise"
  license "MIT"
  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/findyourexit/excise/releases/download/v1.0.2/excise-aarch64-apple-darwin-v1.0.2.tar.gz"
      sha256 "a6b3b9dc31b4bde9a4fdf6701147d7dd915d755dab169b62c68516287acee3fd"
    else
      url "https://github.com/findyourexit/excise/releases/download/v1.0.2/excise-x86_64-apple-darwin-v1.0.2.tar.gz"
      sha256 "a550327c0d507257103e49699417568b84247fde022a00513740164faeafbef0"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/findyourexit/excise/releases/download/v1.0.2/excise-aarch64-unknown-linux-gnu-v1.0.2.tar.gz"
      sha256 "ebd09b4f6891a04e76db4cc403ceb644296949b4f1ac9a75d14c89ca4348c93b"
    else
      url "https://github.com/findyourexit/excise/releases/download/v1.0.2/excise-x86_64-unknown-linux-gnu-v1.0.2.tar.gz"
      sha256 "1372c9520a4e13589c24b08cc1a63c180ff9386639a2f7bc24f192f1789fbc7f"
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
