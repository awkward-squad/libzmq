module Main (main) where

import Control.Exception (bracket)
import Control.Monad (when)
import Control.Monad qualified as Monad
import Foreign (Ptr, Storable, free, malloc, nullFunPtr, nullPtr, peek, sizeOf)
import Foreign.C (CInt, newCString, newCStringLen, peekCString, peekCStringLen)
import GHC.IO.Encoding qualified as Encoding
import GHC.Stack (HasCallStack)
import Libzmq.Bindings
import Test.Tasty
import Test.Tasty.HUnit qualified as HUnit

main :: IO ()
main = do
  Encoding.setForeignEncoding Encoding.char8 -- ascii test cases
  defaultMain (testGroup "tests" tests)

tests :: [TestTree]
tests =
  [ testGroup "zmq_atomic_counter_dec" zmq_atomic_counter_dec_tests,
    testGroup "zmq_atomic_counter_inc" zmq_atomic_counter_inc_tests,
    testGroup "zmq_atomic_counter_set" zmq_atomic_counter_set_tests,
    testGroup "zmq_atomic_counter_value" zmq_atomic_counter_value_tests,
    testGroup "zmq_bind" zmq_bind_tests,
    testGroup "zmq_close" zmq_close_tests,
    testGroup "zmq_connect" zmq_connect_tests,
    testGroup "zmq_ctx_destroy" zmq_ctx_destroy_tests,
    testGroup "zmq_ctx_get" zmq_ctx_get_tests,
    testGroup "zmq_ctx_new" zmq_ctx_new_tests,
    testGroup "zmq_ctx_set" zmq_ctx_set_tests,
    testGroup "zmq_ctx_shutdown" zmq_ctx_shutdown_tests,
    testGroup "zmq_ctx_term" zmq_ctx_term_tests,
    testGroup "zmq_curve_keypair" zmq_curve_keypair_tests,
    testGroup "zmq_curve_public" zmq_curve_public_tests,
    testGroup "zmq_disconnect" zmq_disconnect_tests,
    testGroup "zmq_errno" zmq_errno_tests,
    testGroup "zmq_getsockopt" zmq_getsockopt_tests,
    testGroup "zmq_has" zmq_has_tests,
    testGroup "zmq_init" zmq_init_tests,
    testGroup "zmq_msg_close" zmq_msg_close_tests,
    testGroup "zmq_msg_copy" zmq_msg_copy_tests,
    testGroup "zmq_msg_data" zmq_msg_data_tests,
    testGroup "zmq_msg_get" zmq_msg_get_tests,
    testGroup "zmq_msg_gets" zmq_msg_gets_tests,
    testGroup "zmq_msg_init" zmq_msg_init_tests,
    testGroup "zmq_msg_init_data" zmq_msg_init_data_tests,
    testGroup "zmq_msg_init_size" zmq_msg_init_size_tests,
    testGroup "zmq_msg_more" zmq_msg_more_tests,
    testGroup "zmq_msg_move" zmq_msg_move_tests,
    testGroup "zmq_msg_recv" zmq_msg_recv_tests,
    testGroup "zmq_msg_routing_id" zmq_msg_routing_id_tests,
    testGroup "zmq_msg_send" zmq_msg_send_tests,
    testGroup "zmq_msg_set" zmq_msg_set_tests,
    testGroup "zmq_msg_set_routing_id" zmq_msg_set_routing_id_tests,
    testGroup "zmq_msg_size" zmq_msg_size_tests,
    testGroup "zmq_poll" zmq_poll_tests,
    testGroup "zmq_poller" zmq_poller_tests,
    testGroup "zmq_proxy" zmq_proxy_tests,
    testGroup "zmq_proxy_steerable" zmq_proxy_steerable_tests,
    testGroup "zmq_recv" zmq_recv_tests,
    testGroup "zmq_recvmsg" zmq_recvmsg_tests,
    testGroup "zmq_send" zmq_send_tests,
    testGroup "zmq_send_const" zmq_send_const_tests,
    testGroup "zmq_sendmsg" zmq_sendmsg_tests,
    testGroup "zmq_setsockopt" zmq_setsockopt_tests,
    testGroup "zmq_socket" zmq_socket_tests,
    testGroup "zmq_socket_monitor" zmq_socket_monitor_tests,
    testGroup "zmq_strerror" zmq_strerror_tests,
    testGroup "zmq_term" zmq_term_tests,
    testGroup "zmq_timers" zmq_timers_tests,
    testGroup "zmq_unbind" zmq_unbind_tests,
    testGroup "zmq_version" zmq_version_tests,
    testGroup "zmq_z85_decode" zmq_z85_decode_tests,
    testGroup "zmq_z85_encode" zmq_z85_encode_tests
  ]

