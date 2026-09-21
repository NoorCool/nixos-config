# NixOS Configuration

A modular and reproducible **NixOS desktop configuration** built around **Hyprland**, **Home Manager**, and **Nixvim**.

The configuration is organized by responsibility, making individual components easy to understand, maintain, and extend. The setup is managed through a **Nix flake**, providing pinned dependencies and reproducible system builds.

## Overview

This repository contains my personal NixOS configuration, including:

* NixOS system configuration
* Hyprland desktop environment
* Home Manager user configuration
* Nixvim-based Neovim configuration
* Flake-based dependency management
* Modular configuration structure
* Dotfile management

The goal is to keep the configuration **declarative, reproducible, modular, and easy to maintain**.

---

## Architecture

The configuration is divided into modules based on their primary responsibility.

This makes it possible to locate and modify related settings without having to navigate through one large configuration file.

A simplified structure looks like this:

```text
.
├── flake.nix
├── flake.lock
│
├── hosts/
│   ├── common/
│   │   ├── nixvim/
│   │   └── temp_dotfiles/
│   └── laptop/
│       ├── home/
│       ├── bootloader.nix
│       ├── configuration.nix
│       ├── desktop.nix
│       ├── environment.nix
│       ├── graphics.nix
│       ├── hardware-configuration.nix
│       ├── network.nix
│       ├── sound.nix
│       ├── systempackages.nix
│       └── user.nix
│
└── README.md
```

> The exact structure may evolve as the configuration grows.

### Design principles

The configuration follows a few simple principles:

* **Modularity** — related functionality is grouped together.
* **Reproducibility** — dependencies are pinned through `flake.lock`.
* **Declarative configuration** — system and user configuration are defined in Nix.
* **Portability** — configuration is structured with future multi-host usage in mind.
* **Maintainability** — functionality is separated into focused modules.

---

## Flake & Reproducibility

The system uses a **Nix flake** to manage inputs and outputs.

The `flake.nix` defines dependencies such as:

* Nixpkgs
* Home Manager
* Nixvim
* Other configuration-specific inputs

The generated `flake.lock` pins the versions of these dependencies, making system rebuilds reproducible across machines and over time.

### Rebuild

To rebuild the configuration:

```bash
sudo nixos-rebuild switch --flake .#my-host
```

This builds the NixOS configuration defined by the `my-host` flake output and switches the running system to the new generation.

---

## Home Manager

**Home Manager** is integrated directly as a NixOS module.

This means the user environment is rebuilt together with the NixOS system rather than requiring a separate Home Manager rebuild command.

The user configuration is defined in:

```text
home/home.nix
```

This includes user-level configuration such as:

* Applications
* Environment variables
* User packages
* Dotfiles

The setup is intentionally structured so that user configuration can eventually be shared between multiple hosts.

### Dotfiles

Migrating existing application configuration files to Home Manager is an ongoing part of the project.

The preferred approach depends on the complexity and portability of the configuration.

---

## Desktop Environment

The graphical environment is based on **Hyprland**, a Wayland compositor.

| Category             | Application            |
| -------------------- | ---------------------- |
| Compositor           | Hyprland               |
| Terminal             | Kitty                  |
| Shell                | Bash                   |
| Editor               | Neovim                 |
| Application Launcher | Rofi-wayland           |
| Status Bar           | Waybar                 |
| Network Management   | NetworkManager / nmtui |
| Bluetooth            | bluetoothctl           |
| Brightness           | brightnessctl          |
| Audio                | PulseAudio             |
| PDF Reader           | Zathura                |
| Terminal Animation   | cbonsai                |

---

## Applications

| Category      | Application |
| ------------- | ----------- |
| Music         | Spotify     |
| Notes         | Obsidian    |
| Web Browser   | Firefox     |
| Game Engine   | Godot       |
| Media Player  | mpv         |
| Image Editing | GIMP        |

---

## Nixvim

Neovim is configured declaratively through **Nixvim**.

This allows editor configuration, plugins, and related dependencies to be managed alongside the rest of the NixOS configuration.

The objective is to keep the development environment reproducible rather than relying on manually configured editor installations.

---

## Current Status

The configuration is actively evolving.

Current areas of development include:

* [x] Nix flake-based system configuration
* [x] Home Manager integration
* [x] Hyprland desktop environment
* [x] Declarative Neovim configuration
* [ ] Migration of remaining dotfiles to Home Manager
* [ ] Further modularization
* [ ] Improved multi-host support
* [ ] Additional documentation

---

## Goals

The long-term goals of this configuration are:

1. Keep the entire environment reproducible.
2. Minimize manual configuration after installation.
3. Make the configuration portable between machines.
4. Keep system, user, and application configuration modular.
5. Use Git to track and document configuration changes.

---

## Why NixOS?

This project is also an exploration of declarative system administration and reproducible development environments.

Instead of configuring applications and system services manually, the desired state is described in Nix and version-controlled with Git.

This makes it possible to:

* Rebuild a system from configuration.
* Roll back to previous system generations.
* Reproduce environments across machines.
* Review configuration changes through Git.
* Keep infrastructure and application configuration in one repository.

---

## License

This repository contains my personal system configuration. Feel free to use it as inspiration or adapt individual parts for your own setup.

