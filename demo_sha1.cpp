#include "sha1.hpp"
#include <string>
#include <iostream>
using std::string;
using std::cout;
using std::endl;

int main(int /* argc */, char **argv)
{ 
    SHA1 checksum;
    checksum.update(argv[1]);
    const string hash = checksum.final();

    cout << hash << endl;

    return 0;
}