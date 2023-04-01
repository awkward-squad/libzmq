module Main (main) where

import Control.Exception (bracket)
import Control.Monad qualified as Monad
import Data.Coerce (coerce)
import Foreign (Ptr, Storable, free, malloc, nullFunPtr, nullPtr, peek, sizeOf)
import Foreign.C
  ( CInt,
    Errno (..),
    eAGAIN,
    eBADF,
    eFAULT,
    eINTR,
    eINVAL,
    eMFILE,
    eNODEV,
    eNOENT,
    eNOMEM,
    newCStringLen,
    peekCString,
    peekCStringLen,
  )
import GHC.IO.Encoding qualified as Encoding
import Libzmq.Bindings
import Test.Tasty
import Test.Tasty.HUnit qualified as HUnit

main :: IO ()
main = do
  Encoding.setForeignEncoding Encoding.char8 -- ascii test cases
  defaultMain (testGroup "tests" tests)

tests :: [TestTree]
tests =
  [ testGroup "zmq_ctx_get" zmq_ctx_get_tests,
    testGroup "zmq_ctx_set" zmq_ctx_set_tests,
    testGroup "zmq_ctx_shutdown" zmq_ctx_shutdown_tests,
    testGroup "zmq_ctx_term" zmq_ctx_term_tests,
    testGroup "zmq_msg_copy" zmq_msg_copy_tests,
    testGroup "zmq_msg_get" zmq_msg_get_tests,
    testGroup "zmq_msg_gets" zmq_msg_gets_tests,
    testGroup "zmq_msg_init" zmq_msg_init_tests,
    testGroup "zmq_msg_init_data" zmq_msg_init_data_tests,
    testGroup "zmq_msg_init_size" zmq_msg_init_size_tests,
    testGroup "zmq_msg_more" zmq_msg_more_tests,
    testGroup "zmq_msg_move" zmq_msg_move_tests,
    testGroup "zmq_msg_recv" zmq_msg_recv_tests,
    testGroup "zmq_msg_send" zmq_msg_send_tests,
    testGroup "zmq_msg_set" zmq_msg_set_tests,
    testGroup "zmq_strerror" zmq_strerror_tests,
    testGroup "zmq_version" zmq_version_tests
  ]

zmq_ctx_get_tests :: [TestTree]
zmq_ctx_get_tests =
  [ test "gets the number of IO threads" do
      ctx <- make_context
      io (zmq_ctx_get ctx _ZMQ_IO_THREADS) `shouldReturn` _ZMQ_IO_THREADS_DFLT,
    test "gets the max number of sockets" do
      ctx <- make_context
      io (zmq_ctx_get ctx _ZMQ_MAX_SOCKETS) `shouldReturn` _ZMQ_MAX_SOCKETS_DFLT,
    test "gets the max configurable number of sockets" do
      ctx <- make_context
      io (zmq_ctx_get ctx _ZMQ_SOCKET_LIMIT) `shouldReturn` 65535,
    test "gets IPv6" do
      ctx <- make_context
      io (zmq_ctx_get ctx _ZMQ_IPV6) `shouldReturn` 0,
    test "gets blocky" do
      ctx <- make_context
      io (zmq_ctx_get ctx _ZMQ_BLOCKY) `shouldReturn` 1,
    test "gets the thread scheduling policy" do
      ctx <- make_context
      io (zmq_ctx_get ctx _ZMQ_THREAD_SCHED_POLICY) `shouldReturn` _ZMQ_THREAD_SCHED_POLICY_DFLT,
    test "gets the thread name prefix" do
      ctx <- make_context
      io (zmq_ctx_get ctx _ZMQ_THREAD_NAME_PREFIX) `shouldReturn` 0,
    test "gets the size of a zmq_msg_t" do
      ctx <- make_context
      io (zmq_ctx_get ctx _ZMQ_MSG_T_SIZE) `shouldReturn` fromIntegral @Int @CInt (sizeOf (undefined :: Zmq_msg)),
    test "returns EINVAL on bogus option" do
      ctx <- make_context
      io (zmq_ctx_get ctx 12345) `shouldReturn` (-1)
      io zmq_errno `shouldReturn` _EINVAL
  ]

