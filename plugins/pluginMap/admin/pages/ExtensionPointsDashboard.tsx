/**
 * Extension Points Dashboard Component for Plugin Map
 *
 * This component displays all available extension points in the Talawa Admin Panel
 * from a global admin perspective, helping developers understand the full ecosystem.
 */

import React, { useEffect, useState } from 'react';
import {
  Card,
  Typography,
  Row,
  Col,
  Button,
  message,
  Space,
  Table,
  Tag,
} from 'antd';
// @ts-expect-error - Apollo Client v4 types issue
import { useMutation, useQuery } from '@apollo/client';

import useLocalStorage from 'utils/useLocalstorage';
import { useTranslation } from 'react-i18next';
import '../utils/i18n';
import {
  GET_PLUGIN_MAP_REQUESTS,
  LOG_PLUGIN_MAP_REQUEST,
} from '../graphql/queries';
import {
  IGetPluginMapRequestsResponse,
  IGetPluginMapRequestsVariables,
  ILogPluginMapRequestResponse,
  ILogPluginMapRequestVariables,
} from '../types';

const { Title, Paragraph } = Typography;

const ExtensionPointsDashboard: React.FC = () => {
  const { t } = useTranslation('plugin-map');
  const [logRequest] = useMutation<
    ILogPluginMapRequestResponse,
    ILogPluginMapRequestVariables
  >(LOG_PLUGIN_MAP_REQUEST);
  const { getItem } = useLocalStorage();
  const userId = getItem('id') as string | null;
  const [refetchTrigger, setRefetchTrigger] = useState(0);

  // Query to fetch requests for this extension point
  const {
    data: requestsData,
    loading: loadingRequests,
    refetch,
  } = useQuery<IGetPluginMapRequestsResponse, IGetPluginMapRequestsVariables>(
    GET_PLUGIN_MAP_REQUESTS,
    {
      variables: {
        input: {
          extensionPoint: 'RA2',
          userRole: 'admin',
          organizationId: null, // Global routes have no organization
          userId: userId || 'unknown-user', // Filter by current user ID
        },
      },
      fetchPolicy: 'network-only',
    },
  );

  // Refetch when a new request is logged
  useEffect(() => {
    if (refetchTrigger > 0) {
      refetch();
    }
  }, [refetchTrigger, refetch]);

  const handlePollClick = async () => {
    try {
      const result = await logRequest({
        variables: {
          input: {
            userId: userId || 'unknown-user', // Use actual user ID from localStorage
            userRole: 'admin',
            organizationId: null, // Global routes have no organization
            extensionPoint: 'RA2',
          },
        },
      });

      if (result.data?.plugin_map_logPluginMapRequest) {
        message.success(
          t('messages.success', {
            pollNumber: result.data.plugin_map_logPluginMapRequest.pollNumber,
            extensionPoint:
              result.data.plugin_map_logPluginMapRequest.extensionPoint,
          }),
        );
        setRefetchTrigger((prev) => prev + 1);
      } else {
        message.error(t('messages.error'));
      }
    } catch (error) {
      const errorMessage =
        error instanceof Error ? error.message : String(error);
      console.error('Error logging request:', errorMessage);
      message.error(t('messages.error'));
    }
  };

  const columns = [
    {
      title: t('table.pollNumber'),
      dataIndex: 'pollNumber',
      key: 'pollNumber',
    },
    {
      title: t('table.userId'),
      dataIndex: 'userId',
      key: 'userId',
    },
    {
      title: t('table.userRole'),
      dataIndex: 'userRole',
      key: 'userRole',
      render: (role: string) => <Tag color="blue">{role}</Tag>,
    },
    {
      title: t('table.orgId'),
      dataIndex: 'organizationId',
      key: 'organizationId',
      render: (orgId: string | null) =>
        orgId ? <Tag color="green">{orgId}</Tag> : '-',
    },
    {
      title: t('table.extensionPoint'),
      dataIndex: 'extensionPoint',
      key: 'extensionPoint',
      render: (point: string) => <Tag color="purple">{point}</Tag>,
    },
    {
      title: t('table.createdAt'),
      dataIndex: 'createdAt',
      key: 'createdAt',
      render: (date: string) => new Date(date).toLocaleString(),
    },
  ];

  return (
    <div style={{ padding: 24 }}>
      <Title level={2}>{t('dashboard.title')}</Title>
      <Paragraph>{t('dashboard.description')}</Paragraph>

      <Row gutter={[16, 16]}>
        <Col span={24}>
          <Card
            title={t('dashboard.testRequestSystem')}
            style={{ marginBottom: 16 }}
          >
            <Space direction="vertical" style={{ width: '100%' }}>
              <Paragraph>{t('dashboard.clickBelow')}</Paragraph>
              <Button
                type="primary"
                onClick={handlePollClick}
                aria-label={t('dashboard.requestButton')}
              >
                {t('dashboard.requestButton')}
              </Button>
            </Space>
          </Card>
        </Col>

        <Col span={24}>
          <Card
            title={t('dashboard.requestHistory')}
            style={{ marginBottom: 16 }}
          >
            <Space direction="vertical" style={{ width: '100%' }}>
              <Paragraph>
                {t('table.totalRequests', {
                  count:
                    requestsData?.plugin_map_getPluginMapRequests.totalCount ||
                    0,
                })}
              </Paragraph>
              <Table
                dataSource={
                  requestsData?.plugin_map_getPluginMapRequests.requests || []
                }
                columns={columns}
                rowKey="id"
                loading={loadingRequests}
                pagination={{ pageSize: 5 }}
                scroll={{ x: true }}
                aria-label={t('dashboard.requestHistory')}
              />
            </Space>
          </Card>
        </Col>

        <Col span={24}>
          <Card title={t('info.cardTitle')}>
            <Row gutter={[24, 16]}>
              <Col span={6}>
                <div
                  style={{
                    textAlign: 'center',
                    padding: 16,
                    background: '#f8f9fa',
                    borderRadius: 6,
                  }}
                >
                  <div
                    style={{
                      fontSize: 14,
                      color: '#666',
                      marginBottom: 4,
                    }}
                  >
                    {t('info.extensionId')}
                  </div>
                  <div style={{ fontSize: 16, fontWeight: 'bold' }}>RA2</div>
                </div>
              </Col>
              <Col span={6}>
                <div
                  style={{
                    textAlign: 'center',
                    padding: 16,
                    background: '#f8f9fa',
                    borderRadius: 6,
                  }}
                >
                  <div
                    style={{
                      fontSize: 14,
                      color: '#666',
                      marginBottom: 4,
                    }}
                  >
                    {t('info.type')}
                  </div>
                  <div style={{ fontSize: 16, fontWeight: 'bold' }}>
                    {t('info.adminDashboard')}
                  </div>
                </div>
              </Col>
              <Col span={6}>
                <div
                  style={{
                    textAlign: 'center',
                    padding: 16,
                    background: '#f8f9fa',
                    borderRadius: 6,
                  }}
                >
                  <div
                    style={{
                      fontSize: 14,
                      color: '#666',
                      marginBottom: 4,
                    }}
                  >
                    {t('info.accessLevel')}
                  </div>
                  <div style={{ fontSize: 16, fontWeight: 'bold' }}>
                    {t('info.adminsOnly')}
                  </div>
                </div>
              </Col>
              <Col span={6}>
                <div
                  style={{
                    textAlign: 'center',
                    padding: 16,
                    background: '#f8f9fa',
                    borderRadius: 6,
                  }}
                >
                  <div
                    style={{
                      fontSize: 14,
                      color: '#666',
                      marginBottom: 4,
                    }}
                  >
                    {t('info.organization')}
                  </div>
                  <div style={{ fontSize: 16, fontWeight: 'bold' }}>Global</div>
                </div>
              </Col>
            </Row>
            <div
              style={{
                marginTop: 16,
                padding: 16,
                background: '#f0f8ff',
                borderRadius: 6,
                border: '1px solid #d6e4ff',
              }}
            >
              <strong>{t('info.note')}</strong> {t('info.dashboardDesc')}
            </div>
          </Card>
        </Col>
      </Row>
    </div>
  );
};

export default ExtensionPointsDashboard;
