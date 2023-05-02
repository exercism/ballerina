# Running the Tests

1. Open a Command Prompt and get the first exercise:

     ```sh
     exercism download --track ballerina --exercise hello-world
     ```

2. Change directory to the newly downloaded exercise

     ```sh
     cd ~/exercism/ballerina
     ```

	The directory location depends on your OS and your configured exercism workspace.
	See `exercism configure` for your workspace location.

3. Initialize the project prior to executing tests:

     ```sh
     bal init
     ```
     
4. Run the tests:

     ```sh
     bal test --offline
     ```

    By default, only the first test is enabled.
    This is intentional as it allows you to focus on just making that one test pass.
    Once it passes, you can enable the next test by removing `enable: false` from the test's `@test:Config {}` set.
    When all tests have been enabled ans your implementation makes them all pass, you'll have solved the exercise!

Good luck!  Have fun!

If you get stuck, at any point, don't forget to reach out for help:
- on [the forum][forum],
- in the #support channel on [Exercism's discord server][discord].


[discord]: https://exercism.org/r/discord
[forum]: https://forum.exercism.org/
