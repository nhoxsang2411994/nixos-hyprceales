{ rootPath, pkgs, ... }: {

  services.hyprpaper = {
    enable = true;
    settings =
      let
        walldir = "${rootPath}/home/hyprpaper";
        moony-mountains = "${rootPath}/home/hyprpaper/moony-mountains.jpg";
        abstract-darkhole = "${rootPath}/home/hyprpaper/abstract-darkhole.png";
      in {
        #preload = [ anime_skull moony-mountains ];
        wallpaper = {
          monitor = "HDMI-A-2";
          path = "${walldir}";
          fit_mode = "cover";
          timeout = 300;# seconds
        };
      };
  };
}
