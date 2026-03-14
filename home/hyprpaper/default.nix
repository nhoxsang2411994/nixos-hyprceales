{ rootPath, ... }: {
  services.hyprpaper = {
    enable = true;

    settings =
      let
        anime_skull = "${rootPath}/home/hyprpaper/anime_skull.png";
        moony-mountains = "${rootPath}/home/hyprpaper/moony-mountains.jpg";
      in {
        #preload = [ anime_skull moony-mountains ];
        wallpaper = {
          monitor = "HDMI-A-2";
          path = "${anime_skull}";
          fit_mode = "cover";
        };
      };
  };
}
