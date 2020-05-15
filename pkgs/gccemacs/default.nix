{ stdenv
, lib
, emacsGit
, fetchFromGitHub
, libgccjit
}:

(emacsGit.override { srcRepo = true; }).overrideAttrs (
  o: rec {
    pname = "gccemacs";
    version = "28";
    src = fetchFromGitHub {
      owner = "emacs-mirror";
      repo = "emacs";
      # Fetching off the feature/native-comp git branch
      rev = "bc50c0c57eca22cb290465ae5df93d48326eeb05";
      sha256 = "09f21y42qcp08byq5nvfndsrw71z7sjrrpq3q8hph6m3wx01cysp";
    };
    patches = [];

    # When this is enabled, emacs does native compilation lazily after starting
    # up, resulting in quicker package builds up-front, at the cost of slower
    # running emacs until everything has been compiled.
    # makeFlags = [ "NATIVE_FAST_BOOT=1" ];

    LIBRARY_PATH = "${lib.getLib stdenv.cc.libc}/lib";

    configureFlags = o.configureFlags ++ [ "--with-nativecomp" ];

    buildInputs = o.buildInputs ++ [ libgccjit ];
  }
)
