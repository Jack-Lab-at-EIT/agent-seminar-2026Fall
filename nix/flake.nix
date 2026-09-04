{
  description = "A startup basic project";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixpkgs-unstable";

    flake-parts = {
      url = "github:hercules-ci/flake-parts";
      inputs.nixpkgs-lib.follows = "nixpkgs";
    };
    devshell = {
      url = "github:numtide/devshell";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs =
    inputs@{ flake-parts, ... }:
    flake-parts.lib.mkFlake { inherit inputs; } {
      imports = [ inputs.devshell.flakeModule ];

      perSystem = { pkgs, ... }: {
        devshells.default =
          let
            tex = (
              pkgs.texliveBasic.withPackages (
                ps: with ps; [
                  dvisvgm
                  dvipng # for preview and export as html
                  amsmath
                  latexmk
                  enumitem
                  booktabs
                  titlesec
                  xcolor
                  ctex
                  xecjk
                  xetex
                  fontspec
                ]
              )
            );
          in
          {
            packages = with pkgs; [
              typst
              tinymist
              tex
            ];
          };
      };

      systems = [
        "x86_64-linux"
        "aarch64-linux"
        "aarch64-darwin"
        "x86_64-darwin"
      ];
    };
}
