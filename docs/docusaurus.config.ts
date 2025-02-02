import { themes as prismThemes } from "prism-react-renderer";
import type { Config } from "@docusaurus/types";
import type * as Preset from "@docusaurus/preset-classic";

// This runs in Node.js - Don't use client-side code here (browser APIs, JSX...)

const config: Config = {
  title: "Talawa Mobile Documentation",
  tagline: "Start your open source journey here",
  favicon: "img/favicon.ico",

  url: "https://docs-mobile.talawa.io",
  baseUrl: "/",
  deploymentBranch: "gh-pages",

  organizationName: "PalisadoesFoundation", // GitHub org
  projectName: "talawa", // repo name

  onBrokenLinks: "throw",
  onBrokenMarkdownLinks: "warn",

  // Even if you don't use internationalization, you can use this field to set
  // useful metadata like html lang. For example, if your site is Chinese, you
  // may want to replace "en" with "zh-Hans".
  i18n: {
    defaultLocale: "en",
    locales: ["en"],
  },

  presets: [
    [
      "classic",
      /** @type {import('@docusaurus/preset-classic').Options} */
      {
        docs: {
          sidebarPath: require.resolve("./sidebars.js"),
          editUrl: ({ docPath }) => {
            return `https://github.com/PalisadoesFoundation/talawa/edit/develop/docs/docs/${docPath}`;
          },
        },
        blog: {
          showReadingTime: true,
          editUrl:
            "https://github.com/PalisadoesFoundation/talawa/tree/develop/docs/docs",
        },
        theme: {
          customCss: [
            require.resolve("./src/css/custom.css"),
            require.resolve("./src/css/index.css"),
          ],
        },
      },
    ],
  ],

  themeConfig: {
    // Replace with your project's social card
    image: "img/docusaurus-social-card.jpg",
    navbar: {
      title: "Talawa",
      logo: {
        alt: "Talawa Logo",
        src: "img/icons/logo.png",
      },
      items: [
        {
          label: 'General',
          position: 'left',
          href: 'https://docs.talawa.io/docs',
          target: '_self',
        },
        {
          label: 'Mobile Guide',
          position: 'left',
          href: '/docs',
          target: '_self',
        },
        {
          label: 'Admin Guide',
          position: 'left',
          href: 'https://docs-admin.talawa.io/docs',
          target: '_self',
        },
        {
          label: 'API Guide',
          position: 'left',
          href: 'https://docs-api.talawa.io/docs',
          target: '_self',
        },

        {
          label: 'Demo',
          position: 'left',
          href: 'http://admin-demo.talawa.io/',
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
              label: 'Slack',
              to: 'https://github.com/PalisadoesFoundation',
              className: 'footer__icon footer__slack',
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
    prism: {
      theme: prismThemes.github,
      darkTheme: prismThemes.dracula,
    },
  } satisfies Preset.ThemeConfig,
};

export default config;
