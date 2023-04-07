#include <stdlib.h>

void free2 (void* data, void* hint) {
  free(data);
}
