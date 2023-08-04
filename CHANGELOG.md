# Changelog

All notable changes to this project will be documented in this file. The format is based on [Keep a Changelog](https://keepachangelog.com/en/1.0.0/), and this project adheres to [Semantic Versioning](https://semver.org/spec/v2.0.0.html).

## Unreleased

## 2.1.0 - 2023-08-04

### Added

- `swap!` now broadcasts `conditions`. [b038129](https://github.com/cossio/ConditionalSwaps.jl/commit/b038129443ee08d2659b182e7146aba43e99fddc)

## 2.0.0 - 2023-08-04

### Changed

- Changed `swap!` argument order.

### Added

## 1.1.1 - 2023-08-04

### Fixed

- Restrict `swap!` to consistent sizes, since it would fail otherwise.

## 1.1.0 - 2023-08-04

### Added

- In-place version, `swap!`.

## 1.0.0

### Added

- `swap` function.
- Register at https://github.com/cossio/CossioJuliaRegistry.
