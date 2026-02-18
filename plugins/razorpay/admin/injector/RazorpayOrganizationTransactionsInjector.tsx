/**
 * Razorpay Organization Transactions Injector (G2)
 *
 * This component is specifically designed for the G2 extension point to display
 * Razorpay payment provider transactions for organization admins in their transaction management.
 */

import React from 'react';
import { useTranslation } from 'react-i18next';
/**
 * TODO(2024-12-18): Apollo Client v4.x type definitions do not export useQuery/useMutation
 * hooks with correct generic signatures, causing TS2305 errors. This is a known issue:
 * @see https://github.com/apollographql/apollo-client/issues/11506
 */
// @ts-expect-error - Apollo Client v4 types issue
import { useQuery } from '@apollo/client';
import {
  GET_ORG_TRANSACTIONS,
  GET_ORG_TRANSACTION_STATS,
} from '../graphql/queries';
import {
  Card,
  Table,
  Tag,
  Button,
  Space,
  Typography,
  message,
  Spin,
  Statistic,
  Row,
  Col,
} from 'antd';
import {
  CreditCardOutlined,
  EyeOutlined,
  DownloadOutlined,
  DollarOutlined,
  UserOutlined,
} from '@ant-design/icons';
import type { ColumnsType } from 'antd/es/table';
import { useParams } from 'react-router-dom';

const { Title, Text } = Typography;

// GraphQL queries for fetching organization transactions and stats

interface RazorpayOrganizationTransaction {
  id: string;
  paymentId?: string;
  amount?: number;
  currency: string;
  status: string;
  donorName?: string;
  donorEmail?: string;
  method?: string;
  bank?: string;
  wallet?: string;
  vpa?: string;
  email?: string;
  contact?: string;
  fee?: number;
  tax?: number;
  errorCode?: string;
  errorDescription?: string;
  refundStatus?: string;
  capturedAt?: string;
  createdAt: string;
  updatedAt: string;
}

