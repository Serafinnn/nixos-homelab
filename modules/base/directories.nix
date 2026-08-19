{ ... }:

{
  systemd.tmpfiles.rules = [
    "d /srv 0755 root root -"
    "d /srv/apps 0755 root root -"
    "d /srv/data 0755 root root -"
    "d /srv/shared 0755 root root -"
    "d /srv/backups 0755 root root -"
  ];
}