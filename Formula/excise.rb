# typed: strict
# frozen_string_literal: true

# Excise binary formula for the first-party tap.
class Excise < Formula
  desc "Surgical terminal storage navigator"
  homepage "https://github.com/findyourexit/excise"
  license "MIT"
  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/findyourexit/excise/releases/download/v1.0.1/excise-aarch64-apple-darwin-v1.0.1.tar.gz"
      sha256 "b7e704fbdfeb6ddc20535527ee183f612c54b8386a82a58f3be7123936f62a85"
    else
      url "https://github.com/findyourexit/excise/releases/download/v1.0.1/excise-x86_64-apple-darwin-v1.0.1.tar.gz"
      sha256 "4f1d2ac86a29df8816bcab2807dc4eba77f00f286651a736c2e1b5652b42c45d"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/findyourexit/excise/releases/download/v1.0.1/excise-aarch64-unknown-linux-gnu-v1.0.1.tar.gz"
      sha256 "32ab7dc7539a9adcdc2c130da712fb6c7a248dfba8ca71beaca68c6e5eeea077"
    else
      url "https://github.com/findyourexit/excise/releases/download/v1.0.1/excise-x86_64-unknown-linux-gnu-v1.0.1.tar.gz"
      sha256 "4a04cea3b83d1e3ee36802443ae79f643f88c3c7d1a9be475e6ab30df226c9aa"
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
