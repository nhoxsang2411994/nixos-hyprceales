{ inputs, pkgs, ... }: {
  #imports = [ inputs.colorshell.packages.x86_64-linux.default ];
  
  environment.systemPackages = with pkgs; [
    # keep-sorted start
#     inputs.astal-git.packages.x86_64-linux.default
#     inputs.colorshell.packages.x86_64-linux.default
#     jq
    # keep-sorted end
  ];
}
