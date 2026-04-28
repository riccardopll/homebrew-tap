# frozen_string_literal: true

class Ytfeed < Formula
  desc "Scrape YouTube homepage videos into an LLM-friendly format"
  homepage "https://github.com/riccardopll/ytfeed"
  url "https://github.com/riccardopll/ytfeed/releases/download/0.0.6/ytfeed-0.0.6-arm64-macos.tar.gz"
  sha256 "d2534c66503a58448ab536596039f419e2c18ce67cb58dcf7d4df8f591dc77e8"
  license "MIT"

  on_macos do
    on_intel do
      url "https://github.com/riccardopll/ytfeed/releases/download/0.0.6/ytfeed-0.0.6-x86_64-macos.tar.gz"
      sha256 "ef27a02ed1c3ac4905894ee2f5e3b2b408d4746750c2e918469cf82a7675578d"
    end
  end

  on_linux do
    disable! date: "2026-04-28", because: :unsupported
  end

  def install
    libexec.install "ytfeed"
    libexec.install Dir["libexec/*"]
    bin.write_exec_script libexec/"ytfeed"
  end

  test do
    assert_match "Scrape videos from the YouTube homepage", shell_output("#{bin}/ytfeed --help")
  end
end
