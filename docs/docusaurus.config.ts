import { themes as prismThemes } from 'prism-react-renderer';
import type { Config } from '@docusaurus/types';
import type * as Preset from '@docusaurus/preset-classic';

// This runs in Node.js - Don't use client-side code here (browser APIs, JSX...)

const config: Config = {
  title: 'Talawa-Plugin Documentation',
  tagline: 'Complete guides and references for building with Talawa',
  favicon: 'img/icons/favicon_palisadoes.ico',

  url: 'https://docs-plugin.talawa.io',
  baseUrl: '/',
  deploymentBranch: 'gh-pages',

  organizationName: 'PalisadoesFoundation', // GitHub org
  projectName: 'talawa-plugin', // repo name

  onBrokenLinks: 'throw',
  markdown: {
    hooks: {
      onBrokenMarkdownLinks: 'warn', // Or 'throw', 'ignore'
    },
  },

  // Even if you don't use internationalization, you can use this field to set
  // useful metadata like html lang. For example, if your site is Chinese, you
  // may want to replace "en" with "zh-Hans".
  i18n: {
    defaultLocale: 'en',
    locales: ['en'],
  },

  stylesheets: ['https://docs.talawa.io/css/styles-latest.css'],

  presets: [
    [
      'classic',
      /** @type {import('@docusaurus/preset-classic').Options} */
      {
        docs: {
          sidebarPath: require.resolve('./sidebars.js'),
          editUrl: ({ docPath }) => {
            return `https://github.com/PalisadoesFoundation/talawa-plugin/edit/develop/docs/docs/${docPath}`;
          },
        },
        blog: {
          showReadingTime: true,
          editUrl:
            'https://github.com/PalisadoesFoundation/talawa-plugin/tree/develop/docs/docs',
        },
        theme: {
          customCss: require.resolve('./src/css/custom.css'),
        },
      },
    ],
  ],

  themeConfig:
    /** @type {import('@docusaurus/preset-classic').ThemeConfig} */
    {
      docs: {
        sidebar: {
          hideable: false,
        },
      },
      navbar: {
        title: 'Talawa',
        logo: {
          alt: 'Talawa Logo',
          src: 'img/icons/logo.png',
          href: 'https://docs.talawa.io/',
          className: 'LogoAnimation',
        },
        items: [
          {
            label: 'General',
            position: 'left',
            to: 'https://docs.talawa.io/docs',
            target: '_self',
          },
          {
            label: 'Mobile Guide',
            position: 'left',
            to: 'https://docs-mobile.talawa.io/docs',
            target: '_self',
          },
          {
            to: 'https://docs-admin.talawa.io/docs',
            activeBasePath: 'docs',
            label: 'Admin Guide',
            position: 'left',
          },
          {
            label: 'API Guide',
            position: 'left',
            to: 'https://docs-api.talawa.io/docs',
            target: '_self',
          },
          {
            to: '/docs',
            label: 'Plugin Guide',
            position: 'left',
            target: '_self',
          },
          {
            label: 'Community',
            position: 'left',
            to: 'https://community.talawa.io',
            target: '_self',
          },
          {
            label: 'Demo',
            position: 'left',
            to: 'https://demo.talawa.io/',
          },
          {
            to: 'https://github.com/PalisadoesFoundation',
            position: 'right',
            className: 'header-github-link',
            'aria-label': 'GitHub repository',
          },
          {
            to: 'https://www.youtube.com/@PalisadoesOrganization',
            position: 'right',
            className: 'header-youtube-link',
            'aria-label': 'Palisadoes Youtube channel',
          },
        ],
      },
      footer: {
        style: 'dark',
        links: [
          {
            title: 'Community',
            items: [
              {
                label: 'Forums',
                to: 'https://community.talawa.io/',
                className: 'footer__icon footer__news',
              },
              {
                label: 'News',
                to: 'https://www.palisadoes.org/news/',
                className: 'footer__icon footer__news',
              },
              {
                label: 'Contact Us',
                to: 'https://www.palisadoes.org/contact/',
                className: 'footer__icon footer__contact',
              },
            ],
          },
          {
            title: 'Social Media',
            items: [
              {
                label: ' Twitter',
                to: 'https://twitter.com/palisadoesorg?lang=en',
                className: 'footer__icon footer__twitter',
              },
              {
                label: ' Facebook',
                to: 'https://www.facebook.com/palisadoesproject/',
                className: 'footer__icon footer__facebook',
              },
              {
                label: ' Instagram',
                to: 'https://www.instagram.com/palisadoes/?hl=en',
                className: 'footer__icon footer__instagram',
              },
            ],
          },
          {
            title: 'Development',
            items: [
              {
                label: ' GitHub',
                to: 'https://github.com/PalisadoesFoundation',
                className: 'footer__icon footer__github',
              },
            ],
          },
        ],
        copyright: `Copyright © ${new Date().getFullYear()} The Palisadoes Foundation, LLC. Built with Docusaurus.`,
      },
      colorMode: {
        defaultMode: 'light',
        disableSwitch: false,
        respectPrefersColorScheme: true,
      },
      prism: {
        theme: prismThemes.github,
        darkTheme: prismThemes.dracula,
      },
    },
};

export default config;
