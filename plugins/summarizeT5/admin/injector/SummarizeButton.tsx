import React, { useState } from 'react';
import { Button, CircularProgress, Alert, Box } from '@mui/material';
import { SmartToy } from '@mui/icons-material';
import { gql } from 'graphql-tag';
import { useMutation } from '@apollo/client';

interface SummarizeButtonProps {
  caption?: string;
  postId?: string;
  text?: string;
  creator?: any;
  upVoteCount?: number;
  downVoteCount?: number;
  comments?: any[];
  commentCount?: number;
  postedAt?: string;
  pinnedAt?: string | null;
  image?: string | null;
  video?: string | null;
  hasUserVoted?: any;
  createdAt?: string;
  creatorId?: string;
  attachments?: any[];
  isPinned?: boolean;
}

const SummarizeButton: React.FC<SummarizeButtonProps> = (props) => {
  const [loading, setLoading] = useState(false);
  const [summary, setSummary] = useState<string | null>(null);
  const [error, setError] = useState<string | null>(null);

  // GraphQL mutation (namespaced with pluginId)
  const SUMMARIZE_MUTATION = gql`
    mutation Summarize($input: SummarizeInput!) {
      summarize_t5_summarizeText(input: $input) {
        summary
        originalLength
        summaryLength
        postId
      }
    }
  `;

  const [runSummarize] = useMutation(SUMMARIZE_MUTATION);

  // Get the text content to summarize
  const getTextToSummarize = () => {
    return props.caption || props.text || '';
  };

  const handleSummarize = async () => {
    const textToSummarize = getTextToSummarize();
    if (!textToSummarize.trim()) {
      setError('No text content to summarize');
      return;
    }
    setLoading(true);
    setError(null);
    setSummary(null);
    try {
      const { data } = await runSummarize({
        variables: { input: { text: textToSummarize, postId: props.postId } },
        fetchPolicy: 'no-cache',
      });
      const result = data?.summarize_t5_summarizeText;
      if (!result?.summary) throw new Error('Empty summary');
      setSummary(result.summary);
    } catch (err) {
      console.error('Summarization failed:', err);
      setError(
        err instanceof Error ? err.message : 'Failed to generate summary',
      );
    } finally {
      setLoading(false);
    }
  };

  const textToSummarize = getTextToSummarize();

  // Don't show button if there's no text to summarize
  if (!textToSummarize.trim()) {
    return null;
  }

  return (
    <Box sx={{ mt: 1, mb: 1 }}>
      {!summary && !loading && (
        <Button
          variant="outlined"
          size="small"
          startIcon={<SmartToy />}
          onClick={handleSummarize}
          sx={{
            textTransform: 'none',
            fontSize: '0.75rem',
            borderColor: '#1976d2',
            color: '#1976d2',
            '&:hover': {
              backgroundColor: '#e3f2fd',
              borderColor: '#1976d2',
            },
          }}
        >
          Summarize
        </Button>
      )}

      {loading && (
        <Box sx={{ display: 'flex', alignItems: 'center', gap: 1 }}>
          <CircularProgress size={16} />
          <span style={{ fontSize: '0.75rem', color: '#666' }}>
            Generating summary...
          </span>
        </Box>
      )}

      {error && (
        <Alert severity="error" sx={{ mt: 1, fontSize: '0.75rem' }}>
          {error}
        </Alert>
      )}

      {summary && (
        <Box
          sx={{
            mt: 1,
            p: 1,
            backgroundColor: '#f5f5f5',
            borderRadius: 1,
            border: '1px solid #e0e0e0',
          }}
        >
          <Box
            sx={{
              fontSize: '0.75rem',
              fontWeight: 'bold',
              color: '#1976d2',
              mb: 0.5,
            }}
          >
            Summary:
          </Box>
          <Box sx={{ fontSize: '0.8rem', lineHeight: 1.4 }}>{summary}</Box>
        </Box>
      )}
    </Box>
  );
};

export default SummarizeButton;
