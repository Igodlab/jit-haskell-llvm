{ mkDerivation, base, lib }:
mkDerivation {
  pname = "jit-haskell-llvm";
  version = "0.1.0.0";
  src = ./.;
  isLibrary = false;
  isExecutable = true;
  executableHaskellDepends = [ base ];
  license = "unknown";
  hydraPlatforms = lib.platforms.none;
}

