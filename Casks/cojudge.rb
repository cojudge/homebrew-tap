cask "cojudge" do
  version "0.8.9"
  sha256 "bc2d5cc54d31cf9f69165d994eba04e62df6ee293ac4c6ff9cf8ead626cdcf73"

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
