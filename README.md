# GeometricPortfolioDiversificationMeasure
This project implements a function to compute the Geometric Portfolio Diversification Measure (GPDM) for a portfolio weight vector. 
The GPDM quantifies diversification by combining portfolio weights with the concentration of risk.

This project implements a function to compute the Geometric Portfolio Diversification Measure (GPDM) — a quantitative measure of 
the diversification of a financial portfolio, based on a specified risk metric.

The function accepts the following inputs:

w: a weight vector w representing the allocation of the portfolio across n assets. It is assumed that w lies in the n-dimensional simplex 
(i.e., non-negative weights summing to 1).
rho: a vector containing the values of the risk metric associated with each asset (e.g., volatility, Value at Risk, Expected Shortfall, etc.). 
This metric is user-defined and flexible.

coeff: a multiplicative coefficient that depends on the rank of the underlying data matrix (e.g., a return matrix), and is computed externally 
for computational efficiency. 

The function returns a scalar value representing the geometric diversification level of the portfolio, taking into account both the weight distribution 
and the concentration of risk. 
