module Libzmq.Internal.Types (module Libzmq.Internal.Types) where

import Control.Monad (guard)
import Data.Bits ((.&.), (.|.))
import Data.ByteString (ByteString)
import Data.Coerce
import Data.Function ((&))
import Data.Int (Int32, Int64)
import Data.List qualified as List
import Data.Maybe (catMaybes)
import Data.Text (Text)
import Data.Word (Word64)
import Foreign.C.Error
import Foreign.C.Types (CInt, CShort)
import Foreign.Ptr (Ptr, nullPtr)
import Libzmq.Bindings qualified

-- | An atomic counter.
newtype Zmq_atomic_counter
  = Zmq_atomic_counter (Ptr ())
  deriving stock (Eq, Ord)

-- | A ØMQ context option.
newtype Zmq_ctx_option
  = Zmq_ctx_option CInt
  deriving stock (Eq, Ord)

instance Show Zmq_ctx_option where
  show = \case
    ZMQ_BLOCKY -> "ZMQ_BLOCKY"
    ZMQ_IO_THREADS -> "ZMQ_IO_THREADS"
    ZMQ_IPV6 -> "ZMQ_IPV6"
    ZMQ_MAX_MSGSZ -> "ZMQ_MAX_MSGSZ"
    ZMQ_MAX_SOCKETS -> "ZMQ_MAX_SOCKETS"
    ZMQ_MSG_T_SIZE -> "ZMQ_MSG_T_SIZE"
    ZMQ_SOCKET_LIMIT -> "ZMQ_SOCKET_LIMIT"
    ZMQ_THREAD_NAME_PREFIX -> "ZMQ_THREAD_NAME_PREFIX"
    ZMQ_THREAD_SCHED_POLICY -> "ZMQ_THREAD_SCHED_POLICY"

pattern ZMQ_BLOCKY :: Zmq_ctx_option
pattern ZMQ_BLOCKY = Zmq_ctx_option Libzmq.Bindings.ZMQ_BLOCKY

pattern ZMQ_IO_THREADS :: Zmq_ctx_option
pattern ZMQ_IO_THREADS = Zmq_ctx_option Libzmq.Bindings.ZMQ_IO_THREADS

pattern ZMQ_IPV6 :: Zmq_ctx_option
pattern ZMQ_IPV6 = Zmq_ctx_option Libzmq.Bindings.ZMQ_IPV6

pattern ZMQ_MAX_MSGSZ :: Zmq_ctx_option
pattern ZMQ_MAX_MSGSZ = Zmq_ctx_option Libzmq.Bindings.ZMQ_MAX_MSGSZ

pattern ZMQ_MAX_SOCKETS :: Zmq_ctx_option
pattern ZMQ_MAX_SOCKETS = Zmq_ctx_option Libzmq.Bindings.ZMQ_MAX_SOCKETS

pattern ZMQ_MSG_T_SIZE :: Zmq_ctx_option
pattern ZMQ_MSG_T_SIZE = Zmq_ctx_option Libzmq.Bindings.ZMQ_MSG_T_SIZE

pattern ZMQ_SOCKET_LIMIT :: Zmq_ctx_option
pattern ZMQ_SOCKET_LIMIT = Zmq_ctx_option Libzmq.Bindings.ZMQ_SOCKET_LIMIT

pattern ZMQ_THREAD_NAME_PREFIX :: Zmq_ctx_option
pattern ZMQ_THREAD_NAME_PREFIX = Zmq_ctx_option Libzmq.Bindings.ZMQ_THREAD_NAME_PREFIX

pattern ZMQ_THREAD_SCHED_POLICY :: Zmq_ctx_option
pattern ZMQ_THREAD_SCHED_POLICY = Zmq_ctx_option Libzmq.Bindings.ZMQ_THREAD_SCHED_POLICY

