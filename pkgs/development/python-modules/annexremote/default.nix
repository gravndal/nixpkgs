{ lib
, isPy3k
, buildPythonPackage
, fetchPypi
, future
, mock
, nose
}:

buildPythonPackage rec {
  pname = "annexremote";
  version = "1.4.5";

  src = fetchPypi {
    inherit pname version;
    sha256 = "1s22m4shira97h34ixz80753wskb8p3l56x1c7r7p1m78hhl3bpc";
  };

  propagatedBuildInputs = [ future ];

  checkInputs = [ nose ] ++ lib.optional (!isPy3k) mock;
  checkPhase = "nosetests -v";

  meta = with lib; {
    description = "Helper module to easily develop git-annex remotes";
    homepage = "https://github.com/Lykos153/AnnexRemote";
    license = licenses.gpl3;
    maintainers = with maintainers; [ montag451 ];
  };
}
