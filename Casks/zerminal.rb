cask "zerminal" do
  version "0.3.0"
  sha256 "e81f1891ac5a3c090e60f288bd2c08531d9cb9f5359b90fec280aeff6160f9e0"

  url "https://github.com/elleryfamilia/zerminal/releases/download/v#{version}/Zerminal-aarch64.dmg"
  name "Zerminal"
  desc "Terminal-first IDE for agentic coding (Zed fork)"
  homepage "https://github.com/elleryfamilia/zerminal"

  livecheck do
    url :url
    strategy :github_latest
  end

  depends_on arch: :arm64
  depends_on macos: ">= :catalina"

  app "Zerminal.app"

  postflight do
    prefix = `brew --prefix`.strip
    dir = "#{prefix}/etc/zerminal"
    FileUtils.mkdir_p dir
    File.write("#{dir}/install_source", "homebrew\n")
  end

  uninstall_postflight do
    prefix = `brew --prefix`.strip
    path = "#{prefix}/etc/zerminal/install_source"
    begin
      File.delete(path)
    rescue Errno::ENOENT
      # File already gone — fine.
    end
  end

  zap trash: [
    "~/Library/Application Support/Zerminal",
    "~/Library/Caches/Zerminal",
    "~/Library/Logs/Zerminal",
    "~/Library/Preferences/dev.zerminal.Zerminal.plist",
    "~/Library/Saved Application State/dev.zerminal.Zerminal.savedState",
  ]
end
