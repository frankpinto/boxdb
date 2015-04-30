/home/vagrant/.bashrc:
  file.append:
    - text:
      - "set -o vi"

temp_cleanup:
  file.line:
    - name: /home/vagrant/.bashrc
    - path: /home/vagrant/.bashrc
    - content: "alias l='ls -liah'"
    - mode: delete

/home/vagrant/.bash_aliases:
  file.managed:
    - contents: "alias l='ls -liah'"