const RazorpayOrganizationTransactionsInjector: React.FC = () => {
  const { t } = useTranslation('razorpay');
  const { orgId } = useParams();

  // GraphQL queries
  const {
    data: transactionsData,
    loading: transactionsLoading,
    error: transactionsError,
  } = useQuery(GET_ORG_TRANSACTIONS, {
    variables: {
      orgId: orgId || '',
      limit: 10, // Show recent 10 transactions in injector
    },
    skip: !orgId,
    fetchPolicy: 'network-only',
  });

  const {
    data: statsData,
    loading: statsLoading,
    error: statsError,
  } = useQuery(GET_ORG_TRANSACTION_STATS, {
    variables: {
      orgId: orgId || '',
    },
    skip: !orgId,
    fetchPolicy: 'network-only',
  });

  const transactions =
    transactionsData?.razorpay_getOrganizationTransactions || [];
  const stats = statsData?.razorpay_getOrganizationTransactionStats;

  const getStatusColor = (status: string) => {
    switch (status) {
      case 'captured':
        return 'success';
      case 'authorized':
        return 'processing';
      case 'failed':
        return 'error';
      case 'refunded':
        return 'warning';
      default:
        return 'default';
    }
  };

  const formatAmount = (amount: number, currency: string) => {
    return `${currency} ${(amount / 100).toFixed(2)}`;
  };

  const formatDate = (dateString: string) => {
    return new Date(dateString).toLocaleDateString('en-IN', {
      year: 'numeric',
      month: 'short',
      day: 'numeric',
      hour: '2-digit',
      minute: '2-digit',
    });
  };

  const handleViewDetails = (transaction: RazorpayOrganizationTransaction) => {
    message.info(`Viewing details for transaction: ${transaction.id}`);
    // In a real implementation, this would open a modal or navigate to details
  };

  const handleDownloadReceipt = (
    transaction: RazorpayOrganizationTransaction,
  ) => {
    message.success(`Downloading receipt for transaction: ${transaction.id}`);
    // In a real implementation, this would download the receipt
  };

  const columns: ColumnsType<RazorpayOrganizationTransaction> = [
    {
      title: t('transactions.table.id'),
      dataIndex: 'paymentId',
      key: 'paymentId',
      render: (paymentId: string) => (
        <Text code style={{ fontSize: '12px' }}>
          {paymentId || 'N/A'}
        </Text>
      ),
    },
    {
      title: t('transactions.table.amount'),
      dataIndex: 'amount',
      key: 'amount',
      render: (amount: number, record: RazorpayOrganizationTransaction) => (
        <Text strong>
          {amount ? formatAmount(amount, record.currency) : 'N/A'}
        </Text>
      ),
    },
    {
      title: t('transactions.table.status'),
      dataIndex: 'status',
      key: 'status',
      render: (status: string) => (
        <Tag color={getStatusColor(status)}>{status.toUpperCase()}</Tag>
      ),
    },
    {
      title: t('transactions.table.donor'),
      key: 'donor',
      render: (_, record: RazorpayOrganizationTransaction) => (
        <div>
          <div style={{ fontWeight: 500 }}>
            {record.donorName || 'Anonymous'}
          </div>
          <Text type="secondary" style={{ fontSize: '12px' }}>
            {record.donorEmail || 'N/A'}
          </Text>
        </div>
      ),
    },
    {
      title: t('transactions.table.method'),
      dataIndex: 'method',
      key: 'method',
      render: (method: string) => method || 'N/A',
    },
    {
      title: t('transactions.table.fees'),
      dataIndex: 'fee',
      key: 'fee',
      render: (fee: number, record: RazorpayOrganizationTransaction) => (
        <Text type="secondary">
          {fee ? formatAmount(fee, record.currency) : 'N/A'}
        </Text>
      ),
    },
    {
      title: t('transactions.table.date'),
      dataIndex: 'createdAt',
      key: 'createdAt',
      render: (date: string) => formatDate(date),
    },
    {
      title: t('transactions.table.actions'),
      key: 'actions',
      render: (_, record: RazorpayOrganizationTransaction) => (
        <Space size="small">
          <Button
            type="link"
            icon={<EyeOutlined />}
            onClick={() => handleViewDetails(record)}
            size="small"
          >
            View
          </Button>
          <Button
            type="link"
            icon={<DownloadOutlined />}
            onClick={() => handleDownloadReceipt(record)}
            size="small"
          >
            Receipt
          </Button>
        </Space>
      ),
    },
  ];

  if (transactionsLoading || statsLoading) {
    return (
      <Card>
        <div style={{ textAlign: 'center', padding: '40px' }}>
          <Spin size="large" />
          <div style={{ marginTop: '16px' }}>
            <Text>{t('transactions.loadingOrg')}</Text>
          </div>
        </div>
      </Card>
    );
  }

  if (transactionsError || statsError) {
    return (
      <Card>
        <div style={{ textAlign: 'center', padding: '40px' }}>
          <Text type="danger">
            {t('transactions.error.loadOrgFailed')}:{' '}
            {transactionsError?.message || statsError?.message}
          </Text>
        </div>
      </Card>
    );
  }

  return (
    <Card>
      <div style={{ marginBottom: '16px' }}>
        <Space align="center">
          <CreditCardOutlined style={{ fontSize: '20px', color: '#1890ff' }} />
          <Title level={4} style={{ margin: 0 }}>
            {t('transactions.orgTitle')}
          </Title>
        </Space>
        <Text type="secondary" style={{ display: 'block', marginTop: '4px' }}>
          {t('transactions.orgSubtitle')}
        </Text>
      </div>

      {/* Statistics Row */}
      {stats && (
        <Row gutter={16} style={{ marginBottom: '24px' }}>
          <Col span={6}>
            <Card size="small">
              <Statistic
                title={t('transactions.stats.totalAmount')}
                value={stats.totalAmount ? stats.totalAmount / 100 : 0}
                precision={2}
                prefix={<DollarOutlined />}
                suffix={stats.currency || 'INR'}
                valueStyle={{ color: '#3f8600' }}
              />
            </Card>
          </Col>
          <Col span={6}>
            <Card size="small">
              <Statistic
                title={t('transactions.stats.totalTransactions')}
                value={stats.totalTransactions || 0}
                prefix={<UserOutlined />}
                valueStyle={{ color: '#1890ff' }}
              />
            </Card>
          </Col>
          <Col span={6}>
            <Card size="small">
              <Statistic
                title={t('transactions.stats.successRate')}
                value={
                  stats.totalTransactions
                    ? ((stats.successCount || 0) / stats.totalTransactions) *
                      100
                    : 0
                }
                precision={1}
                suffix="%"
                valueStyle={{ color: '#3f8600' }}
              />
            </Card>
          </Col>
          <Col span={6}>
            <Card size="small">
              <Statistic
                title={t('transactions.stats.failedTransactions')}
                value={stats.failedCount || 0}
                valueStyle={{ color: '#cf1322' }}
              />
            </Card>
          </Col>
        </Row>
      )}

      <Table
        columns={columns}
        dataSource={transactions}
        rowKey="id"
        pagination={{
          pageSize: 10,
          showSizeChanger: true,
          showQuickJumper: true,
          showTotal: (total, range) =>
            t('transactions.table.pagination', {
              start: range[0],
              end: range[1],
              total,
            }),
        }}
        scroll={{ x: 1000 }}
      />
    </Card>
  );
};

export default RazorpayOrganizationTransactionsInjector;
