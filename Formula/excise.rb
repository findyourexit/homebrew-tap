# typed: strict
# frozen_string_literal: true

# Excise binary formula for the first-party tap.
class Excise < Formula
  desc "Surgical terminal storage navigator"
  homepage "https://github.com/findyourexit/excise"
  license "MIT"
  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/findyourexit/excise/releases/download/v1.1.1/excise-aarch64-apple-darwin-v1.1.1.tar.gz"
      sha256 "e828c915b91de1a7533b815f34d52c3ef47de6a53c192e2ede2ba2e629a9de02"
    else
      url "https://github.com/findyourexit/excise/releases/download/v1.1.1/excise-x86_64-apple-darwin-v1.1.1.tar.gz"
      sha256 "37710cd76837c1544518417bf33dea94fb8e237e104461349e0fa8e6195c2176"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/findyourexit/excise/releases/download/v1.1.1/excise-aarch64-unknown-linux-gnu-v1.1.1.tar.gz"
      sha256 "699d476fe0eef82e47992a2a2486d295ad29a3f539d9573cc0180c55c39a976b"
    else
      url "https://github.com/findyourexit/excise/releases/download/v1.1.1/excise-x86_64-unknown-linux-gnu-v1.1.1.tar.gz"
      sha256 "f90cec02f6e54af2c2f09b361c03755904b5b331eb2797d8cb33157034819036"
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
