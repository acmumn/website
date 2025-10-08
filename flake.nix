{
  description = "quick zola flake";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";
  };
  outputs = { self, nixpkgs, ... }:
  let
    system = "x86_64-linux";
    pkgs = import nixpkgs { inherit system; config.allowUnfree = true; };
  in
  {
    devShells.${pkgs.system}.default = pkgs.mkShell {
      packages = with pkgs; [
      	zola
      ];
    };
  };
}
