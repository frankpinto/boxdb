/home/vagrant/.bashrc:
  file.append:
    - text:
      - "set -o vi"

Remove alias from .bashrc:
  file.replace:
    - name: /home/vagrant/.bashrc
    - pattern: alias l='ls -liah'\n
    - repl:
    - flags: ['MULTILINE']
    - bufsize: file
    - mode: delete

/home/vagrant/.bash_aliases:
  file.managed:
    - contents: "alias l='ls -liah'"
