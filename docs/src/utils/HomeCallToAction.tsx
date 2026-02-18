import React from 'react';
import ActionButton from './ActionButton';

const HomeCallToAction = () => {
  return (
    <>
      <ActionButton
        type="primary"
        href="/docs"
        buttonClassName="custom-button"
        ariaLabel="Learn more about Talawa Mobile"
      >
        Learn More
      </ActionButton>
      <ActionButton
        type="secondary"
        href="https://github.com/PalisadoesFoundation/talawa"
        buttonClassName="custom-button"
        target="_blank"
        rel="noopener noreferrer"
        aria-label="View Talawa Mobile on GitHub"
      >
        GitHub
      </ActionButton>
    </>
  );
};

export default HomeCallToAction;
