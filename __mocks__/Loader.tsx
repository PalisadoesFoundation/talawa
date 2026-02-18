/**
 * Mock for components/Loader/Loader from talawa-admin
 * Used for testing admin UI components that depend on this component
 */
import React from 'react';

const Loader: React.FC = () => {
  return React.createElement('div', { 'data-testid': 'loader' }, 'Loading...');
};

export default Loader;
