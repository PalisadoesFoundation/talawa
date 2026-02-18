/**
 * User Transactions Page for Razorpay Plugin
 *
 * This component provides a global view of all user transactions across all organizations
 * processed through Razorpay. It allows users to see their complete transaction history
 * in one place, regardless of which organization the transactions were made to.
 */

import React, { useState } from 'react';

/**
 * TODO(2024-12-18): Apollo Client v4.x type definitions do not export useQuery/useMutation
 * hooks with correct generic signatures, causing TS2305 errors. This is a known issue:
 * @see https://github.com/apollographql/apollo-client/issues/11506
 */
// @ts-expect-error - Apollo Client v4 types issue
import { useQuery } from '@apollo/client';
import { useTranslation } from 'react-i18next';
import {
  Card,
  Table,
  Tag,
  Button,
  Space,
  Typography,
  message,
  Spin,
  Input,
  Select,
  DatePicker,
  Row,
  Col,
} from 'antd';
import { Navigate } from 'react-router-dom';
import {
  CreditCardOutlined,
  EyeOutlined,
  DownloadOutlined,
  SearchOutlined,
} from '@ant-design/icons';
import type { ColumnsType } from 'antd/es/table';
import dayjs from 'dayjs';
import isSameOrAfter from 'dayjs/plugin/isSameOrAfter';
import isSameOrBefore from 'dayjs/plugin/isSameOrBefore';

dayjs.extend(isSameOrAfter);
dayjs.extend(isSameOrBefore);
import useLocalStorage from 'utils/useLocalstorage';

const { Title, Text } = Typography;
const { Search } = Input;
const { RangePicker } = DatePicker;

// GraphQL operations
import {
  GET_USER_TRANSACTIONS,
  GET_USER_TRANSACTION_STATS,
} from '../graphql/queries';

