{ stdenv, lib, fetchFromGitHub, emacs, emacsGit, jansson, glibc, libgccjit }:

(emacsGit.override { srcRepo = true; }).overrideAttrs (
  o: rec {
    pname = "gccemacs";
    version = "27";
    src = fetchFromGitHub {
      owner = "emacs-mirror";
      repo = "emacs";
      # Fetching off the feature/native-comp git branch
      rev = "92dc81f85e1b91db04487ccf1b52c0cd3328dfee";
      sha256 = "1f22bxwq53hhdjlakmqz66y63vix5ybpnc1pk9fpy18wjh871scq";
    };
    patches = [];

    # When this is enabled, emacs does native compilation lazily after starting
    # up, resulting in quicker package builds up-front, at the cost of slower
    # running emacs until everything has been compiled.
    # makeFlags = [ "NATIVE_FAST_BOOT=1" ];

    LIBRARY_PATH = "${lib.getLib stdenv.cc.libc}/lib";

    configureFlags = o.configureFlags ++ [ "--with-nativecomp" ];

    buildInputs = o.buildInputs ++ [ jansson libgccjit glibc ];
  }
)
