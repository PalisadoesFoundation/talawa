/**
 * DonationForm Component
 *
 * A comprehensive donation form that integrates with Razorpay payment gateway.
 * Allows users to make donations to organizations with real-time payment processing.
 *
 * @module DonationForm
 */

import React, { useState, useEffect } from 'react';
import { useTranslation } from 'react-i18next';
/**
 * TODO(2024-12-18): Apollo Client v4.x type definitions do not export useQuery/useMutation
 * hooks with correct generic signatures, causing TS2305 errors. This is a known issue:
 * @see https://github.com/apollographql/apollo-client/issues/11506
 */
// @ts-expect-error - Apollo Client v4 useQuery/useMutation hooks have incompatible type exports
import { useQuery, useMutation } from '@apollo/client';
import { useParams, useNavigate } from 'react-router-dom';
import { toast } from 'react-toastify';
import { Card, Form, Button, Row, Col, Alert } from 'react-bootstrap';
import Loader from '../../../../components/Loader/Loader';
import {
  GET_CURRENT_USER,
  GET_ORGANIZATION_INFO,
  GET_RAZORPAY_CONFIG_PUBLIC as GET_RAZORPAY_CONFIG,
  CREATE_PAYMENT_ORDER,
  VERIFY_PAYMENT,
} from '../graphql/queries';

interface RazorpaySuccessResponse {
  razorpay_payment_id: string;
  razorpay_order_id: string;
  razorpay_signature: string;
}

interface RazorpayOptions {
  key: string;
  amount: number;
  currency: string;
  name: string;
  description: string;
  order_id: string;
  prefill?: {
    name?: string;
    email?: string;
    contact?: string;
  };
  theme?: {
    color?: string;
  };
  handler: (response: RazorpaySuccessResponse) => void;
  modal?: {
    ondismiss?: () => void;
  };
}

interface VerifyPaymentResponse {
  razorpay_verifyPayment: {
    success: boolean;
    message?: string;
  };
}

declare global {
  interface Window {
    Razorpay: new (options: RazorpayOptions) => { open: () => void };
  }
}

/**
 * DonationForm component for processing donations via Razorpay
 *
 * @returns {React.ReactElement} The donation form UI
 */
