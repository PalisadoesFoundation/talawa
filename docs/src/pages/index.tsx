import React from 'react';
import Head from '@docusaurus/Head';
import Layout from '@theme/Layout';
import HeaderHero from '../components/layout/HeaderHero';

const Index = () => {
  const pageTitle = 'Talawa-Docs: Powered by The Palisadoes';

  return (
    <Layout
      description="Powering Closer Communities"
      wrapperClassName="homepage"
    >
      <Head>
        <title>{pageTitle}</title>
        <meta property="og:title" content={pageTitle} />
        <meta property="twitter:title" content={pageTitle} />
      </Head>
      <HeaderHero />
    </Layout>
  );
};

export default Index;
