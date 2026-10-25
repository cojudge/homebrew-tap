cask "cojudge" do
  version "0.8.7"
  sha256 "68af7b1f4260c4d5d53b47c5e08ea17aae383b8697ee2010e6746fba68e91d30"

  url "https://github.com/cojudge/cojudge/releases/download/v#{version}/Cojudge_#{version}_universal.dmg"
  name "Cojudge"
  desc "Offline-first code judge for solving algorithmic problems"
  homepage "https://cojudge.cloud/"

  livecheck do
    url :url
    strategy :github_latest
  end

  auto_updates true
  depends_on macos: :ventura

  app "Cojudge.app"

  zap trash: [
    "~/Library/Application Support/cloud.cojudge.desktop",
    "~/Library/Caches/cloud.cojudge.desktop",
    "~/Library/Preferences/cloud.cojudge.desktop.plist",
    "~/Library/Saved Application State/cloud.cojudge.desktop.savedState",
  ]

  caveats <<~EOS
    First install only (app is ad-hoc signed, not yet notarized):
      xattr -dr com.apple.quarantine /Applications/Cojudge.app

    Then launch Cojudge from the Applications folder, or with:
      open -a Cojudge
  EOS
end
