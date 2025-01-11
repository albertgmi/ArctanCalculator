# Program for Calculating Arctan(x) with Approximation in Assembly and C Interface

This program calculates the arctangent of a given value x (arctan(x)) and approximates its value using assembly language. The user can specify the desired number of decimal places for the result. The program is written with a C interface, making it user-friendly and easy to interact with.

## Features:
- **C Interface**: Handles user input and displays results.
- **Assembly Calculation**: Implements the core logic of calculating the arctangent and approximating the result.
- **User Input**: Allows the user to input the value of x and the desired number of decimal places for the result.

### Main Features:
- Calculate arctan(x) for any real number x.
- Round the result to a user-defined number of decimal places (between 0 and 6).
- User-friendly interface with input validation.

## Requirements:
- C compiler (e.g., bcc32)
- Assembly language support (for instance NASM)

## Arctan(x) Calculation and Taylor Series Expansion

The arctangent function, **arctan(x)**, is computed using the Taylor series expansion. For |x| < 1, the function can be approximated using the following series:

\[
\arctan(x) = x - \frac{x^3}{3} + \frac{x^5}{5} - \frac{x^7}{7} + \dots
\]

This series converges for values of x such that |x| < 1. In this case, the terms are alternately added and subtracted. The accuracy of the result improves as more terms are added.

For values of **|x| >= 1**, the arctangent is calculated using a different formula that makes the value of x lie within the convergence range of the Taylor series (i.e., transforming the input such that **|x| < 1**). The formula used for this is:

\[
\arctan(x) = \frac{\pi}{2} - \arctan\left(\frac{1}{x}\right) \quad \text{for} \quad x > 1
\]

and

\[
\arctan(x) = -\frac{\pi}{2} + \arctan\left(\frac{1}{x}\right) \quad \text{for} \quad x < -1
\]

This ensures that the function works correctly for all input values.

The assembly code handles the calculation and approximation of the arctangent, using the Taylor series for values of **|x| < 1** and applying the transformation for **|x| >= 1**.

