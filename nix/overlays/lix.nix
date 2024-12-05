(final: prev: {
  lix = prev.lix.overrideAttrs (oldAttrs: {
    postPatch = (oldAttrs.postPatch or "") + ''
      substituteInPlace src/libmain/shared.cc \
        --replace-fail "(Lix, like Nix)" "but for lesbians"
    '';

    # <https://git.lix.systems/lix-project/lix/issues/588>
    buildInputs = oldAttrs.buildInputs ++ [ prev.apple-sdk_11 ];

    # WARNING: This greatly assumes that lix will never merge a CL that breaks
    # the tests. But I choose to disable them anyway because the build time is faster
    doCheck = false;
  });
})
