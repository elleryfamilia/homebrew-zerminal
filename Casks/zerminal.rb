cask "zerminal" do
  version "0.2.1"
  sha256 "19c77baacb2524d6587b0eca2c39765cb7aa780e65087d5142622c3167dd6311"

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
