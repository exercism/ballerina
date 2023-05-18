# Exercise testing

Follow the steps below to develop a solution for an exercise and test it locally.

## Download the exercise

Open a Command Prompt and execute the command below to download the exercise.

>**Tip:** Replace the value of the `--exercise` property with the name of your preferred exercise.

```sh
exercism download --track ballerina --exercise hello-world
```

## Develop your solution

1. Execute the command below to navigate to the directory of the newly downloaded exercise.

     >**Tip:** The directory location in the command below depends on your OS and your configured Exercism workspace. You can find out your workspace location by executing the `exercism configure` command.

     ```sh
     cd ~/exercism/ballerina/hello-world/
     ```

2. Follow the provided instructions and develop a solution for the exercise.

## Test your solution

Some Ballerina exercises will have a single test, while others will have multiple tests. The tests can be found in the respective test file of the `/tests` directory inside the root directory of the exercise.

### Test exercise with a single test

Execute the command below to run the test of the exercise.

By default, only the first test is enabled. This is intentional as it allows you to focus on just making that one test pass. 
     
```sh
bal test
```

### Test exercise with multiple tests

Follow the steps below to test an exercise with multiple tests.

1. Once the first test passes, enable the next test by removing the `enable: false` property shown in the example below from the `@test:Config` annotation of it.

     ```ballerina
     @test:Config {
     enable: false
     }
     function nextTestCase() {
     }
     ``` 

2.  Execute the command below to run the enabled test.

   ```sh
     bal test
   ```

3. Repeat the two steps above to enable the remaining tests one by one and run them.

You have solved the exercise when all tests have been enabled and your implementation makes them all pass.

Good luck and have fun solving the exercises!

If you need any help, do not forget to reach out on the channels below.
- [Ballerina forum](https://forum.exercism.org/c/programming/ballerina/232)
- [Exercism's Discord channel](https://exercism.org/r/discord)
- [Ballerina Discord channel](https://discord.gg/ballerinalang)
