vim:
  pkg.installed:
    - refresh: true

/usr/share/vim/vim74/bundle:
  file.directory:
    - user: root
    - group: root
    - mode: 755

https://github.com/gmarik/Vundle.vim.git:
  git.latest:
    - target: /usr/share/vim/vim74/bundle/Vundle.vim

/etc/vim/vimrc.local:
  file.managed:
    - source:
      - salt://vim/.vimrc
      - https://raw.githubusercontent.com/frankpinto/dotfiles/master/.vimrc

vim -c 'PluginInstall' -c 'qa!':
  cmd.run:
    - creates: ls ~/.vim/bundle/js-beautify/package.json
    - output_loglevel: quiet
