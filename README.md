# ConditionalSwaps

[![Build Status](https://github.com/cossio/ConditionalSwaps.jl/actions/workflows/CI.yml/badge.svg?branch=main)](https://github.com/cossio/ConditionalSwaps.jl/actions/workflows/CI.yml?query=branch%3Amain)
[![Coverage](https://codecov.io/gh/cossio/ConditionalSwaps.jl/branch/main/graph/badge.svg)](https://codecov.io/gh/cossio/ConditionalSwaps.jl)

## Installation

Registered at https://github.com/cossio/CossioJuliaRegistry.

## Usage

Implements a function `swap(conditions, x, y)`, where `conditions` is a boolean array and `x, y` are two arrays of the same size Returns `a, b`, where `a[i], b[i] == y[i], x[i]` or `a[i], b[i] == x[i], y[i]`, depending to whether the corresponding `condition[i]` is true or false.