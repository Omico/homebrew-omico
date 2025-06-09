# frozen_string_literal: true

cask "kuaishou-kim" do
  version "5.0.2,59105"

  on_arm do
    sha256 "2b033079b42b9393b17a83251b96ac58aa89733f13047da8caafb8ddbbd6eeb5"

    url "https://kim.static.yximgs.com/udata/pkg/kim-install/Kim-#{version.csv.first}-#{version.csv.second}-arm.dmg",
        verified: "kim.static.yximgs.com/udata/pkg/kim-install/"
  end
  on_intel do
    sha256 "a19f41005f5c8495f298b1e2ad1d078117314d78aff114da20103c9ff00a9959"

    url "https://kim.static.yximgs.com/udata/pkg/kim-install/Kim-#{version.csv.first}-#{version.csv.second}.dmg",
        verified: "kim.static.yximgs.com/udata/pkg/kim-install/"
  end

  name "Kim"
  desc "Empower Efficiency with Collaboration"
  homepage "https://kim.kuaishou.com/"

  livecheck do
    url do
      on_intel do
        "https://kim.kuaishou.com/mis/deploy/version/v2/appDownloadUrl?type=darwin"
      end
      on_arm do
        "https://kim.kuaishou.com/mis/deploy/version/v2/appDownloadUrl?type=darwin-arm"
      end
    end

    strategy :json do |json|
      url = json.dig("data", "format")
      match = url&.match(/Kim-(\d+(?:\.\d+)+)-(\d+)(?:-arm)?\.dmg/i)
      next if match.nil?

      "#{match[1]},#{match[2]}"
    end
  end

  auto_updates true

  app "Kim.app"

  uninstall quit: "Kem"

  zap trash: [
    "~/Library/Application Support/Kim (Kim)",
    "~/Library/Application Support/Kim",
    "~/Library/Logs/Kim",
    "~/Library/Preferences/Kem.plist",
  ]
end
