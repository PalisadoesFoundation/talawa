/**
 * Map Icon Injector Component for Plugin Map
 *
 * This component injects a map icon indicator to show where extension points are available.
 * It's used for G1-G5 extension points to visually indicate injection points.
 */

import React from 'react';
import { Badge, Tooltip, Card, Typography, Space } from 'antd';
import {
  EnvironmentOutlined,
  AppstoreOutlined,
  TransactionOutlined,
} from '@ant-design/icons';
import { useTranslation } from 'react-i18next';

const { Text, Title } = Typography;

interface MapIconInjectorProps {
  extensionPointId?: string;
  position?: 'top' | 'bottom' | 'left' | 'right';
  size?: 'small' | 'default' | 'large';
  showBadge?: boolean;
}

const MapIconInjector: React.FC<MapIconInjectorProps> = ({
  extensionPointId = 'G1',
  position = 'top',
  size = 'default',
  showBadge = true,
}) => {
  const { t } = useTranslation('plugin-map');

  // For G1 extension point, render a full-width transaction block
  if (extensionPointId === 'G1') {
    return (
      <Card
        style={{
          width: '100%',
          margin: '16px 0',
          border: '2px dashed #1890ff',
          backgroundColor: '#f6ffed',
          borderRadius: '8px',
        }}
        bodyStyle={{
          padding: '20px',
          textAlign: 'center',
        }}
      >
        <Space direction="vertical" size="middle" style={{ width: '100%' }}>
          <Space align="center" size="large">
            <TransactionOutlined
              style={{
                fontSize: '32px',
                color: '#1890ff',
              }}
              aria-label={t('injector.title')}
              role="img"
            />
            <div>
              <Title level={4} style={{ margin: 0, color: '#1890ff' }}>
                {t('injector.title')}
              </Title>
              <Text type="secondary">{t('injector.description')}</Text>
            </div>
          </Space>

          <div
            style={{
              padding: '12px 16px',
              backgroundColor: '#e6f7ff',
              borderRadius: '6px',
              border: '1px solid #91d5ff',
            }}
          >
            <Text style={{ fontSize: '14px', color: '#1890ff' }}>
              <AppstoreOutlined
                style={{ marginRight: '8px' }}
                aria-hidden="true"
              />
              {t('injector.extensionPoint', { id: extensionPointId })}
            </Text>
          </div>
        </Space>
      </Card>
    );
  }

  // For other extension points, render the original small icon
  const getIconSize = () => {
    switch (size) {
      case 'small':
        return { fontSize: '12px' };
      case 'large':
        return { fontSize: '20px' };
      default:
        return { fontSize: '16px' };
    }
  };

  const getTooltipContent = () => {
    return (
      <div>
        <div style={{ fontWeight: 'bold', marginBottom: '4px' }}>
          {t('injector.extensionPoint', { id: extensionPointId })}
        </div>
        <div style={{ fontSize: '12px' }}>
          {t('injector.supportText', { id: extensionPointId })}
        </div>
        <div style={{ fontSize: '11px', marginTop: '8px', opacity: 0.8 }}>
          <AppstoreOutlined style={{ marginRight: '4px' }} aria-hidden="true" />
          {t('injector.badge')}
        </div>
      </div>
    );
  };

  const mapIcon = (
    <div
      style={{
        display: 'inline-flex',
        alignItems: 'center',
        justifyContent: 'center',
        padding: '2px',
        borderRadius: '4px',
        backgroundColor: '#f0f0f0',
        border: '1px dashed #d9d9d9',
        cursor: 'help',
        transition: 'all 0.3s ease',
      }}
      onMouseEnter={(e) => {
        e.currentTarget.style.backgroundColor = '#e6f7ff';
        e.currentTarget.style.borderColor = '#1890ff';
      }}
      onMouseLeave={(e) => {
        e.currentTarget.style.backgroundColor = '#f0f0f0';
        e.currentTarget.style.borderColor = '#d9d9d9';
      }}
    >
      <EnvironmentOutlined
        style={{
          color: '#1890ff',
          ...getIconSize(),
        }}
        aria-label={t('injector.badge')}
        role="img"
      />
    </div>
  );

  const content = showBadge ? (
    <Badge
      count={extensionPointId}
      size="small"
      style={{
        backgroundColor: '#52c41a',
        fontSize: '10px',
        minWidth: '20px',
        height: '16px',
        lineHeight: '16px',
        borderRadius: '8px',
      }}
    >
      {mapIcon}
    </Badge>
  ) : (
    mapIcon
  );

  return (
    <Tooltip
      title={getTooltipContent()}
      placement={position}
      overlayStyle={{ maxWidth: '300px' }}
    >
      {content}
    </Tooltip>
  );
};

export default MapIconInjector;
