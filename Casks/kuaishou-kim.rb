cask "kuaishou-kim" do
  arch arm: "-arm"

  version "5.0.3,59346"
  sha256 arm:   "6a846a11a92a3e0be04a7acf015c176b6206ff5f44352e41989b8dc11e829924",
         intel: "f8bdc88c92efed5ece0ac90e648b8501661aff7c1d48f35e941f366590100dc8"

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

  app "Kim.app"

  uninstall quit: "Kem"

  zap trash: [
    "~/Library/Application Support/Kim (Kim)",
    "~/Library/Application Support/Kim",
    "~/Library/Logs/Kim",
    "~/Library/Preferences/Kem.plist",
  ]
end
