# Talawa Mobile Documentation Website

[![N|Solid](static/img/markdown/misc/logo.png)](https://github.com/PalisadoesFoundation/docs-mobile)

# Installation

This document provides instructions on how to set up and start a running instance of docs-mobile website on your local system. The instructions are written to be followed in sequence so make sure to go through each of them step by step without skipping any sections.

# Table of Contents

<!-- /TOC -->

- [Developer-Docs Installation](#docs-mobile-installation)
- [Table of Contents](#table-of-contents)
- [Prerequisites for Developers](#prerequisites-for-developers)
  - [Install node.js](#install-nodejs)
  - [Install the Required Packages](#install-the-required-packages)
    - [Install Yarn on Windows Using NPM](#install-yarn-on-windows-using-npm)
    - [Install Yarn on Windows Using msi File](#install-yarn-on-windows-using-msi-file)
    - [Install Yarn on macOS Using NPM](#install-yarn-on-macos-using-npm)
    - [Install Yarn on macOS Using Homebrew](#install-yarn-on-macos-using-homebrew)
    - [Install Yarn on Linux Using NPM](#install-yarn-on-linux-using-npm)
- [Running the Development Server](#running-the-development-server)
- [Building Static HTML Pages](#building-static-html-pages)

# Prerequisites for Developers

The contents of the `docs-mobile` repo is used to automatically create [the Talawa Mobile Documentation website](https://docs-mobile.talawa.io/). The automation uses [Docusaurus](https://docusaurus.io/docs/), a modern static website generator.

We recommend that you follow these steps before beginning development work in this repository.

## Install the Required Packages

For the package installation, use only the `yarn` package as `npm` will throw an error. Only `npm` use case here would be to install the `yarn` package. Visit the [Docusaurus installation web page](https://docusaurus.io/docs/installation) if you have any difficulties with the steps below.

The steps are simple:

1. If you have previously installed yarn on your local device run the following command to confirm

```terminal
$ yarn -version
```

2. If you don't have yarn installed, follow these steps:

**Note:** Please bear in mind that to install docusaurus in your system, a Node.js version 16.14 or above (which can be checked by running node -v) is required. Other requirements that pertains to the installation of docusaurus can be found [here](https://docusaurus.io/docs/installation)

```console
$ git clone https://github.com/PalisadoesFoundation/docs-mobile.git
$ cd docs-mobile
$ yarn add docusaurus
```

### Install Yarn on Windows Using NPM

NPM (Node Package Manager) is a package manager included with the Node.js installation. It is used for developing and sharing JavaScript code, but it also provides another method of installing Yarn

1. [Download the Node Windows installer](https://nodejs.org/en/download/)
1. After choosing the path, double-click to install. Then give access to run the application
1. Install Yarn by running the following command

```terminal
$ npm install --global yarn
```

4. Check Yarn installation

```terminal
$ yarn -version
```

### Install Yarn on Windows Using msi File

Here’s how to install the Yarn package manager on Windows

1. [Download the Yarn Windows installer](https://classic.yarnpkg.com/en/docs/install#windows-stable)
1. After choosing the path, double-click to install. Then give access to run the application

1. Check Yarn installation

```terminal
$ yarn -version
```

### Install Yarn on macOS Using NPM

The .pkg installer can be used to install Yarn on macOS. Using the .pkg installer also helps resolve dependencies since it does not require a command line to install Node.js

1. [Click on the macOS Installer option to download the .pkg installer](https://nodejs.org/en/download/)
2. Run the Node.js installer
3. Verify Node.js Installation by running the following command in your terminal

```terminal
$ node -v
$ npm -v
```

4. Run the following command to install Yarn

```terminal
$ sudo npm install --global yarn
```

5. Verify Yarn Installation

```terminal
$ yarn --version
```

### Install Yarn on macOS Using Homebrew

One of the easiest way to install Yarn on macOS is to use the command line installer

1. Install Yarn by running the given command in your terminal

```terminal
$ brew install yarn
```

### Install Yarn on Linux Using NPM

Installing Yarn on Linux through NPM can be done via command line installer, this doesn't automatically install Node.js

1. Run the following command in your terminal to install Node and NPM respectively. [Confirm your Linux distro and it's command prompt](https://classic.yarnpkg.com/lang/en/docs/install/#debian-stable)

```terminal
$ sudo apt install nodejs
$ sudo apt install npm
```

2. Verify installation

```terminal
$ node -v
$ npm -v
```

3. Install Yarn with the following command

```terminal
npm install --global yarn
```

Finally, after installing yarn and confirming that it is installed in your computer, run the command below to install the packages

```terminal
$ yarn install
```

# Running the Development Server

To preview your changes as you edit the files, you can run a local development server that will serve your website and it will reflect the latest changes.

The command to run the server is:

```console
$ yarn run start
OR
$ yarn start
```

By default, a browser window will open at http://localhost:3000.

This command starts a local development server and open up a browser window. Most changes are reflected live without having to restart the server.

# Building Static HTML Pages

**In most cases is unnecessary**. Running the `development server` will be sufficient.

If you need to generate static HTML pages (unlikely), then follow these steps.

```console
$ yarn run build
```

This command generates static content into the `/build` directory and can be served using any static contents hosting service.