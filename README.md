# 🌌 Dots

My personal dotfiles managed using [dotdrop](https://github.com/deadc0de6/dotdrop).

This repository handles syncing, templating, and deploying dotfiles across multiple setups and hosts.

---

## 🚀 Getting Started on a New Host

Follow these steps to clone this repository, set up dotdrop, and install the dotfiles on a new machine.

### 1. Prerequisites

Ensure you have the following installed on the target system:
*   **Git**
*   **Python 3** and `pip`

#### On Arch Linux / WSL:
```bash
sudo pacman -Syu git python python-pip python-docopt python-jinja
```

### 2. Clone the Repository

Clone this repository along with its submodules (since `dotdrop` is managed as a Git submodule):

```bash
git clone --recursive https://github.com/Nihhaar/Dots.git ~/Dots
cd ~/Dots
```

If you already cloned the repository without submodules, initialize and update them:

```bash
git submodule update --init --recursive
```

### 3. Install Python Dependencies

Install the required Python dependencies for dotdrop:

```bash
pip3 install --user -r dotdrop/requirements.txt
```

---

## ⚙️ Profiles

This repository contains two main profiles configured in [config.yaml](./config.yaml):

1.  **`ArchLinuxWSL`** - Minimal configuration suitable for WSL or headless Arch setups. Includes:
    *   Fonts (`d_fonts`)
    *   Git configuration (`f_gitconfig`)
    *   Vim configuration (`f_vimrc`)
    *   Zim / Zsh configuration (`f_zimrc`, `f_zshrc`)
2.  **`LoneRanger`** - Complete desktop environment configuration including window managers, bars, launchers, themes, and applications. Includes everything in `ArchLinuxWSL` plus:
    *   i3 WM (`d_i3`)
    *   Polybar (`d_polybar`)
    *   Rofi (`d_rofi`)
    *   Openbox (`d_openbox`)
    *   Alacritty (`f_alacritty.yml`)
    *   Compton (`f_compton.conf`)
    *   Themes & GTK settings (`d_themes`, `d_gtk-3.0`, `f_gtkrc-2.0`)
    *   MPD & ncmpcpp (`d_mpd`, `d_ncmpcpp`)
    *   Xresources / xbindkeys (`f_xresources`, `f_xbindkeysrc`)
    *   And more...

---

## 🛠️ Installation & Deployment

Before deploying, it is recommended to run a **dry-run** or **compare** to see what changes will be made to your local system.

### Step A: Dry Run (Highly Recommended)
See what changes dotdrop will make without actually modifying any files:
```bash
# For ArchLinuxWSL profile
./dotdrop.sh install -p ArchLinuxWSL --dry

# For LoneRanger profile
./dotdrop.sh install -p LoneRanger --dry
```

### Step B: Compare Existing Files
Compare files currently on the filesystem with the versions stored in the repository:
```bash
./dotdrop.sh compare -p <profile-name>
```

### Step C: Deploy Dotfiles
Once you are confident with the changes, install the dotfiles:
```bash
./dotdrop.sh install -p <profile-name>
```
*(Replace `<profile-name>` with `ArchLinuxWSL` or `LoneRanger` depending on your environment).*

---

## 📥 Importing Dotfiles from a Host into the Git Repository

If you make configuration changes on your host or want to start tracking new files from a host and save them to this Git repository, use the following commands:

### 1. Import a New (Untracked) File or Directory
To start managing a new configuration file/directory that is not yet in the repository:
```bash
./dotdrop.sh import <path-to-file-or-directory>
```
Dotdrop will copy the file into the `dotfiles/` directory, register it in `config.yaml`, and prompt you to associate it with a profile.

### 2. Update/Sync Existing Dotfiles in Git
If you have edited a dotfile locally on your host and want to copy those changes back into the repository:

*   **Update a specific file:**
    ```bash
    ./dotdrop.sh update -p <profile-name> <dotfile-key>
    ```
*   **Update all files for a profile:**
    ```bash
    ./dotdrop.sh update -p <profile-name>
    ```

### 3. Compare Host Files vs. Git Repository
To see what changes exist on your host compared to what is currently stored in the repository before importing or updating:
```bash
# Show difference between host files and Git repository
./dotdrop.sh compare -p <profile-name>

# View detailed status and diffs
./dotdrop.sh detail
```

Once imported or updated, don't forget to commit and push your changes to your Git remote:
```bash
git add .
git commit -m "Update dotfiles from host"
git push origin master
```

---

## 💡 Tips & Tricks

*   **Automation:** Add a helper alias in your shell configuration (e.g., in `.zshrc`) to run dotdrop easily from anywhere:
    ```bash
    alias dots="~/Dots/dotdrop.sh"
    ```
*   **Templating:** Dotdrop supports [Jinja2](https://jinja.palletsprojects.com/) templating. You can use variables (defined under `variables:` in `config.yaml`) to customize file contents based on hostnames or profiles.

For more advanced options and full documentation, refer to the [Dotdrop Documentation](https://dotdrop.readthedocs.io/).
