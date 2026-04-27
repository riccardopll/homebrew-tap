# frozen_string_literal: true

class Ical < Formula
  desc "Read-only macOS Calendar CLI"
  homepage "https://github.com/riccardopll/ical"
  url "https://github.com/riccardopll/ical/archive/refs/tags/2026.04.28.1.tar.gz"
  sha256 "97498a1586ab5c360a56ea22729ba24744380753385fe92eea6925d2be8ab26d"
  license "MIT"

  on_macos do
    on_arm do
      resource "ical-binary" do
        url "https://github.com/riccardopll/ical/releases/download/2026.04.28.1/ical-2026.04.28.1-arm64-macos.tar.gz"
        sha256 "9f67f19e39e485825ff49fd2615bb62ea8bf6618010c9fd5332da8d27733fad6"
      end
    end

    on_intel do
      resource "ical-binary" do
        url "https://github.com/riccardopll/ical/releases/download/2026.04.28.1/ical-2026.04.28.1-x86_64-macos.tar.gz"
        sha256 "2822e5b6cc3c7310f1c27f2afd04ce20b7feb98f88733ec7703b631829a98c21"
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
