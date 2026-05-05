# Notepadqq Ubuntu 24.04 Compatibility Fork

> This repository is an unofficial fork of [notepadqq/notepadqq](https://github.com/notepadqq/notepadqq).
>
> The goal of this fork is to test and improve compatibility with Ubuntu 24.04 and Qt 5.15.x.
>
> This project is not affiliated with, endorsed by, or maintained by the original Notepadqq maintainers.

## Fork status

This fork is currently experimental.

Current goals:

- Build Notepadqq on Ubuntu 24.04
- Test runtime behavior with Qt 5.15.x
- Preserve Notepadqq / Notepad++-like user experience
- Improve documentation for build and smoke testing
- Investigate crash and data-correctness risks

This fork should not yet be considered production-ready.
Use it at your own risk, especially for important files or infrastructure configuration.


# <img src="https://user-images.githubusercontent.com/4319621/36906314-e3f99680-1e35-11e8-90fd-f959c9641f36.png" alt="Notepadqq" width="32" height="32" /> Notepadqq [![Build Status](https://travis-ci.com/notepadqq/notepadqq.svg?branch=master)](https://travis-ci.com/notepadqq/notepadqq) [![notepadqq](https://snapcraft.io/notepadqq/badge.svg)](https://snapcraft.io/notepadqq)

> [!WARNING]  
> This project is not actively maintained anymore. New maintainers are welcome.
>
> It has been reported that with the most recent OS/Qt versions, the program can crash unexpectedly. Use this at your own risk.
> 
>  -- Daniele


## Fork status (Ubuntu 24.04 / Qt 5.15.x)

This fork focuses on **Ubuntu 24.04 + Qt 5.15.x compatibility** with priorities in this order:

1. Data correctness
2. Runtime stability
3. Reproducible builds

Current status: **porting in progress**.

- Baseline build verification and CI are being added for Ubuntu 24.04.
- Qt version must be explicitly checked in each environment (`qmake -v`, `pkg-config --modversion Qt5Core`).
- This fork is **not declared production-ready** yet; please validate with the smoke-test checklist before critical use.

### Links

* [What is it?](#what-is-it)
* [Build it yourself](#build-it-yourself)
* [Download it](#distribution-packages)

#### What is it?

Notepadqq is a text editor designed by developers, for developers. 

![screenshot_20180302_163505](https://notepadqq.com/s/images/snapshot1.png)

Please visit our [Wiki](https://github.com/notepadqq/notepadqq/wiki) for more screenshots and details.

Build it yourself
-----

| Build dependencies    | Dependencies      |
|-----------------------|-------------------|
| Qt 5.6 or higher      | Qt 5.6 or higher  |
| qtwebengine5-dev      | qtwebengine5      |
| libqt5websockets5-dev | libqt5websockets5 |
| libqt5svg5-dev        | libqt5svg5        |
| qttools5-dev-tools    | coreutils         |
| libuchardet-dev       | libuchardet       |
| pkg-config            |                   |

#### Get the source

    $ git clone --recursive https://github.com/notepadqq/notepadqq.git
    $ cd notepadqq

#### Build

    notepadqq$ ./configure --prefix /usr
    notepadqq$ make

If you encounter errors make sure to have the necessary libraries installed. For Ubuntu you can do that using apt-get:

    sudo apt-get install qttools5-dev-tools qtwebengine5-dev libqt5websockets5-dev libqt5svg5 libqt5svg5-dev libuchardet-dev pkg-config

For CentOS:

    sudo yum install -y qt5-qtbase-devel qt5-qttools-devel qt5-qtwebengine-devel qt5-qtwebsockets-devel qt5-qtsvg-devel uchardet qt5-qtwebchannel-devel pkgconfig

#### Install

You can run notepadqq from its build output folder. If however you want to install it, first build it
by following the above steps, then run:

    notepadqq$ sudo make install

#### Qt

If the newest version of Qt isn't available on your distribution, you can use the [online installer](http://www.qt.io/download-open-source) to get the latest libraries and install them into your home directory (`$HOME/Qt`). Notepadqq will automatically use them.

Distribution Packages
---------------------

#### Ubuntu, Debian, and others:

    sudo apt install notepadqq

#### Snap

To install the latest stable version:

    sudo snap install notepadqq

You don't have the `snap` command? Follow the instructions at https://docs.snapcraft.io/core/install and then install Notepadqq as shown above.

You can follow the unstable development releases from the "edge" channel.

#### Arch Linux (community-maintained)
Notepadqq is available from Arch's [community repositories](https://www.archlinux.org/packages/community/x86_64/notepadqq/). To install using pacman:

    sudo pacman -S notepadqq

Alternatively it can be found in the AUR:

 * Development (git version): [notepadqq-git](https://aur.archlinux.org/packages/notepadqq-git/)

#### OpenSUSE (community-maintained)
Notepadqq is avilable in OpenSUSE's main repository:

     sudo zypper in notepadqq

#### Solus (community-maintained)
Notepadqq is available in the `shannon` (stable) repository:

     sudo eopkg it notepadqq

#### Others
Use a package for a compatible distribution, or build from [source](https://github.com/notepadqq/notepadqq.git).
If you want to submit a package: https://github.com/notepadqq/notepadqq-packaging

#### Compiling on macOS
Instructions can be found [here](https://github.com/notepadqq/notepadqq/wiki/Compiling-Notepadqq-on-macOS).
