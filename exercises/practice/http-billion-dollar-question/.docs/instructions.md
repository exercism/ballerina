# The HTTP Billion Dollar Question

## Problem Statement

You have been asked to find the top `x` billionaires by net worth in a given set of countries (number of countries = `N`). To implement that, you have been given access to an API that returns the details of the billionaires by country.

To simplify accessing the API, you can use a predefined client connector to connect to the API which returns details of the billionaires by country.


```ballerina
import ballerina_exercism/http_billion_dollar_question.billionairehub_client as billionairehubClient;

type Billionaire record {|
    string name;
    float netWorth;
|};

public function getTopXBillionaires(string[] countries, int x) returns string[]|error {
    billionairehubClient:billionaireClient cl = check new;

    // TODO Write your logic here
    return [];
}
```

## Constraints

* 1 <= N <= 5
* 1 <= x <= 10

## Example 1

Input

```
Countries: ["United States"]
Limit: 3
```

Output

```
["Elon Musk", "Jeff Bezos", "Bill Gates"]
```

## Example 2

Input

```
Countries: ["China", "India"]
Limit: 5
```

Output

```
["Mukesh Ambani","Zhong Shanshan","Ma Huateng","Colin Huang","Pony Ma"]
```

## Test Environment

* Use `bal test` to run and test your implementation.

## Hints

* Use the `getBillionaires` remote method defined in the `billionairehub_client ` module.
* You can find the richest people per country first and then combine them to find the top `x`.
* [Query expressions](https://ballerina.io/learn/by-example/query-expressions/) will be convenient for filtering and sorting.
