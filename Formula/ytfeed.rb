# frozen_string_literal: true

class Ytfeed < Formula
  desc "Scrape YouTube homepage videos into an LLM-friendly format"
  homepage "https://github.com/riccardopll/ytfeed"
  url "https://github.com/riccardopll/ytfeed/releases/download/0.0.5/ytfeed-0.0.5-arm64-macos.tar.gz"
  sha256 "1ab6859b49f40a4695e76d41f15fb1603887f43f566c93876171880cef6c5baa"
  license "MIT"

  on_macos do
    on_intel do
      url "https://github.com/riccardopll/ytfeed/releases/download/0.0.5/ytfeed-0.0.5-x86_64-macos.tar.gz"
      sha256 "658c4bddca47f624913f1d9338e5a3c2ce27e318d097299c9f78b20c1e7c346f"
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
