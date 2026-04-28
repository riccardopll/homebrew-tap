# frozen_string_literal: true

class Ytfeed < Formula
  desc "Scrape YouTube homepage videos into an LLM-friendly format"
  homepage "https://github.com/riccardopll/ytfeed"
  url "https://github.com/riccardopll/ytfeed/releases/download/0.0.7/ytfeed-0.0.7-arm64-macos.tar.gz"
  sha256 "bc10945a0c38e537aee225a77030965ad1457f36e873b03cd14899d77c23bbe0"
  license "MIT"

  on_macos do
    on_intel do
      url "https://github.com/riccardopll/ytfeed/releases/download/0.0.7/ytfeed-0.0.7-x86_64-macos.tar.gz"
      sha256 "b6827b2b3f48a783195ee28ab6cbbb755f1901da94a7064802acddc6118563a3"
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