interface RazorpayTransaction {
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

const UserTransactions: React.FC = () => {
  const { t } = useTranslation('razorpay');
  const [searchText, setSearchText] = useState('');
  const [statusFilter, setStatusFilter] = useState<string>('all');
  const [dateRange, setDateRange] = useState<[dayjs.Dayjs, dayjs.Dayjs] | null>(
    null,
  );

  // Get user data (no orgId needed for global user transactions)
  const { getItem } = useLocalStorage();
  const userId = getItem('id') as string | null;

  // GraphQL queries - must be called unconditionally (React hooks rule)
  const {
    data: transactionsData,
    loading: transactionsLoading,
    error: transactionsError,
  } = useQuery(GET_USER_TRANSACTIONS, {
    variables: {
      userId: userId || '',
      limit: 100, // Get more transactions for user view
    },
    skip: !userId,
    fetchPolicy: 'network-only',
  });

  const { loading: statsLoading, error: statsError } = useQuery(
    GET_USER_TRANSACTION_STATS,
    {
      variables: {
        userId: userId || '',
      },
      skip: !userId,
      fetchPolicy: 'network-only',
    },
  );

  // Redirect if no userId is available (after hooks are called)
  if (!userId) {
    return <Navigate to="/" replace />;
  }

  const transactions = transactionsData?.razorpay_getUserTransactions || [];

  // Apply filters to transactions
  const filteredTransactions = transactions.filter(
    (transaction: RazorpayTransaction) => {
      // Search filter
      if (searchText) {
        const searchLower = searchText.toLowerCase();
        const matchesSearch =
          transaction.paymentId?.toLowerCase().includes(searchLower) ||
          transaction.donorName?.toLowerCase().includes(searchLower) ||
          transaction.donorEmail?.toLowerCase().includes(searchLower) ||
          transaction.id.toLowerCase().includes(searchLower);

        if (!matchesSearch) return false;
      }

      // Status filter
      if (statusFilter !== 'all') {
        if (transaction.status !== statusFilter) return false;
      }

      // Date range filter
      if (dateRange && dateRange[0] && dateRange[1]) {
        const transactionDate = dayjs(transaction.createdAt);
        if (
          !transactionDate.isSameOrAfter(dateRange[0], 'day') ||
          !transactionDate.isSameOrBefore(dateRange[1], 'day')
        ) {
          return false;
        }
      }

      return true;
    },
  );

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

  const getMethodColor = (method: string) => {
    switch (method?.toLowerCase()) {
      case 'card':
        return 'blue';
      case 'upi':
        return 'green';
      case 'netbanking':
        return 'purple';
      case 'wallet':
        return 'orange';
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

  const handleViewDetails = (transaction: RazorpayTransaction) => {
    message.info(`Viewing details for transaction: ${transaction.id}`);
  };

  const handleDownloadReceipt = (transaction: RazorpayTransaction) => {
    message.success(`Downloading receipt for transaction: ${transaction.id}`);
  };

  const columns: ColumnsType<RazorpayTransaction> = [
    {
      title: 'Transaction ID',
      dataIndex: 'paymentId',
      key: 'paymentId',
      render: (paymentId: string) => (
        <Text code style={{ fontSize: '12px' }}>
          {paymentId || 'N/A'}
        </Text>
      ),
    },
    {
      title: 'Amount',
      dataIndex: 'amount',
      key: 'amount',
      render: (amount: number, record: RazorpayTransaction) => (
        <Text strong>
          {amount ? formatAmount(amount, record.currency) : 'N/A'}
        </Text>
      ),
    },
    {
      title: 'Status',
      dataIndex: 'status',
      key: 'status',
      render: (status: string) => (
        <Tag color={getStatusColor(status)}>{status.toUpperCase()}</Tag>
      ),
    },
    {
      title: 'Donor',
      dataIndex: 'donorName',
      key: 'donorName',
      render: (name: string, record: RazorpayTransaction) => (
        <div>
          <div style={{ fontWeight: 500 }}>{name || 'Anonymous'}</div>
          <div style={{ fontSize: '12px', color: '#666' }}>
            {record.donorEmail}
          </div>
        </div>
      ),
    },
    {
      title: 'Payment Method',
      dataIndex: 'method',
      key: 'method',
      render: (method: string) => (
        <Tag color={getMethodColor(method)}>{method || 'N/A'}</Tag>
      ),
    },
    {
      title: 'Date',
      dataIndex: 'createdAt',
      key: 'createdAt',
      render: (date: string) => formatDate(date),
      sorter: (a, b) =>
        new Date(a.createdAt).getTime() - new Date(b.createdAt).getTime(),
    },
    {
      title: 'Actions',
      key: 'actions',
      render: (_, record: RazorpayTransaction) => (
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
            <Text>{t('common.loading')}</Text>
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
            {t('transactions.error.loadFailed')}:{' '}
            {transactionsError?.message || statsError?.message}
          </Text>
        </div>
      </Card>
    );
  }

  return (
    <div>
      <Card style={{ marginBottom: '16px' }}>
        <div style={{ marginBottom: '16px' }}>
          <Space align="center">
            <CreditCardOutlined
              style={{ fontSize: '24px', color: '#1890ff' }}
            />
            <Title level={3} style={{ margin: 0 }}>
              {t('transactions.title')}
            </Title>
          </Space>
          <Text type="secondary" style={{ display: 'block', marginTop: '4px' }}>
            {t('transactions.subtitle')}
          </Text>
        </div>

        {/* Filters */}
        <Row gutter={[16, 16]}>
          <Col xs={24} sm={12} md={8} lg={8}>
            <Search
              placeholder={t('transactions.search')}
              aria-label={t('transactions.search')}
              value={searchText}
              onChange={(e) => setSearchText(e.target.value)}
              onSearch={setSearchText}
              prefix={<SearchOutlined />}
              allowClear
            />
          </Col>
          <Col xs={24} sm={12} md={8} lg={8}>
            <Select
              placeholder={t('transactions.filters.statusPlaceholder')}
              aria-label={t('transactions.filters.statusLabel')}
              value={statusFilter}
              onChange={setStatusFilter}
              style={{ width: '100%' }}
              allowClear
            >
              <Select.Option value="all">
                {t('transactions.filters.allStatuses')}
              </Select.Option>
              <Select.Option value="captured">
                {t('transactions.status.captured')}
              </Select.Option>
              <Select.Option value="authorized">
                {t('transactions.status.authorized')}
              </Select.Option>
              <Select.Option value="failed">
                {t('transactions.status.failed')}
              </Select.Option>
              <Select.Option value="refunded">
                {t('transactions.status.refunded')}
              </Select.Option>
            </Select>
          </Col>
          <Col xs={24} sm={12} md={8} lg={8}>
            <RangePicker
              value={dateRange}
              onChange={(dates) =>
                setDateRange(dates as [dayjs.Dayjs, dayjs.Dayjs] | null)
              }
              style={{ width: '100%' }}
              placeholder={[
                t('transactions.filters.startDate'),
                t('transactions.filters.endDate'),
              ]}
              aria-label={t('transactions.filters.dateRangeLabel')}
            />
          </Col>
        </Row>
      </Card>

      <Card>
        <Table
          columns={columns}
          dataSource={filteredTransactions}
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
    </div>
  );
};

export default UserTransactions;