zmq_ctx_set_tests :: [TestTree]
zmq_ctx_set_tests =
  [ test "sets blocky" do
      ctx <- make_context
      io (zmq_ctx_set ctx _ZMQ_BLOCKY 0) `shouldReturn` 0
      io (zmq_ctx_get ctx _ZMQ_BLOCKY) `shouldReturn` 0,
    test "sets the number of IO threads" do
      ctx <- make_context
      io (zmq_ctx_set ctx _ZMQ_IO_THREADS 0) `shouldReturn` 0
      io (zmq_ctx_get ctx _ZMQ_IO_THREADS) `shouldReturn` 0,
    test "sets the thread scheduling policy" do
      ctx <- make_context
      io (zmq_ctx_set ctx _ZMQ_THREAD_SCHED_POLICY 0) `shouldReturn` 0
      io (zmq_ctx_get ctx _ZMQ_THREAD_SCHED_POLICY) `shouldReturn` 0,
    test "sets the thread name prefix" do
      ctx <- make_context
      io (zmq_ctx_set ctx _ZMQ_THREAD_NAME_PREFIX 1) `shouldReturn` 0
      io (zmq_ctx_get ctx _ZMQ_THREAD_NAME_PREFIX) `shouldReturn` 1,
    test "sets the maximum number of sockets" do
      ctx <- make_context
      io (zmq_ctx_set ctx _ZMQ_MAX_SOCKETS 1) `shouldReturn` 0
      io (zmq_ctx_get ctx _ZMQ_MAX_SOCKETS) `shouldReturn` 1,
    test "sets IPv6" do
      ctx <- make_context
      io (zmq_ctx_set ctx _ZMQ_IPV6 1) `shouldReturn` 0
      io (zmq_ctx_get ctx _ZMQ_IPV6) `shouldReturn` 1
  ]

zmq_ctx_shutdown_tests :: [TestTree]
zmq_ctx_shutdown_tests =
  [ test "shuts down a context" do
      ctx <- make_context
      io (zmq_ctx_shutdown ctx) `shouldReturn` 0,
    test "does nothing on shut-down context" do
      ctx <- make_context
      io (zmq_ctx_shutdown ctx) `shouldReturn` 0
      io (zmq_ctx_shutdown ctx) `shouldReturn` 0,
    test "returns EFAULT on terminated context" do
      ctx <- io zmq_ctx_new
      io (zmq_ctx_shutdown ctx) `shouldReturn` 0
      io (zmq_ctx_term ctx) `shouldReturn` 0
      io (zmq_ctx_shutdown ctx) `shouldReturn` (-1)
      io zmq_errno `shouldReturn` _EFAULT
  ]

zmq_ctx_term_tests :: [TestTree]
zmq_ctx_term_tests =
  [ test "returns EFAULT on terminated context" do
      ctx <- io zmq_ctx_new
      io (zmq_ctx_term ctx) `shouldReturn` 0
      io (zmq_ctx_term ctx) `shouldReturn` (-1)
      io zmq_errno `shouldReturn` _EFAULT
  ]

zmq_msg_copy_tests :: [TestTree]
zmq_msg_copy_tests =
  [ test "copies message contents" do
      _ <- make_context
      src <- make_string_message "hello"
      dest <- make_empty_message
      io (zmq_msg_copy dest src) `shouldReturn` 0
      message_string dest `shouldReturn` "hello"
      io (zmq_msg_close src) `shouldReturn` 0
      io (zmq_msg_close dest) `shouldReturn` 0
  ]

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
      io (zmq_msg_close message) `shouldReturn` 0
  ]

zmq_msg_init_size_tests :: [TestTree]
zmq_msg_init_size_tests = []

zmq_msg_more_tests :: [TestTree]
zmq_msg_more_tests = []

zmq_msg_move_tests :: [TestTree]
zmq_msg_move_tests = []

zmq_msg_recv_tests :: [TestTree]
zmq_msg_recv_tests = []

zmq_msg_send_tests :: [TestTree]
zmq_msg_send_tests = []

zmq_msg_set_tests :: [TestTree]
zmq_msg_set_tests = []

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

