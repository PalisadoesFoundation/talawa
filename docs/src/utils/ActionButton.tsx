import React from 'react';

interface ActionButtonProps {
  href: string;
  type?: 'primary' | 'secondary';
  target?: string;
  children: React.ReactNode;
  buttonClassName?: string;
  ariaLabel: string;
}

function ActionButton({
  href,
  type = 'primary',
  target,
  children,
  buttonClassName,
  ariaLabel,
}: ActionButtonProps) {
  return (
    <a
      className={`ActionButton ${type}${buttonClassName ? ` ${buttonClassName}` : ''}`}
      rel={target === '_blank' ? 'noopener noreferrer' : undefined}
      href={href}
      target={target}
      role="button"
      aria-label={ariaLabel}
    >
      {children}
    </a>
  );
}

export default ActionButton;
