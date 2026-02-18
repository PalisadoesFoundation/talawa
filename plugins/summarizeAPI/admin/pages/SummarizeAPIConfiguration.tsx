import React, { useState, useEffect } from 'react';
import { useMutation, useQuery, gql } from '@apollo/client';
import { toast } from 'react-toastify';
import { Card, Form, Button, Row, Col, Alert } from 'react-bootstrap';
import Loader from '../../../../components/Loader/Loader';

// GraphQL operations
const GET_SUMMARIZE_API_CONFIG = gql`
  query GetSummarizeAPIConfig {
    summarize_api_getConfig {
      apiEndpoint
      apiKey
      isEnabled
      maxLength
      timeoutSeconds
    }
  }
`;

const UPDATE_SUMMARIZE_API_CONFIG = gql`
  mutation UpdateSummarizeAPIConfig($input: SummarizeAPIConfigInput!) {
    summarize_api_updateConfig(input: $input) {
      apiEndpoint
      apiKey
      isEnabled
      maxLength
      timeoutSeconds
    }
  }
`;

const TEST_SUMMARIZE_API_SETUP = gql`
  mutation TestSummarizeAPISetup {
    summarize_api_testSetup {
      success
      message
    }
  }
`;

interface SummarizeAPIConfig {
  apiEndpoint?: string;
  apiKey?: string;
  isEnabled: boolean;
  maxLength: number;
  timeoutSeconds: number;
}

