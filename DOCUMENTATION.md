# Documentation
Welcome to our documentation guide. Here are some useful tips you need to know!
## Where to find our documentation

Our documentation can be found in ONLY TWO PLACES:

1. ***Inline within the repository's code files***: We have automated processes to extract this information and place it in our Talawa documentation site [docs.talawa.io](https://docs.talawa.io/). 
1. ***In our `talawa-docs` repository***: Our [Talawa-Docs](https://github.com/PalisadoesFoundation/talawa-docs) repository contains user edited markdown files that are automatically integrated into our Talawa documentation site [docs.talawa.io](https://docs.talawa.io/) using the [Docusaurus](https://docusaurus.io/) package.

## How to use Docusaurus
The process in easy:
1. Install `talawa-docs` on your system
1. Launch docusaurus on your system according to the `talawa-docs`documentation. 
    - A local version of `docs.talawa.io` should automatically launched in your browser at http://localhost:3000/
1. Add/modify the markdown documents to the `docs/` directory of the `talawa-docs` repository
1. If adding a file, then you will also need to edit the `sidebars.js` which is used to generate the [docs.talawa.io](https://docs.talawa.io/) menus.
1. Always monitor the local website in your brower to make sure the changes are acceptable. 
    - You'll be able to see errors that you can use for troubleshooting in the CLI window you used to launch the local website.

## Other information
***PLEASE*** do not add markdown files in this repository. Add them to `talawa-docs`!
