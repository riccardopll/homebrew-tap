# frozen_string_literal: true

class TeamsCli < Formula
  desc "Read and send messages through the signed-in Microsoft Teams desktop app"
  homepage "https://github.com/riccardopll/teams-cli"
  url "https://github.com/riccardopll/teams-cli/releases/download/0.2.0/teams-cli-0.2.0-arm64-macos.tar.gz"
  sha256 "ccc5ffa50c0ee7747bbdc7703618dedb677d3356a0ef050f5dcb267b97fc2183"
  license "MIT"

  on_macos do
    on_intel do
      url "https://github.com/riccardopll/teams-cli/releases/download/0.2.0/teams-cli-0.2.0-x86_64-macos.tar.gz"
      sha256 "abcea0dbcffae9b0f49f86b93974389dff48e1c3d0ef82b95bce92e2507f9d76"
    end
  end

  on_linux do
    disable! date: "2026-08-18", because: :unsupported
  end

  def install
    bin.install "teams-cli"
  end

  test do
    assert_match "Read and send messages", shell_output("#{bin}/teams-cli --help")
  end
end
