{ callPackage, buildGoPackage }:

callPackage ./generic.nix {
  inherit buildGoPackage;
  version = "1.0.0-beta2";
  sha256 = "19321720xng1cq7yc4r4dsmgx5k2wk3afz0qdcjxp116000ivip6";
}
