import React from 'react';
import { vi } from 'vitest';

export type VitestUtils = typeof vi;

interface CommonProps extends Omit<
  React.HTMLAttributes<HTMLDivElement>,
  'title'
> {
  children?: React.ReactNode;
  title?: React.ReactNode;
}

interface ColumnType {
  title: React.ReactNode;
  dataIndex: string;
  key?: React.Key;
  render?: (value: unknown, record: Record<string, unknown>) => React.ReactNode;
}

interface PaginationType {
  showTotal?: (total: number, range: [number, number]) => React.ReactNode;
}

interface TableProps extends CommonProps {
  dataSource?: Record<string, unknown>[];
  columns?: ColumnType[];
  pagination?: PaginationType;
}

export const createAntdMocks = (viInstance: VitestUtils) => {
  const MockComponent = ({ children, title, ...props }: CommonProps) => (
    <div {...(props as React.HTMLAttributes<HTMLDivElement>)}>
      {' '}
      {children} {title}{' '}
    </div>
  );

  const TypographyBase = ({ children, ...props }: CommonProps) => (
    <div {...(props as React.HTMLAttributes<HTMLDivElement>)}> {children} </div>
  );

  const Title = ({ children, ...props }: CommonProps) => (
    <h2 {...(props as React.HTMLAttributes<HTMLHeadingElement>)}>
      {' '}
      {children}{' '}
    </h2>
  );

  const Text = ({ children, ...props }: CommonProps) => (
    <span {...(props as React.HTMLAttributes<HTMLSpanElement>)}>
      {' '}
      {children}{' '}
    </span>
  );

  const Paragraph = ({ children, ...props }: CommonProps) => (
    <p {...(props as React.HTMLAttributes<HTMLParagraphElement>)}>
      {' '}
      {children}{' '}
    </p>
  );

  const MockTypography = Object.assign(TypographyBase, {
    Title,
    Text,
    Paragraph,
  });

  return {
    Button: ({
      children,
      ...props
    }: React.ButtonHTMLAttributes<HTMLButtonElement>) => (
      <button {...props}> {children} </button>
    ),
    Table: ({ dataSource, columns, pagination, ...props }: TableProps) => (
      <div {...(props as React.HTMLAttributes<HTMLDivElement>)}>
        <table>
          <thead>
            <tr>
              {columns?.map((col, j) => (
                <th key={j}>{col.title}</th>
              ))}
            </tr>
          </thead>
          <tbody>
            {dataSource?.map((row, i) => (
              <tr key={i}>
                {columns?.map((col, j) => (
                  <td key={j}>
                    {col.render
                      ? col.render(row[col.dataIndex], row)
                      : (row[col.dataIndex] as React.ReactNode)}
                  </td>
                ))}
              </tr>
            ))}
          </tbody>
        </table>
        {pagination?.showTotal && (
          <div data-testid="pagination-total">
            {pagination.showTotal(dataSource?.length || 0, [
              1,
              dataSource?.length || 0,
            ])}
          </div>
        )}
      </div>
    ),
    Tag: ({ children, ...props }: CommonProps) => (
      <span {...(props as React.HTMLAttributes<HTMLSpanElement>)}>
        {' '}
        {children}{' '}
      </span>
    ),
    Card: ({ title, children, ...props }: CommonProps) => (
      <div {...(props as React.HTMLAttributes<HTMLDivElement>)}>
        {title && <div className="ant-card-head-title">{title}</div>}
        {children}
      </div>
    ),
    Space: MockComponent,
    Row: MockComponent,
    Col: MockComponent,
    Typography: MockTypography,
    Tooltip: ({ children, title }: CommonProps) => (
      <div title={typeof title === 'string' ? title : undefined}>
        {' '}
        {children}{' '}
      </div>
    ),
    Spin: () => <div data-testid="loading-spinner"> Loading...</div>,
    message: {
      success: viInstance.fn(),
      error: viInstance.fn(),
    },
  };
};