zmq_atomic_counter_dec_tests :: [TestTree]
zmq_atomic_counter_dec_tests =
  [ test "decrements a new counter to -1 and returns 1" do
      counter <- make_counter
      io (zmq_atomic_counter_dec counter) `shouldReturn` 1
      io (zmq_atomic_counter_value counter) `shouldReturn` (-1),
    test "decrements a 1 counter to 0 and returns 0" do
      counter <- make_counter
      io (zmq_atomic_counter_inc counter) `shouldReturn` 0
      io (zmq_atomic_counter_dec counter) `shouldReturn` 0
      io (zmq_atomic_counter_value counter) `shouldReturn` 0,
    test "decrements a 2 counter to 1 and returns 1" do
      counter <- make_counter
      io (zmq_atomic_counter_inc counter) `shouldReturn` 0
      io (zmq_atomic_counter_inc counter) `shouldReturn` 1
      io (zmq_atomic_counter_dec counter) `shouldReturn` 1
      io (zmq_atomic_counter_value counter) `shouldReturn` 1
  ]

zmq_atomic_counter_inc_tests :: [TestTree]
zmq_atomic_counter_inc_tests =
  [ test "increments a new counter to 1 and returns 0" do
      counter <- make_counter
      io (zmq_atomic_counter_inc counter) `shouldReturn` 0
      io (zmq_atomic_counter_value counter) `shouldReturn` 1
  ]

zmq_atomic_counter_set_tests :: [TestTree]
zmq_atomic_counter_set_tests =
  [ test "sets the value of a counter" do
      counter <- make_counter
      io (zmq_atomic_counter_set counter 10)
      io (zmq_atomic_counter_value counter) `shouldReturn` 10
  ]

zmq_atomic_counter_value_tests :: [TestTree]
zmq_atomic_counter_value_tests =
  [ test "gets the value of a counter" do
      counter <- make_counter
      io (zmq_atomic_counter_value counter) `shouldReturn` 0
  ]

zmq_bind_tests :: [TestTree]
zmq_bind_tests =
  [ test "returns EINVAL on bogus endpoint" do
      ctx <- make_context
      socket <- make_socket ctx ZMQ_REP
      endpoint <- io (newCString "bogus")
      io (zmq_bind socket endpoint) `shouldReturn` (-1)
      io zmq_errno `shouldReturn` EINVAL
  ]

zmq_close_tests :: [TestTree]
zmq_close_tests = []

zmq_connect_tests :: [TestTree]
zmq_connect_tests = []

zmq_ctx_destroy_tests :: [TestTree]
zmq_ctx_destroy_tests = []

