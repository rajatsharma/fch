#include <iostream>
using namespace std;

int main(int argc, char *argv[]) {
  int buffer_size = 100;
  char buffer[buffer_size];

  if (argc < 2) {
    cout << "insufficient arguments";
    return 1;
  }

  char *arg = argv[1];

  snprintf(buffer, buffer_size, "git fetch origin/%s", arg);
  system(buffer);

  snprintf(buffer, buffer_size, "git checkout %s", arg);
  system(buffer);

  return 0;
}
