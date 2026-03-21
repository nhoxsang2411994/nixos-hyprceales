{ inputs, pkgs, ... }: {

  
  home.packages = with pkgs; [
    # colorshell dependencies
    cliphist # clipboard manager
    wireplumber
    fastfetch
    starship
    socat
    curl
    gobject-introspection
    procps
    libglycin
    glycin-loaders
    gjs
    typescript
    ags
    #widgets dependencies
    dart-sass
    pywal16
    grim
    slurp
    pnpm
    jq
    # end colorshell dependencies
    inputs.astal-git.packages.x86_64-linux.default
    inputs.colorshell.packages.x86_64-linux.default
  ];
}
