"Add Postgresql APT":
  pkgrepo.managed:
    - name: deb http://apt.postgresql.org/pub/repos/apt/ trusty-pgdg main
    - dist: trusty
    - comps: main
    - file: /etc/apt/sources.list.d/postgresql.list
    - key_url: https://www.postgresql.org/media/keys/ACCC4CF8.asc
    - require_in:
      - pkg: postgresql
      - pkg: libpq-dev

postgresql:
  pkg.latest: []

libpq-dev:
  pkg.installed: []
