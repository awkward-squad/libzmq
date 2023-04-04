#include <zmq.h>
#include "zmq-wrapper.h"

// libzmq wants us to pass in the *address* of the counter pointer it allocates, so it can free the counter memory and
// null our pointer. That's annoying, and we can't really get the address of a thing in Haskell, so this seems like the
// simplest way to expose this function.
//
// In short: although zmq_atomic_counter_destroy's type is `void** -> void`, our wrapper is `void* -> void`
void zmq_atomic_counter_destroy_wrapper (void* counter) {
  zmq_atomic_counter_destroy(&counter);
}
