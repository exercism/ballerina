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
     ballerina init
     ```
     
4. Run the tests:

     ```sh
     ballerina test --offline
     ```
   *(Don't worry about the tests failing, at first, this is how you begin each exercise.)*

Good luck!  Have fun!

If you get stuck, at any point, don't forget to reach out for help:
- on [the forum][forum],
- in the #support channel on [Exercism's discord server][discord].


[discord]: https://exercism.org/r/discord
[forum]: https://forum.exercism.org/
