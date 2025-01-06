# .dotfiles

This repository contains my personal dotfiles, which are tailored to set up my preferred development environment. These configurations simplify the setup process for both Windows and Windows Subsystem for Linux systems, ensuring consistency and efficiency.

## Windows Configuration

Follow these steps to set up your Windows environment:

### 1. Prepare a Windows Bootable USB Drive

1. Create a bootable USB drive with the Windows installation ISO.
2. Place the `autounattended.xml` file located in the `windows/` directory of this repository at the root of the USB drive.

### 2. Install Windows

1. Disconnect your system from the internet.
2. Boot from the USB drive and proceed with the Windows installation.
   - The installation process will start automatically using the `autounattended.xml` file.

### 3. Update Windows

1. Once Windows is installed, connect to the internet.
2. Install all available Windows updates and Microsoft Store updates.
3. Reboot your system after updates are complete.

### 4. Run Setup Script

1. Open a terminal with administrator privileges.

2. Run the following commands
   ```powershell
   $url = "https://github.com/raxl8/.dotfiles/archive/refs/heads/main.zip"
   $downloadsPath = "$env:USERPROFILE\Downloads"
   Invoke-WebRequest -Uri $url -OutFile "$downloadsPath\dotfiles.zip"
   Expand-Archive -LiteralPath "$downloadsPath\dotfiles.zip" -DestinationPath "$downloadsPath"
   Set-Location "$downloadsPath\.dotfiles-main"
   powershell -EP Bypass -NoP .\setup.ps1
   ```

Follow any prompts or instructions provided by the setup script. Once complete, your Windows environment will be fully configured.

## WSL Configuration

Follow these steps to set up WSL with NixOS and the dotfiles:

1. Open a terminal.

2. Run:
   ```bash
   wsl -d NixOS --user root
   ```

3. Inside WSL, update Nix and set up the environment:
   ```bash
   nix-channel --update
   cd
   nix-shell -p git
   ```
4. Setup SSH keys
   - *Can't really help with that*

5. Inside the `nix-shell`, clone the dotfiles repository:
   ```bash
   git clone git@github.com:raxl8/.dotfiles.git ~/.dotfiles
   ```

6. Apply the NixOS configuration:
   ```bash
   nixos-rebuild --flake ~/.dotfiles#wsl boot
   ```

7. Exit the environment:
   ```bash
   exit
   exit
   ```
This will exit the \`nix-shell\` and then WSL.

8. Back in the Windows terminal:
   ```powershell
   wsl -t NixOS
   wsl -d NixOS --user root exit
   wsl -t NixOS
   ```
9. Re-enter WSL using:
   ```powershell
   wsl -d NixOS
   ```
10. Move over SSH keys from root user
   ```nushell
   sudo mv /root/.ssh $"($env.HOME)/.ssh"
   sudo chown -R $"($env.USER):users" $"($env.HOME)/.ssh"
   ```
11. Create git directory and move over dotfiles repository
   ```nushell
   mkdir git
   sudo mv /root/.dotfiles $"($env.HOME)/git/.dotfiles"
   sudo chown -R $"($env.USER):users" $"($env.HOME)/git/.dotfiles"
   ```
   
Your WSL setup should now be ready to use.
