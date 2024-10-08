## Sucklessrandr

Sucklessrandr monitors for changes in the `xrandr` connected outputs and
loads an `xrandr` configuration when a predefined pattern is detected.

## Install

1. Download and start the bash script to create a sample config file

```
wget https://raw.githubusercontent.com/vkdimitrov/sucklessrandr/refs/heads/master/sucklessrandr.sh
chmod +x sucklessrandr.sh
./sucklessrandr.sh
```

2. Edit the config file `~/.config/sucklessrandr.conf` to match your desired configuration

## Usage

```
./sucklessrandr.sh &
```