zmq_ctx_get_tests :: [TestTree]
zmq_ctx_get_tests =
  [ test "gets the number of IO threads" do
      ctx <- make_context
      io (zmq_ctx_get ctx ZMQ_IO_THREADS) `shouldReturn` ZMQ_IO_THREADS_DFLT,
    test "gets the max number of sockets" do
      ctx <- make_context
      io (zmq_ctx_get ctx ZMQ_MAX_SOCKETS) `shouldReturn` ZMQ_MAX_SOCKETS_DFLT,
    test "gets the max configurable number of sockets" do
      ctx <- make_context
      io (zmq_ctx_get ctx ZMQ_SOCKET_LIMIT) `shouldReturn` 65535,
    test "gets IPv6" do
      ctx <- make_context
      io (zmq_ctx_get ctx ZMQ_IPV6) `shouldReturn` 0,
    test "gets blocky" do
      ctx <- make_context
      io (zmq_ctx_get ctx ZMQ_BLOCKY) `shouldReturn` 1,
    test "gets the thread scheduling policy" do
      ctx <- make_context
      io (zmq_ctx_get ctx ZMQ_THREAD_SCHED_POLICY) `shouldReturn` ZMQ_THREAD_SCHED_POLICY_DFLT,
    test "gets the thread name prefix" do
      ctx <- make_context
      io (zmq_ctx_get ctx ZMQ_THREAD_NAME_PREFIX) `shouldReturn` 0,
    test "gets the size of a zmq_msg_t" do
      ctx <- make_context
      io (zmq_ctx_get ctx ZMQ_MSG_T_SIZE) `shouldReturn` fromIntegral @Int @CInt (sizeOf (undefined :: Zmq_msg)),
    test "returns EINVAL on bogus option" do
      ctx <- make_context
      io (zmq_ctx_get ctx 12345) `shouldReturn` (-1)
      io zmq_errno `shouldReturn` EINVAL
  ]

zmq_ctx_new_tests :: [TestTree]
zmq_ctx_new_tests = []

zmq_ctx_set_tests :: [TestTree]
zmq_ctx_set_tests =
  [ test "sets blocky" do
      ctx <- make_context
      io (zmq_ctx_set ctx ZMQ_BLOCKY 0) `shouldReturn` 0
      io (zmq_ctx_get ctx ZMQ_BLOCKY) `shouldReturn` 0,
    test "sets the number of IO threads" do
      ctx <- make_context
      io (zmq_ctx_set ctx ZMQ_IO_THREADS 0) `shouldReturn` 0
      io (zmq_ctx_get ctx ZMQ_IO_THREADS) `shouldReturn` 0,
    test "sets the thread scheduling policy" do
      ctx <- make_context
      io (zmq_ctx_set ctx ZMQ_THREAD_SCHED_POLICY 0) `shouldReturn` 0
      io (zmq_ctx_get ctx ZMQ_THREAD_SCHED_POLICY) `shouldReturn` 0,
    test "sets the thread name prefix" do
      ctx <- make_context
      io (zmq_ctx_set ctx ZMQ_THREAD_NAME_PREFIX 1) `shouldReturn` 0
      io (zmq_ctx_get ctx ZMQ_THREAD_NAME_PREFIX) `shouldReturn` 1,
    test "sets the maximum number of sockets" do
      ctx <- make_context
      io (zmq_ctx_set ctx ZMQ_MAX_SOCKETS 1) `shouldReturn` 0
      io (zmq_ctx_get ctx ZMQ_MAX_SOCKETS) `shouldReturn` 1,
    test "sets IPv6" do
      ctx <- make_context
      io (zmq_ctx_set ctx ZMQ_IPV6 1) `shouldReturn` 0
      io (zmq_ctx_get ctx ZMQ_IPV6) `shouldReturn` 1
  ]

zmq_ctx_shutdown_tests :: [TestTree]
zmq_ctx_shutdown_tests =
  [ test "shuts down a context" do
      ctx <- make_context
      io (zmq_ctx_shutdown ctx) `shouldReturn` 0,
    test "does nothing on shut-down context" do
      ctx <- make_context
      io (zassert_ (zmq_ctx_shutdown ctx) (== 0))
      io (zmq_ctx_shutdown ctx) `shouldReturn` 0,
    test "returns EFAULT on terminated context" do
      ctx <- io zmq_ctx_new
      io (zassert_ (zmq_ctx_shutdown ctx) (== 0))
      io (zassert_ (zmq_ctx_term ctx) (== 0))
      io (zmq_ctx_shutdown ctx) `shouldReturn` (-1)
      io zmq_errno `shouldReturn` EFAULT
  ]

