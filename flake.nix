{
  description = "DiffPrivacyInferenceHs";

  inputs.nixpkgs.url = "nixpkgs/nixos-21.05";
  inputs.DiffPIHs = {
    url = "github:DiffMu/DiffPrivacyInferenceHs";
    flake = false;
  };

  outputs = { self, nixpkgs, DiffPIHs }: {

    defaultPackage.x86_64-linux =
      with import nixpkgs { system = "x86_64-linux"; };
      let drv =
        { mkDerivation, base, bifunctors, constraints, containers, data-default, hashable, hpack, hspec, hspec-core, HUnit, lattices, lens, lib, mtl, newtype, parsec, parsec3-numbers, pomaps, QuickCheck, singletons, text, unordered-containers }:
        mkDerivation {
          pname = "DiffPrivacyInferenceHs";
          version = "0.1.0.0";
          src = DiffPIHs;
          isLibrary = true;
          isExecutable = true;
          libraryHaskellDepends = [ base bifunctors constraints containers data-default hashable hspec hspec-core HUnit lattices lens mtl newtype parsec parsec3-numbers pomaps QuickCheck singletons text unordered-containers ];
          libraryToolDepends = [ hpack ];
          executableHaskellDepends = [ base ];
          testHaskellDepends = [ base hspec HUnit QuickCheck ];
          prePatch = "hpack";
          homepage = "https://github.com/githubuser/DiffPrivacyInferenceHs#readme";
          license = lib.licenses.bsd3;
        };
      in
      pkgs.haskellPackages.callPackage drv { };

  };
}
