module Main (main) where

import Control.Exception (bracket)
import Control.Monad qualified as Monad
import Control.Monad.IO.Class
import Data.Functor (void)
import Data.Text qualified as Text
import Foreign (sizeOf)
import Foreign.C (CInt)
import GHC.IO.Encoding qualified as Encoding
import GHC.Stack (HasCallStack)
import Libzmq
import Libzmq.Bindings qualified
import Test.Tasty
import Test.Tasty.HUnit qualified as HUnit

main :: IO ()
main = do
  Encoding.setForeignEncoding Encoding.char8 -- ascii test cases
  defaultMain (testGroup "libzmq tests" tests)

tests :: [TestTree]
tests =
  [ test "atomic counter tests" do
      Just counter <- liftIO zmq_atomic_counter_new
      zmq_atomic_counter_value counter `shouldReturn` 0
      zmq_atomic_counter_inc counter `shouldReturn` 0
      zmq_atomic_counter_value counter `shouldReturn` 1
      zmq_atomic_counter_inc counter `shouldReturn` 1
      zmq_atomic_counter_value counter `shouldReturn` 2
      zmq_atomic_counter_dec counter `shouldReturn` 1
      zmq_atomic_counter_value counter `shouldReturn` 1
      zmq_atomic_counter_dec counter `shouldReturn` 0
      zmq_atomic_counter_value counter `shouldReturn` 0
      zmq_atomic_counter_dec counter `shouldReturn` 1
      zmq_atomic_counter_value counter `shouldReturn` (-1)
      liftIO (zmq_atomic_counter_set counter 10)
      zmq_atomic_counter_value counter `shouldReturn` 10
      liftIO (zmq_atomic_counter_destroy counter),
    test "basic socket bind/connect/unbind/disconnect tests" do
      context <- make_context
      socket <- make_socket context ZMQ_REP
      z (zmq_bind socket "inproc://foo")
      z (zmq_connect socket "inproc://foo")
      z (zmq_unbind socket "inproc://foo")
      z (zmq_disconnect socket "inproc://foo"),
    test "getting/setting context options tests" do
      ctx <- make_context
      zmq_ctx_get ctx ZMQ_IO_THREADS `shouldReturn` fromIntegral @CInt @Int ZMQ_IO_THREADS_DFLT
      z (zmq_ctx_set ctx ZMQ_IO_THREADS 0)
      zmq_ctx_get ctx ZMQ_IO_THREADS `shouldReturn` 0
      zmq_ctx_get ctx ZMQ_MAX_SOCKETS `shouldReturn` fromIntegral @CInt @Int ZMQ_MAX_SOCKETS_DFLT
      z (zmq_ctx_set ctx ZMQ_MAX_SOCKETS 1)
      zmq_ctx_get ctx ZMQ_MAX_SOCKETS `shouldReturn` 1
      zmq_ctx_get ctx ZMQ_SOCKET_LIMIT `shouldReturn` 65535
      zmq_ctx_get ctx ZMQ_IPV6 `shouldReturn` 0
      z (zmq_ctx_set ctx ZMQ_IPV6 1)
      zmq_ctx_get ctx ZMQ_IPV6 `shouldReturn` 1
      zmq_ctx_get ctx ZMQ_BLOCKY `shouldReturn` 1
      z (zmq_ctx_set ctx ZMQ_BLOCKY 0)
      zmq_ctx_get ctx ZMQ_BLOCKY `shouldReturn` 0
      zmq_ctx_get ctx ZMQ_THREAD_SCHED_POLICY `shouldReturn` fromIntegral @CInt @Int ZMQ_THREAD_SCHED_POLICY_DFLT
      z (zmq_ctx_set ctx ZMQ_THREAD_SCHED_POLICY 0)
      zmq_ctx_get ctx ZMQ_THREAD_SCHED_POLICY `shouldReturn` 0
      zmq_ctx_get ctx ZMQ_THREAD_NAME_PREFIX `shouldReturn` 0
      z (zmq_ctx_set ctx ZMQ_THREAD_NAME_PREFIX 1)
      zmq_ctx_get ctx ZMQ_THREAD_NAME_PREFIX `shouldReturn` 1
      zmq_ctx_get ctx ZMQ_MSG_T_SIZE `shouldReturn` sizeOf (undefined :: Libzmq.Bindings.Zmq_msg),
    testGroup "zmq_ctx_shutdown" zmq_ctx_shutdown_tests,
    testGroup "zmq_curve_keypair" zmq_curve_keypair_tests,
    testGroup "zmq_curve_public" zmq_curve_public_tests,
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
    testGroup "zmq_term" zmq_term_tests,
    testGroup "zmq_timers" zmq_timers_tests,
    test "zmq_vesion returns version 4.3" do
      let (x, y, _) = zmq_version
      (x, y) `shouldBe` (4, 3),
    testGroup "zmq_z85_decode" zmq_z85_decode_tests,
    testGroup "zmq_z85_encode" zmq_z85_encode_tests
  ]