zmq_ctx_term_tests :: [TestTree]
zmq_ctx_term_tests =
  [ test "returns EFAULT on terminated context" do
      ctx <- io zmq_ctx_new
      io (zassert_ (zmq_ctx_term ctx) (== 0))
      io (zmq_ctx_term ctx) `shouldReturn` (-1)
      io zmq_errno `shouldReturn` EFAULT
  ]

zmq_curve_keypair_tests :: [TestTree]
zmq_curve_keypair_tests = []

zmq_curve_public_tests :: [TestTree]
zmq_curve_public_tests = []

zmq_disconnect_tests :: [TestTree]
zmq_disconnect_tests = []

zmq_errno_tests :: [TestTree]
zmq_errno_tests = []

zmq_getsockopt_tests :: [TestTree]
zmq_getsockopt_tests = []

zmq_has_tests :: [TestTree]
zmq_has_tests = []

zmq_init_tests :: [TestTree]
zmq_init_tests = []

zmq_msg_close_tests :: [TestTree]
zmq_msg_close_tests = []

zmq_msg_copy_tests :: [TestTree]
zmq_msg_copy_tests =
  [ test "copies message contents" do
      _ <- make_context
      src <- make_string_message "hello"
      dest <- make_empty_message
      io (zmq_msg_copy dest src) `shouldReturn` 0
      message_string dest `shouldReturn` "hello"
      io (zassert_ (zmq_msg_close src) (== 0))
      io (zassert_ (zmq_msg_close dest) (== 0))
  ]

zmq_msg_data_tests :: [TestTree]
zmq_msg_data_tests = []

zmq_msg_get_tests :: [TestTree]
zmq_msg_get_tests = []

zmq_msg_gets_tests :: [TestTree]
zmq_msg_gets_tests = []

zmq_msg_init_tests :: [TestTree]
zmq_msg_init_tests = []

zmq_msg_init_data_tests :: [TestTree]
zmq_msg_init_data_tests =
  [ test "initializes a message with data" do
      _ <- make_context
      message <- make_string_message "hello"
      message_string message `shouldReturn` "hello"
      io (zassert_ (zmq_msg_close message) (== 0))
  ]

zmq_msg_init_size_tests :: [TestTree]
zmq_msg_init_size_tests = []

zmq_msg_more_tests :: [TestTree]
zmq_msg_more_tests = []

zmq_msg_move_tests :: [TestTree]
zmq_msg_move_tests = []

zmq_msg_recv_tests :: [TestTree]
zmq_msg_recv_tests = []

zmq_msg_routing_id_tests :: [TestTree]
zmq_msg_routing_id_tests = []

zmq_msg_send_tests :: [TestTree]
zmq_msg_send_tests = []

zmq_msg_set_tests :: [TestTree]
zmq_msg_set_tests = []

zmq_msg_set_routing_id_tests :: [TestTree]
zmq_msg_set_routing_id_tests = []

zmq_msg_size_tests :: [TestTree]
zmq_msg_size_tests = []

zmq_poll_tests :: [TestTree]
zmq_poll_tests = []

zmq_poller_tests :: [TestTree]
zmq_poller_tests = []

zmq_proxy_tests :: [TestTree]
zmq_proxy_tests = []

zmq_proxy_steerable_tests :: [TestTree]
zmq_proxy_steerable_tests = []

zmq_recv_tests :: [TestTree]
zmq_recv_tests = []

zmq_recvmsg_tests :: [TestTree]
zmq_recvmsg_tests = []

zmq_send_tests :: [TestTree]
zmq_send_tests = []

zmq_send_const_tests :: [TestTree]
zmq_send_const_tests = []

