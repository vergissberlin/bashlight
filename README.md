# bashlight

[![Build Status](https://travis-ci.org/vergissberlin/bashlight.svg?branch=master)](https://travis-ci.org/vergissberlin/bashlight)
[![Version](https://img.shields.io/badge/version-0.1.5-green.svg)](https://github.com/vergissberlin/bashlight)

> This bash script enhanced your OSX/Linux console.
> The console or "terminal" on macOS comes in the basic equipment therefore very slim. This is good as long as you do not work with it every day. If you often go to the console, you should do something for their eyes and install the [Solarized
      colorscheme](https://github.com/altercation/solarized) theme.
> If you working a lot with **GIT**, *then bashlight can* be you a great help. The Bash extension offers you information for Branch and status of your current GIT repositories.
> Furthermore it contains many commonly used aliases, which allow a fast working on the console. *Let amazed your colleagues!*


```
 _               _     _ _       _     _
| |__   __ _ ___| |__ | (_) __ _| |__ | |_
| '_ \ / _` / __| '_ \| | |/ _` | '_ \| __|
| |_) | (_| \__ \ | | | | | (_| | | | | |_
|_.__/ \__,_|___/_| |_|_|_|\__, |_| |_|\__|
                           |___/

```

## Features
### Git management

**The background colour** represents the git status

- green = no changes
- yellow = changes detected
- red = untracked files

**The chess figure** represents the branch you are. [Git flow](https://github.com/nvie/gitflow) is also supported.

- ♔ = king = master
- ♙ = pawn = development
- ♘ = knight = feature
- ♗ = bishop = hotfix
- ☂ = umbrella = *other*

**Ohter signs**

- Arrows "⇡⇣"  and number behind represent how many commits you are behind/ahead of the remote
- Display "+" symbol when current branch is changed but uncommited
- Display current git branch name, or short SHA1 hash when the head is detached

**Git completion**

- [git-bash-completion](https://github.com/markgandolfo/git-bash-completion) is included as subtree to this project. Use <code>git [tab][tab]</code> to list all available commands.

### Prompt

- Platform-dependent prompt symbol for macOS and Linux
- No need for patched fonts Remote

#### Additional information

You are able to add informations to you prompt by setting following environment variables.

1. ``PS_INFO``: (string) e.g. dev/stage/prod.
2. ``PS_INFO_BRAND``: (string) e.g. info/success/warning/danger

Set this variables in your .bashrc (Linux) ord src/profile (macOS) file like so:

```
export PS_INFO="stage"
export PS_INFO_BRAND="warning"
```

### Notification

On macOS and Linux, you have the option to send notifications from the console. However, the commands are different for this purpose. *bashlight* provides you a unified interface. You can play sounds, open the message window and use the voice output.


#### Play sounds

```
blPlay Submarine
```

#### Say something

```
blSay "OK Computer. I just understand train station."
```

#### Notification messages

```
alert "This is the title" "... and this is the content"
```
![Notifications](https://farm6.staticflickr.com/5568/15131688612_12f1cd7a2b_o.png)

#### Contains configurations for ...

1. **Git global config**
   - Shortcuts for all commands
   - Enhanced git history with colours with <code>git sl</code>
   - Colours Which harmonize with the colors used as background
   - Branch setting

- **Bash aliases (shortcuts)**
  - _directory_
     - ll, la, l
     - cd .. = .. < ... < ....

### Git global configuration

It also include a shell script to set common global bash settings. Before you run the file, take a look in the file. The setting included are tailored to bashlight.

---

## Installation & Requirements

**1.** get the source code

```
cd
git clone https://github.com/vergissberlin/bashlight.git
```

**2.** Open your home bash file in editor

``~/.bashrc`` on *linux* **or** ``~/src/profile`` on *macOS*

**3.** Include bashlight/bashlight with the following line at the end of the bash file

```
if [ -f ~/bashlight/bashlight ]; then
    . ~/bashlight/bashlight
fi
```

### Optional settings

To install common git and tmux settings are tailored to bashlight simply run:

```
bash ~/bashlight/install.bash
```

### Supported operating systems

- Linux
- macOS
- Windows with bash shell

### Optional dependencies

- `coreutils` for a colourful, easy to handle directory listing
-- `apt install coreutils`
-- `brew install coreutils`

## Contributing

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request

### Testing

```
bash tests/suite.bash
bats ./tests/
```

### CI

```
fly set-pipeline \
	-t box \
	-p bashlight \
	-c ci/pipeline.yml \
	-l ci/variables/messages.yml \
	-l ci/variables/credentials.yml -n
```


### Change log

Update the changelog
```
conventional-changelog -i CHANGELOG.md -s -r 0
```


## Support or Contact

You can contact me (@vergissberlin) on GitHub. Use the issue tracker to report bugs.


## Thank you

- .. to @riobard, the founder of [bash-powrline](https://github.com/riobard/bash-powerline) which this project is based on.
- .. to @markgandolfo, the founder of [git-bash-completion](https://github.com/markgandolfo/git-bash-completion), which is included as subtree to this project.
- Further thanks **JetBrains** for a free license for PhpStorm.

---

*Made with love and*

[![Atom.IO](http://github-atom-io-herokuapp-com.global.ssl.fastly.net/assets/logo-4e073dbd4c0ce67ece1b30a6b31253b9.png)](https://atom.io/)
