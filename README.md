# Exercism Ballerina Track

[![Configlet Status](https://github.com/exercism/ballerina/workflows/Configlet%20CI/badge.svg)]
[![Exercise Test Status](https://github.com/exercism/ballerina/workflows/Ballerina%20%2F%20main/badge.svg)]

Exercism exercises in Ballerina. [Ballerina](https://ballerina.io/) is a compiled, transactional, statically and strongly typed programming language with textual and graphical syntaxes. Ballerina incorporates fundamental concepts of distributed system integration into the language and offers a type-safe, concurrent environment to implement microservices with distributed transactions, reliable messaging, stream processing, and workflows.

## Setup

You can install Ballerina by following the Ballerina [installation guide](https://ballerina.io/learn/getting-started/).

## Contributing

Thank you so much for contributing! :tada:

Please read about how to [get involved in a track](https://github.com/exercism/docs/tree/master/contributing-to-language-tracks). Be sure to read the Exercism [Code of Conduct](https://exercism.io/code-of-conduct).

We welcome pull requests of all kinds. No contribution is too small.

We encourage contributions that provide fixes and improvements to existing exercises. Please note that this track's exercises must conform to the Exercism-wide standards described in the [documentation](https://github.com/exercism/docs/tree/master/language-tracks/exercises). If you're unsure about how to make a change, then go ahead and open a GitHub issue, and we'll discuss it.

## Exercise Tests

At the most basic level, Exercism is all about the tests. You can read more about how we think about test suites in [the Exercism documentation](https://github.com/exercism/docs/blob/master/language-tracks/exercises/anatomy/test-suites.md).

Test files should use the following format:

```ballerina
import ballerina/test;

@test:Config
function testHello() {
    test:assertEquals(hello(), "Hello, World!");
}
```

## Opening an Issue

If you plan to make significant or breaking changes, please open an issue so we can discuss it first. If this is a discussion that is relevant to more than just the Ballerina track, please open an issue in [exercism/discussions](https://github.com/exercism/discussions/issues).

## Submitting a Pull Request

Pull requests should be focused on a single exercise, issue, or conceptually cohesive change. Please refer to Exercism's [pull request guidelines](https://github.com/exercism/docs/blob/master/contributing/pull-request-guidelines.md).

Please follow the coding standards for Ballerina. (If there is a formatter for the track's language, add instructions for using it here.)

### Verifying Your Change

Before submitting your pull request, you'll want to verify the changes in two ways:

- Run all the tests for the Ballerina exercises against the example implementation:

```shell
bin/verify-exercises
```

Note: you can also verify a single exercise by passing the exercise's slug:

```shell
bin/verify-exercises anagram
```

- Run an Exercism-specific linter to verify the track:

```shell
bin/fetch-configlet
bin/configlet lint
```

For the Exercism-specific linting, please see [the documentation](https://github.com/exercism/docs/blob/master/language-tracks/configuration/linting.md).

## Contributing a New Exercise

To add a new exercise, you can run:

```shell
bin/add-exercise <slug>
```

This will generate all the files for the exercise.
Once the script has finished, you then need to:

- Create the test suite in `exercises/practice/<slug>/tests/<snake_name>_test.bal`,
  based on the canonical data at `https://github.com/exercism/problem-specifications/blob/main/exercises/<slug>/canonical-data.json`
- Create the example solution in `exercises/practice/<slug>/.meta/reference/<snake_name>.bal`
- Create the stub solution in `exercises/practice/<slug>/<snake_name>.bal`
- Add your GitHub username to the `authors` array in the `exercises/practice/<slug>/.meta/config.json` file
- Update the `difficulty` value for the exercise's entry in the `config.json` file
- Verify the exercise by running `bin/verify-exercises <slug>`

Note that:

- Each exercise must stand on its own.
  Do not reference files outside the exercise directory.
  They will not be included when the user fetches the exercise.
- Exercises should use only the Ballerina core libraries.
- Exercises must conform to the Exercism-wide standards described in [the documentation](https://github.com/exercism/docs/tree/master/language-tracks/exercises).
