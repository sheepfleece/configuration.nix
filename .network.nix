{ pkgs, config, ... }:


{  
  networking.extraHosts = let 
    hostsPath = https://raw.githubusercontent.com/StevenBlack/hosts/master/alternates/fakenews-gambling-porn-social/hosts;
    hostsFile = builtins.fetchurl hostsPath;
  in builtins.readFile "${hostsFile}";

  # Don't waste your time, you!
  networking.hosts = {
    "0.0.0.0" = [ 
      "onliner.by" "www.onliner.by"

      "dobrochan.ru"  "www.dobrochan.ru"  
      "dobrochan.com" "www.dobrochan.com"  

      "linux.org.ru"  "www.linux.org.ru"
      "opennet.ru"    "www.opennet.ru"
      "news.ycombinator.com" "news.www.ycombinator.com"
      "twitch.tv"       "www.twitch.tv"
      "youtube.com" "www.youtube.com"
      "discord.com" "www.discord.com"

      "dobrochan.net" "www.dobrochan.net"
      "nowere.net" "www.nowere.net"
      "lainchan.org" "www.lainchan.org"
      "tohno-chan.com" "www.tohno-chan.com"
      "uboachan.net" "www.uboachan.net"
      "tut.by" "www.tut.by"
      "people.onliner.by" "www.people.onliner.by"
      "news.tut.by" "www.news.tut.by"
      "vk.com" "www.vk.com"

      "steam.com" "www.steam.com"
      "steamcommunity.com" "www.steamcommunity.com"
    ];
  };
}
