# This file was generated by go2nix.
{ stdenv, lib, goPackages, fetchgit, fetchhg, fetchbzr, fetchsvn }:

with goPackages;

buildGoPackage rec {
  name = "collectd-exporter-${version}";
  version = "0.1.0";
  rev = version;

  goPackagePath = "github.com/prometheus/collectd_exporter";

  src= fetchgit {
    inherit rev;
    url = "https://github.com/prometheus/collectd_exporter";
    sha256 = "165zsdn0lffb6fvxz75szmm152a6wmia5skb96k1mv59qbmn9fi1";
  };

  goDeps = ./collectd-exporter_deps.json;

  meta = with stdenv.lib; {
    description = "Relay server for exporting metrics from collectd to Prometheus";
    homepage = https://github.com/prometheus/alertmanager;
    license = licenses.asl20;
    maintainers = with maintainers; [ benley ];
    platforms = platforms.unix;
  };
}
