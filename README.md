# DiffPrivacyInference
Flake for the 'Verified Differential Privacy for Julia' Project.
The goal of this project is to create a type checker which can automatically analyze Julia programs with respect to differential privacy guarantees.
This project uses both Julia and Haskell, a Julia package with a Haskell backend.

The Haskell backend Flake works, but the Julia frontend part still has some problems.
___
The frontend Flake has some problems when cloning the the packages to build:

I got some errors while cloning the dependencies in Manifest.toml \
2 were easy to fix, I just changed the version numbers:\
`Artifacts`       1.3.0        changed to     1.6.1\
`Zlib_jll `       1.2.11       changed to     1.2.12\
But `Libiconv_jll` couldn't be clonned at all:\
`ERROR caused by: Libiconv_jll: git object cba7b560fcc00f8cd770fa85a498cbc1d63ff618 could not be found`\
`caused by: GitError(Code:ENOTFOUND, Class:Odb, object not found - no match for id ... ) `

I tried different git-tree-sha1 and versions, but none of them seem to work.

I couldn't use the following depedencies, because they depend on `Libiconv_jll` directly or indirectly:\
`XML2_jll`          (Depends on `Libiconv_jll`)\
`EzXML`            (Depends on `XML2_jll`)\
`LightXML`          (Depends on `XML2_jll`)\
`TimeZones`         (Depends on `EzXML`)\
`Intervals`         (Depends on `TimeZones`)\
`Polynomials`       (Depends on `Intervals`)\
`SimplePolynomials` (Depends on `Polynomials`)\
`SimpleGraphs`      (Depends on `LightXML`, `LinearAlgebraX` and `SimplePolynomials`)\
`LinearAlgebraX`    (Depends on `SimplePolynomials`)\
`SimplePosets`      (Depends on `SimpleGraphs`)
___



Repos: \
https://github.com/DiffMu/DiffPrivacyInference.jl \
https://github.com/DiffMu/DiffPrivacyInferenceHs
