# Overview for `PolynomialFit`

## Description

An nth degree polynomial fit to a dataset.

## Members

- **coefficients**: `List&lt;double&gt;`
  The polynomial coefficients of the fit.

 For each `i`, the element `coefficients[i]` is the coefficient of
 the `i`-th power of the variable.

- **confidence**: `double`
  An indicator of the quality of the fit.

 Larger values indicate greater quality.  The value ranges from 0.0 to 1.0.

 The confidence is defined as the fraction of the dataset's variance
 that is captured by variance in the fit polynomial.  In statistics
 textbooks this is often called "r-squared".

## Constructors

### Unnamed Constructor
Creates a polynomial fit of the given degree.

 There are n + 1 coefficients in a fit of degree n.

