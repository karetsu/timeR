{ pkgs ? import <nixpkgs> { } }:

pkgs.mkShell {
  buildInputs = with pkgs;
    with rPackages; [
      R
      tidyverse
      usethis
      testthat
      devtools
      quickcheck
      here
      microbenchmark
      knitr
      rmarkdown
    ];
}
