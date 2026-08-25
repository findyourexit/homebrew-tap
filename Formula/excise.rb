# typed: strict
# frozen_string_literal: true

# Excise binary formula for the first-party tap.
class Excise < Formula
  desc "Surgical terminal storage navigator"
  homepage "https://github.com/findyourexit/excise"
  license "MIT"
  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/findyourexit/excise/releases/download/v0.1.2/excise-aarch64-apple-darwin-v0.1.2.tar.gz"
      sha256 "495cf9dafc576e8a9e329cf6b8461853ee7f9a6939a0ede7bc90a4466c638257"
    else
      url "https://github.com/findyourexit/excise/releases/download/v0.1.2/excise-x86_64-apple-darwin-v0.1.2.tar.gz"
      sha256 "8b933b031edce1aa6faddea89017d4cce8c34a9169b196681ff566b070721e03"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/findyourexit/excise/releases/download/v0.1.2/excise-aarch64-unknown-linux-gnu-v0.1.2.tar.gz"
      sha256 "e829e1ca21ed0ee05b32d81ab7aaab47ca3ac36bb36adb6c001968dac4792f60"
    else
      url "https://github.com/findyourexit/excise/releases/download/v0.1.2/excise-x86_64-unknown-linux-gnu-v0.1.2.tar.gz"
      sha256 "616df05b0ccc5ef28447bd1419536ee3543e4bf41d246cdd3b9697bb828b32f7"
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
