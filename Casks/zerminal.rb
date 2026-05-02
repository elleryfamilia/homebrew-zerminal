cask "zerminal" do
  version "0.1.10"
  sha256 "b875ff3807ea6c5d86c8a838cbf398e7b24f47f170b139e26c74be4ae2724be7"

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
    File.delete("#{prefix}/etc/zerminal/install_source") rescue nil
  end

  zap trash: [
    "~/Library/Application Support/Zerminal",
    "~/Library/Caches/Zerminal",
    "~/Library/Logs/Zerminal",
    "~/Library/Preferences/dev.zerminal.Zerminal.plist",
    "~/Library/Saved Application State/dev.zerminal.Zerminal.savedState",
  ]
end