{-# COMPLETE
  ZMQ_BLOCKY,
  ZMQ_IO_THREADS,
  ZMQ_IPV6,
  ZMQ_MAX_MSGSZ,
  ZMQ_MAX_SOCKETS,
  ZMQ_MSG_T_SIZE,
  ZMQ_SOCKET_LIMIT,
  ZMQ_THREAD_NAME_PREFIX,
  ZMQ_THREAD_SCHED_POLICY
  #-}

-- | A ØMQ context.
newtype Zmq_ctx
  = Zmq_ctx (Ptr ())
  deriving stock (Eq, Ord)

-- | A ØMQ error.
newtype Zmq_error
  = Zmq_error CInt
  deriving stock (Eq, Ord)

instance Show Zmq_error where
  show = \case
    EADDRINUSE -> "EADDRINUSE"
    EADDRNOTAVAIL -> "EADDRNOTAVAIL"
    EAFNOSUPPORT -> "EAFNOSUPPORT"
    EAGAIN -> "EAGAIN"
    EBADF -> "EBADF"
    ECONNABORTED -> "ECONNABORTED"
    ECONNREFUSED -> "ECONNREFUSED"
    ECONNRESET -> "ECONNRESET"
    EFAULT -> "EFAULT"
    EFSM -> "EFSM"
    EHOSTUNREACH -> "EHOSTUNREACH"
    EINPROGRESS -> "EINPROGRESS"
    EINTR -> "EINTR"
    EINVAL -> "EINVAL"
    EMFILE -> "EMFILE"
    EMSGSIZE -> "EMSGSIZE"
    EMTHREAD -> "EMTHREAD"
    ENETDOWN -> "ENETDOWN"
    ENETRESET -> "ENETRESET"
    ENETUNREACH -> "ENETUNREACH"
    ENOBUFS -> "ENOBUFS"
    ENOCOMPATPROTO -> "ENOCOMPATPROTO"
    ENODEV -> "ENODEV"
    ENOENT -> "ENOENT"
    ENOMEM -> "ENOMEM"
    ENOTCONN -> "ENOTCONN"
    ENOTSOCK -> "ENOTSOCK"
    ENOTSUP -> "ENOTSUP"
    EPROTONOSUPPORT -> "EPROTONOSUPPORT"
    ETERM -> "ETERM"
    ETIMEDOUT -> "ETIMEDOUT"

pattern EADDRINUSE :: Zmq_error
pattern EADDRINUSE = Zmq_error Libzmq.Bindings.EADDRINUSE

pattern EADDRNOTAVAIL :: Zmq_error
pattern EADDRNOTAVAIL = Zmq_error Libzmq.Bindings.EADDRNOTAVAIL

pattern EAFNOSUPPORT :: Zmq_error
pattern EAFNOSUPPORT = Zmq_error Libzmq.Bindings.EAFNOSUPPORT

pattern EAGAIN :: Zmq_error
pattern EAGAIN = Zmq_error Libzmq.Bindings.EAGAIN

pattern EBADF :: Zmq_error
pattern EBADF = Zmq_error Libzmq.Bindings.EBADF

pattern ECONNABORTED :: Zmq_error
pattern ECONNABORTED = Zmq_error Libzmq.Bindings.ECONNABORTED

pattern ECONNREFUSED :: Zmq_error
pattern ECONNREFUSED = Zmq_error Libzmq.Bindings.ECONNREFUSED

pattern ECONNRESET :: Zmq_error
pattern ECONNRESET = Zmq_error Libzmq.Bindings.ECONNRESET

pattern EFAULT :: Zmq_error
pattern EFAULT <-
  ((== Zmq_error (coerce @Errno @CInt eFAULT)) -> True)
  where
    EFAULT = Zmq_error (coerce @Errno @CInt eFAULT)

pattern EFSM :: Zmq_error
pattern EFSM = Zmq_error Libzmq.Bindings.EFSM

pattern EHOSTUNREACH :: Zmq_error
pattern EHOSTUNREACH = Zmq_error Libzmq.Bindings.EHOSTUNREACH

pattern EINPROGRESS :: Zmq_error
pattern EINPROGRESS = Zmq_error Libzmq.Bindings.EINPROGRESS

pattern EINTR :: Zmq_error
pattern EINTR <-
  ((== Zmq_error (coerce @Errno @CInt eINTR)) -> True)
  where
    EINTR = Zmq_error (coerce @Errno @CInt eINTR)

pattern EINVAL :: Zmq_error
pattern EINVAL <-
  ((== Zmq_error (coerce @Errno @CInt eINVAL)) -> True)
  where
    EINVAL = Zmq_error (coerce @Errno @CInt eINVAL)

pattern EMFILE :: Zmq_error
pattern EMFILE <-
  ((== Zmq_error (coerce @Errno @CInt eMFILE)) -> True)
  where
    EMFILE = Zmq_error (coerce @Errno @CInt eMFILE)

pattern EMSGSIZE :: Zmq_error
pattern EMSGSIZE = Zmq_error Libzmq.Bindings.EMSGSIZE

pattern EMTHREAD :: Zmq_error
pattern EMTHREAD = Zmq_error Libzmq.Bindings.EMTHREAD

pattern ENETDOWN :: Zmq_error
pattern ENETDOWN = Zmq_error Libzmq.Bindings.ENETDOWN

pattern ENETRESET :: Zmq_error
pattern ENETRESET = Zmq_error Libzmq.Bindings.ENETRESET

pattern ENETUNREACH :: Zmq_error
pattern ENETUNREACH = Zmq_error Libzmq.Bindings.ENETUNREACH

pattern ENOBUFS :: Zmq_error
pattern ENOBUFS = Zmq_error Libzmq.Bindings.ENOBUFS

pattern ENOCOMPATPROTO :: Zmq_error
pattern ENOCOMPATPROTO = Zmq_error Libzmq.Bindings.ENOCOMPATPROTO

pattern ENODEV :: Zmq_error
pattern ENODEV <-
  ((== Zmq_error (coerce @Errno @CInt eNODEV)) -> True)
  where
    ENODEV = Zmq_error (coerce @Errno @CInt eNODEV)

pattern ENOENT :: Zmq_error
pattern ENOENT <-
  ((== Zmq_error (coerce @Errno @CInt eNOENT)) -> True)
  where
    ENOENT = Zmq_error (coerce @Errno @CInt eNOENT)

pattern ENOMEM :: Zmq_error
pattern ENOMEM <-
  ((== Zmq_error (coerce @Errno @CInt eNOMEM)) -> True)
  where
    ENOMEM = Zmq_error (coerce @Errno @CInt eNOMEM)

pattern ENOTCONN :: Zmq_error
pattern ENOTCONN = Zmq_error Libzmq.Bindings.ENOTCONN

pattern ENOTSOCK :: Zmq_error
pattern ENOTSOCK = Zmq_error Libzmq.Bindings.ENOTSOCK

pattern ENOTSUP :: Zmq_error
pattern ENOTSUP = Zmq_error Libzmq.Bindings.ENOTSUP

pattern EPROTONOSUPPORT :: Zmq_error
pattern EPROTONOSUPPORT = Zmq_error Libzmq.Bindings.EPROTONOSUPPORT

pattern ETERM :: Zmq_error
pattern ETERM = Zmq_error Libzmq.Bindings.ETERM

pattern ETIMEDOUT :: Zmq_error
pattern ETIMEDOUT = Zmq_error Libzmq.Bindings.ETIMEDOUT

{-# COMPLETE
  EADDRINUSE,
  EADDRNOTAVAIL,
  EAFNOSUPPORT,
  EAGAIN,
  EBADF,
  ECONNABORTED,
  ECONNREFUSED,
  ECONNRESET,
  EFAULT,
  EFSM,
  EHOSTUNREACH,
  EINPROGRESS,
  EINTR,
  EINVAL,
  EMFILE,
  EMSGSIZE,
  EMTHREAD,
  ENETDOWN,
  ENETRESET,
  ENETUNREACH,
  ENOBUFS,
  ENOCOMPATPROTO,
  ENODEV,
  ENOENT,
  ENOMEM,
  ENOTCONN,
  ENOTSOCK,
  ENOTSUP,
  EPROTONOSUPPORT,
  ETERM,
  ETIMEDOUT
  #-}

-- | A set of ØMQ events.
newtype Zmq_events
  = Zmq_events CShort
  deriving stock (Eq, Ord)

instance Monoid Zmq_events where
  mempty = Zmq_events 0
  mappend = (<>)

instance Semigroup Zmq_events where
  Zmq_events x <> Zmq_events y =
    Zmq_events (x .|. y)

instance Show Zmq_events where
  show event =
    [ "ZMQ_POLLIN" <$ guard (hasPollin event),
      "ZMQ_POLLOUT" <$ guard (hasPollout event),
      "ZMQ_POLLERR" <$ guard (hasPollerr event),
      "ZMQ_POLLPRI" <$ guard (hasPollpri event)
    ]
      & catMaybes
      & List.intersperse "<>"
      & \case
        [] -> "mempty"
        events -> unwords events

pattern ZMQ_POLLIN :: Zmq_events
pattern ZMQ_POLLIN <-
  (hasPollin -> True)
  where
    ZMQ_POLLIN = Zmq_events Libzmq.Bindings.ZMQ_POLLIN

pattern ZMQ_POLLOUT :: Zmq_events
pattern ZMQ_POLLOUT <-
  (hasPollout -> True)
  where
    ZMQ_POLLOUT = Zmq_events Libzmq.Bindings.ZMQ_POLLOUT

pattern ZMQ_POLLERR :: Zmq_events
pattern ZMQ_POLLERR <-
  (hasPollerr -> True)
  where
    ZMQ_POLLERR = Zmq_events Libzmq.Bindings.ZMQ_POLLERR

pattern ZMQ_POLLPRI :: Zmq_events
pattern ZMQ_POLLPRI <-
  (hasPollpri -> True)
  where
    ZMQ_POLLPRI = Zmq_events Libzmq.Bindings.ZMQ_POLLPRI

hasPollin :: Zmq_events -> Bool
hasPollin (Zmq_events n) =
  n .&. Libzmq.Bindings.ZMQ_POLLIN /= 0

hasPollout :: Zmq_events -> Bool
hasPollout (Zmq_events n) =
  n .&. Libzmq.Bindings.ZMQ_POLLOUT /= 0

hasPollerr :: Zmq_events -> Bool
hasPollerr (Zmq_events n) =
  n .&. Libzmq.Bindings.ZMQ_POLLERR /= 0

hasPollpri :: Zmq_events -> Bool
hasPollpri (Zmq_events n) =
  n .&. Libzmq.Bindings.ZMQ_POLLPRI /= 0

-- | A ØMQ message option.
newtype Zmq_msg_option
  = Zmq_msg_option CInt
  deriving stock (Eq, Ord)

instance Show Zmq_msg_option where
  show = \case
    ZMQ_MORE -> "ZMQ_MORE"
    ZMQ_SHARED -> "ZMQ_SHARED"

pattern ZMQ_MORE :: Zmq_msg_option
pattern ZMQ_MORE = Zmq_msg_option Libzmq.Bindings.ZMQ_MORE

pattern ZMQ_SHARED :: Zmq_msg_option
pattern ZMQ_SHARED = Zmq_msg_option Libzmq.Bindings.ZMQ_SHARED

{-# COMPLETE
  ZMQ_MORE,
  ZMQ_SHARED
  #-}

-- | A ØMQ message.
newtype Zmq_msg
  = Zmq_msg (Ptr Libzmq.Bindings.Zmq_msg)
  deriving stock (Eq, Ord)

-- | A file descripter ØMQ pollitem.
pattern Zmq_pollitem_fd :: Libzmq.Bindings.Zmq_fd -> Zmq_events -> Libzmq.Bindings.Zmq_pollitem
pattern Zmq_pollitem_fd fd events <-
  (asPollitemFd -> Just (fd, events))
  where
    Zmq_pollitem_fd fd (Zmq_events events) =
      Libzmq.Bindings.Zmq_pollitem
        { Libzmq.Bindings.socket = nullPtr,
          Libzmq.Bindings.fd = fd,
          Libzmq.Bindings.events = events,
          Libzmq.Bindings.revents = 0
        }

-- | A socket ØMQ pollitem.
pattern Zmq_pollitem_socket :: Zmq_socket -> Zmq_events -> Libzmq.Bindings.Zmq_pollitem
pattern Zmq_pollitem_socket socket events <-
  (asPollitemSocket -> Just (socket, events))
  where
    Zmq_pollitem_socket (Zmq_socket socket) (Zmq_events events) =
      Libzmq.Bindings.Zmq_pollitem
        { Libzmq.Bindings.socket = socket,
          Libzmq.Bindings.fd = 0,
          Libzmq.Bindings.events = events,
          Libzmq.Bindings.revents = 0
        }

asPollitemFd :: Libzmq.Bindings.Zmq_pollitem -> Maybe (Libzmq.Bindings.Zmq_fd, Zmq_events)
asPollitemFd Libzmq.Bindings.Zmq_pollitem {Libzmq.Bindings.socket, Libzmq.Bindings.fd, Libzmq.Bindings.revents} =
  if socket == nullPtr
    then Just (fd, Zmq_events revents)
    else Nothing

asPollitemSocket :: Libzmq.Bindings.Zmq_pollitem -> Maybe (Zmq_socket, Zmq_events)
asPollitemSocket Libzmq.Bindings.Zmq_pollitem {Libzmq.Bindings.socket, Libzmq.Bindings.revents} =
  if socket == nullPtr
    then Nothing
    else Just (Zmq_socket socket, Zmq_events revents)

-- | A ØMQ protocol error.
newtype Zmq_protocol_error
  = Zmq_protocol_error CInt
  deriving stock (Eq, Ord)

instance Show Zmq_protocol_error where
  show = \case
    ZMQ_PROTOCOL_ERROR_WS_UNSPECIFIED -> "ZMQ_PROTOCOL_ERROR_WS_UNSPECIFIED"
    ZMQ_PROTOCOL_ERROR_ZAP_BAD_REQUEST_ID -> "ZMQ_PROTOCOL_ERROR_ZAP_BAD_REQUEST_ID"
    ZMQ_PROTOCOL_ERROR_ZAP_BAD_VERSION -> "ZMQ_PROTOCOL_ERROR_ZAP_BAD_VERSION "
    ZMQ_PROTOCOL_ERROR_ZAP_INVALID_METADATA -> "ZMQ_PROTOCOL_ERROR_ZAP_INVALID_METADATA"
    ZMQ_PROTOCOL_ERROR_ZAP_INVALID_STATUS_CODE -> "ZMQ_PROTOCOL_ERROR_ZAP_INVALID_STATUS_CODE"
    ZMQ_PROTOCOL_ERROR_ZAP_MALFORMED_REPLY -> "ZMQ_PROTOCOL_ERROR_ZAP_MALFORMED_REPLY"
    ZMQ_PROTOCOL_ERROR_ZAP_UNSPECIFIED -> "ZMQ_PROTOCOL_ERROR_ZAP_UNSPECIFIED"
    ZMQ_PROTOCOL_ERROR_ZMTP_CRYPTOGRAPHIC -> "ZMQ_PROTOCOL_ERROR_ZMTP_CRYPTOGRAPHIC"
    ZMQ_PROTOCOL_ERROR_ZMTP_INVALID_METADATA -> "ZMQ_PROTOCOL_ERROR_ZMTP_INVALID_METADATA"
    ZMQ_PROTOCOL_ERROR_ZMTP_INVALID_SEQUENCE -> "ZMQ_PROTOCOL_ERROR_ZMTP_INVALID_SEQUENCE"
    ZMQ_PROTOCOL_ERROR_ZMTP_KEY_EXCHANGE -> "ZMQ_PROTOCOL_ERROR_ZMTP_KEY_EXCHANGE"
    ZMQ_PROTOCOL_ERROR_ZMTP_MALFORMED_COMMAND_ERROR -> "ZMQ_PROTOCOL_ERROR_ZMTP_MALFORMED_COMMAND_ERROR"
    ZMQ_PROTOCOL_ERROR_ZMTP_MALFORMED_COMMAND_HELLO -> "ZMQ_PROTOCOL_ERROR_ZMTP_MALFORMED_COMMAND_HELLO"
    ZMQ_PROTOCOL_ERROR_ZMTP_MALFORMED_COMMAND_INITIATE -> "ZMQ_PROTOCOL_ERROR_ZMTP_MALFORMED_COMMAND_INITIATE"
    ZMQ_PROTOCOL_ERROR_ZMTP_MALFORMED_COMMAND_MESSAGE -> "ZMQ_PROTOCOL_ERROR_ZMTP_MALFORMED_COMMAND_MESSAGE"
    ZMQ_PROTOCOL_ERROR_ZMTP_MALFORMED_COMMAND_READY -> "ZMQ_PROTOCOL_ERROR_ZMTP_MALFORMED_COMMAND_READY"
    ZMQ_PROTOCOL_ERROR_ZMTP_MALFORMED_COMMAND_UNSPECIFIED -> "ZMQ_PROTOCOL_ERROR_ZMTP_MALFORMED_COMMAND_UNSPECIFIED"
    ZMQ_PROTOCOL_ERROR_ZMTP_MALFORMED_COMMAND_WELCOME -> "ZMQ_PROTOCOL_ERROR_ZMTP_MALFORMED_COMMAND_WELCOME"
    ZMQ_PROTOCOL_ERROR_ZMTP_MECHANISM_MISMATCH -> "ZMQ_PROTOCOL_ERROR_ZMTP_MECHANISM_MISMATCH"
    ZMQ_PROTOCOL_ERROR_ZMTP_UNEXPECTED_COMMAND -> "ZMQ_PROTOCOL_ERROR_ZMTP_UNEXPECTED_COMMAND"
    ZMQ_PROTOCOL_ERROR_ZMTP_UNSPECIFIED -> "ZMQ_PROTOCOL_ERROR_ZMTP_UNSPECIFIED"
    Zmq_protocol_error n -> "Zmq_protocol_error " ++ show n

pattern ZMQ_PROTOCOL_ERROR_WS_UNSPECIFIED :: Zmq_protocol_error
pattern ZMQ_PROTOCOL_ERROR_WS_UNSPECIFIED = Zmq_protocol_error Libzmq.Bindings.ZMQ_PROTOCOL_ERROR_WS_UNSPECIFIED

pattern ZMQ_PROTOCOL_ERROR_ZAP_BAD_REQUEST_ID :: Zmq_protocol_error
pattern ZMQ_PROTOCOL_ERROR_ZAP_BAD_REQUEST_ID = Zmq_protocol_error Libzmq.Bindings.ZMQ_PROTOCOL_ERROR_ZAP_BAD_REQUEST_ID

pattern ZMQ_PROTOCOL_ERROR_ZAP_BAD_VERSION :: Zmq_protocol_error
pattern ZMQ_PROTOCOL_ERROR_ZAP_BAD_VERSION = Zmq_protocol_error Libzmq.Bindings.ZMQ_PROTOCOL_ERROR_ZAP_BAD_VERSION

pattern ZMQ_PROTOCOL_ERROR_ZAP_INVALID_METADATA :: Zmq_protocol_error
pattern ZMQ_PROTOCOL_ERROR_ZAP_INVALID_METADATA = Zmq_protocol_error Libzmq.Bindings.ZMQ_PROTOCOL_ERROR_ZAP_INVALID_METADATA

pattern ZMQ_PROTOCOL_ERROR_ZAP_INVALID_STATUS_CODE :: Zmq_protocol_error
pattern ZMQ_PROTOCOL_ERROR_ZAP_INVALID_STATUS_CODE = Zmq_protocol_error Libzmq.Bindings.ZMQ_PROTOCOL_ERROR_ZAP_INVALID_STATUS_CODE

pattern ZMQ_PROTOCOL_ERROR_ZAP_MALFORMED_REPLY :: Zmq_protocol_error
pattern ZMQ_PROTOCOL_ERROR_ZAP_MALFORMED_REPLY = Zmq_protocol_error Libzmq.Bindings.ZMQ_PROTOCOL_ERROR_ZAP_MALFORMED_REPLY

pattern ZMQ_PROTOCOL_ERROR_ZAP_UNSPECIFIED :: Zmq_protocol_error
pattern ZMQ_PROTOCOL_ERROR_ZAP_UNSPECIFIED = Zmq_protocol_error Libzmq.Bindings.ZMQ_PROTOCOL_ERROR_ZAP_UNSPECIFIED

pattern ZMQ_PROTOCOL_ERROR_ZMTP_CRYPTOGRAPHIC :: Zmq_protocol_error
pattern ZMQ_PROTOCOL_ERROR_ZMTP_CRYPTOGRAPHIC = Zmq_protocol_error Libzmq.Bindings.ZMQ_PROTOCOL_ERROR_ZMTP_CRYPTOGRAPHIC

pattern ZMQ_PROTOCOL_ERROR_ZMTP_INVALID_METADATA :: Zmq_protocol_error
pattern ZMQ_PROTOCOL_ERROR_ZMTP_INVALID_METADATA = Zmq_protocol_error Libzmq.Bindings.ZMQ_PROTOCOL_ERROR_ZMTP_INVALID_METADATA

pattern ZMQ_PROTOCOL_ERROR_ZMTP_INVALID_SEQUENCE :: Zmq_protocol_error
pattern ZMQ_PROTOCOL_ERROR_ZMTP_INVALID_SEQUENCE = Zmq_protocol_error Libzmq.Bindings.ZMQ_PROTOCOL_ERROR_ZMTP_INVALID_SEQUENCE

pattern ZMQ_PROTOCOL_ERROR_ZMTP_KEY_EXCHANGE :: Zmq_protocol_error
pattern ZMQ_PROTOCOL_ERROR_ZMTP_KEY_EXCHANGE = Zmq_protocol_error Libzmq.Bindings.ZMQ_PROTOCOL_ERROR_ZMTP_KEY_EXCHANGE

pattern ZMQ_PROTOCOL_ERROR_ZMTP_MALFORMED_COMMAND_ERROR :: Zmq_protocol_error
pattern ZMQ_PROTOCOL_ERROR_ZMTP_MALFORMED_COMMAND_ERROR = Zmq_protocol_error Libzmq.Bindings.ZMQ_PROTOCOL_ERROR_ZMTP_MALFORMED_COMMAND_ERROR

pattern ZMQ_PROTOCOL_ERROR_ZMTP_MALFORMED_COMMAND_HELLO :: Zmq_protocol_error
pattern ZMQ_PROTOCOL_ERROR_ZMTP_MALFORMED_COMMAND_HELLO = Zmq_protocol_error Libzmq.Bindings.ZMQ_PROTOCOL_ERROR_ZMTP_MALFORMED_COMMAND_HELLO

pattern ZMQ_PROTOCOL_ERROR_ZMTP_MALFORMED_COMMAND_INITIATE :: Zmq_protocol_error
pattern ZMQ_PROTOCOL_ERROR_ZMTP_MALFORMED_COMMAND_INITIATE = Zmq_protocol_error Libzmq.Bindings.ZMQ_PROTOCOL_ERROR_ZMTP_MALFORMED_COMMAND_INITIATE

pattern ZMQ_PROTOCOL_ERROR_ZMTP_MALFORMED_COMMAND_MESSAGE :: Zmq_protocol_error
pattern ZMQ_PROTOCOL_ERROR_ZMTP_MALFORMED_COMMAND_MESSAGE = Zmq_protocol_error Libzmq.Bindings.ZMQ_PROTOCOL_ERROR_ZMTP_MALFORMED_COMMAND_MESSAGE

pattern ZMQ_PROTOCOL_ERROR_ZMTP_MALFORMED_COMMAND_READY :: Zmq_protocol_error
pattern ZMQ_PROTOCOL_ERROR_ZMTP_MALFORMED_COMMAND_READY = Zmq_protocol_error Libzmq.Bindings.ZMQ_PROTOCOL_ERROR_ZMTP_MALFORMED_COMMAND_READY

pattern ZMQ_PROTOCOL_ERROR_ZMTP_MALFORMED_COMMAND_UNSPECIFIED :: Zmq_protocol_error
pattern ZMQ_PROTOCOL_ERROR_ZMTP_MALFORMED_COMMAND_UNSPECIFIED = Zmq_protocol_error Libzmq.Bindings.ZMQ_PROTOCOL_ERROR_ZMTP_MALFORMED_COMMAND_UNSPECIFIED

pattern ZMQ_PROTOCOL_ERROR_ZMTP_MALFORMED_COMMAND_WELCOME :: Zmq_protocol_error
pattern ZMQ_PROTOCOL_ERROR_ZMTP_MALFORMED_COMMAND_WELCOME = Zmq_protocol_error Libzmq.Bindings.ZMQ_PROTOCOL_ERROR_ZMTP_MALFORMED_COMMAND_WELCOME

pattern ZMQ_PROTOCOL_ERROR_ZMTP_MECHANISM_MISMATCH :: Zmq_protocol_error
pattern ZMQ_PROTOCOL_ERROR_ZMTP_MECHANISM_MISMATCH = Zmq_protocol_error Libzmq.Bindings.ZMQ_PROTOCOL_ERROR_ZMTP_MECHANISM_MISMATCH

pattern ZMQ_PROTOCOL_ERROR_ZMTP_UNEXPECTED_COMMAND :: Zmq_protocol_error
pattern ZMQ_PROTOCOL_ERROR_ZMTP_UNEXPECTED_COMMAND = Zmq_protocol_error Libzmq.Bindings.ZMQ_PROTOCOL_ERROR_ZMTP_UNEXPECTED_COMMAND

pattern ZMQ_PROTOCOL_ERROR_ZMTP_UNSPECIFIED :: Zmq_protocol_error
pattern ZMQ_PROTOCOL_ERROR_ZMTP_UNSPECIFIED = Zmq_protocol_error Libzmq.Bindings.ZMQ_PROTOCOL_ERROR_ZMTP_UNSPECIFIED

-- COMPLETE pragma intentionally missing for forward-compatibility
-- Users' programs should be allowed to use _ pattern to mean "the errors that were invented after I wrote this"

-- | A ØMQ send option.
newtype Zmq_send_option
  = Zmq_send_option CInt
  deriving stock (Eq, Ord)

instance Monoid Zmq_send_option where
  mempty = Zmq_send_option 0
  mappend = (<>)

instance Semigroup Zmq_send_option where
  Zmq_send_option x <> Zmq_send_option y =
    Zmq_send_option (x .|. y)

instance Show Zmq_send_option where
  show option =
    [ "ZMQ_DONTWAIT" <$ guard (hasDontwait option),
      "ZMQ_SNDMORE" <$ guard (hasSndmore option)
    ]
      & catMaybes
      & List.intersperse "<>"
      & \case
        [] -> "mempty"
        options -> unwords options

pattern ZMQ_DONTWAIT :: Zmq_send_option
pattern ZMQ_DONTWAIT <-
  (hasDontwait -> True)
  where
    ZMQ_DONTWAIT = Zmq_send_option Libzmq.Bindings.ZMQ_DONTWAIT

pattern ZMQ_SNDMORE :: Zmq_send_option
pattern ZMQ_SNDMORE <-
  (hasSndmore -> True)
  where
    ZMQ_SNDMORE = Zmq_send_option Libzmq.Bindings.ZMQ_SNDMORE

hasDontwait :: Zmq_send_option -> Bool
hasDontwait (Zmq_send_option n) =
  n .&. Libzmq.Bindings.ZMQ_DONTWAIT /= 0

hasSndmore :: Zmq_send_option -> Bool
hasSndmore (Zmq_send_option n) =
  n .&. Libzmq.Bindings.ZMQ_SNDMORE /= 0

-- | A ØMQ socket.
newtype Zmq_socket
  = Zmq_socket (Ptr ())
  deriving stock (Eq, Ord)

-- | A ØMQ socket event type.
--
-- The @Monoid@ instance can be used to combine types together for the purpose of passing to
-- 'Libzmq.zmq_socket_monitor'.
--
-- FIXME rename to Zmq_socket_event_type
newtype Zmq_socket_events
  = Zmq_socket_events CInt
  deriving stock (Eq, Ord)

instance Monoid Zmq_socket_events where
  mempty = Zmq_socket_events 0
  mappend = (<>)

instance Semigroup Zmq_socket_events where
  Zmq_socket_events x <> Zmq_socket_events y =
    Zmq_socket_events (x .|. y)

instance Show Zmq_socket_events where
  show event =
    [ "ZMQ_EVENT_ACCEPTED" <$ guard (hasAccepted event),
      "ZMQ_EVENT_ACCEPT_FAILED" <$ guard (hasAcceptFailed event),
      "ZMQ_EVENT_ALL" <$ guard (hasAll event),
      "ZMQ_EVENT_BIND_FAILED" <$ guard (hasBindFailed event),
      "ZMQ_EVENT_CLOSED" <$ guard (hasClosed event),
      "ZMQ_EVENT_CLOSE_FAILED" <$ guard (hasCloseFailed event),
      "ZMQ_EVENT_CONNECTED" <$ guard (hasConnected event),
      "ZMQ_EVENT_CONNECT_DELAYED" <$ guard (hasConnectDelayed event),
      "ZMQ_EVENT_CONNECT_RETRIED" <$ guard (hasConnectRetried event),
      "ZMQ_EVENT_DISCONNECTED" <$ guard (hasDisconnected event),
      "ZMQ_EVENT_HANDSHAKE_FAILED_AUTH" <$ guard (hasHandshakeFailedAuth event),
      "ZMQ_EVENT_HANDSHAKE_FAILED_NO_DETAIL" <$ guard (hasHandshakeFailedNoDetail event),
      "ZMQ_EVENT_HANDSHAKE_FAILED_PROTOCOL" <$ guard (hasHandshakeFailedProtocol event),
      "ZMQ_EVENT_HANDSHAKE_SUCCEEDED" <$ guard (hasHandshakeSucceeded event),
      "ZMQ_EVENT_LISTENING" <$ guard (hasListening event),
      "ZMQ_EVENT_MONITOR_STOPPED" <$ guard (hasMonitorStopped event)
    ]
      & catMaybes
      & List.intersperse "<>"
      & \case
        [] -> "mempty"
        events -> unwords events

pattern ZMQ_EVENT_ACCEPTED :: Zmq_socket_events
pattern ZMQ_EVENT_ACCEPTED = Zmq_socket_events Libzmq.Bindings.ZMQ_EVENT_ACCEPTED

pattern ZMQ_EVENT_ACCEPT_FAILED :: Zmq_socket_events
pattern ZMQ_EVENT_ACCEPT_FAILED = Zmq_socket_events Libzmq.Bindings.ZMQ_EVENT_ACCEPT_FAILED

pattern ZMQ_EVENT_ALL :: Zmq_socket_events
pattern ZMQ_EVENT_ALL = Zmq_socket_events Libzmq.Bindings.ZMQ_EVENT_ALL

pattern ZMQ_EVENT_BIND_FAILED :: Zmq_socket_events
pattern ZMQ_EVENT_BIND_FAILED = Zmq_socket_events Libzmq.Bindings.ZMQ_EVENT_BIND_FAILED

pattern ZMQ_EVENT_CLOSED :: Zmq_socket_events
pattern ZMQ_EVENT_CLOSED = Zmq_socket_events Libzmq.Bindings.ZMQ_EVENT_CLOSED

pattern ZMQ_EVENT_CLOSE_FAILED :: Zmq_socket_events
pattern ZMQ_EVENT_CLOSE_FAILED = Zmq_socket_events Libzmq.Bindings.ZMQ_EVENT_CLOSE_FAILED

pattern ZMQ_EVENT_CONNECTED :: Zmq_socket_events
pattern ZMQ_EVENT_CONNECTED = Zmq_socket_events Libzmq.Bindings.ZMQ_EVENT_CONNECTED

pattern ZMQ_EVENT_CONNECT_DELAYED :: Zmq_socket_events
pattern ZMQ_EVENT_CONNECT_DELAYED = Zmq_socket_events Libzmq.Bindings.ZMQ_EVENT_CONNECT_DELAYED

pattern ZMQ_EVENT_CONNECT_RETRIED :: Zmq_socket_events
pattern ZMQ_EVENT_CONNECT_RETRIED = Zmq_socket_events Libzmq.Bindings.ZMQ_EVENT_CONNECT_RETRIED

pattern ZMQ_EVENT_DISCONNECTED :: Zmq_socket_events
pattern ZMQ_EVENT_DISCONNECTED = Zmq_socket_events Libzmq.Bindings.ZMQ_EVENT_DISCONNECTED

pattern ZMQ_EVENT_HANDSHAKE_FAILED_AUTH :: Zmq_socket_events
pattern ZMQ_EVENT_HANDSHAKE_FAILED_AUTH = Zmq_socket_events Libzmq.Bindings.ZMQ_EVENT_HANDSHAKE_FAILED_AUTH

pattern ZMQ_EVENT_HANDSHAKE_FAILED_NO_DETAIL :: Zmq_socket_events
pattern ZMQ_EVENT_HANDSHAKE_FAILED_NO_DETAIL = Zmq_socket_events Libzmq.Bindings.ZMQ_EVENT_HANDSHAKE_FAILED_NO_DETAIL

pattern ZMQ_EVENT_HANDSHAKE_FAILED_PROTOCOL :: Zmq_socket_events
pattern ZMQ_EVENT_HANDSHAKE_FAILED_PROTOCOL = Zmq_socket_events Libzmq.Bindings.ZMQ_EVENT_HANDSHAKE_FAILED_PROTOCOL

pattern ZMQ_EVENT_HANDSHAKE_SUCCEEDED :: Zmq_socket_events
pattern ZMQ_EVENT_HANDSHAKE_SUCCEEDED = Zmq_socket_events Libzmq.Bindings.ZMQ_EVENT_HANDSHAKE_SUCCEEDED

pattern ZMQ_EVENT_LISTENING :: Zmq_socket_events
pattern ZMQ_EVENT_LISTENING = Zmq_socket_events Libzmq.Bindings.ZMQ_EVENT_LISTENING

pattern ZMQ_EVENT_MONITOR_STOPPED :: Zmq_socket_events
pattern ZMQ_EVENT_MONITOR_STOPPED = Zmq_socket_events Libzmq.Bindings.ZMQ_EVENT_MONITOR_STOPPED

-- COMPLETE pragma intentionally missing for forward-compatibility
-- Users' programs should be allowed to use _ pattern to mean "the events that were invented after I wrote this"

hasAccepted :: Zmq_socket_events -> Bool
hasAccepted (Zmq_socket_events n) =
  n .&. Libzmq.Bindings.ZMQ_EVENT_ACCEPTED /= 0

hasAcceptFailed :: Zmq_socket_events -> Bool
hasAcceptFailed (Zmq_socket_events n) =
  n .&. Libzmq.Bindings.ZMQ_EVENT_ACCEPT_FAILED /= 0

hasAll :: Zmq_socket_events -> Bool
hasAll (Zmq_socket_events n) =
  n .&. Libzmq.Bindings.ZMQ_EVENT_ALL /= 0

hasBindFailed :: Zmq_socket_events -> Bool
hasBindFailed (Zmq_socket_events n) =
  n .&. Libzmq.Bindings.ZMQ_EVENT_BIND_FAILED /= 0

hasClosed :: Zmq_socket_events -> Bool
hasClosed (Zmq_socket_events n) =
  n .&. Libzmq.Bindings.ZMQ_EVENT_CLOSED /= 0

hasCloseFailed :: Zmq_socket_events -> Bool
hasCloseFailed (Zmq_socket_events n) =
  n .&. Libzmq.Bindings.ZMQ_EVENT_CLOSE_FAILED /= 0

hasConnected :: Zmq_socket_events -> Bool
hasConnected (Zmq_socket_events n) =
  n .&. Libzmq.Bindings.ZMQ_EVENT_CONNECTED /= 0

hasConnectDelayed :: Zmq_socket_events -> Bool
hasConnectDelayed (Zmq_socket_events n) =
  n .&. Libzmq.Bindings.ZMQ_EVENT_CONNECT_DELAYED /= 0

hasConnectRetried :: Zmq_socket_events -> Bool
hasConnectRetried (Zmq_socket_events n) =
  n .&. Libzmq.Bindings.ZMQ_EVENT_CONNECT_RETRIED /= 0

hasDisconnected :: Zmq_socket_events -> Bool
hasDisconnected (Zmq_socket_events n) =
  n .&. Libzmq.Bindings.ZMQ_EVENT_DISCONNECTED /= 0

hasHandshakeFailedAuth :: Zmq_socket_events -> Bool
hasHandshakeFailedAuth (Zmq_socket_events n) =
  n .&. Libzmq.Bindings.ZMQ_EVENT_HANDSHAKE_FAILED_AUTH /= 0

hasHandshakeFailedNoDetail :: Zmq_socket_events -> Bool
hasHandshakeFailedNoDetail (Zmq_socket_events n) =
  n .&. Libzmq.Bindings.ZMQ_EVENT_HANDSHAKE_FAILED_NO_DETAIL /= 0

hasHandshakeFailedProtocol :: Zmq_socket_events -> Bool
hasHandshakeFailedProtocol (Zmq_socket_events n) =
  n .&. Libzmq.Bindings.ZMQ_EVENT_HANDSHAKE_FAILED_PROTOCOL /= 0

hasHandshakeSucceeded :: Zmq_socket_events -> Bool
hasHandshakeSucceeded (Zmq_socket_events n) =
  n .&. Libzmq.Bindings.ZMQ_EVENT_HANDSHAKE_SUCCEEDED /= 0

hasListening :: Zmq_socket_events -> Bool
hasListening (Zmq_socket_events n) =
  n .&. Libzmq.Bindings.ZMQ_EVENT_LISTENING /= 0

hasMonitorStopped :: Zmq_socket_events -> Bool
hasMonitorStopped (Zmq_socket_events n) =
  n .&. Libzmq.Bindings.ZMQ_EVENT_MONITOR_STOPPED /= 0

-- | A ØMQ socket option.
data Zmq_socket_option a where
  ZMQ_AFFINITY :: Zmq_socket_option Word64
  ZMQ_BACKLOG :: Zmq_socket_option Int32
  ZMQ_BINDTODEVICE :: Zmq_socket_option Text
  ZMQ_CONFLATE :: Zmq_socket_option Int32
  ZMQ_CONNECT_ROUTING_ID :: Zmq_socket_option ByteString
  ZMQ_CONNECT_TIMEOUT :: Zmq_socket_option Int32
  ZMQ_CURVE_PUBLICKEY :: Zmq_socket_option ByteString
  ZMQ_CURVE_SECRETKEY :: Zmq_socket_option ByteString
  ZMQ_CURVE_SERVER :: Zmq_socket_option Int32
  ZMQ_CURVE_SERVERKEY :: Zmq_socket_option ByteString
  ZMQ_GSSAPI_PLAINTEXT :: Zmq_socket_option Int32
  ZMQ_GSSAPI_PRINCIPAL :: Zmq_socket_option Text
  ZMQ_GSSAPI_PRINCIPAL_NAMETYPE :: Zmq_socket_option Int32
  ZMQ_GSSAPI_SERVER :: Zmq_socket_option Int32
  ZMQ_GSSAPI_SERVICE_PRINCIPAL :: Zmq_socket_option Text
  ZMQ_GSSAPI_SERVICE_PRINCIPAL_NAMETYPE :: Zmq_socket_option Int32
  ZMQ_HANDSHAKE_IVL :: Zmq_socket_option Int32
  ZMQ_HEARTBEAT_IVL :: Zmq_socket_option Int32
  ZMQ_HEARTBEAT_TIMEOUT :: Zmq_socket_option Int32
  ZMQ_HEARTBEAT_TTL :: Zmq_socket_option Int32
  ZMQ_IMMEDIATE :: Zmq_socket_option Int32
  ZMQ_INVERT_MATCHING :: Zmq_socket_option Int32
  ZMQ_IPV6' :: Zmq_socket_option Int32
  ZMQ_LINGER :: Zmq_socket_option Int32
  ZMQ_MAXMSGSIZE :: Zmq_socket_option Int64
  ZMQ_MULTICAST_HOPS :: Zmq_socket_option Int32
  ZMQ_MULTICAST_MAXTPDU :: Zmq_socket_option Int32
  ZMQ_PLAIN_PASSWORD :: Zmq_socket_option Text
  ZMQ_PLAIN_SERVER :: Zmq_socket_option Int32
  ZMQ_PLAIN_USERNAME :: Zmq_socket_option Text
  ZMQ_PROBE_ROUTER :: Zmq_socket_option Int32
  ZMQ_RATE :: Zmq_socket_option Int32
  ZMQ_RCVBUF :: Zmq_socket_option Int32
  ZMQ_RCVHWM :: Zmq_socket_option Int32
  ZMQ_RCVTIMEO :: Zmq_socket_option Int32
  ZMQ_RECONNECT_IVL :: Zmq_socket_option Int32
  ZMQ_RECONNECT_IVL_MAX :: Zmq_socket_option Int32
  ZMQ_RECOVERY_IVL :: Zmq_socket_option Int32
  ZMQ_REQ_CORRELATE :: Zmq_socket_option Int32
  ZMQ_REQ_RELAXED :: Zmq_socket_option Int32
  ZMQ_ROUTER_HANDOVER :: Zmq_socket_option Int32
  ZMQ_ROUTER_MANDATORY :: Zmq_socket_option Int32
  ZMQ_ROUTING_ID :: Zmq_socket_option ByteString
  ZMQ_SNDBUF :: Zmq_socket_option Int32
  ZMQ_SNDHWM :: Zmq_socket_option Int32
  ZMQ_SNDTIMEO :: Zmq_socket_option Int32
  ZMQ_SOCKS_PROXY :: Zmq_socket_option Text
  ZMQ_STREAM_NOTIFY :: Zmq_socket_option Int32
  ZMQ_SUBSCRIBE :: Zmq_socket_option ByteString
  ZMQ_TCP_KEEPALIVE :: Zmq_socket_option Int32
  ZMQ_TCP_KEEPALIVE_CNT :: Zmq_socket_option Int32
  ZMQ_TCP_KEEPALIVE_IDLE :: Zmq_socket_option Int32
  ZMQ_TCP_KEEPALIVE_INTVL :: Zmq_socket_option Int32
  ZMQ_TCP_MAXRT :: Zmq_socket_option Int32
  ZMQ_TOS :: Zmq_socket_option Int32
  ZMQ_UNSUBSCRIBE :: Zmq_socket_option ByteString
  ZMQ_USE_FD :: Zmq_socket_option Int32
  ZMQ_VMCI_BUFFER_MAX_SIZE :: Zmq_socket_option Word64
  ZMQ_VMCI_BUFFER_MIN_SIZE :: Zmq_socket_option Word64
  ZMQ_VMCI_BUFFER_SIZE :: Zmq_socket_option Word64
  ZMQ_VMCI_CONNECT_TIMEOUT :: Zmq_socket_option Int32
  ZMQ_XPUB_MANUAL :: Zmq_socket_option Int32
  ZMQ_XPUB_NODROP :: Zmq_socket_option Int32
  ZMQ_XPUB_VERBOSE :: Zmq_socket_option Int32
  ZMQ_XPUB_VERBOSER :: Zmq_socket_option Int32
  ZMQ_XPUB_WELCOME_MSG :: Zmq_socket_option ByteString
  ZMQ_ZAP_DOMAIN :: Zmq_socket_option Text

deriving stock instance Eq (Zmq_socket_option a)

deriving stock instance Show (Zmq_socket_option a)

-- | A ØMQ socket type.
newtype Zmq_socket_type
  = Zmq_socket_type CInt
  deriving stock (Eq, Ord)

instance Show Zmq_socket_type where
  show = \case
    ZMQ_CHANNEL -> "ZMQ_CHANNEL"
    ZMQ_CLIENT -> "ZMQ_CLIENT"
    ZMQ_DEALER -> "ZMQ_DEALER"
    ZMQ_DGRAM -> "ZMQ_DGRAM"
    ZMQ_DISH -> "ZMQ_DISH"
    ZMQ_GATHER -> "ZMQ_GATHER"
    ZMQ_PAIR -> "ZMQ_PAIR"
    ZMQ_PEER -> "ZMQ_PEER"
    ZMQ_PUB -> "ZMQ_PUB"
    ZMQ_PULL -> "ZMQ_PULL"
    ZMQ_PUSH -> "ZMQ_PUSH"
    ZMQ_RADIO -> "ZMQ_RADIO"
    ZMQ_REP -> "ZMQ_REP"
    ZMQ_REQ -> "ZMQ_REQ"
    ZMQ_ROUTER -> "ZMQ_ROUTER"
    ZMQ_SCATTER -> "ZMQ_SCATTER"
    ZMQ_SERVER -> "ZMQ_SERVER"
    ZMQ_STREAM -> "ZMQ_STREAM"
    ZMQ_SUB -> "ZMQ_SUB"
    ZMQ_XPUB -> "ZMQ_XPUB"
    ZMQ_XSUB -> "ZMQ_XSUB"

-- | /Draft API/.
pattern ZMQ_CHANNEL :: Zmq_socket_type
pattern ZMQ_CHANNEL = Zmq_socket_type Libzmq.Bindings.ZMQ_CHANNEL

-- | /Draft API/.
pattern ZMQ_CLIENT :: Zmq_socket_type
pattern ZMQ_CLIENT = Zmq_socket_type Libzmq.Bindings.ZMQ_CLIENT

pattern ZMQ_DEALER :: Zmq_socket_type
pattern ZMQ_DEALER = Zmq_socket_type Libzmq.Bindings.ZMQ_DEALER

-- | /Draft API/.
pattern ZMQ_DGRAM :: Zmq_socket_type
pattern ZMQ_DGRAM = Zmq_socket_type Libzmq.Bindings.ZMQ_DGRAM

-- | /Draft API/.
pattern ZMQ_DISH :: Zmq_socket_type
pattern ZMQ_DISH = Zmq_socket_type Libzmq.Bindings.ZMQ_DISH

-- | /Draft API/.
pattern ZMQ_GATHER :: Zmq_socket_type
pattern ZMQ_GATHER = Zmq_socket_type Libzmq.Bindings.ZMQ_GATHER

pattern ZMQ_PAIR :: Zmq_socket_type
pattern ZMQ_PAIR = Zmq_socket_type Libzmq.Bindings.ZMQ_PAIR

-- | /Draft API/.
pattern ZMQ_PEER :: Zmq_socket_type
pattern ZMQ_PEER = Zmq_socket_type Libzmq.Bindings.ZMQ_PEER

pattern ZMQ_PUB :: Zmq_socket_type
pattern ZMQ_PUB = Zmq_socket_type Libzmq.Bindings.ZMQ_PUB

pattern ZMQ_PULL :: Zmq_socket_type
pattern ZMQ_PULL = Zmq_socket_type Libzmq.Bindings.ZMQ_PULL

pattern ZMQ_PUSH :: Zmq_socket_type
pattern ZMQ_PUSH = Zmq_socket_type Libzmq.Bindings.ZMQ_PUSH

-- | /Draft API/.
pattern ZMQ_RADIO :: Zmq_socket_type
pattern ZMQ_RADIO = Zmq_socket_type Libzmq.Bindings.ZMQ_RADIO

pattern ZMQ_REP :: Zmq_socket_type
pattern ZMQ_REP = Zmq_socket_type Libzmq.Bindings.ZMQ_REP

pattern ZMQ_REQ :: Zmq_socket_type
pattern ZMQ_REQ = Zmq_socket_type Libzmq.Bindings.ZMQ_REQ

pattern ZMQ_ROUTER :: Zmq_socket_type
pattern ZMQ_ROUTER = Zmq_socket_type Libzmq.Bindings.ZMQ_ROUTER

-- | /Draft API/.
pattern ZMQ_SCATTER :: Zmq_socket_type
pattern ZMQ_SCATTER = Zmq_socket_type Libzmq.Bindings.ZMQ_SCATTER

-- | /Draft API/.
pattern ZMQ_SERVER :: Zmq_socket_type
pattern ZMQ_SERVER = Zmq_socket_type Libzmq.Bindings.ZMQ_SERVER

pattern ZMQ_STREAM :: Zmq_socket_type
pattern ZMQ_STREAM = Zmq_socket_type Libzmq.Bindings.ZMQ_STREAM

pattern ZMQ_SUB :: Zmq_socket_type
pattern ZMQ_SUB = Zmq_socket_type Libzmq.Bindings.ZMQ_SUB

pattern ZMQ_XPUB :: Zmq_socket_type
pattern ZMQ_XPUB = Zmq_socket_type Libzmq.Bindings.ZMQ_XPUB

pattern ZMQ_XSUB :: Zmq_socket_type
pattern ZMQ_XSUB = Zmq_socket_type Libzmq.Bindings.ZMQ_XSUB

{-# COMPLETE
  ZMQ_CHANNEL,
  ZMQ_CLIENT,
  ZMQ_DEALER,
  ZMQ_DGRAM,
  ZMQ_DISH,
  ZMQ_GATHER,
  ZMQ_PAIR,
  ZMQ_PEER,
  ZMQ_PUB,
  ZMQ_PULL,
  ZMQ_PUSH,
  ZMQ_RADIO,
  ZMQ_REP,
  ZMQ_REQ,
  ZMQ_ROUTER,
  ZMQ_SCATTER,
  ZMQ_SERVER,
  ZMQ_STREAM,
  ZMQ_SUB,
  ZMQ_XPUB,
  ZMQ_XSUB
  #-}
