# frozen_string_literal: true

class Ical < Formula
  desc "Read-only macOS Calendar CLI"
  homepage "https://github.com/riccardopll/ical"
  url "https://github.com/riccardopll/ical/archive/refs/tags/2026.04.28.2.tar.gz"
  sha256 "bc3891d2474dbe2b454d6243b3441b25d1542547de20cf41fd49516b157305f3"
  license "MIT"

  on_macos do
    on_arm do
      resource "ical-binary" do
        url "https://github.com/riccardopll/ical/releases/download/2026.04.28.2/ical-2026.04.28.2-arm64-macos.tar.gz"
        sha256 "aa4e2d574a745b3d277f93b4a151d7629bffe48612ca49d5e864813bfcd3090c"
      end
    end

    on_intel do
      resource "ical-binary" do
        url "https://github.com/riccardopll/ical/releases/download/2026.04.28.2/ical-2026.04.28.2-x86_64-macos.tar.gz"
        sha256 "d8afd50b761e2785c9ed9045118132d28f67f660238cda44e537f9c572c333b1"
      end
    end
  end

  on_linux do
    disable! date: "2026-04-28", because: :unsupported
  end

  def install
    resource("ical-binary").stage do
      bin.install "ical"
    end
  end

  test do
    ENV["ICAL_CALENDAR_DB_PATH"] = (testpath / "missing.sqlite").to_s
    output = shell_output("#{bin}/ical calendars 2>&1", 1)
    assert_match "Calendar DB not found", output
  end
end
