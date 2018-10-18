import ballerina/io;

function main(string... args) {
    error err = { message:"Default Message" };
    throw err;
}
