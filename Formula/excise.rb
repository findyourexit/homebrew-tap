# typed: strict
# frozen_string_literal: true

# Excise binary formula for the first-party tap.
class Excise < Formula
  desc "Surgical terminal storage navigator"
  homepage "https://github.com/findyourexit/excise"
  license "MIT"
  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/findyourexit/excise/releases/download/v1.3.0/excise-aarch64-apple-darwin-v1.3.0.tar.gz"
      sha256 "270ed1e886f6ed9c8d5ae32e1a98b4d84f87f8960e11e041be550a795ef72056"
    else
      url "https://github.com/findyourexit/excise/releases/download/v1.3.0/excise-x86_64-apple-darwin-v1.3.0.tar.gz"
      sha256 "ddc9ab5826cfe49b7287b3666dd9bd6d513971392a9cc536b39cf2e5df34d32a"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/findyourexit/excise/releases/download/v1.3.0/excise-aarch64-unknown-linux-gnu-v1.3.0.tar.gz"
      sha256 "9fdc8c9086748992651422e97fd55e61431c397e1b30ec1cc67503ff2d03ddb1"
    else
      url "https://github.com/findyourexit/excise/releases/download/v1.3.0/excise-x86_64-unknown-linux-gnu-v1.3.0.tar.gz"
      sha256 "1f83acd45855ca8851510f6078d3910e827228fc773410b8075fc89b1bfa5020"
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
