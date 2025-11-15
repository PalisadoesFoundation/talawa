# Documentation
Welcome to our documentation guide. Here are some useful tips you need to know!

# Table of Contents

<!-- toc -->

- [Documentation](#documentation)
- [Table of Contents](#table-of-contents)
  - [General Talawa Documentation](#general-talawa-documentation)
  - [Repo Specific Documentation](#repo-specific-documentation)
    - [Most Common](#most-common)
      - [How to use Docusaurus in this repository](#how-to-use-docusaurus-in-this-repository)
    - [Other Methods](#other-methods)

<!-- tocstop -->

## General Talawa Documentation

Our [docs.talawa.io](https://docs.talawa.io/) contains our Talawa documentation.

## Repo Specific Documentation

Our documentation can be found in ONLY 3 PLACES:

### Most Common

1. ***Mardown files in the `/docs` directory.***: Manually created documents are placed in this directory tree. These files are rendered in docusaurus on the [docs.talawa.io](https://docs.talawa.io/) site after each PR.

#### How to use Docusaurus in this repository

The process in easy:

1. Enter the `docs/` directory
2. Follow the instructions in the `README.md` file to launch Docusaurus.
3. Add/modify the markdown documents to the `docs/docs/docs` directory.
4. If adding a file, then you may need to edit the `sidebars.js` which is used to generate the left navigation menus.
5. Always monitor the local website in your brower to make sure the changes are acceptable. 
    - You'll be able to see errors that you can use for troubleshooting in the CLI window you used to launch the local website.

### Other Methods

1. ***Inline within the repository's code files***: We have automated processes to extract this information and place it in our Talawa documentation site [docs.talawa.io](https://docs.talawa.io/).
2. ***In our `talawa-docs` repository***: This is used for Talawa Wide documentation. Our [Talawa-Docs](https://github.com/PalisadoesFoundation/talawa-docs) repository contains user edited markdown files that are automatically integrated into our Talawa documentation site [docs.talawa.io](https://docs.talawa.io/) using the [Docusaurus](https://docusaurus.io/) package.
   1. The `talawa-docs`  repository has an `INSTALLATION.md` file that explains how to configure and install it.