zmq_version_tests :: [TestTree]
zmq_version_tests =
  [ test "translates error codes to error strings" do
      io (peekCString (zmq_strerror _EADDRINUSE)) `shouldReturn` "Address already in use"
      io (peekCString (zmq_strerror _EADDRNOTAVAIL)) `shouldReturn` "Can't assign requested address"
      io (peekCString (zmq_strerror _EAFNOSUPPORT)) `shouldReturn` "Address family not supported by protocol family"
      io (peekCString (zmq_strerror _EAGAIN)) `shouldReturn` "Resource temporarily unavailable"
      io (peekCString (zmq_strerror _EBADF)) `shouldReturn` "Bad file descriptor"
      io (peekCString (zmq_strerror _ECONNABORTED)) `shouldReturn` "Software caused connection abort"
      io (peekCString (zmq_strerror _ECONNREFUSED)) `shouldReturn` "Connection refused"
      io (peekCString (zmq_strerror _ECONNRESET)) `shouldReturn` "Connection reset by peer"
      io (peekCString (zmq_strerror _EFAULT)) `shouldReturn` "Bad address"
      io (peekCString (zmq_strerror _EFSM)) `shouldReturn` "Operation cannot be accomplished in current state"
      io (peekCString (zmq_strerror _EHOSTUNREACH)) `shouldReturn` "Host unreachable"
      io (peekCString (zmq_strerror _EINPROGRESS)) `shouldReturn` "Operation now in progress"
      io (peekCString (zmq_strerror _EINTR)) `shouldReturn` "Interrupted system call"
      io (peekCString (zmq_strerror _EINVAL)) `shouldReturn` "Invalid argument"
      io (peekCString (zmq_strerror _EMFILE)) `shouldReturn` "Too many open files"
      io (peekCString (zmq_strerror _EMSGSIZE)) `shouldReturn` "Message too long"
      io (peekCString (zmq_strerror _EMTHREAD)) `shouldReturn` "No thread available"
      io (peekCString (zmq_strerror _ENETDOWN)) `shouldReturn` "Network is down"
      io (peekCString (zmq_strerror _ENETRESET)) `shouldReturn` "Network dropped connection on reset"
      io (peekCString (zmq_strerror _ENETUNREACH)) `shouldReturn` "Network is unreachable"
      io (peekCString (zmq_strerror _ENOBUFS)) `shouldReturn` "No buffer space available"
      io (peekCString (zmq_strerror _ENOCOMPATPROTO)) `shouldReturn` "The protocol is not compatible with the socket type"
      io (peekCString (zmq_strerror _ENODEV)) `shouldReturn` "Operation not supported by device"
      io (peekCString (zmq_strerror _ENOENT)) `shouldReturn` "No such file or directory"
      io (peekCString (zmq_strerror _ENOMEM)) `shouldReturn` "Cannot allocate memory"
      io (peekCString (zmq_strerror _ENOTCONN)) `shouldReturn` "Socket is not connected"
      io (peekCString (zmq_strerror _ENOTSOCK)) `shouldReturn` "Socket operation on non-socket"
      io (peekCString (zmq_strerror _ENOTSUP)) `shouldReturn` "Operation not supported"
      io (peekCString (zmq_strerror _EPROTONOSUPPORT)) `shouldReturn` "Protocol not supported"
      io (peekCString (zmq_strerror _ETERM)) `shouldReturn` "Context was terminated"
      io (peekCString (zmq_strerror _ETIMEDOUT)) `shouldReturn` "Operation timed out",
    test "complains about unknown error codes" do
      io (peekCString (zmq_strerror 0)) `shouldReturn` "Undefined error: 0"
  ]

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

shouldBe :: (Eq a, Show a) => a -> a -> M ()
shouldBe actual expected =
  io (actual HUnit.@?= expected)

shouldReturn :: (Eq a, Show a) => M a -> a -> M ()
shouldReturn action expected = do
  actual <- action
  actual `shouldBe` expected

------------------------------------------------------------------------------------------------------------------------
-- Zmq library helpers

_EAGAIN :: CInt
_EAGAIN =
  coerce @Errno @CInt eAGAIN

_EBADF :: CInt
_EBADF =
  coerce @Errno @CInt eBADF

_EFAULT :: CInt
_EFAULT =
  coerce @Errno @CInt eFAULT

_EINTR :: CInt
_EINTR =
  coerce @Errno @CInt eINTR

_EINVAL :: CInt
_EINVAL =
  coerce @Errno @CInt eINVAL

_EMFILE :: CInt
_EMFILE =
  coerce @Errno @CInt eMFILE

_ENODEV :: CInt
_ENODEV =
  coerce @Errno @CInt eNODEV

_ENOENT :: CInt
_ENOENT =
  coerce @Errno @CInt eNOENT

_ENOMEM :: CInt
_ENOMEM =
  coerce @Errno @CInt eNOMEM

message_string :: Ptr Zmq_msg -> M String
message_string message =
  io do
    len <- zmq_msg_size message
    HUnit.assertBool "zmq_msg_size failed" (len > 0)
    string <- zmq_msg_data message
    peekCStringLen (string, fromIntegral len)

make_context :: M (Ptr context)
make_context =
  M $
    bracket
      zmq_ctx_new
      (\ctx -> zmq_ctx_term ctx >>= (HUnit.@?= 0))

make_empty_message :: M (Ptr Zmq_msg)
make_empty_message = do
  message <- allocate
  io (zmq_msg_init message) `shouldReturn` 0
  pure message

make_string_message :: String -> M (Ptr Zmq_msg)
make_string_message string = do
  (c_string, fromIntegral -> len) <- io (newCStringLen string)
  message <- allocate
  io (zmq_msg_init_data message c_string len nullFunPtr nullPtr) `shouldReturn` 0
  pure message
