# The HTTP Billion Dollar Question

## Problem Statement

You have been asked to find the top `x` billionaires by net worth in a given set of countries (number of countries = `N`). To implement that, you have been given access to an API that returns the details of the billionaires by country.

To simplify accessing the API, you can use the [`ims/billionairehub` client](https://lib.ballerina.io/ims/billionairehub/1.0.0/clients/Client) connector to connect to the API which returns details of the billionaires by country.


```ballerina
import ims/billionairehub;

# Client ID and Client Secret to connect to the billionaire API
configurable string clientId = ?;
configurable string clientSecret = ?;

public function getTopXBillionaires(string[] countries, int x) returns string[]|error {
    // Create the client connector
    billionairehub:Client cl = check new ({auth: {clientId, clientSecret}});

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
["Mukesh Ambani", "Gautam Adani & family", "Zhong Shanshan", "Zhang Yiming", "Ma Huateng"]
```

## Test Environment

* Client ID and Client Secret to connect to the billionaire API have been provided to you in the `tests/Config.toml`. You can use them to initialize the client.
* Use `bal test` to run and test your implementation.

## Hints

* `ims/billionairehub` package's [client](https://lib.ballerina.io/ims/billionairehub/1.0.0/clients/Client) can be used to invoke the get billionaires by country API. You can use the `getBillionaires("<country>")` remote method specifically.
* You can find the richest people per country first and then combine them to find the top `x`
* [Query expressions](https://ballerina.io/learn/by-example/query-expressions/) will be convenient for filtering and sorting
