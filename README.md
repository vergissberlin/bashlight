# bashlight

[![Build Status](https://travis-ci.org/vergissberlin/bashlight.svg?branch=master)](https://travis-ci.org/vergissberlin/bashlight)
[![codecov](https://codecov.io/gh/vergissberlin/bashlight/branch/master/graph/badge.svg)](https://codecov.io/gh/vergissberlin/bashlight)
[![Releases](https://img.shields.io/github/release/vergissberlin/bashlight.svg)](https://github.com/vergissberlin/bashlight/releases)
[![Github commits (since latest release)](https://img.shields.io/github/commits-since/vergissberlin/bashlight/latest.svg)](https://github.com/vergissberlin/bashlight/commits)

> This bash script enhances your OSX/Linux console.
> The console or "terminal" on macOS comes in the basic equipment therefore it is very slim. This is good as long as you do not work with it every day. If you often go into the console, you should do something for your eyes and install the [Solarized colorscheme](https://github.com/altercation/solarized) theme.
> If you working a lot with **GIT**, *then bashlight can* be you a great help. The Bash extension offers you information for Branch and status of your current GIT repositories.
> Furthermore it contains many commonly used aliases, which allow for fast working on the console. *Let your colleagues be amazed !*

```code
 _               _     _ _       _     _
| |__   __ _ ___| |__ | (_) __ _| |__ | |_
| '_ \ / _` / __| '_ \| | |/ _` | '_ \| __|
| |_) | (_| \__ \ | | | | | (_| | | | | |_
|_.__/ \__,_|___/_| |_|_|_|\__, |_| |_|\__|
                           |___/

```

## Features

### Git management

**The background colour** represents the current git status

- green = no changes
- yellow = changes detected
- red = untracked files

**The chess figure** represents the branch you are on. [Git flow](https://github.com/nvie/gitflow) is also supported.

- ♔ = king = master
- ♙ = pawn = development
- ♘ = knight = feature
- ♗ = bishop = hotfix
- ☂ = umbrella = *other*

### Other symbols

- "⇡⇣" and number behind them show how many commits you are behind/ahead of the remote
- "+"  symbol when current branch has been changed but uncommited
- current git branch name, or short SHA1 hash when the head is detached

### Prompt

- Platform-dependent prompt symbol for macOS and Linux
- No need for patched fonts on remote when using ssh

### Additional information

You are able to add informations to you prompt by setting following environment variables.

1. ``PS_INFO``: (string) e.g. dev/stage/prod.
2. ``PS_INFO_BRAND``: (string) e.g. info/success/warning/danger

Set this variables in your .bashrc (Linux) ord src/profile (macOS) file like so:

```bash
export PS_INFO="stage"
export PS_INFO_BRAND="warning"
```

### Notification

On macOS and Linux, you have the option to send notifications from the console. However, the commands are different for this purpose. *bashlight* provides you a unified interface. You can play sounds, open the message window and use the voice output.

### Play sounds

```bash
blPlay Submarine
```

### Say words

```bash
blSay "OK Computer!"
```

### Notifications

Note: On macOS you can use two arguments.

```bash
alert "This is the message"
```

![Notifications](https://farm6.staticflickr.com/5568/15131688612_12f1cd7a2b_o.png)

#### Contains configurations for

1. **Git global config**
   - Shortcuts for all commands
   - Enhanced git history with colors with ```git sl```
   - Colous which harmonize with the colors used as background
   - Branch setting

- **Bash aliases (shortcuts)**
  - _directory_
    - ll, la, l
    - cd .. = .. < ... < ....
  - _git_
    - `gad` --- "`git add`"
    - `gbr` --- "`git branch`"
    - `gco` --- "`git commit`"
    - `gcs` --- "`git commit -S`"
    - `gdi` --- "`git diff`"
    - `gch` --- "`git checkout`"
    - `gpu` --- "`git pull`"
    - `gst` --- "`git status`"
  - _git-ui_
    - `gig` --- "`gitg --all`"
    - `gik` --- "`gitk --all`"

### Git global configuration

It also include a shell script to set common global bash settings. Before you run the file, take a look in the file. The setting included are tailored to bashlight.

---

## Installation & Requirements

**1.** get the source code

```bash
mkdir -p ~/.bin
cd ~/.bin
git clone https://github.com/vergissberlin/bashlight.git
```

**2.** Open your home bash file in editor

``~/.bashrc`` on *linux* **or** ``~/src/profile`` on *macOS*

**3.** Include bashlight/bashlight with the following line at the end of the file

```bash
if [ -f ~/.bin/bashlight/bashlight ]; then
    . ~/.bin/bashlight/bashlight
fi
```

### Optional settings

To install common git and tmux settings are tailored with use for bashlight simply run:

```bash
bash ~/.bin/bashlight/install.bash
```

### Supported operating systems

- Linux
- macOS
- Windows with bash shell (Windows subsystem for Linux, WSL)

### Optional dependencies

- `coreutils` for a colourful, easy to handle directory listing

-- `apt install coreutils`

-- `brew install coreutils`

## Support or Contact

You can contact me (@vergissberlin) or TheDevMinerTV (@TheDevMinerTV) on GitHub. Use the issue tracker to report bugs.

## Thank you

- .. to @riobard, the founder of [bash-powrline](https://github.com/riobard/bash-powerline) which this project is based on.
- .. to the contributers and testers, who help to further improve the project.
- Further thanks to **GitHub** for Atom.io.

---

## Made with love and [![Atom.IO](http://github-atom-io-herokuapp-com.global.ssl.fastly.net/assets/logo-4e073dbd4c0ce67ece1b30a6b31253b9.png)](https://atom.io/)