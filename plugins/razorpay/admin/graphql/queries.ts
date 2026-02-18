/**
 * Shared GraphQL queries and mutations for Razorpay admin components
 *
 * This file consolidates all GraphQL operations to avoid duplication
 * across components and test files.
 */
import { gql } from '@apollo/client';

// ============================================================================
// User Queries
// ============================================================================

/**
 * Get current user information
 */
export const GET_CURRENT_USER = gql`
  query GetCurrentUser {
    me {
      id
      firstName
      lastName
      email
    }
  }
`;

// ============================================================================
// Organization Queries
// ============================================================================

/**
 * Get organization information
 */
export const GET_ORGANIZATION_INFO = gql`
  query GetOrganizationInfo($orgId: String!) {
    organization(input: { id: $orgId }) {
      id
      name
      description
      avatarURL
    }
  }
`;

// ============================================================================
// Razorpay Configuration Queries & Mutations
// ============================================================================

/**
 * Get Razorpay configuration (full - admin only)
 */
export const GET_RAZORPAY_CONFIG = gql`
  query GetRazorpayConfig {
    razorpay_getRazorpayConfig {
      keyId
      keySecret
      webhookSecret
      isEnabled
      testMode
      currency
      description
    }
  }
`;

/**
 * Get Razorpay configuration (public - no secrets, for donation form)
 */
export const GET_RAZORPAY_CONFIG_PUBLIC = gql`
  query GetRazorpayConfigPublic {
    razorpay_getRazorpayConfig {
      keyId
      isEnabled
      testMode
      currency
      description
    }
  }
`;

/**
 * Update Razorpay configuration
 */
export const UPDATE_RAZORPAY_CONFIG = gql`
  mutation UpdateRazorpayConfig($input: RazorpayConfigInput!) {
    razorpay_updateRazorpayConfig(input: $input) {
      keyId
      keySecret
      webhookSecret
      isEnabled
      testMode
      currency
      description
    }
  }
`;

/**
 * Test Razorpay setup with dummy payment
 */
export const TEST_RAZORPAY_SETUP = gql`
  mutation TestRazorpaySetup {
    razorpay_testRazorpaySetup {
      success
      message
    }
  }
`;

// ============================================================================
// Payment Order Queries & Mutations
// ============================================================================

/**
 * Create a payment order
 */
export const CREATE_PAYMENT_ORDER = gql`
  mutation CreatePaymentOrder($input: RazorpayOrderInput!) {
    razorpay_createPaymentOrder(input: $input) {
      id
      razorpayOrderId
      organizationId
      userId
      amount
      currency
      status
      donorName
      donorEmail
      donorPhone
      description
      createdAt
      updatedAt
    }
  }
`;

/**
 * Verify a completed payment
 */
export const VERIFY_PAYMENT = gql`
  mutation VerifyPayment($input: RazorpayVerificationInput!) {
    razorpay_verifyPayment(input: $input) {
      success
      message
      transaction {
        paymentId
        status
        amount
        currency
      }
    }
  }
`;

// ============================================================================
// Transaction Queries
// ============================================================================

/**
 * Get user transactions
 */
export const GET_USER_TRANSACTIONS = gql`
  query GetUserTransactions(
    $userId: String!
    $limit: Int
    $offset: Int
    $status: String
    $dateFrom: String
    $dateTo: String
  ) {
    razorpay_getUserTransactions(
      userId: $userId
      limit: $limit
      offset: $offset
      status: $status
      dateFrom: $dateFrom
      dateTo: $dateTo
    ) {
      id
      paymentId
      orderId
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

/**
 * Get user transaction statistics
 */
export const GET_USER_TRANSACTION_STATS = gql`
  query GetUserTransactionStats($userId: String!) {
    razorpay_getUserTransactionStats(userId: $userId) {
      totalTransactions
      totalAmount
      successfulTransactions
      failedTransactions
      averageTransactionAmount
    }
  }
`;

/**
 * Get organization transactions
 */
export const GET_ORG_TRANSACTIONS = gql`
  query GetOrganizationTransactions(
    $orgId: String!
    $limit: Int
    $offset: Int
    $dateFrom: String
    $dateTo: String
  ) {
    razorpay_getOrganizationTransactions(
      organizationId: $orgId
      limit: $limit
      offset: $offset
      dateFrom: $dateFrom
      dateTo: $dateTo
    ) {
      id
      paymentId
      orderId
      userId
      amount
      currency
      status
      method
      email
      contact
      createdAt
      capturedAt
    }
  }
`;

/**
 * Get organization transaction statistics
 */
export const GET_ORG_TRANSACTION_STATS = gql`
  query GetOrganizationTransactionStats($orgId: String!) {
    razorpay_getOrganizationTransactionStats(organizationId: $orgId) {
      totalTransactions
      totalAmount
      successfulTransactions
      failedTransactions
      averageTransactionAmount
    }
  }
`;
