# Overview for `FlexColumnWidth`

## Description

Sizes the column by taking a part of the remaining space once all
 the other columns have been laid out.

 For example, if two columns have a [FlexColumnWidth], then half the
 space will go to one and half the space will go to the other.

 This is a cheap way to size a column.

## Dependencies

- TableColumnWidth

## Members

- **value**: `double`
  The fraction of the remaining space once all the other columns have
 been laid out that this column should occupy.

## Constructors

### Unnamed Constructor
Creates a column width based on a fraction of the remaining space once all
 the other columns have been laid out.

