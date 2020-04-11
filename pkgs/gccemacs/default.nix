{ stdenv, fetchFromGitHub, emacs, emacsGit, jansson, glibc, gccjit }:

(emacsGit.override { srcRepo = true; }).overrideAttrs (
  o: rec {
    pname = "gccemacs";
    version = "27";
    src = fetchFromGitHub {
      owner = "emacs-mirror";
      repo = "emacs";
      # Fetching off the feature/native-comp git branch
      rev = "4abb8c822ce02cf33712bd2699c5b77a5db49e31";
      sha256 = "1w1bs358vx47nj7kgbdw5ppdiq78w96abyvl99lfqkbm0xvi41rz";
    };
    patches = [];

    # Our gccjit is not built correctly and can't find crti.o on its own
    preConfigure = o.preConfigure + ''
      export LD_LIBRARY_PATH=${glibc}/lib:${gccjit}/lib/gcc/x86_64-unknown-linux-gnu/9.3.0:$LD_LIBRARY_PATH
    '';

    configureFlags = o.configureFlags ++ [ "--with-nativecomp" ];

    buildInputs = o.buildInputs ++ [ jansson gccjit glibc ];

  }
)
