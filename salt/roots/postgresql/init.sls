"Remove broken precise PostgreSQL APT":
  pkgrepo.absent:
    - name: deb http://apt.postgresql.org/pub/repos/apt/ precise main
    - dist: precise
    - comps: main

"Remove precise PostgreSQL APT":
  pkgrepo.absent:
    - name: deb http://apt.postgresql.org/pub/repos/apt/ precise-pgdg main

"Remove PostgreSQL 9.3":
  pkg.removed:
    - pkgs:
      - postgresql: 9.3+154ubuntu1
      - postgresql: 9.3.7-0ubuntu0.14.04
      - postgresql-client: 9.3.7-0ubuntu0.14.04
      - postgresql-client-common: 154ubuntu1
      - postgresql-common: 154ubuntu1

"Add Postgresql APT":
  pkgrepo.managed:
    - name: deb http://apt.postgresql.org/pub/repos/apt/ trusty-pgdg main
    - file: /etc/apt/sources.list.d/postgresql.list
    - key_url: https://www.postgresql.org/media/keys/ACCC4CF8.asc
    - require_in:
      - pkg: postgresql
      - pkg: libpq-dev

postgresql:
  pkg.latest: []

libpq-dev:
  pkg.installed: []
