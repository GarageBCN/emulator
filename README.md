# Robota emulator

Robota emulator is focused on providing a common software platform for developing Robota applications.
The goal of this project is to enable Robota developers to work without requiring the hardware platform.
Since current Robota developers might be using different personal setups, this emulator will make use of virtualization to run.

Currently, it only allows to virtualize Raspberry Pi 1 model A, the most simple model.
The emulator will provide with screen emulation through VNC.

## Requirements

The emulator uses [VirtualBox](https://www.virtualbox.org/) and [Vagrant](https://www.vagrantup.com/) for setting everything up.
Emulation provides access to display through VNC, so a VNC client would be required:

- For MacOS, you can choose [The Chicken Of VNC](https://www.google.es/url?sa=t&rct=j&q=&esrc=s&source=web&cd=1&cad=rja&uact=8&ved=0ahUKEwilnoyD8OXNAhWJvhQKHTvBD7AQFggfMAA&url=https%3A%2F%2Fsourceforge.net%2Fprojects%2Fcotvnc%2F&usg=AFQjCNHzMRi-Oqf8qKHZTyqElAfySSakvQ&bvm=bv.126130881,d.d24)
- For Ubuntu, [Vinagre](https://wiki.gnome.org/Apps/Vinagre) is the default client
- For Windows, you can use [UltraVNC](http://www.uvnc.com/)

Everything else required will be automatically downloaded.

## Setup

Once this repository is cloned, the command to build the emulator locally should be executed from the root repository directory:

    vagrant up
    
This process will create a new virtual machine running Ubuntu 16.04, and setup everything needed to virtualize Raspbian on a Raspbery Pi system.
This part of the process can take some minutes, depending on the setup, computer power, and internet connection.
For the record, in my setup (MacBook Pro Retina 2014, with 30Gb fiber link), it took ~30 minutes.
The good side is that this is supposedly to be so slow only the first time, while the environment doesn't get destroyed.

## Usage

For using the emulator, the machine needs to be up, what can be checked with the command:

    vagrant status
    
If it is not up, run `vagrant up`.

Than, connect to VNC, using localhost and display 0, and you'll see Raspbian desktop.

Once you finished working with it, it can be shutdown, using:

    vagrant halt

## Roadmap

- Improve RAM, if possible.
- Network access should be provided.
- Get Raspberry Pi 2 to work.
- Research for a GPIO emulation system/interface.
