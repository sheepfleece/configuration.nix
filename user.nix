{ pkgs, config, ... }:

{
 # Define a user account. Don't forget to set a password with ‘passwd’.
   users = {
     mutableUsers = false;
     users = {
       root.hashedPassword = 
         "$6$nU54ZZDNYhBr$gj7sNjcx1Q3xojz4X4tziV4k6ytMAs9JEeBuArjCaEoiWZlWb7OfX0E4JSGU0XARbemBQWXjRsmlERskt47Kt0";
       sheep = {
         hashedPassword =
           "$6$VzlFxmddDB$5Qt2Vo5RtwzTJpEUsF1yMIzGs8kbWLM3dBTWnzDfsyBvCbNZcK6gRRZOBcjRkVR38MA5Cge3mY6edZ.i73MbB1";
         isNormalUser = true;
         shell = pkgs.fish;
         extraGroups = [ 
           "wireshark"
           "wheel"           # sudo  
           "networkmanager" 
           "video"           # light
           "audio"           # ???
           "lp"              # printer
         ]; 
       };
    };
  };
}
