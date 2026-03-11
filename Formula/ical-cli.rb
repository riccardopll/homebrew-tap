# frozen_string_literal: true

class IcalCli < Formula
  desc "Read-only macOS Calendar CLI"
  homepage "https://github.com/riccardopll/ical-cli"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/riccardopll/ical-cli/releases/download/2026.03.11.1/ical-cli-2026.03.11.1-arm64-macos.tar.gz"
      sha256 "828eb94728ee442d5c8372ca1dd88f3864d6874dd9bbfc3c3a257642c8af28c6"
    else
      url "https://github.com/riccardopll/ical-cli/releases/download/2026.03.11.1/ical-cli-2026.03.11.1-x86_64-macos.tar.gz"
      sha256 "f8cfc48ee7219a3ea8eedfdaec34f001876611eb44d2118107d4f35b42411b20"
    end
  end

  def install
    bin.install "ical-cli" => "ical"
  end

  test do
    ENV["ICAL_CALENDAR_DB_PATH"] = (testpath / "missing.sqlite").to_s
    output = shell_output("#{bin}/ical calendars 2>&1", 1)
    assert_match "Calendar DB not found", output
  end
end
