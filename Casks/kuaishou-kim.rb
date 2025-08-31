cask "kuaishou-kim" do
  arch arm: "-arm"

  version "5.0.4,59510"
  sha256 arm:   "266fab10eb206e27e3f5200dd59e5f7573d2cb6fcd734996b7327a8d6fb238de",
         intel: "fec0209e4217e3ff0014d269829ebf494737a008f3f6873adbfd67aa2aa3a948"

  url "https://kim.static.yximgs.com/udata/pkg/kim-install/Kim-#{version.csv.first}-#{version.csv.second}#{arch}.dmg",
      verified: "kim.static.yximgs.com/udata/pkg/kim-install/"
  name "Kim"
  desc "Empower Efficiency with Collaboration"
  homepage "https://kim.kuaishou.com/"

  livecheck do
    url "https://kim.kuaishou.com/mis/deploy/version/v2/appDownloadUrl?type=darwin#{arch}"
    regex(/Kim[._-](\d+(?:\.\d+)+)[._-](\d+)(?:-arm)?\.dmg/i)
    strategy :json do |json, regex|
      json.map do |_|
        url = json.dig("data", "format")
        match = url&.match(regex)
        next if match.nil?

        "#{match[1]},#{match[2]}"
      end
    end
  end

  auto_updates true
  depends_on macos: ">= :catalina"

  app "Kim.app"

  uninstall quit: "Kem"

  zap trash: [
    "~/Library/Application Support/Kim (Kim)",
    "~/Library/Application Support/Kim",
    "~/Library/Logs/Kim",
    "~/Library/Preferences/Kem.plist",
  ]
end
