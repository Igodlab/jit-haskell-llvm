let 
  pkgs = import <nixpkgs> { config = import ./config.nix; };
in 
  pkgs.haskellPackages.jit-haskell-llvm.env
