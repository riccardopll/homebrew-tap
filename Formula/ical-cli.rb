# frozen_string_literal: true

class IcalCli < Formula
  desc "Read-only macOS Calendar CLI"
  homepage "https://github.com/riccardopll/ical-cli"
  url "https://github.com/riccardopll/ical-cli/archive/refs/tags/2026.03.11.1.tar.gz"
  sha256 "93dcbfd720c05125f4def7b70b81d61049567a9ecdcb14177f2a5d414f2c3f52"
  license "MIT"

  on_macos do
    on_arm do
      resource "ical-cli-binary" do
        url "https://github.com/riccardopll/ical-cli/releases/download/2026.03.11.1/ical-cli-2026.03.11.1-arm64-macos.tar.gz"
        sha256 "828eb94728ee442d5c8372ca1dd88f3864d6874dd9bbfc3c3a257642c8af28c6"
      end
    end

    on_intel do
      resource "ical-cli-binary" do
        url "https://github.com/riccardopll/ical-cli/releases/download/2026.03.11.1/ical-cli-2026.03.11.1-x86_64-macos.tar.gz"
        sha256 "f8cfc48ee7219a3ea8eedfdaec34f001876611eb44d2118107d4f35b42411b20"
      end
    end
  end

  on_linux do
    disable! date: "2026-03-11", because: :unsupported
  end

  def install
    resource("ical-cli-binary").stage do
      bin.install "ical-cli" => "ical"
    end
  end

  test do
    ENV["ICAL_CALENDAR_DB_PATH"] = (testpath / "missing.sqlite").to_s
    output = shell_output("#{bin}/ical calendars 2>&1", 1)
    assert_match "Calendar DB not found", output
  end
end
