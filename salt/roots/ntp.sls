ntpdate -s ntp.ubuntu.com pool.ntp.org time.nist.gov:
  cmd.run:
    - unless: which ntpd

ntp:
  pkg.installed: []
