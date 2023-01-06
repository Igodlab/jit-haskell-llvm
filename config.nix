{
  packageOverrides = pkgs: {
    haskellPackages = pkgs.haskellPackages.override {
      overrides = haskellPackagesNew: haskellPackagesOld: {
        jit-haskell-llvm = haskellPackagesNew.callPackage ./default.nix { };
      };
    };
  };
}

