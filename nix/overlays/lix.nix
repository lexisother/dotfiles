(final: prev: {
  lix = prev.lix.overrideAttrs (oldAttrs: {
    postPatch = (oldAttrs.postPatch or "") + ''
      substituteInPlace src/libmain/shared.cc \
        --replace-fail "(Lix, like Nix)" "but for lesbians"
      '';
  });
})
