{
  description = "DiffPrivacyInference.jl";

  inputs.nixpkgs.url = "nixpkgs/nixos-21.05";
  inputs.DiffPIjl = {
    url = "github:DiffMu/DiffPrivacyInference.jl"; 
    flake = false;
  };

  outputs = { self, nixpkgs, DiffPIjl }: {


    defaultPackage.x86_64-linux = 
      with import nixpkgs { system = "x86_64-linux"; };
      let 
        baseJulia = julia-stable-bin;
        extraLibs = [];
        julia = runCommand "julia-wrapped" { buildInputs = [makeWrapper]; } ''
          mkdir -p $out/bin
          makeWrapper ${baseJulia}/bin/julia $out/bin/julia \
                      --suffix LD_LIBRARY_PATH : "${lib.makeLibraryPath extraLibs}" \
                      --set PYTHON ${python3}/bin/python
        '';

      in  
      callPackage ./build.nix {
        inherit julia;
        precompile = true;
        makeWrapperArgs = "";
        extraBuildInputs = extraLibs;


    };
  };
}