const SummarizeAPIConfiguration: React.FC = () => {
  const [config, setConfig] = useState<SummarizeAPIConfig>({
    apiEndpoint: undefined,
    apiKey: undefined,
    isEnabled: false,
    maxLength: 150,
    timeoutSeconds: 30,
  });

  const [isLoading, setIsLoading] = useState(false);
  const [showApiKey, setShowApiKey] = useState(false);

  // GraphQL operations
  const { data, loading, error, refetch } = useQuery(GET_SUMMARIZE_API_CONFIG);
  const [updateConfig] = useMutation(UPDATE_SUMMARIZE_API_CONFIG);
  const [testSetup] = useMutation(TEST_SUMMARIZE_API_SETUP);

  useEffect(() => {
    if (data?.summarize_api_getConfig) {
      const configData = data.summarize_api_getConfig;
      setConfig(configData);
    }
  }, [data]);

  const handleInputChange = (
    field: keyof SummarizeAPIConfig,
    value: string | boolean | number,
  ) => {
    setConfig((prev) => ({
      ...prev,
      [field]: value,
    }));
  };

  const handleSaveConfig = async (e: React.FormEvent) => {
    e.preventDefault();
    setIsLoading(true);
    try {
      await updateConfig({
        variables: {
          input: {
            apiEndpoint: config.apiEndpoint || null,
            apiKey: config.apiKey || null,
            isEnabled: config.isEnabled,
            maxLength: config.maxLength,
            timeoutSeconds: config.timeoutSeconds,
          },
        },
      });
      toast.success('SummarizeAPI configuration saved successfully!');
      refetch();
    } catch (error) {
      console.error('Error saving SummarizeAPI configuration:', error);
      toast.error('Failed to save SummarizeAPI configuration');
    } finally {
      setIsLoading(false);
    }
  };

  const handleTestSetup = async () => {
    if (!config.apiEndpoint || !config.apiKey) {
      toast.error('Please enter API Endpoint and API Key before testing setup');
      return;
    }

    // Validate URL format
    try {
      new URL(config.apiEndpoint);
    } catch {
      toast.error('Invalid API Endpoint URL format');
      return;
    }

    setIsLoading(true);
    try {
      toast.info('Testing SummarizeAPI setup with sample text...');
      const { data: result } = await testSetup();

      if (result?.summarize_api_testSetup?.success) {
        toast.success(
          'Setup test successful! API configuration is working correctly.',
        );
      } else {
        const errorMessage =
          result?.summarize_api_testSetup?.message || 'Setup test failed';
        toast.error(errorMessage);

        // Log the error for debugging
        console.error('SummarizeAPI setup test failed:', {
          error: errorMessage,
          config: {
            apiEndpoint: config.apiEndpoint,
            hasApiKey: !!config.apiKey,
            maxLength: config.maxLength,
            timeoutSeconds: config.timeoutSeconds,
          },
        });
      }
    } catch (error) {
      console.error('Error testing SummarizeAPI setup:', error);
      toast.error(
        'Setup test failed. Please check your configuration and try again.',
      );
    } finally {
      setIsLoading(false);
    }
  };

  const isConfigComplete = () => {
    return !!(config.apiEndpoint && config.apiKey);
  };

  if (loading) {
    return <Loader />;
  }

  if (error) {
    return (
      <Alert variant="danger">
        Failed to load SummarizeAPI configuration: {error.message}
      </Alert>
    );
  }

  return (
    <div className="container mx-auto p-6">
      <div className="mb-6">
        <div className="d-flex align-items-center justify-content-between">
          <div>
            <h1 className="text-3xl font-bold text-gray-900">
              SummarizeAPI Configuration
            </h1>
            <p className="text-gray-600 mt-2">
              Configure your external AI summarization API settings
            </p>
          </div>
          <div className="d-flex align-items-center gap-2">
            <span
              className={`badge ${config.isEnabled ? 'bg-success' : 'bg-secondary'}`}
            >
              {config.isEnabled ? 'Enabled' : 'Disabled'}
            </span>
          </div>
        </div>
      </div>

      {/* SummarizeAPI Configuration Form */}
      <Card>
        <Card.Header>
          <Card.Title className="d-flex align-items-center">
            <span className="me-2">⚙️</span>
            API Configuration
          </Card.Title>
        </Card.Header>
        <Card.Body>
          <Form onSubmit={handleSaveConfig}>
            <Row>
              {/* API Credentials Section */}
              <Col md={6}>
                <h5 className="mb-3">🔑 API Credentials</h5>

                <Form.Group className="mb-3">
                  <Form.Label>API Endpoint URL *</Form.Label>
                  <Form.Control
                    type="url"
                    placeholder="https://api.example.com/summarize"
                    value={config.apiEndpoint || ''}
                    onChange={(e) =>
                      handleInputChange('apiEndpoint', e.target.value)
                    }
                    required
                  />
                  <Form.Text className="text-muted">
                    The full URL of your summarization API endpoint
                  </Form.Text>
                </Form.Group>

                <Form.Group className="mb-3">
                  <Form.Label>API Key *</Form.Label>
                  <div className="input-group">
                    <Form.Control
                      type={showApiKey ? 'text' : 'password'}
                      placeholder="Enter your API key"
                      value={config.apiKey || ''}
                      onChange={(e) =>
                        handleInputChange('apiKey', e.target.value)
                      }
                      required
                    />
                    <Button
                      variant="outline-secondary"
                      onClick={() => setShowApiKey(!showApiKey)}
                    >
                      {showApiKey ? '👁️' : '👁️‍🗨️'}
                    </Button>
                  </div>
                  <Form.Text className="text-muted">
                    Your API authentication key (keep this secure)
                  </Form.Text>
                </Form.Group>
              </Col>

              {/* Settings Section */}
              <Col md={6}>
                <h5 className="mb-3">⚙️ Settings</h5>

                <Form.Group className="mb-3">
                  <Form.Label>Maximum Summary Length</Form.Label>
                  <Form.Control
                    type="number"
                    min="50"
                    max="500"
                    placeholder="150"
                    value={config.maxLength}
                    onChange={(e) =>
                      handleInputChange('maxLength', parseInt(e.target.value))
                    }
                  />
                  <Form.Text className="text-muted">
                    Maximum length of generated summaries (50-500 characters)
                  </Form.Text>
                </Form.Group>

                <Form.Group className="mb-3">
                  <Form.Label>Request Timeout (seconds)</Form.Label>
                  <Form.Control
                    type="number"
                    min="5"
                    max="120"
                    placeholder="30"
                    value={config.timeoutSeconds}
                    onChange={(e) =>
                      handleInputChange(
                        'timeoutSeconds',
                        parseInt(e.target.value),
                      )
                    }
                  />
                  <Form.Text className="text-muted">
                    Maximum time to wait for API response (5-120 seconds)
                  </Form.Text>
                </Form.Group>

                <Form.Group className="mb-3">
                  <Form.Check
                    type="switch"
                    id="isEnabled"
                    label="Enable SummarizeAPI"
                    checked={config.isEnabled}
                    onChange={(e) =>
                      handleInputChange('isEnabled', e.target.checked)
                    }
                  />
                  <Form.Text className="text-muted">
                    Enable AI summarization using external API
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
                {isLoading ? 'Testing...' : 'Test API Connection'}
              </Button>

              <Button type="submit" variant="primary" disabled={isLoading}>
                {isLoading ? 'Saving...' : 'Save Configuration'}
              </Button>
            </div>

            {!isConfigComplete() && (
              <Alert variant="info" className="mt-3">
                <strong>Complete the required fields</strong> to enable testing
                and save your configuration.
              </Alert>
            )}
          </Form>
        </Card.Body>
      </Card>

      {/* Help Section */}
      <Card className="mt-4">
        <Card.Header>
          <Card.Title>📚 Hugging Face Integration Guide</Card.Title>
        </Card.Header>
        <Card.Body>
          <Row>
            <Col md={6}>
              <h6>Request Format (Hugging Face)</h6>
              <pre className="bg-light p-3 rounded">
                {`{
  "inputs": "Your text to summarize...",
  "parameters": {
    "max_length": 150,
    "min_length": 30
  }
}`}
              </pre>
            </Col>
            <Col md={6}>
              <h6>Response Format (Hugging Face)</h6>
              <pre className="bg-light p-3 rounded">
                {`[
  {
    "summary_text": "The summarized text..."
  }
]`}
              </pre>
            </Col>
          </Row>
          <Row className="mt-3">
            <Col md={12}>
              <h6>Example Configuration</h6>
              <ul className="list-unstyled">
                <li>
                  • <strong>API Endpoint:</strong>{' '}
                  <code>
                    https://api-inference.huggingface.co/models/facebook/bart-large-cnn
                  </code>
                </li>
                <li>
                  • <strong>API Key:</strong> Your Hugging Face token (starts
                  with <code>hf_</code>)
                </li>
                <li>
                  • <strong>Max Length:</strong> 150 characters
                </li>
                <li>
                  • <strong>Timeout:</strong> 30 seconds
                </li>
              </ul>
            </Col>
          </Row>
          <Row className="mt-3">
            <Col md={12}>
              <h6>Recommended Summarization Models</h6>
              <ul>
                <li>
                  <code>facebook/bart-large-cnn</code> - Best for news & general
                  text
                </li>
                <li>
                  <code>google/pegasus-xsum</code> - Very short summaries
                </li>
                <li>
                  <code>sshleifer/distilbart-cnn-12-6</code> - Faster processing
                </li>
                <li>
                  <code>t5-base</code> - General purpose
                </li>
                <li>
                  <code>t5-small</code> - Quick summaries
                </li>
              </ul>
              <p className="text-danger mt-2">
                ⚠️ <strong>Important:</strong> Use only summarization models,
                not sentiment analysis or classification models!
              </p>
            </Col>
          </Row>
          <Row className="mt-3">
            <Col md={12}>
              <h6>Get Your Hugging Face API Token</h6>
              <p>
                1. Visit{' '}
                <a
                  href="https://huggingface.co/settings/tokens"
                  target="_blank"
                  rel="noopener noreferrer"
                >
                  Hugging Face Tokens
                </a>
                <br />
                2. Create a new token (Read permission is enough)
                <br />
                3. Copy and paste it in the API Key field above
              </p>
            </Col>
          </Row>
        </Card.Body>
      </Card>
    </div>
  );
};

export default SummarizeAPIConfiguration;
