{ inputs, ... }: {
  
  perSystem = { pkgs, ... }: {
    packages.git = inputs.wrapper-modules.wrappers.git.wrap {
      inherit pkgs;
      env = rec {
        GIT_AUTHOR_NAME = "asserthq";
        GIT_AUTHOR_EMAIL = "sanya2003ogorodov@gmail.com";
        GIT_COMMITTER_NAME = GIT_AUTHOR_NAME;
        GIT_COMMITTER_EMAIL = GIT_AUTHOR_EMAIL;
      };
    };
  };
  
}
