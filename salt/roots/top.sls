base:
  '*':
    - /home/vagrant/.bashrc:
      - file.append:
        - text:
          - "alias l='ls -liah'"
          - "set -o vi"
    - packages:
      - pkg.installed:
        - git
        - make
        - sysstat
        - htop
    - vim