zmq_sendmsg_tests :: [TestTree]
zmq_sendmsg_tests = []

zmq_setsockopt_tests :: [TestTree]
zmq_setsockopt_tests = []

zmq_socket_tests :: [TestTree]
zmq_socket_tests = []

zmq_socket_monitor_tests :: [TestTree]
zmq_socket_monitor_tests = []

zmq_strerror_tests :: [TestTree]
zmq_strerror_tests =
  [ test "returns the libzmq version" do
      px <- allocate
      py <- allocate
      pz <- allocate
      io (zmq_version px py pz)
      x <- io (peek px)
      y <- io (peek py)
      z <- io (peek pz)
      (x, y, z) `shouldBe` (4, 3, 4)
  ]

zmq_term_tests :: [TestTree]
zmq_term_tests = []

zmq_timers_tests :: [TestTree]
zmq_timers_tests = []

zmq_unbind_tests :: [TestTree]
zmq_unbind_tests = []

zmq_version_tests :: [TestTree]
zmq_version_tests =
  [ test "translates error codes to error strings" do
      io (peekCString (zmq_strerror EADDRINUSE)) `shouldReturn` "Address already in use"
      io (peekCString (zmq_strerror EADDRNOTAVAIL)) `shouldReturn` "Can't assign requested address"
      io (peekCString (zmq_strerror EAFNOSUPPORT)) `shouldReturn` "Address family not supported by protocol family"
      io (peekCString (zmq_strerror EAGAIN)) `shouldReturn` "Resource temporarily unavailable"
      io (peekCString (zmq_strerror EBADF)) `shouldReturn` "Bad file descriptor"
      io (peekCString (zmq_strerror ECONNABORTED)) `shouldReturn` "Software caused connection abort"
      io (peekCString (zmq_strerror ECONNREFUSED)) `shouldReturn` "Connection refused"
      io (peekCString (zmq_strerror ECONNRESET)) `shouldReturn` "Connection reset by peer"
      io (peekCString (zmq_strerror EFAULT)) `shouldReturn` "Bad address"
      io (peekCString (zmq_strerror EFSM)) `shouldReturn` "Operation cannot be accomplished in current state"
      io (peekCString (zmq_strerror EHOSTUNREACH)) `shouldReturn` "Host unreachable"
      io (peekCString (zmq_strerror EINPROGRESS)) `shouldReturn` "Operation now in progress"
      io (peekCString (zmq_strerror EINTR)) `shouldReturn` "Interrupted system call"
      io (peekCString (zmq_strerror EINVAL)) `shouldReturn` "Invalid argument"
      io (peekCString (zmq_strerror EMFILE)) `shouldReturn` "Too many open files"
      io (peekCString (zmq_strerror EMSGSIZE)) `shouldReturn` "Message too long"
      io (peekCString (zmq_strerror EMTHREAD)) `shouldReturn` "No thread available"
      io (peekCString (zmq_strerror ENETDOWN)) `shouldReturn` "Network is down"
      io (peekCString (zmq_strerror ENETRESET)) `shouldReturn` "Network dropped connection on reset"
      io (peekCString (zmq_strerror ENETUNREACH)) `shouldReturn` "Network is unreachable"
      io (peekCString (zmq_strerror ENOBUFS)) `shouldReturn` "No buffer space available"
      io (peekCString (zmq_strerror ENOCOMPATPROTO)) `shouldReturn` "The protocol is not compatible with the socket type"
      io (peekCString (zmq_strerror ENODEV)) `shouldReturn` "Operation not supported by device"
      io (peekCString (zmq_strerror ENOENT)) `shouldReturn` "No such file or directory"
      io (peekCString (zmq_strerror ENOMEM)) `shouldReturn` "Cannot allocate memory"
      io (peekCString (zmq_strerror ENOTCONN)) `shouldReturn` "Socket is not connected"
      io (peekCString (zmq_strerror ENOTSOCK)) `shouldReturn` "Socket operation on non-socket"
      io (peekCString (zmq_strerror ENOTSUP)) `shouldReturn` "Operation not supported"
      io (peekCString (zmq_strerror EPROTONOSUPPORT)) `shouldReturn` "Protocol not supported"
      io (peekCString (zmq_strerror ETERM)) `shouldReturn` "Context was terminated"
      io (peekCString (zmq_strerror ETIMEDOUT)) `shouldReturn` "Operation timed out",
    test "complains about unknown error codes" do
      io (peekCString (zmq_strerror 0)) `shouldReturn` "Undefined error: 0"
  ]

