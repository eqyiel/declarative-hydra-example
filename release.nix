{ nixpkgs }:
let
  pkgs = import nixpkgs {};

  crossPkgs = import nixpkgs {
    crossSystem = {
      config = "armv7l-unknown-linux-gnueabi";
      bigEndian = false;
      arch = "arm";
      float = "hard";
      fpu = "vfp";
      withTLS = true;
      libc = "glibc";
      platform = pkgs.platforms.raspberrypi2;
      openssl.system = "linux-generic32";
    };
  };
in {
  inherit (crossPkgs) hello gcc;

}
