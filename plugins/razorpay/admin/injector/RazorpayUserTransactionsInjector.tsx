/**
 * Razorpay User Transactions Injector (G1)
 *
 * This component is specifically designed for the G1 extension point to display
 * Razorpay payment provider transactions for users in their transaction history.
 */

import React from 'react';
import { useQuery } from '@apollo/client';
import { gql } from 'graphql-tag';
import {
  Card,
  Table,
  Tag,
  Button,
  Space,
  Typography,
  message,
  Spin,
} from 'antd';
import {
  CreditCardOutlined,
  EyeOutlined,
  DownloadOutlined,
} from '@ant-design/icons';
import type { ColumnsType } from 'antd/es/table';
import { useParams } from 'react-router-dom';
import useLocalStorage from 'utils/useLocalstorage';
import { useTranslation } from 'react-i18next';

const { Title, Text } = Typography;

// GraphQL query for fetching user transactions
const GET_USER_TRANSACTIONS = gql`
  query GetUserTransactions($userId: String!, $orgId: String!, $limit: Int) {
    razorpay_getUserTransactions(
      userId: $userId
      orgId: $orgId
      limit: $limit
    ) {
      id
      paymentId
      amount
      currency
      status
      donorName
      donorEmail
      method
      bank
      wallet
      vpa
      email
      contact
      fee
      tax
      errorCode
      errorDescription
      refundStatus
      capturedAt
      createdAt
      updatedAt
    }
  }
`;

interface RazorpayUserTransaction {
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

const RazorpayUserTransactionsInjector: React.FC = () => {
  const { t, i18n } = useTranslation('razorpay');
  const { orgId } = useParams<{ orgId?: string }>();
  const { getItem } = useLocalStorage();
  const userId = getItem('id') as string | null;

  // GraphQL query
  const {
    data: transactionsData,
    loading: transactionsLoading,
    error: transactionsError,
  } = useQuery(GET_USER_TRANSACTIONS, {
    variables: {
      userId: userId || '',
      orgId: orgId || '',
      limit: 10, // Show recent 10 transactions in injector
    },
    skip: !userId || !orgId,
    fetchPolicy: 'network-only',
  });

  const transactions = transactionsData?.razorpay_getUserTransactions || [];

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
    return new Intl.NumberFormat(i18n.language, {
      style: 'currency',
      currency: currency,
    }).format(amount / 100);
  };

  const formatDate = (dateString: string) => {
    return new Date(dateString).toLocaleDateString(i18n.language, {
      year: 'numeric',
      month: 'short',
      day: 'numeric',
      hour: '2-digit',
      minute: '2-digit',
    });
  };

  const handleViewDetails = (transaction: RazorpayUserTransaction) => {
    message.info(
      t('transactions.messages.viewingDetails', { id: transaction.id }),
    );
    // In a real implementation, this would open a modal or navigate to details
  };

  const handleDownloadReceipt = (transaction: RazorpayUserTransaction) => {
    message.success(
      t('transactions.messages.downloadingReceipt', { id: transaction.id }),
    );
    // In a real implementation, this would download the receipt
  };

  const columns: ColumnsType<RazorpayUserTransaction> = [
    {
      title: t('transactions.table.id'),
      dataIndex: 'paymentId',
      key: 'paymentId',
      render: (paymentId: string) => (
        <Text code style={{ fontSize: '12px' }}>
          {paymentId || t('common.notAvailable')}
        </Text>
      ),
    },
    {
      title: t('transactions.table.amount'),
      dataIndex: 'amount',
      key: 'amount',
      render: (amount: number, record: RazorpayUserTransaction) => (
        <Text strong>
          {amount
            ? formatAmount(amount, record.currency)
            : t('common.notAvailable')}
        </Text>
      ),
    },
    {
      title: t('transactions.table.status'),
      dataIndex: 'status',
      key: 'status',
      render: (status: string) => (
        <Tag color={getStatusColor(status)}>
          {/* i18n-ignore-next-line */}
          {t(`transactions.status.${status}`, {
            defaultValue: status.toUpperCase(),
          })}
        </Tag>
      ),
    },
    {
      title: t('transactions.table.method'),
      dataIndex: 'method',
      key: 'method',
      render: (method: string) => method || t('common.notAvailable'),
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
      render: (_, record: RazorpayUserTransaction) => (
        <Space size="small">
          <Button
            type="link"
            icon={<EyeOutlined />}
            onClick={() => handleViewDetails(record)}
            size="small"
            aria-label={t('transactions.userTransactions.viewDetailsAriaLabel')}
          >
            {t('transactions.viewButton')}
          </Button>
          <Button
            type="link"
            icon={<DownloadOutlined />}
            onClick={() => handleDownloadReceipt(record)}
            size="small"
            aria-label={t(
              'transactions.userTransactions.downloadReceiptAriaLabel',
            )}
          >
            {t('transactions.userTransactions.receiptButton')}
          </Button>
        </Space>
      ),
    },
  ];

  if (transactionsLoading) {
    return (
      <Card>
        <div style={{ textAlign: 'center', padding: '40px' }}>
          <Spin
            size="large"
            aria-label={t('transactions.userTransactions.loading')}
          />
          <div style={{ marginTop: '16px' }}>
            <Text>{t('transactions.userTransactions.loading')}</Text>
          </div>
        </div>
      </Card>
    );
  }

  if (transactionsError) {
    return (
      <Card>
        <div style={{ textAlign: 'center', padding: '40px' }}>
          <Text type="danger" role="alert" aria-live="polite">
            {/* Note: errorPrefix includes trailing colon for concatenating error details */}
            {t('transactions.userTransactions.errorPrefix')}{' '}
            {transactionsError.message}
          </Text>
        </div>
      </Card>
    );
  }

  return (
    <Card>
      <div style={{ marginBottom: '16px' }}>
        <Space align="center">
          <CreditCardOutlined
            style={{ fontSize: '20px', color: '#1890ff' }}
            aria-hidden="true"
          />
          <Title level={4} style={{ margin: 0 }}>
            {t('transactions.userTransactions.title')}
          </Title>
        </Space>
        <Text type="secondary" style={{ display: 'block', marginTop: '8px' }}>
          {t('transactions.userTransactions.subtitle')}
        </Text>
      </div>

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
        scroll={{ x: 800 }}
      />
    </Card>
  );
};

export default RazorpayUserTransactionsInjector;