const DonationForm: React.FC = () => {
  const { t } = useTranslation('razorpay');
  const { orgId } = useParams<{ orgId: string }>();
  const navigate = useNavigate();

  // Load Razorpay script on component mount
  useEffect(() => {
    const script = document.createElement('script');
    script.src = 'https://checkout.razorpay.com/v1/checkout.js';
    script.async = true;
    document.body.appendChild(script);

    return () => {
      // Cleanup script on unmount
      const existingScript = document.querySelector(
        'script[src="https://checkout.razorpay.com/v1/checkout.js"]',
      );
      if (existingScript) {
        existingScript.remove();
      }
    };
  }, []);

  const [formData, setFormData] = useState({
    amount: '',
    currency: 'INR',
    description: '',
    donorName: '',
    donorEmail: '',
    donorPhone: '',
  });

  const [isProcessing, setIsProcessing] = useState(false);
  const [currentStep, setCurrentStep] = useState<
    'form' | 'payment' | 'success'
  >('form');
  const [validated, setValidated] = useState(false);

  // GraphQL operations
  const {
    data: currentUserData,
    loading: userLoading,
    error: userError,
  } = useQuery(GET_CURRENT_USER);

  const {
    data: orgData,
    loading: orgLoading,
    error: orgError,
  } = useQuery(GET_ORGANIZATION_INFO, {
    variables: { orgId },
    skip: !orgId,
  });

  const {
    data: razorpayConfig,
    loading: configLoading,
    error: configError,
  } = useQuery(GET_RAZORPAY_CONFIG);

  const [createOrder] = useMutation(CREATE_PAYMENT_ORDER);
  const [verifyPayment] = useMutation(VERIFY_PAYMENT);

  useEffect(() => {
    // Load user data from GraphQL query
    if (currentUserData?.me) {
      const user = currentUserData.me;
      const nameParts = [user.firstName, user.lastName].filter(Boolean);
      const donorName = nameParts.join(' ').trim();

      setFormData((prev) => ({
        ...prev,
        ...(donorName && { donorName }),
        ...(user.email && { donorEmail: user.email }),
      }));
    }
  }, [currentUserData]);

  useEffect(() => {
    if (userError) {
      toast.error(t('donation.error.loadUserFailed'));
    }
  }, [userError, t]);

  /**
   * Handles form input changes and updates form state
   * @param field - The form field name to update
   * @param value - The new value for the field
   */
  const handleInputChange = (field: string, value: string | boolean): void => {
    setFormData((prev) => ({
      ...prev,
      [field]: value,
    }));
  };

  /**
   * Validates the donation form fields
   * @returns {boolean} True if form is valid, false otherwise
   */
  const validateForm = (): boolean => {
    if (!formData.amount || parseFloat(formData.amount) <= 0) {
      toast.error(t('donation.validation.amountRequired'));
      return false;
    }
    if (!formData.donorName.trim()) {
      toast.error(t('donation.validation.nameRequired'));
      return false;
    }
    if (!formData.donorEmail.trim()) {
      toast.error(t('donation.validation.emailRequired'));
      return false;
    }
    return true;
  };

  /**
   * Handles form submission and initiates Razorpay payment flow
   * @param e - Form submit event
   * @throws {Error} When payment order creation fails
   */
  const handleSubmit = async (e: React.FormEvent): Promise<void> => {
    e.preventDefault();
    setValidated(true);

    if (!validateForm()) return;

    // Check if Razorpay is configured
    if (
      !razorpayConfig?.razorpay_getRazorpayConfig?.keyId ||
      !razorpayConfig?.razorpay_getRazorpayConfig?.isEnabled
    ) {
      toast.error(t('donation.error.configNotEnabled'));
      return;
    }

    setIsProcessing(true);

    try {
      // Step 1: Create payment order
      const orderVariables = {
        input: {
          organizationId: orgId,
          userId: currentUserData?.me?.id || null,
          amount: parseFloat(formData.amount) * 100, // Convert to paise
          currency: formData.currency,
          description:
            formData.description ||
            `Donation to ${orgData?.organization?.name}`,
          donorName: formData.donorName,
          donorEmail: formData.donorEmail,
          donorPhone: formData.donorPhone,
        },
      };

      const { data: orderData } = await createOrder({
        variables: orderVariables,
      });

      if (!orderData?.razorpay_createPaymentOrder) {
        throw new Error('Failed to create payment order');
      }

      const order = orderData.razorpay_createPaymentOrder;

      // Validate order data
      if (!order.razorpayOrderId) {
        throw new Error('Invalid order: missing Razorpay order ID');
      }
      if (!order.amount || order.amount <= 0) {
        throw new Error('Invalid order: missing or invalid amount');
      }

      // Step 2: Open Razorpay payment modal - simplified as per official docs
      const options = {
        key: razorpayConfig.razorpay_getRazorpayConfig.keyId,
        amount: order.amount,
        currency: order.currency,
        name: orgData?.organization?.name || 'Organization',
        description:
          order.description || `Donation to ${orgData?.organization?.name}`,
        order_id: order.razorpayOrderId,
        prefill: {
          name: formData.donorName,
          email: formData.donorEmail,
          contact: formData.donorPhone,
        },
        theme: {
          color: '#3399cc',
        },
        handler: function (response: RazorpaySuccessResponse) {
          // Payment successful - verify payment
          verifyPayment({
            variables: {
              input: {
                razorpayPaymentId: response.razorpay_payment_id,
                razorpayOrderId: response.razorpay_order_id,
                razorpaySignature: response.razorpay_signature,
                paymentData: JSON.stringify({
                  razorpay_payment_id: response.razorpay_payment_id,
                  razorpay_order_id: response.razorpay_order_id,
                  razorpay_signature: response.razorpay_signature,
                }),
              },
            },
          })
            .then(
              ({ data: verificationData }: { data: VerifyPaymentResponse }) => {
                if (verificationData?.razorpay_verifyPayment?.success) {
                  setCurrentStep('success');
                  toast.success(t('donation.success.thankYou'));
                  setIsProcessing(false);
                } else {
                  toast.error(
                    verificationData?.razorpay_verifyPayment?.message ||
                      t('donation.error.verificationFailed'),
                  );
                  setIsProcessing(false);
                }
              },
            )
            .catch((error) => {
              console.error('Razorpay verification error:', error);
              toast.error(t('donation.error.verificationFailed'));
              setIsProcessing(false);
            });
        },
        modal: {
          ondismiss: function () {
            setIsProcessing(false);
          },
        },
      };

      // Simple Razorpay integration as per official docs
      const rzp = new window.Razorpay(options);
      rzp.open();
    } catch (error) {
      toast.error(
        error instanceof Error
          ? error.message
          : t('donation.error.paymentFailed'),
      );
      setIsProcessing(false);
    }
  };

  /**
   * Formats currency amount according to locale
   * @param amount - Numeric amount to format
   * @param currency - ISO currency code (e.g., 'INR', 'USD')
   * @returns Formatted currency string
   */
  const formatCurrency = (amount: number, currency: string): string => {
    // Map currency codes to their typical locales
    const currencyLocaleMap: { [key: string]: string } = {
      INR: 'en-IN',
      USD: 'en-US',
      EUR: 'de-DE',
      GBP: 'en-GB',
    };
    // Use browser locale, then currency-specific locale, then default to en-US
    const locale =
      currencyLocaleMap[currency] || navigator?.language || 'en-US';
    return new Intl.NumberFormat(locale, {
      style: 'currency',
      currency: currency || 'INR',
    }).format(amount);
  };

  /**
   * Gets the currency symbol for a given currency code
   * @param currency - ISO currency code
   * @returns Currency symbol or the code if symbol not found
   */
  const getCurrencySymbol = (currency: string): string => {
    const symbols: { [key: string]: string } = {
      INR: '₹',
      USD: '$',
      EUR: '€',
      GBP: '£',
    };
    return symbols[currency] || currency;
  };

  if (orgLoading || configLoading || userLoading) {
    return <Loader />;
  }

  if (orgError) {
    return (
      <Alert variant="danger" role="alert" aria-live="polite">
        {t('donation.error.loadOrgFailed')}: {orgError.message}
      </Alert>
    );
  }

  if (configError) {
    return (
      <Alert variant="danger" role="alert" aria-live="polite">
        {t('configuration.error.loadFailed')}: {configError.message}
      </Alert>
    );
  }

  // Check if Razorpay is configured
  if (
    !razorpayConfig?.razorpay_getRazorpayConfig?.keyId ||
    !razorpayConfig?.razorpay_getRazorpayConfig?.isEnabled
  ) {
    return (
      <Alert variant="warning">
        <h4>Payment System Not Available</h4>
        <p>
          Razorpay payment gateway is not configured or enabled. Please contact
          the administrator to set up payments.
        </p>
      </Alert>
    );
  }

  const organization = orgData?.organization;

  if (currentStep === 'success') {
    return (
      <div className="container mx-auto p-6">
        <Card className="max-w-md mx-auto">
          <Card.Body className="text-center py-8">
            <div className="text-success text-6xl mb-4">✓</div>
            <h2 className="text-2xl font-bold text-dark mb-2">Thank You!</h2>
            <p className="text-muted mb-6">
              Your donation has been processed successfully. You will receive a
              confirmation email shortly.
            </p>
            <div className="d-grid gap-2">
              <Button
                onClick={() => {
                  setCurrentStep('form');
                  setFormData({
                    amount: '',
                    currency: 'INR',
                    description: '',
                    donorName: formData.donorName, // Keep donor info for convenience
                    donorEmail: formData.donorEmail,
                    donorPhone: formData.donorPhone,
                  });
                }}
                className="w-100"
              >
                Make Another Donation
              </Button>
              <Button
                variant="outline"
                onClick={() => navigate('/user/razorpay/my-transactions')}
                className="w-100"
              >
                View My Transactions
              </Button>
            </div>
          </Card.Body>
        </Card>
      </div>
    );
  }

  return (
    <div className="container mx-auto p-6">
      <div className="max-w-2xl mx-auto">
        <div className="mb-6">
          <h1 className="text-3xl font-bold text-gray-900">Make a Donation</h1>
          <p className="text-gray-600 mt-2">
            Support {organization?.name} with your generous donation
          </p>
        </div>

        {/* Organization Info */}
        {organization && (
          <Card className="mb-6">
            <Card.Body className="p-6">
              <div className="d-flex align-items-center">
                {organization.avatarURL && (
                  <img
                    src={organization.avatarURL}
                    alt={organization.name}
                    className="w-16 h-16 rounded-circle me-3"
                    style={{ objectFit: 'cover' }}
                  />
                )}
                <div>
                  <h2 className="text-xl font-semibold">{organization.name}</h2>
                  {organization.description && (
                    <p className="text-muted">{organization.description}</p>
                  )}
                </div>
              </div>
            </Card.Body>
          </Card>
        )}

        {/* Donation Form */}
        <Card>
          <Card.Header>
            <Card.Title>Donation Details</Card.Title>
          </Card.Header>
          <Card.Body>
            <Form onSubmit={handleSubmit}>
              {/* Amount Section */}
              <div className="mb-4">
                <h3 className="text-lg font-semibold mb-3">Donation Amount</h3>

                <Row>
                  <Col md={6}>
                    <Form.Group className="mb-3">
                      <Form.Label htmlFor="donation-amount">
                        {t('donation.form.amountLabel')}
                      </Form.Label>
                      <div className="position-relative">
                        <span className="position-absolute top-50 start-0 translate-middle-y ms-2 text-muted">
                          {getCurrencySymbol(formData.currency)}
                        </span>
                        <Form.Control
                          id="donation-amount"
                          type="number"
                          value={formData.amount}
                          onChange={(e) =>
                            handleInputChange('amount', e.target.value)
                          }
                          placeholder={t('donation.form.amountPlaceholder')}
                          min="1"
                          step="0.01"
                          className="ps-4"
                          required
                          aria-required="true"
                          isInvalid={
                            validated &&
                            (!formData.amount ||
                              parseFloat(formData.amount) <= 0)
                          }
                          aria-invalid={
                            validated &&
                            (!formData.amount ||
                              parseFloat(formData.amount) <= 0)
                          }
                          aria-label={t('donation.form.amountLabel')}
                        />
                      </div>
                    </Form.Group>
                  </Col>

                  <Col md={6}>
                    <Form.Group className="mb-3">
                      <Form.Label>Currency</Form.Label>
                      <Form.Select
                        value={formData.currency}
                        onChange={(e) =>
                          handleInputChange('currency', e.target.value)
                        }
                      >
                        <option value="INR">INR (₹)</option>
                        <option value="USD">USD ($)</option>
                        <option value="EUR">EUR (€)</option>
                        <option value="GBP">GBP (£)</option>
                      </Form.Select>
                    </Form.Group>
                  </Col>
                </Row>

                {/* Quick Amount Buttons */}
                <Form.Group className="mb-3">
                  <Form.Label>Quick Amounts</Form.Label>
                  <div className="d-flex flex-wrap gap-2">
                    {[100, 500, 1000, 2000, 5000].map((amount) => (
                      <Button
                        key={amount}
                        type="button"
                        variant="outline-secondary"
                        size="sm"
                        onClick={() =>
                          handleInputChange('amount', amount.toString())
                        }
                      >
                        {formatCurrency(amount, formData.currency)}
                      </Button>
                    ))}
                  </div>
                </Form.Group>
              </div>

              {/* Donor Information */}
              <div className="mb-4">
                <h3 className="text-lg font-semibold mb-3">
                  {t('donation.form.donorInfoTitle')}
                </h3>

                <Row>
                  <Col md={6}>
                    <Form.Group className="mb-3">
                      <Form.Label htmlFor="donor-name">
                        {t('donation.form.fullNameRequired')}
                      </Form.Label>
                      <Form.Control
                        id="donor-name"
                        type="text"
                        value={formData.donorName}
                        onChange={(e) =>
                          handleInputChange('donorName', e.target.value)
                        }
                        placeholder={t('donation.form.fullNamePlaceholder')}
                        required
                        aria-required="true"
                        isInvalid={validated && !formData.donorName.trim()}
                        aria-invalid={validated && !formData.donorName.trim()}
                        aria-label={t('donation.form.fullNameLabel')}
                      />
                    </Form.Group>
                  </Col>

                  <Col md={6}>
                    <Form.Group className="mb-3">
                      <Form.Label htmlFor="donor-email">
                        {t('donation.form.emailRequired')}
                      </Form.Label>
                      <Form.Control
                        id="donor-email"
                        type="email"
                        value={formData.donorEmail}
                        onChange={(e) =>
                          handleInputChange('donorEmail', e.target.value)
                        }
                        placeholder={t('donation.form.emailPlaceholder')}
                        required
                        aria-required="true"
                        isInvalid={validated && !formData.donorEmail.trim()}
                        aria-invalid={validated && !formData.donorEmail.trim()}
                        aria-label={t('donation.form.emailLabel')}
                      />
                    </Form.Group>
                  </Col>
                </Row>

                <Form.Group className="mb-3" controlId="donorContact">
                  <Form.Label htmlFor="donorContact">
                    {t('donation.form.phoneLabel')}
                  </Form.Label>
                  <Form.Control
                    id="donorContact"
                    type="tel"
                    value={formData.donorPhone}
                    onChange={(e) =>
                      handleInputChange('donorPhone', e.target.value)
                    }
                    placeholder={t('donation.form.phonePlaceholder')}
                  />
                </Form.Group>

                <Form.Group className="mb-3" controlId="description">
                  <Form.Label htmlFor="description">
                    {t('donation.form.messageLabel')}
                  </Form.Label>
                  <Form.Control
                    id="description"
                    as="textarea"
                    rows={3}
                    value={formData.description}
                    onChange={(e) =>
                      handleInputChange('description', e.target.value)
                    }
                    placeholder={t('donation.form.messagePlaceholder')}
                  />
                </Form.Group>
              </div>

              {/* Payment Summary */}
              {formData.amount && parseFloat(formData.amount) > 0 && (
                <div className="bg-light p-4 rounded mb-4">
                  <h3 className="font-semibold mb-2">Payment Summary</h3>
                  <div className="d-flex justify-content-between mb-1">
                    <span>Donation Amount:</span>
                    <span className="fw-medium">
                      {formatCurrency(
                        parseFloat(formData.amount),
                        formData.currency,
                      )}
                    </span>
                  </div>
                  <div className="d-flex justify-content-between mb-1">
                    <span>Processing Fee:</span>
                    <span className="fw-medium">₹0.00</span>
                  </div>
                  <hr />
                  <div className="d-flex justify-content-between fw-semibold">
                    <span>Total Amount:</span>
                    <span className="text-success">
                      {formatCurrency(
                        parseFloat(formData.amount),
                        formData.currency,
                      )}
                    </span>
                  </div>
                </div>
              )}

              {/* Submit Button */}
              <Button
                type="submit"
                disabled={
                  isProcessing ||
                  !formData.amount ||
                  parseFloat(formData.amount) <= 0
                }
                className="w-100 btn-success"
                size="lg"
              >
                {isProcessing ? (
                  <div className="d-flex align-items-center justify-content-center">
                    <div
                      className="spinner-border spinner-border-sm me-2"
                      role="status"
                    >
                      <span className="visually-hidden">Loading...</span>
                    </div>
                    <span>Processing...</span>
                  </div>
                ) : (
                  `Donate ${formData.amount ? formatCurrency(parseFloat(formData.amount), formData.currency) : ''}`
                )}
              </Button>
            </Form>
          </Card.Body>
        </Card>

        {/* Security Notice */}
        <Card className="mt-6">
          <Card.Body className="p-4">
            <div className="d-flex align-items-start">
              <div className="text-primary fs-4 me-3">🔒</div>
              <div>
                <h4 className="fw-semibold">Secure Payment</h4>
                <p className="text-muted small">
                  Your payment information is encrypted and secure. We use
                  Razorpay, a trusted payment gateway, to process all
                  transactions safely.
                </p>
              </div>
            </div>
          </Card.Body>
        </Card>
      </div>
    </div>
  );
};

export default DonationForm;
