import React from 'react';
import HomeCallToAction from '../../utils/HomeCallToAction';

function HeaderHero() {
  return (
    <section className="HeaderHero" role="banner">
      <h1 className="title" id="main-title">
        Talawa
      </h1>
      <h2 className="tagline" aria-describedby="main-title">
        Plugin Docs
      </h2>
      <p className="description">Plugins for the Talawa Admin portal</p>
      <div className="buttons" role="navigation" aria-label="Quick links">
        <HomeCallToAction />
      </div>
    </section>
  );
}

export default HeaderHero;
