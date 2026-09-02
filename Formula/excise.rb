# typed: strict
# frozen_string_literal: true

# Excise binary formula for the first-party tap.
class Excise < Formula
  desc "Surgical terminal storage navigator"
  homepage "https://github.com/findyourexit/excise"
  license "MIT"
  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/findyourexit/excise/releases/download/v1.2.1/excise-aarch64-apple-darwin-v1.2.1.tar.gz"
      sha256 "3e1382e5fdc4329750728b1a0d4d8463625e0fa4a5a2d60264790a021b0c9f4e"
    else
      url "https://github.com/findyourexit/excise/releases/download/v1.2.1/excise-x86_64-apple-darwin-v1.2.1.tar.gz"
      sha256 "ec1cda1c2d99cfaba6fc750141ba57b500cc78c73fdceb1f5046d73f864aeba4"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/findyourexit/excise/releases/download/v1.2.1/excise-aarch64-unknown-linux-gnu-v1.2.1.tar.gz"
      sha256 "e259f53885f33a8a5b64b459990f4c755845e05bc98be67f820541755804560c"
    else
      url "https://github.com/findyourexit/excise/releases/download/v1.2.1/excise-x86_64-unknown-linux-gnu-v1.2.1.tar.gz"
      sha256 "df039dd469deddbfe0c378ad58c68f2645696f9554c3686f8f5b7031d6b0dec4"
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
