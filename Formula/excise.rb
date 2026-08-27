# typed: strict
# frozen_string_literal: true

# Excise binary formula for the first-party tap.
class Excise < Formula
  desc "Surgical terminal storage navigator"
  homepage "https://github.com/findyourexit/excise"
  license "MIT"
  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/findyourexit/excise/releases/download/v0.2.0/excise-aarch64-apple-darwin-v0.2.0.tar.gz"
      sha256 "9ac806f032fc0ea8ebbacbc2d5801d3921caea27156b43fcd67f1de26aa6f877"
    else
      url "https://github.com/findyourexit/excise/releases/download/v0.2.0/excise-x86_64-apple-darwin-v0.2.0.tar.gz"
      sha256 "747c8c05163564afc711ef6a3e5e99e3235f79ea59abe12bbc2ebe75563602c9"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/findyourexit/excise/releases/download/v0.2.0/excise-aarch64-unknown-linux-gnu-v0.2.0.tar.gz"
      sha256 "3daec912e0c0ba220716953bafbb53207cb49c2da25366223c978e2908a498a5"
    else
      url "https://github.com/findyourexit/excise/releases/download/v0.2.0/excise-x86_64-unknown-linux-gnu-v0.2.0.tar.gz"
      sha256 "9d3ac654d65587f8cb5af2209df4ac676f573b99e04cd7f939f56a519cd17708"
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
