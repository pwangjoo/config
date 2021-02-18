# README.md
This repository was made & opened public to share personally.

## Macbook initial set-up
System Software Overview
- System Version: macOS 10.15.7 (19H15) (Catalina)
- Kernel Version: Darwin 19.6.0
- Boot Volume: Macintosh HD
- Boot Mode: Normal
- Secure Virtual Memory: Enabled
- System Integrity Protection: Disabled
- Default command: Z shell (zsh)

### Install Homebrew
```zsh
% xcode-select --install
% /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
```

### Configure Git
```zsh
% git config --global user.name "ID"
% git config --global user.email "EMAIL"
```

### Set-up SSH
Menu > System Preferences > Sharing > Remote Login