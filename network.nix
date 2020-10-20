{ pkgs, config, ... }:

# {}
{  
  networking.extraHosts = let 
    hostsPath = https://raw.githubusercontent.com/StevenBlack/hosts/master/alternates/fakenews-gambling-porn-social/hosts;
    hostsFile = builtins.fetchurl hostsPath;
  in builtins.readFile "${hostsFile}";

  # Don't waste your time, you!
  networking.hosts = {
    "0.0.0.0" = [ 
      "last.fm"       "www.last.fm"
      "youtube.com"   "www.youtube.com"
      "twitter.com"   "www.twitter.com"
      "twitch.tv"     "www.twitch.tv"
      "dobrochan.ru"  "www.dobrochan.ru"
      "dobrochan.net" "www.dobrochan.net"
      "dobrochan.com" "www.dobrochan.com"
      "tut.by"        "www.tut.by"
      "onliner.by"    "www.onliner.by"
    ];
  };
}
