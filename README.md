# Chocolatey Package: Jabra Direct

[![Build Status](https://img.shields.io/travis/itigoag/chocolatey.jabra-direct?style=flat-square)](https://travis-ci.org/itigoag/chocolatey.jabra-direct) [![license](https://img.shields.io/github/license/mashape/apistatus.svg?style=popout-square)](licence) [![Chocolatey](https://img.shields.io/chocolatey/v/jabra-direct?label=package%20version)](https://chocolatey.org/packages/jabra-direct) [![Chocolatey](https://img.shields.io/chocolatey/dt/jabra-direct?label=package%20downloads&style=flat-square)](https://chocolatey.org/packages/jabra-direct)

## Description

Jabra Direct is free PC software enabling Jabra USB devices to have Remote Call Control over most softphones. It also brings you features to personalize your Jabra device, to improve your device with firmware upgrades and offers a Dashboard with status to ensure everything is ready for the next call.

## Package Parameters

- `/CleanStartmenu` Removes frequently used Jabra Direct shortcuts from the Startmenu.

## Installation

### choco

installation without parameters.

```ps1
 choco install jabra-direct
```

installation with parameters.

```ps1
 choco install jabra-direct --params="'/CleanStartmenu'"
```

### [ITIGO Packages](https://github.com/itigoag/ansible.packages)

installation without parameters.

```yml
packages:
  'jabra-direct':
    version: latest
```

installation with parameters.

```yml
packages:
  'jabra-direct':
    version: latest
    params: "'/CleanStartmenu'"
```

## Disclaimer

These Chocolatey Packages only contain installation routines. The software itself is downloaded from the official sources of the software developer. ITIGO AG has no affilation with the software developer.

## Author

- [Simon Bärlocher](https://sbaerlocher.ch)
- [ITIGO AG](https://www.itigo.ch)

## License

This project is under the MIT License. See the [LICENSE](LICENSE) file for the full license text.

## Copyright

(c) 2019, ITIGO AG
