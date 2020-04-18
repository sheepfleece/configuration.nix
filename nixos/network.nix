{ pkgs, config, ... }:

{
  networking.extraHosts = builtins.readFile "${./data/hosts}";
  # Don't waste your time, you!
  networking.hosts = {
    "0.0.0.0" = [ 
      "steamcommunity.com" "www.steamcommunity.com"  
      "dobrochan.ru" "www.dobrochan.ru"  
      "dobrochan.com" "www.dobrochan.com"  
      "dobrochan.net" "www.dobrochan.net"  
      "nowere.net" "www.nowere.net"  
      "linux.org.ru" "www.linux.org.ru"
      # "reddit.com" "www.reddit.com"
      "opennet.ru" "www.opennet.ru"
      "news.ycombinator.com" "news.www.ycombinator.com"

      "facebook.com" "www.facebook.com"
      "api.facebook.com" "fbcdn.net" "www.fbcdn.net"
      "support.hp.com" "hp.com"
      "store.hp.com" "www3.hp.com"
      "id.hp.com" "ext.hp.com"
      "123.hp.com" "hpclould.hp.com"
      "www2.hp.com" "www1.hp.com"
      "www.hp.com"
      
















      
      
      
      
      
      
      
      
      
      
      
      
      
      
      
      
      
      
      
      
      
      "youtube.com" "www.youtube.com"
      # "twitch.tv" "www.twitch.tv"
      "discordapp.com" "www.discordapp.com"
    ];
  };
}
