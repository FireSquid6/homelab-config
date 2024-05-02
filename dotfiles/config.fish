if status is-interactive
  set fish_greeting

  export PATH="$PATH:/etc/nixos/scripts"
  export PATH="$PATH:/etc/nixos/bins"

  starship init fish | source
  direnv hook fish | source


  alias ea='NVIM_APPNAME=astro-nvim nvim'
  alias e='NVIM_APPNAME=ink-nvim nvim'
end
