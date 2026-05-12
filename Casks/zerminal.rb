cask "zerminal" do
  version "0.1.17"
  sha256 "f0cefd809799d910f70db88a7ff17dd755d7c512c81f7f0db85e774af72bb7de"

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
