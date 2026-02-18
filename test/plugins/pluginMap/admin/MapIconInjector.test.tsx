/**
 * @vitest-environment jsdom
 */
import React from 'react';
import { describe, it, expect, vi } from 'vitest';
import { render, screen, fireEvent } from '@testing-library/react';
import { I18nextProvider } from 'react-i18next';
import i18n from '../../../../utils/i18nForTests';
import MapIconInjector from '../../../../plugins/pluginMap/admin/injector/MapIconInjector';

// Mock EnvironmentOutlined and TransactionOutlined to avoid complex SVG structures in tests
vi.mock('@ant-design/icons', async () => {
  const actual =
    await vi.importActual<typeof import('@ant-design/icons')>(
      '@ant-design/icons',
    );
  return {
    ...actual,
    EnvironmentOutlined: (props: React.HTMLAttributes<HTMLSpanElement>) => (
      <span data-testid="map-icon" {...props} />
    ),
    TransactionOutlined: (props: React.HTMLAttributes<HTMLSpanElement>) => (
      <span data-testid="transaction-icon" {...props} />
    ),
    AppstoreOutlined: (props: React.HTMLAttributes<HTMLSpanElement>) => (
      <span data-testid="app-icon" {...props} />
    ),
  };
});

const renderWithI18n = (component: React.ReactElement) => {
  return render(<I18nextProvider i18n={i18n}>{component}</I18nextProvider>);
};

describe('MapIconInjector', () => {
  it('should render transaction block for G1 extension point', () => {
    renderWithI18n(<MapIconInjector extensionPointId="G1" />);
    expect(
      screen.getByText(/Plugin Map G1 Extension Point/i),
    ).toBeInTheDocument();
  });

  it('should render small icon for non-G1 (e.g., RA1) extension points', () => {
    renderWithI18n(<MapIconInjector extensionPointId="RA1" />);
    expect(screen.getByTestId('map-icon')).toBeInTheDocument();
  });

  it('should show badge by default', () => {
    renderWithI18n(<MapIconInjector extensionPointId="RA1" />);
    expect(screen.getByText('RA1')).toBeInTheDocument();
  });

  it('should not show badge when showBadge is false', () => {
    renderWithI18n(
      <MapIconInjector extensionPointId="RA1" showBadge={false} />,
    );
    expect(screen.queryByText('RA1')).not.toBeInTheDocument();
  });

  it('should show tooltip on hover', async () => {
    renderWithI18n(<MapIconInjector extensionPointId="RA1" />);
    const badge = screen.getByText('RA1');

    fireEvent.mouseEnter(badge);

    // Explicitly assert tooltip appearance
    await screen.findByRole('tooltip', { hidden: true });
    // Check for the translated extension point text
    expect(screen.getByRole('tooltip')).toHaveTextContent(
      /Extension Point:\s*RA1/,
    );
  });

  it('should handle small and large sizes', () => {
    const { rerender } = renderWithI18n(
      <MapIconInjector extensionPointId="RA1" size="small" />,
    );
    let icon = screen.getByTestId('map-icon');
    expect(icon.getAttribute('style')).toContain('font-size: 12px');

    rerender(
      <I18nextProvider i18n={i18n}>
        <MapIconInjector extensionPointId="RA1" size="large" />
      </I18nextProvider>,
    );
    icon = screen.getByTestId('map-icon');
    expect(icon.getAttribute('style')).toContain('font-size: 20px');

    rerender(
      <I18nextProvider i18n={i18n}>
        <MapIconInjector extensionPointId="RA1" size="default" />
      </I18nextProvider>,
    );
    icon = screen.getByTestId('map-icon');
    expect(icon.getAttribute('style')).toContain('font-size: 16px');
  });

  it('should change styles on mouse enter and leave', () => {
    renderWithI18n(<MapIconInjector extensionPointId="RU1" />);
    const icon = screen.getByTestId('map-icon');
    const iconContainer = icon.parentElement;

    expect(iconContainer).toBeInTheDocument();

    if (iconContainer) {
      fireEvent.mouseEnter(iconContainer);
      expect(iconContainer.style.backgroundColor).toBe('rgb(230, 247, 255)');

      fireEvent.mouseLeave(iconContainer);
      expect(iconContainer.style.backgroundColor).toBe('rgb(240, 240, 240)');
    }
  });
});
