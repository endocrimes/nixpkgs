{ stdenv, lib, fetchFromGitHub, buildGoModule }:

buildGoModule rec {
  pname = "athens";
  version = "0.11.0";

  src = fetchFromGitHub {
    owner = "gomods";
    repo = "athens";
    rev = "v${version}";
    sha256 = "sha256-hkewZ21ElkoDsbPPiCZNmWu4MBlKTlnrK72/xCX06Sk=";
  };

  vendorSha256 = "sha256-9iwT+PE54zy+DCJLb9R2YOXVYPqy3UGs+ro/2JoAFDU=";

  subPackages = [ "cmd/proxy" ];

  ldflags = [
    "-X github.com/gomods/athens/pkg/build.version=${version}"
  ];

  postInstall = ''
    mv $out/bin/proxy $out/bin/athens
  '';

  meta = with lib; {
    homepage = "https://github.com/gomods/athens";
    description = "A Go module datastore and proxy";
    changelog = "https://github.com/gomods/athens/releases/tag/v${version}";
    platforms = platforms.linux ++ platforms.darwin;
    license = licenses.mit;
    maintainers = with maintainers; [ endocrimes ];
  };
}
