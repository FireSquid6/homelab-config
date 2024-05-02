# Edit this configuration file to define what should be installed on
# your system.  Help is available in the configuration.nix(5) man page
# and in the NixOS manual (accessible by running ‘nixos-help’).

{ config, pkgs, callPackage, inputs, ... }:

{
  imports =
    [
      # Include the results of the hardware scan.
      ./hardware-configuration.nix
      ./local-configuration.nix
      inputs.home-manager.nixosModules.default
    ];

  environment.pathsToLink = [ "/libexec" ];

  services.tailscale.enable = true;

  # hardware.bluetooth.enable = true;
  # hardware.bluetooth.powerOnBoot = true;

  virtualisation.docker.enable = true;
  virtualisation.docker.rootless = {
    enable = true;
    setSocketVariable = true;
  };

  virtualisation.virtualbox.host.enable = true;
  users.extraGroups.vboxusers.members = [ "firesquid" ];

  hardware.bluetooth.enable = true;
  hardware.bluetooth.powerOnBoot = true;
  services.blueman.enable = true;

  services.passSecretService.enable = true; # not as cool as it sounds
  services.gnome.gnome-keyring.enable = true;

  services.logind = {
    lidSwitch = "suspend";
    lidSwitchDocked = "suspend";
    lidSwitchExternalPower = "suspend";
    powerKey = "poweroff";
  };

  programs.fish.enable = true;
  programs.nix-ld.enable = true;

  services.flatpak.enable = true;
  xdg.portal.enable = true;
  xdg.portal.config.common.default = "gtk";
  xdg.portal.extraPortals = [ pkgs.xdg-desktop-portal-gtk ];

  xdg.mime.defaultApplications = {
    "text/html" = "firefox.desktop";
    "image/gif" = "firefox.desktop";
    "image/png" = "firefox.desktop";
    "image/jpeg" = "firefox.desktop";
    "x-scheme-handler/http" = "firefox.desktop";
    "x-scheme-handler/https" = "firefox.desktop";
    "x-scheme-handler/about" = "firefox.desktop";
    "x-scheme-handler/unknown" = "firefox.desktop";
    "text/plain" = "neovide.desktop";
  };
  xdg.mime.enable = true;

  sound.enable = true;
  nixpkgs.config.pulseaudio = true;
  hardware.pulseaudio.enable = true;
  hardware.pulseaudio.support32Bit = true;

  nixpkgs.config.permittedInsecurePackages = [
    "electron-25.9.0"
  ];

  nix.settings.experimental-features = [ "nix-command" "flakes" ];

  programs.hyprland = {
    enable = true;
    xwayland.enable = true;
  };

  hardware.keyboard.zsa.enable = true;

  services.xserver = {
    enable = true;

    displayManager = {
      defaultSession = "none+i3";
      sddm.enable = true;
    };

    desktopManager.plasma5.enable = true;

    windowManager.i3 = {
      enable = true;
      extraPackages = with pkgs; [
        dmenu
        i3status
        i3blocks
        i3lock-color
      ];
    };
  };

  environment.plasma5.excludePackages = with pkgs.libsForQt5; [
    elisa
    gwenview
    okular
    oxygen
    khelpcenter
    konsole
    plasma-browser-integration
    print-manager
  ];

  # Bootloader.
  boot.initrd.kernelModules = [ "i915" ];
  boot.kernelPackages = pkgs.linuxPackages_latest;

  boot.loader = {
    efi = {
      canTouchEfiVariables = true;
    };
    grub = {
      enable = true;
      device = "nodev";
      efiSupport = true;
      useOSProber = true;
    };
  };

  # networking.wireless.enable = true;  # Enables wireless support via wpa_supplicant.

  # Configure network proxy if necessary
  # networking.proxy.default = "http://user:password@proxy:port/";
  # networking.proxy.noProxy = "127.0.0.1,localhost,internal.domain";

  # Enable networking
  networking.networkmanager.enable = true;

  # Set your time zone.
  time.timeZone = "America/Chicago";

  # Select internationalisation properties.
  i18n.defaultLocale = "en_US.UTF-8";

  i18n.extraLocaleSettings = {
    LC_ADDRESS = "en_US.UTF-8";
    LC_IDENTIFICATION = "en_US.UTF-8";
    LC_MEASUREMENT = "en_US.UTF-8";
    LC_MONETARY = "en_US.UTF-8";
    LC_NAME = "en_US.UTF-8";
    LC_NUMERIC = "en_US.UTF-8";
    LC_PAPER = "en_US.UTF-8";
    LC_TELEPHONE = "en_US.UTF-8";
    LC_TIME = "en_US.UTF-8";
  };

  # Configure keymap in X11
  services.xserver = {
    xkb.layout = "us";
    xkb.variant = "";
  };


  programs.steam = {
    enable = true;
    remotePlay.openFirewall = true;
    dedicatedServer.openFirewall = true;
  };

  # Define a user account. Don't forget to set a password with ‘passwd’.
  users.users.firesquid = {
    isNormalUser = true;
    shell = pkgs.fish;
    description = "firesquid";
    extraGroups = [ "networkmanager" "wheel" "docker" ];
    packages = with pkgs; [
      font-manager

    ];
  };

  home-manager = {
    extraSpecialArgs = { inherit inputs; };
    users = {
      "firesquid" = import ./home.nix;
    };
  };

  qt = {
    enable = true;
    platformTheme = "gnome";
    style = "adwaita-dark";
  };

  # Allow unfree packages
  nixpkgs.config.allowUnfree = true;

  # List packages installed in system profile. To search, run:
  # $ nix search wget
  environment.systemPackages = with pkgs; [
    (waybar.overrideAttrs (oldAttrs: {
        mesonFlags = oldAttrs.mesonFlags ++ [ "-Dexperimental=true" ];
      })
    )

    vim # Do not forget to add an editor to edit configuration.nix! The Nano editor is also installed by default.
    wget
    firefox
    killall
    git
    tailscale
    xclip
    playerctl
    fish
    neovim
    swww
    rofi-wayland
    kitty
    unzip
    lxappearance
    feh
    lazygit
    brightnessctl
    gh
    direnv
    xss-lock
    starship
    waybar
    flameshot
    watershot
    simplescreenrecorder
    gnome-icon-theme
    papirus-icon-theme
    htop
    ripgrep
    docker
    picom
    polybar
    libsForQt5.sddm-kcm
    libnotify

    # python stuff
    python3
    python311Packages.pip

    nodejs_20
    home-manager
    hyprlock
  ];

  fonts.packages = with pkgs; [
    fira-code
    noto-fonts
    (nerdfonts.override { fonts = [ "FiraCode" "DroidSansMono" "Hasklig" "JetBrainsMono" "GeistMono" ]; })
  ];

  # Some programs need SUID wrappers, can be configured further or are
  # started in user sessions.
  # programs.mtr.enable = true;
  # programs.gnupg.agent = {
  #   enable = true;
  #   enableSSHSupport = true;
  # };

  # List services that you want to enable:

  # Enable the OpenSSH daemon.
  services.openssh.enable = true;

  # Open ports in the firewall.
  # networking.firewall.allowedTCPPorts = [ ... ];
  # networking.firewall.allowedUDPPorts = [ ... ];
  # Or disable the firewall altogether.
  # networking.firewall.enable = false;

  # This value determines the NixOS release from which the default
  # settings for stateful data, like file locations and database versions
  # on your system were taken. It‘s perfectly fine and recommended to leave
  # this value at the release version of the first install of this system.
  # Before changing this value read the documentation for this option
  # (e.g. man configuration.nix or on https://nixos.org/nixos/options.html).
  system.stateVersion = "23.11"; # Did you read the comment?
}
