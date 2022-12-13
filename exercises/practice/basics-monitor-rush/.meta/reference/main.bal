import ballerina/lang.array;

function allocateCubicles(int[] requests) returns int[] {
    if requests.length() <= 1 {
        return requests;
    }

    int[] sortedRequests = requests.sort(array:ASCENDING);
    int[] allocated = [sortedRequests[0]];
    int prev = allocated[0];
    foreach var cur in sortedRequests {
        if prev != cur {
            allocated.push(cur);
            prev = cur;
        }
    }

    return allocated;
}
