{ inputs, config, pkgs, ... }:

{
  # Home Manager needs a bit of information about you and the paths it should
  # manage.
  home.username = "firesquid";
  home.homeDirectory = "/home/firesquid";

  # This value determines the Home Manager release that your configuration is
  # compatible with. This helps avoid breakage when a new Home Manager release
  # introduces backwards incompatible changes.
  #
  # You should not change this value, even if you update Home Manager. If you do
  # want to update the value, then make sure to first check the Home Manager
  # release notes.
  home.stateVersion = "23.11"; # Please read the comment before changing.

  # The home.packages option allows you to install Nix packages into your
  # environment.

  nixpkgs.config.allowUnfree = true;
  nixpkgs.config.allowUnsupportedSystem = true;

  nixpkgs.config.permittedInsecurePackages = [
    "electron-25.9.0"
  ];


  home.packages = [
    # # Adds the 'hello' command to your environment. It prints a friendly
    # # "Hello, world!" when run.

    pkgs.libnotify

    pkgs.bluez5
    pkgs.neofetch
    pkgs.discord
    pkgs.godot_4

    pkgs._2048-in-terminal

    pkgs.lapce
    pkgs.asciinema

    pkgs.libresprite
    pkgs.wuzz
    pkgs.inkscape
    pkgs.krita
    pkgs.vlc

    pkgs.thunderbird
    pkgs.freecad
    pkgs.libsForQt5.kmail
    pkgs.prismlauncher
    pkgs.guvcview

    pkgs.vscode
    pkgs.neovide
    pkgs.lazydocker
    pkgs.warp-terminal
    pkgs.nheko

    pkgs.chromium

    pkgs.rofimoji
    pkgs.swappy
    pkgs.grim

    pkgs.betterlockscreen
    pkgs.youtube-music

    pkgs.tmux
    pkgs.obsidian
    pkgs.dunst
    # # It is sometimes useful to fine-tune packages, for example, by applying
    # # overrides. You can do that directly here, just don't forget the
    # # parentheses. Maybe you want to install Nerd Fonts with a limited number of
    # # fonts?
    # (pkgs.nerdfonts.override { fonts = [ "FantasqueSansMono" ]; })

    # # You can also create simple shell scripts directly inside your
    # # configuration. For example, this adds a command 'my-hello' to your
    # # environment:
    # (pkgs.writeShellScriptBin "my-hello" ''
    #   echo "Hello, ${config.home.username}!"
    # '')
  ];


  programs.git = {
    enable = true;
    userName = "firesquid6";
    userEmail = "jdeiss06@gmail.com";
  };

  home.sessionVariables = {
    EDITOR = "nvim";
    BROWSER = "firefox";
    TERMINAL = "kitty";
    VISUAL = "nvim";
  };

  # Let Home Manager install and manage itself.
  programs.home-manager.enable = true;
}
