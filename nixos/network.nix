{ pkgs, config, ... }:

{
  networking.extraHosts = builtins.readFile "${./data/hosts}";
  # Don't waste your time, you!
  networking.hosts = {
    "0.0.0.0" = [ 
      "onliner.by" "www.onliner.by"
      # "steamcommunity.com" "www.steamcommunity.com"  

      "dobrochan.ru"  "www.dobrochan.ru"  
      "dobrochan.com" "www.dobrochan.com"  
      # "dobrochan.net" "www.dobrochan.net"  
      "nowere.net"    "www.nowere.net"
      "lainchan.org"  "www.lainchan.org"
      "uboachan.net"  "www.uboachan.net"

      "linux.org.ru"  "www.linux.org.ru"
      "opennet.ru"    "www.opennet.ru"
      "news.ycombinator.com" "news.www.ycombinator.com"

      # "youtube.com"     "www.youtube.com"
      "twitch.tv"       "www.twitch.tv"
      "discordapp.com"  "www.discordapp.com"
    ];
  };
}
