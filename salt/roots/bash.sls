/home/vagrant/.bashrc:
  file.append:
    - text:
      - "set -o vi"

/home/vagrant/.bash_aliases:
  file.managed:
    - contents: "alias l='ls -liah'"
