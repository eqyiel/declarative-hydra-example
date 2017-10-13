{ nixpkgs, declInput }: let pkgs = import nixpkgs {}; in {
  jobsets = pkgs.runCommand "spec.json" {} ''
    cat <<EOF
    ${builtins.toXML declInput}
    EOF
    cat > $out <<EOF
    {
      "master": {
        "enabled": 1,
        "hidden": false,
        "description": "js",
        "nixexprinput": "src",
        "nixexprpath": "release.nix",
        "checkinterval": 300,
        "schedulingshares": 100,
        "enableemail": false,
        "emailoverride": "",
        "keepnr": 3,
        "inputs": {
          "src": {
            "type": "git",
            "value": "git://github.com/eqyiel/hydra-jobs.git",
            "emailresponsible": false
          },
          "nixpkgs": {
            "type": "git",
            "value": "git://github.com/eqyiel/nixpkgs.git aisaka.maher.fyi",
            "emailresponsible": false
          }
        }
      }
    }

    EOF
  '';
}

