{ config, pkgs, inputs, lib, ... }:

{
  imports = [ ./shell.nix ./desktop.nix ];

  home-manager = {
    extraSpecialArgs = { inherit inputs; };
    users = { "leonard" = import ../home-manager/home.nix; };
    backupFileExtension = "bak";
  };

  services.xserver.enable = true;

  nix.settings.trusted-users = [ "root" "leonard" ];

  nix.sshServe.write = true;
  nix.sshServe.enable = true;

  boot.plymouth = {
    enable = true;
  };


  boot.binfmt.emulatedSystems = [
    "aarch64-linux"
    "aarch64_be-linux"
    "alpha-linux"
    "armv6l-linux"
    "armv7l-linux"
    "i386-linux"
    "i486-linux"
    "i586-linux"
    "i686-linux"
    "i686-windows"
    "loongarch64-linux"
    "mips-linux"
    "mips64-linux"
    "mips64-linuxabin32"
    "mips64el-linux"
    "mips64el-linuxabin32"
    "mipsel-linux"
    "powerpc-linux"
    "powerpc64-linux"
    "powerpc64le-linux"
    "riscv32-linux"
    "riscv64-linux"
    "sparc-linux"
    "sparc64-linux"
    "wasm32-wasi"
    "wasm64-wasi"
    #"x86_64-linux"
    "x86_64-windows"
  ];


  programs.adb.enable = true;
  programs.partition-manager.enable = true;
  #programs.steam.enable = true;

  services.openssh.enable = true;
  services.fwupd.enable = true;
  environment.sessionVariables = {
    FLAKE = "/home/leonard/.config/nix-config";
  };

  users.users.leonard = {
    isNormalUser = true;
    description = "Leonard Menzel";
    extraGroups = [ "networkmanager" "wheel" "libvirtd" "docker" "adbusers" ];
    packages = with pkgs; [
      wineWowPackages.full
      nh
      #nodejs_21
      gimp
      picard
      parabolic
      kdePackages.elisa
      kdePackages.kmail
      kdePackages.kontact
      kdePackages.kmail-account-wizard
      kdePackages.akonadi-import-wizard
      jetbrains.webstorm
      libsForQt5.polonium
      minetest
      glxinfo
      clinfo
      wayland-utils
      less
      pciutils
      vulkan-tools

      kate
      htop
      curl
      tor-browser-bundle-bin
      vlc
      anki
      #git
      discord
      thunderbird
      prismlauncher
      arianna
      #kdePackages.angelfish
      signal-desktop
      libreoffice
      killall
    ];
    shell = pkgs.zsh;
  };

}
