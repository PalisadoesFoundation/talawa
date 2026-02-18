import React, { useState, useEffect } from 'react';
// @ts-expect-error - Apollo Client v4 DocumentNode generic inference incompatibility with centralized query exports
import { useQuery, useMutation } from '@apollo/client';
import { toast } from 'react-toastify';
import { Card, Form, Button, Row, Col, Alert } from 'react-bootstrap';
import Loader from '../../../../components/Loader/Loader';
import {
  GET_RAZORPAY_CONFIG,
  UPDATE_RAZORPAY_CONFIG,
  TEST_RAZORPAY_SETUP,
} from '../graphql/queries';
import { useTranslation } from 'react-i18next';

interface RazorpayConfig {
  keyId?: string;
  keySecret?: string;
  webhookSecret?: string;
  isEnabled: boolean;
  testMode: boolean;
  currency: string;
  description: string;
}

/**
 * Razorpay Configuration Page
 *
 * Allows organization administrators to configure their Razorpay payment gateway credentials
 * and settings. Supports managing API keys, webhook secrets, and test/live mode toggles.
 * Also provides functionality to test the configuration with a dummy payment initiation.
 */
const RazorpayConfiguration: React.FC = () => {
  const { t } = useTranslation('razorpay');
  const [validated, setValidated] = useState(false);
  const [config, setConfig] = useState<RazorpayConfig>({
    keyId: undefined,
    keySecret: undefined,
    webhookSecret: undefined,
    isEnabled: false,
    testMode: true,
    currency: 'INR',
    description: 'Donation to organization',
  });

  const [isLoading, setIsLoading] = useState(false);
  const [showSecrets, setShowSecrets] = useState(false);

  // GraphQL operations
  const { data, loading, error, refetch } = useQuery(GET_RAZORPAY_CONFIG);
  const [updateConfig] = useMutation(UPDATE_RAZORPAY_CONFIG);
  const [testSetup] = useMutation(TEST_RAZORPAY_SETUP);

  useEffect(() => {
    if (data?.razorpay_getRazorpayConfig) {
      const configData = data.razorpay_getRazorpayConfig;
      setConfig(configData);
    }
  }, [data]);

  const handleInputChange = (
    field: keyof RazorpayConfig,
    value: string | boolean,
  ) => {
    setConfig((prev) => ({
      ...prev,
      [field]: value,
    }));
  };

  /**
   * Handles saving the updated Razorpay configuration to the database
   * @param e - Form submission event
   */
  const handleSaveConfig = async (e: React.FormEvent<HTMLFormElement>) => {
    e.preventDefault();
    const form = e.currentTarget;
    if (form.checkValidity() === false) {
      e.stopPropagation();
      setValidated(true);
      return;
    }
    setValidated(true);
    setIsLoading(true);
    try {
      await updateConfig({
        variables: {
          input: {
            keyId: config.keyId || null,
            keySecret: config.keySecret || null,
            webhookSecret: config.webhookSecret || null,
            isEnabled: config.isEnabled,
            testMode: config.testMode,
            currency: config.currency,
            description: config.description,
          },
        },
      });
      toast.success('Razorpay configuration saved successfully!');
      refetch();
    } catch (error) {
      const errorMessage =
        error instanceof Error ? error.message : 'Unknown error';
      toast.error(`Failed to save Razorpay configuration: ${errorMessage}`);
    } finally {
      setIsLoading(false);
    }
  };

  /**
   * Tests the current configuration by initiating a dummy payment setup
   * Validates API keys before attempting the test
   */
  const handleTestSetup = async () => {
    if (!config.keyId || !config.keySecret || !config.webhookSecret) {
      toast.error(
        'Please enter Key ID, Key Secret, and Webhook Secret before testing setup',
      );
      return;
    }

    // Validate key format
    if (!config.keyId.startsWith('rzp_')) {
      toast.error(
        'Invalid Key ID format. Razorpay Key ID should start with "rzp_"',
      );
      return;
    }

    setIsLoading(true);
    try {
      toast.info('Testing Razorpay setup with dummy payment...');
      const { data: result } = await testSetup();

      if (result?.razorpay_testRazorpaySetup?.success) {
        toast.success(t('configuration.success.testSetup'));
      } else {
        const errorMessage =
          result?.razorpay_testRazorpaySetup?.message ||
          t('configuration.error.testSetupFailed');
        toast.error(errorMessage);

        // Error message already shown via toast above
      }
    } catch (error) {
      const errorMessage =
        error instanceof Error ? error.message : 'Unknown error';
      toast.error(
        `${t('configuration.error.testSetupGeneric')} ${errorMessage}`,
      );
    } finally {
      setIsLoading(false);
    }
  };

  const isConfigComplete = () => {
    return !!(config.keyId && config.keySecret && config.webhookSecret);
  };

  if (loading) {
    return <Loader />;
  }

  if (error) {
    return (
      <Alert variant="danger">
        Failed to load Razorpay configuration: {error.message}
      </Alert>
    );
  }

  return (
    <div className="container mx-auto p-6">
      <div className="mb-6">
        <div className="d-flex align-items-center justify-content-between">
          <div>
            <h1 className="text-3xl font-bold text-gray-900">
              Razorpay Configuration
            </h1>
            <p className="text-gray-600 mt-2">
              Configure your Razorpay payment gateway settings
            </p>
          </div>
          <div className="d-flex align-items-center gap-2">
            <span
              className={`badge ${config.isEnabled ? 'bg-success' : 'bg-secondary'}`}
            >
              {config.isEnabled ? 'Enabled' : 'Disabled'}
            </span>
            <span
              className={`badge ${config.testMode ? 'bg-warning' : 'bg-info'}`}
            >
              {config.testMode ? 'Test Mode' : 'Live Mode'}
            </span>
          </div>
        </div>
      </div>

      {/* Razorpay Configuration Form */}
      <Card>
        <Card.Header>
          <Card.Title className="d-flex align-items-center">
            <span className="me-2">⚙️</span>
            {t('configuration.title')}
          </Card.Title>
        </Card.Header>
        <Card.Body>
          <Form noValidate validated={validated} onSubmit={handleSaveConfig}>
            <Row>
              {/* API Keys Section */}
              <Col md={6}>
                <h5 className="mb-3">
                  {t('configuration.sections.credentials')}
                </h5>

                <Form.Group className="mb-3" controlId="keyId">
                  <Form.Label>
                    {t('configuration.form.keyIdLabel')} *
                  </Form.Label>
                  <Form.Control
                    type="text"
                    placeholder={t('configuration.form.keyIdPlaceholder')}
                    value={config.keyId || ''}
                    onChange={(e) => handleInputChange('keyId', e.target.value)}
                    required
                    isInvalid={validated && !config.keyId}
                    aria-invalid={validated && !config.keyId}
                  />
                  <Form.Text className="text-muted">
                    {t('configuration.form.keyIdHelp')}
                  </Form.Text>
                  <Form.Control.Feedback type="invalid">
                    {t('configuration.error.invalidKeyId')}
                  </Form.Control.Feedback>
                </Form.Group>

                <Form.Group className="mb-3" controlId="keySecret">
                  <Form.Label>
                    {t('configuration.form.keySecretLabel')} *
                  </Form.Label>
                  <div className="input-group">
                    <Form.Control
                      type={showSecrets ? 'text' : 'password'}
                      placeholder={t('configuration.form.keySecretPlaceholder')}
                      value={config.keySecret || ''}
                      onChange={(e) =>
                        handleInputChange('keySecret', e.target.value)
                      }
                      required
                      isInvalid={validated && !config.keySecret}
                      aria-invalid={validated && !config.keySecret}
                    />
                    <Button
                      variant="outline-secondary"
                      onClick={() => setShowSecrets(!showSecrets)}
                      aria-label={
                        showSecrets
                          ? t('configuration.actions.hideSecret')
                          : t('configuration.actions.showSecret')
                      }
                    >
                      {showSecrets ? '👁️' : '👁️‍🗨️'}
                    </Button>
                  </div>
                  <Form.Text className="text-muted">
                    {t('configuration.form.keySecretHelp')}
                  </Form.Text>
                </Form.Group>

                <Form.Group className="mb-3" controlId="webhookSecret">
                  <Form.Label>
                    {t('configuration.form.webhookSecretLabel')} *
                  </Form.Label>
                  <div className="input-group">
                    <Form.Control
                      type={showSecrets ? 'text' : 'password'}
                      placeholder={t(
                        'configuration.form.webhookSecretPlaceholder',
                      )}
                      value={config.webhookSecret || ''}
                      onChange={(e) =>
                        handleInputChange('webhookSecret', e.target.value)
                      }
                      required
                      isInvalid={validated && !config.webhookSecret}
                      aria-invalid={validated && !config.webhookSecret}
                    />
                    <Button
                      variant="outline-secondary"
                      onClick={() => setShowSecrets(!showSecrets)}
                      aria-label={
                        showSecrets
                          ? t('configuration.actions.hideSecret')
                          : t('configuration.actions.showSecret')
                      }
                    >
                      {showSecrets ? '👁️' : '👁️‍🗨️'}
                    </Button>
                  </div>
                  <Form.Text className="text-muted">
                    {t('configuration.form.webhookSecretHelp')}
                  </Form.Text>
                </Form.Group>
              </Col>

              {/* Settings Section */}
              <Col md={6}>
                <h5 className="mb-3">{t('configuration.sections.settings')}</h5>

                <Form.Group className="mb-3" controlId="currency">
                  <Form.Label>
                    {t('configuration.form.currencyLabel')}
                  </Form.Label>
                  <Form.Select
                    value={config.currency}
                    onChange={(e) =>
                      handleInputChange('currency', e.target.value)
                    }
                  >
                    <option value="INR">INR (Indian Rupee)</option>
                    <option value="USD">USD (US Dollar)</option>
                    <option value="EUR">EUR (Euro)</option>
                  </Form.Select>
                </Form.Group>

                <Form.Group className="mb-3" controlId="description">
                  <Form.Label>
                    {t('configuration.form.descriptionLabel')}
                  </Form.Label>
                  <Form.Control
                    type="text"
                    placeholder={t('configuration.form.descriptionPlaceholder')}
                    value={config.description}
                    onChange={(e) =>
                      handleInputChange('description', e.target.value)
                    }
                  />
                </Form.Group>

                <Form.Group className="mb-3">
                  <Form.Check
                    type="switch"
                    id="testMode"
                    label={t('configuration.form.testModeLabel')}
                    checked={config.testMode}
                    onChange={(e) =>
                      handleInputChange('testMode', e.target.checked)
                    }
                  />
                  <Form.Text className="text-muted">
                    {t('configuration.form.testModeHelp')}
                  </Form.Text>
                </Form.Group>

                <Form.Group className="mb-3">
                  <Form.Check
                    type="switch"
                    id="isEnabled"
                    label={t('configuration.form.enabledLabel')}
                    checked={config.isEnabled}
                    onChange={(e) =>
                      handleInputChange('isEnabled', e.target.checked)
                    }
                  />
                  <Form.Text className="text-muted">
                    {t('configuration.form.enabledHelp')}
                  </Form.Text>
                </Form.Group>
              </Col>
            </Row>

            {/* Action Buttons */}
            <div className="d-flex justify-content-between mt-4">
              <Button
                type="button"
                variant="outline-secondary"
                onClick={handleTestSetup}
                disabled={isLoading || !isConfigComplete()}
              >
                {isLoading
                  ? t('configuration.actions.testing')
                  : t('configuration.actions.test')}
              </Button>

              <Button type="submit" variant="primary" disabled={isLoading}>
                {isLoading
                  ? t('configuration.form.saving')
                  : t('configuration.form.saveButton')}
              </Button>
            </div>

            {!isConfigComplete() && (
              <Alert variant="info" className="mt-3">
                <strong>{t('configuration.help.completeFields')}</strong>
              </Alert>
            )}
          </Form>
        </Card.Body>
      </Card>

      {/* Help Section */}
      <Card className="mt-4">
        <Card.Header>
          <Card.Title>{t('configuration.help.title')}</Card.Title>
        </Card.Header>
        <Card.Body>
          <Row>
            <Col md={6}>
              <h6>{t('configuration.help.gettingStarted')}</h6>
              <ul className="list-unstyled">
                <li>{t('configuration.help.step1')}</li>
                <li>
                  {t('configuration.help.step2')}{' '}
                  <code>/api/plugins/razorpay/webhook/</code>
                </li>
                <li>{t('configuration.help.step3')}</li>
                <li>{t('configuration.help.step4')}</li>
              </ul>
            </Col>
            <Col md={6}>
              <h6>{t('configuration.help.usefulLinks')}</h6>
              <p>
                <a
                  href="https://razorpay.com/docs"
                  target="_blank"
                  rel="noopener noreferrer"
                >
                  {t('configuration.help.docsLink')}
                </a>{' '}
                •
                <a
                  href="https://dashboard.razorpay.com"
                  target="_blank"
                  rel="noopener noreferrer"
                >
                  {t('configuration.help.dashboardLink')}
                </a>
              </p>
            </Col>
          </Row>
        </Card.Body>
      </Card>
    </div>
  );
};

export default RazorpayConfiguration;