zmq_z85_decode_tests :: [TestTree]
zmq_z85_decode_tests = []

zmq_z85_encode_tests :: [TestTree]
zmq_z85_encode_tests = []

------------------------------------------------------------------------------------------------------------------------
-- Test suite monad and test API

newtype M a = M
  { unM :: forall r. (a -> IO r) -> IO r
  }
  deriving stock (Functor)

instance Applicative M where
  pure x = M \k -> k x
  (<*>) = Monad.ap

instance Monad M where
  return = pure
  M ma >>= f = M \k -> ma \a -> unM (f a) k

runM :: M a -> IO a
runM (M m) = m pure

io :: IO a -> M a
io m = M (m >>=)

allocate :: Storable a => M (Ptr a)
allocate =
  M (bracket malloc free)

test :: String -> M () -> TestTree
test name action =
  HUnit.testCase name (runM action)

shouldBe :: (HasCallStack, Eq a, Show a) => a -> a -> M ()
shouldBe actual expected =
  io (actual HUnit.@?= expected)

shouldReturn :: (HasCallStack, Eq a, Show a) => M a -> a -> M ()
shouldReturn action expected = do
  actual <- action
  actual `shouldBe` expected

------------------------------------------------------------------------------------------------------------------------
-- Zmq library helpers

zassert :: HasCallStack => IO a -> (a -> Bool) -> IO a
zassert action predicate = do
  result <- action
  when (not (predicate result)) do
    errno <- zmq_errno
    message <- peekCString (zmq_strerror errno)
    HUnit.assertFailure message
  pure result

zassert_ :: HasCallStack => IO a -> (a -> Bool) -> IO ()
zassert_ action predicate = do
  result <- action
  when (not (predicate result)) do
    errno <- zmq_errno
    message <- peekCString (zmq_strerror errno)
    HUnit.assertFailure message

message_string :: Ptr Zmq_msg -> M String
message_string message =
  io do
    len <- zassert (zmq_msg_size message) (> 0)
    string <- zmq_msg_data message
    peekCStringLen (string, fromIntegral len)

make_context :: M (Ptr context)
make_context =
  M (bracket zmq_ctx_new \ctx -> zassert (zmq_ctx_term ctx) (== 0))

make_counter :: M (Ptr counter)
make_counter =
  M (bracket (zassert zmq_atomic_counter_new (/= nullPtr)) zmq_atomic_counter_destroy)

make_empty_message :: M (Ptr Zmq_msg)
make_empty_message = do
  message <- allocate
  io (zassert_ (zmq_msg_init message) (== 0))
  pure message

make_socket :: HasCallStack => Ptr context -> CInt -> M (Ptr socket)
make_socket ctx typ =
  M (bracket acquire release)
  where
    acquire :: IO (Ptr socket)
    acquire = zassert (zmq_socket ctx typ) (/= nullPtr)

    release :: Ptr socket -> IO CInt
    release socket = zassert (zmq_close socket) (== 0)

make_string_message :: String -> M (Ptr Zmq_msg)
make_string_message string = do
  (c_string, fromIntegral -> len) <- io (newCStringLen string)
  message <- allocate
  io (zassert_ (zmq_msg_init_data message c_string len nullFunPtr nullPtr) (== 0))
  pure message
