# typed: strict
# frozen_string_literal: true

# Excise binary formula for the first-party tap.
class Excise < Formula
  desc "Surgical terminal storage navigator"
  homepage "https://github.com/findyourexit/excise"
  license "MIT"
  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/findyourexit/excise/releases/download/v0.3.0/excise-aarch64-apple-darwin-v0.3.0.tar.gz"
      sha256 "e7377a7a3e1c8eec7dfe312dc26eab7e76180e858805e32c4a50b3da51242d93"
    else
      url "https://github.com/findyourexit/excise/releases/download/v0.3.0/excise-x86_64-apple-darwin-v0.3.0.tar.gz"
      sha256 "bc514731bb92837e4ffc7fa7d3ee9dc9fc7cdc50f825d19c3e628398a25570c9"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/findyourexit/excise/releases/download/v0.3.0/excise-aarch64-unknown-linux-gnu-v0.3.0.tar.gz"
      sha256 "c44059be1aabbe16b5319df5932daa343edf985ad168ba027ec9387f6acd7d1e"
    else
      url "https://github.com/findyourexit/excise/releases/download/v0.3.0/excise-x86_64-unknown-linux-gnu-v0.3.0.tar.gz"
      sha256 "cdcd80c20c4ca102a21655cfae52260b6e24a63e410101f6a9c69b4fd8a84b3f"
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
