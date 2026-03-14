{ inputs, pkgs, ... }: {
  #imports = [ inputs.colorshell.packages.x86_64-linux.default ];
  
  environment.systemPackages = with pkgs; [
    # keep-sorted start
    inputs.colorshell.packages.x86_64-linux.default
    # keep-sorted end
  ];
}
