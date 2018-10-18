# Exercism Ballerina Track

![build status](https://travis-ci.org/exercism/ballerina.svg?branch=master)

Exercism exercises in Ballerina. [Ballerina](https://ballerina.io/) is a compiled, transactional, statically and strongly typed programming language with textual and graphical syntaxes. Ballerina incorporates fundamental concepts of distributed system integration into the language and offers a type-safe, concurrent environment to implement microservices with distributed transactions, reliable messaging, stream processing, and workflows. 

## Setup

You can install Ballerina by following the Ballerina [installation guide](https://ballerina.io/learn/getting-started/). 
## Contributing

Thank you so much for contributing! :tada:

Please read about how to [get involved in a track](https://github.com/exercism/docs/tree/master/contributing-to-language-tracks). Be sure to read the Exercism [Code of Conduct](https://github.com/exercism/exercism.io/blob/master/CODE_OF_CONDUCT.md).

We welcome pull requests of all kinds. No contribution is too small.

We encourage contributions that provide fixes and improvements to existing exercises. Please note that this track's exercises must conform to the Exercism-wide standards described in the [documentation](https://github.com/exercism/docs/tree/master/language-tracks/exercises). If you're unsure about how to make a change, then go ahead and open a GitHub issue, and we'll discuss it.

## Exercise Tests

At the most basic level, Exercism is all about the tests. You can read more about how we think about test suites in [the Exercism documentation](https://github.com/exercism/docs/blob/master/language-tracks/exercises/anatomy/test-suites.md).

Test files should use the following format:

```
import ballerina/test;
import ballerina/io;

any[] outputs = [];
int counter = 0;

// This is the mock function which will replace the real function
@test:Mock {
    packageName: "ballerina.io",
    functionName: "println"
}
public function mockPrint(any... s) {
    outputs[counter] = s[0];
    counter++;
}

@test:Config
function testFunc() {
    // Invoking the main function
    main();
    test:assertEquals("Hello, World!", outputs[0]);
}

```

## Opening an Issue

If you plan to make significant or breaking changes, please open an issue so we can discuss it first. If this is a discussion that is relevant to more than just the Ballerina track, please open an issue in [exercism/discussions](https://github.com/exercism/discussions/issues).

## Submitting a Pull Request

Pull requests should be focused on a single exercise, issue, or conceptually cohesive change. Please refer to Exercism's [pull request guidelines](https://github.com/exercism/docs/blob/master/contributing/pull-request-guidelines.md).

Please follow the coding standards for Ballerina. (If there is a formatter for the track's language, add instructions for using it here.)

### Verifying Your Change

Before submitting your pull request, you'll want to verify the changes in two ways:

* Run all the tests for the Ballerina exercises
* Run an Exercism-specific linter to verify the track

All the tests for Ballerina exercises can be run from the top level of the repo with

```
sh run_ballerina_tests.sh
```

For the Exercism-specific linting, please see [the documentation](https://github.com/exercism/docs/blob/master/language-tracks/configuration/linting.md).

## Contributing a New Exercise

Please see the documentation about [adding new exercises](https://github.com/exercism/docs/blob/master/you-can-help/make-up-new-exercises.md).

Note that:

- Each exercise must stand on its own. Do not reference files outside the exercise directory. They will not be included when the user fetches the exercise.
- Exercises should use only the Ballerina core libraries.
- Exercises must conform to the Exercism-wide standards described in [the documentation](https://github.com/exercism/docs/tree/master/language-tracks/exercises).
- Each exercise should have a test suite, an example solution, a template file for the real implementation and ... (anything else that needs to go with each exercise for this track). The CI build expects files to be named using the following convention: (describe the Ballerina convention for naming the various files that make up an exercise).
- Please do not commit any configuration files or directories inside the exercise other than ...
- Be sure to add it to the appropriate place in the `config.json` file.


Quick Reference: 

- Create an exercise under ``` ballerina-exercism/exercsises/<exercise-name>```
- Add the full reference implementation to ```<exercise-name>/.meta/reference ```. 
- Add the exercise skeleton(incomplete solution) to `` <exercise-name>/``. 
- Add all test cases under ```<exercise-name>test/ ```.
- Run all tests using : ``.../ballerina-exercism/exercises$ sh run_ballerina_tests.sh`` and make sure all tests are passed. 
- Add exercise to ``` ballerina-exercism/config.json ```. 
- Generate an UUID using `configlet uuid` use that as the ID for the exercise.
- Update ``config.json`` with the metadata for the new exercise. 
- Run linter : `` configlet lint . --track-id=ballerina`` and make sure you don't have any issues. 
- Now you are ready to commit and push the exercise. 
- Once changes are pushed, create a PR. 