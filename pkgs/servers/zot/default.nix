{ lib, buildGoModule, fetchFromGitHub, pkg-config, gpgme, libassuan, btrfs-progs }:

buildGoModule rec {
  pname = "zot";
  version = "1.4.3";

  src = fetchFromGitHub {
    owner = "project-zot";
    repo = pname;
    rev = "v${version}";
    sha256 = "sha256-crh/khLdD2drpyEAQ5z9y2J+/hz2q0m9K4Dk1eVCTuY=";
  };

  vendorHash = "sha256-P+CTvNtMTQG1n2CSVZDiLBnyz/XUpgR7K0o9j7D6nLQ=";

  doCheck = true;

  subPackages = [ "cmd/zot" ];

  nativeBuildInputs = [
    pkg-config
  ];

  buildInputs = [
    gpgme
    libassuan
    btrfs-progs
  ];

  tags = [
    "debug"
    "imagetrust"
    "lint"
    "metrics"
    "mgmt"
    "profile"
    "scrub"
    "search"
    "sync"
    "ui"
    "userprefs"
  ];

  meta = with lib; {
    homepage = "https://zotregistry.io/";
    description = "zot - A production-ready vendor-neutral OCI-native container image registry.";
    changelog = "https://github.com/project-zot/zot/releases/tag/v${version}";
    maintainers = with maintainers; [ endocrimes ];
    license = licenses.asl20;
  };
}
