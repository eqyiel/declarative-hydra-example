{ nixpkgs }:
let
  pkgs = import nixpkgs {};

  crossPkgs = import nixpkgs {
    crossSystem = pkgs.lib.systems.platforms.raspberrypi2;
  };
in {
  inherit (crossPkgs) hello gcc;

}