zmq_ctx_shutdown_tests :: [TestTree]
zmq_ctx_shutdown_tests =
  [ test "shuts down a context" do
      ctx <- make_context
      z (zmq_ctx_shutdown ctx),
    test "does nothing on shut-down context" do
      ctx <- make_context
      z (zmq_ctx_shutdown ctx)
      z (zmq_ctx_shutdown ctx),
    test "returns EFAULT on terminated context" do
      ctx <- liftIO zmq_ctx_new
      z (zmq_ctx_shutdown ctx)
      z (zmq_ctx_term ctx)
      zmq_ctx_shutdown ctx `shouldReturn` Left EFAULT
  ]

zmq_curve_keypair_tests :: [TestTree]
zmq_curve_keypair_tests = []

zmq_curve_public_tests :: [TestTree]
zmq_curve_public_tests = []

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
      src <- z (zmq_msg_init_data "hello")
      dest <- liftIO zmq_msg_init
      z (zmq_msg_copy dest src)
      zmq_msg_data dest `shouldReturn` "hello"
      z_ (zmq_msg_close src)
      z_ (zmq_msg_close dest)
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
      message <- z (zmq_msg_init_data "hello")
      zmq_msg_data message `shouldReturn` "hello"
      z_ (zmq_msg_close message)
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

zmq_term_tests :: [TestTree]
zmq_term_tests = []

zmq_timers_tests :: [TestTree]
zmq_timers_tests = []

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

instance MonadFail M where
  fail s = M \_ -> fail s

instance MonadIO M where
  liftIO m = M (m >>=)

runM :: M a -> IO a
runM (M m) = m pure

test :: String -> M () -> TestTree
test name action =
  HUnit.testCase name (runM action)

shouldBe :: (HasCallStack, Eq a, Show a) => a -> a -> M ()
shouldBe actual expected =
  liftIO (actual HUnit.@?= expected)

shouldReturn :: (HasCallStack, Eq a, Show a) => IO a -> a -> M ()
shouldReturn action expected = do
  actual <- liftIO action
  actual `shouldBe` expected

------------------------------------------------------------------------------------------------------------------------
-- Zmq library helpers

z :: (HasCallStack, MonadIO m) => IO (Either Zmq_error a) -> m a
z action =
  liftIO do
    action >>= \case
      Left err -> HUnit.assertFailure (Text.unpack (zmq_strerror err))
      Right val -> pure val

z_ :: (HasCallStack, MonadIO m) => IO (Either Zmq_error a) -> m ()
z_ action =
  void (z action)

make_context :: M Zmq_ctx
make_context =
  M (bracket zmq_ctx_new \ctx -> z (zmq_ctx_term ctx))

make_socket :: HasCallStack => Zmq_ctx -> Zmq_socket_type -> M Zmq_socket
make_socket ctx typ =
  M (bracket (z (zmq_socket ctx typ)) \socket -> z (zmq_close socket))
