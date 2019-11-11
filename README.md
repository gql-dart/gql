[![MIT License][license-badge]][license-link]
[![PRs Welcome][prs-badge]][prs-link]
[![Star on GitHub][github-star-badge]][github-star-link]
[![Watch on GitHub][github-watch-badge]][github-watch-link]

# Normalize

## About

This project allows for the normalization and denormalization of GraphQL Documents. It is based loosely on the [graphql-norm](https://github.com/dividab/graphql-norm) package.

The `normalize` function creates a flat map of normalized documents and can be used to cache results of GraphQL queries. It traverses the [GraphQL AST](https://github.com/gql-dart/gql/blob/master/gql/README.md) and only includes the fields specified in the GraphQL Document in the normalized results.

## Features

| Feature                 | Progress |
| :---------------------- | :------: |
| Fragments               |    ✅    |
| Variables               |    ✅    |
| Interface & Union types |    ✅    |
