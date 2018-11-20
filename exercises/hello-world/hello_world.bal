import ballerina/io;

public function main(string... args) {
    error err = { message:"Default Message" };
    throw err;
}
