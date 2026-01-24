{
  description = "A quarto development flake with pdf";
  #Pinning nixpkgs to commit on September 1st, 2025. Quarto broken with Deno2 :/
  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/22b3e817a2916e4bbd745e141d7129cec1499fb5";
    flake-utils.url = "github:numtide/flake-utils";
  };

  outputs = {
    self,
    nixpkgs,
    flake-utils,
  }:
    flake-utils.lib.eachDefaultSystem (system: let
      pkgs = nixpkgs.legacyPackages.${system};
      rmark = pkgs.rPackages.buildRPackage {
        name = "rix";
        src = pkgs.fetchFromGitHub {
          owner = "ropensci";
          repo = "rix";
          rev = "287e8bd5d41649247747a499e459ef33cc7c76e0";
          sha256 = "0v4q9zqffv97nc4zda8db2jlgwws7pgqbq3pk4fn34zf50zb792d";
        };
        propagatedBuildInputs = with pkgs.rPackages; [
          bslib
          codetools
          curl
          data_table
          evaluate
          ggrepel
          ggplot2
          glue
          jsonlite
          knitr
          mvtnorm
          R_utils
          stringr
          sys
          tinytex
          yaml
          xfun
        ];
      };
    in {
      devShells.default = pkgs.mkShell {
        nativeBuildInputs = [pkgs.bashInteractive];
        buildInputs = with pkgs; [R rmark pandoc poppler_utils quarto texliveFull];
      };
    });
}
