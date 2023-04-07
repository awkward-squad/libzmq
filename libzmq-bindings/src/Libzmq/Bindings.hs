module Libzmq.Bindings
  ( -- * Functions

    -- ** Error
    zmq_errno,
    zmq_strerror,

    -- ** Version
    zmq_version,

    -- ** Context
    zmq_ctx_new,
    zmq_ctx_term,
    zmq_ctx_shutdown,
    zmq_ctx_set,
    zmq_ctx_get,

    -- ** Message
    zmq_msg_init,
    zmq_msg_init_size,
    zmq_msg_init_data,
    zmq_msg_send,
    zmq_msg_send__unsafe,
    zmq_msg_recv,
    zmq_msg_recv__unsafe,
    zmq_msg_close,
    zmq_msg_move,
    zmq_msg_copy,
    zmq_msg_data,
    zmq_msg_size,
    zmq_msg_more,
    zmq_msg_get,
    zmq_msg_set,
    zmq_msg_gets,

    -- ** Socket
    zmq_socket,
    zmq_close,
    zmq_setsockopt,
    zmq_getsockopt,
    zmq_bind,
    zmq_connect,
    zmq_unbind,
    zmq_disconnect,
    zmq_send,
    zmq_send__unsafe,
    zmq_send_const,
    zmq_send_const__unsafe,
    zmq_recv,
    zmq_recv__unsafe,
    zmq_socket_monitor,

    -- ** Input/output multiplexing
    zmq_poll,
    zmq_poll__unsafe,

    -- ** Message proxying
    zmq_proxy,
    zmq_proxy_steerable,

    -- ** Probe library capabilities
    zmq_has,

    -- ** Encryption
    zmq_z85_encode,
    zmq_z85_decode,
    zmq_curve_keypair,
    zmq_curve_public,

    -- ** Atomic counters
    zmq_atomic_counter_new,
    zmq_atomic_counter_set,
    zmq_atomic_counter_inc,
    zmq_atomic_counter_dec,
    zmq_atomic_counter_value,
    zmq_atomic_counter_destroy,

    -- * Types
    Zmq_fd,
    Zmq_msg,
    Zmq_pollitem (..),

    -- * Constants

    -- ** Errors
    pattern EADDRINUSE,
    pattern EADDRNOTAVAIL,
    pattern EAFNOSUPPORT,
    pattern EAGAIN,
    pattern EBADF,
    pattern ECONNABORTED,
    pattern ECONNREFUSED,
    pattern ECONNRESET,
    pattern EFAULT,
    pattern EFSM,
    pattern EHOSTUNREACH,
    pattern EINPROGRESS,
    pattern EINTR,
    pattern EINVAL,
    pattern EMFILE,
    pattern EMSGSIZE,
    pattern EMTHREAD,
    pattern ENETDOWN,
    pattern ENETRESET,
    pattern ENETUNREACH,
    pattern ENOBUFS,
    pattern ENOCOMPATPROTO,
    pattern ENODEV,
    pattern ENOENT,
    pattern ENOMEM,
    pattern ENOTCONN,
    pattern ENOTSOCK,
    pattern ENOTSUP,
    pattern EPROTONOSUPPORT,
    pattern ETERM,
    pattern ETIMEDOUT,

    -- ** Context options
    pattern ZMQ_IO_THREADS,
    pattern ZMQ_MAX_MSGSZ,
    pattern ZMQ_MAX_SOCKETS,
    pattern ZMQ_MSG_T_SIZE,
    pattern ZMQ_SOCKET_LIMIT,
    pattern ZMQ_THREAD_AFFINITY_CPU_ADD,
    pattern ZMQ_THREAD_AFFINITY_CPU_REMOVE,
    pattern ZMQ_THREAD_NAME_PREFIX,
    pattern ZMQ_THREAD_PRIORITY,
    pattern ZMQ_THREAD_SCHED_POLICY,

    -- ** Default for new contexts
    pattern ZMQ_IO_THREADS_DFLT,
    pattern ZMQ_MAX_SOCKETS_DFLT,
    pattern ZMQ_THREAD_PRIORITY_DFLT,
    pattern ZMQ_THREAD_SCHED_POLICY_DFLT,

    -- ** Socket types
    pattern ZMQ_DEALER,
    pattern ZMQ_PAIR,
    pattern ZMQ_PUB,
    pattern ZMQ_PULL,
    pattern ZMQ_PUSH,
    pattern ZMQ_REP,
    pattern ZMQ_REQ,
    pattern ZMQ_ROUTER,
    pattern ZMQ_STREAM,
    pattern ZMQ_SUB,
    pattern ZMQ_XPUB,
    pattern ZMQ_XSUB,

    -- ** Socket options
    pattern ZMQ_AFFINITY,
    pattern ZMQ_BACKLOG,
    pattern ZMQ_BINDTODEVICE,
    pattern ZMQ_BLOCKY,
    pattern ZMQ_CONFLATE,
    pattern ZMQ_CONNECT_ROUTING_ID,
    pattern ZMQ_CONNECT_TIMEOUT,
    pattern ZMQ_CURVE_PUBLICKEY,
    pattern ZMQ_CURVE_SECRETKEY,
    pattern ZMQ_CURVE_SERVER,
    pattern ZMQ_CURVE_SERVERKEY,
    pattern ZMQ_EVENTS,
    pattern ZMQ_FD,
    pattern ZMQ_GSSAPI_PLAINTEXT,
    pattern ZMQ_GSSAPI_PRINCIPAL,
    pattern ZMQ_GSSAPI_PRINCIPAL_NAMETYPE,
    pattern ZMQ_GSSAPI_SERVER,
    pattern ZMQ_GSSAPI_SERVICE_PRINCIPAL,
    pattern ZMQ_GSSAPI_SERVICE_PRINCIPAL_NAMETYPE,
    pattern ZMQ_HANDSHAKE_IVL,
    pattern ZMQ_HEARTBEAT_IVL,
    pattern ZMQ_HEARTBEAT_TIMEOUT,
    pattern ZMQ_HEARTBEAT_TTL,
    pattern ZMQ_IMMEDIATE,
    pattern ZMQ_INVERT_MATCHING,
    pattern ZMQ_IPV6,
    pattern ZMQ_LAST_ENDPOINT,
    pattern ZMQ_LINGER,
    pattern ZMQ_MAXMSGSIZE,
    pattern ZMQ_MECHANISM,
    pattern ZMQ_MULTICAST_HOPS,
    pattern ZMQ_MULTICAST_MAXTPDU,
    pattern ZMQ_PLAIN_PASSWORD,
    pattern ZMQ_PLAIN_SERVER,
    pattern ZMQ_PLAIN_USERNAME,
    pattern ZMQ_PROBE_ROUTER,
    pattern ZMQ_RATE,
    pattern ZMQ_RCVBUF,
    pattern ZMQ_RCVHWM,
    pattern ZMQ_RCVMORE,
    pattern ZMQ_RCVTIMEO,
    pattern ZMQ_RECONNECT_IVL,
    pattern ZMQ_RECONNECT_IVL_MAX,
    pattern ZMQ_RECOVERY_IVL,
    pattern ZMQ_REQ_CORRELATE,
    pattern ZMQ_REQ_RELAXED,
    pattern ZMQ_ROUTER_HANDOVER,
    pattern ZMQ_ROUTER_MANDATORY,
    pattern ZMQ_ROUTER_RAW,
    pattern ZMQ_ROUTING_ID,
    pattern ZMQ_SNDBUF,
    pattern ZMQ_SNDHWM,
    pattern ZMQ_SNDTIMEO,
    pattern ZMQ_SOCKS_PROXY,
    pattern ZMQ_STREAM_NOTIFY,
    pattern ZMQ_SUBSCRIBE,
    pattern ZMQ_TCP_KEEPALIVE,
    pattern ZMQ_TCP_KEEPALIVE_CNT,
    pattern ZMQ_TCP_KEEPALIVE_IDLE,
    pattern ZMQ_TCP_KEEPALIVE_INTVL,
    pattern ZMQ_TCP_MAXRT,
    pattern ZMQ_THREAD_SAFE,
    pattern ZMQ_TOS,
    pattern ZMQ_TYPE,
    pattern ZMQ_UNSUBSCRIBE,
    pattern ZMQ_USE_FD,
    pattern ZMQ_VMCI_BUFFER_MAX_SIZE,
    pattern ZMQ_VMCI_BUFFER_MIN_SIZE,
    pattern ZMQ_VMCI_BUFFER_SIZE,
    pattern ZMQ_VMCI_CONNECT_TIMEOUT,
    pattern ZMQ_XPUB_MANUAL,
    pattern ZMQ_XPUB_NODROP,
    pattern ZMQ_XPUB_VERBOSE,
    pattern ZMQ_XPUB_VERBOSER,
    pattern ZMQ_XPUB_WELCOME_MSG,
    pattern ZMQ_ZAP_DOMAIN,

    -- ** Message options
    pattern ZMQ_MORE,
    pattern ZMQ_SHARED,

    -- ** Send/recv options
    pattern ZMQ_DONTWAIT,
    pattern ZMQ_SNDMORE,

    -- ** Security mechanisms
    pattern ZMQ_CURVE,
    pattern ZMQ_GSSAPI,
    pattern ZMQ_NULL,
    pattern ZMQ_PLAIN,

    -- ** RADIO-DISH protocol
    pattern ZMQ_GROUP_MAX_LENGTH,

    -- ** GSSAPI principal name types
    pattern ZMQ_GSSAPI_NT_HOSTBASED,
    pattern ZMQ_GSSAPI_NT_KRB5_PRINCIPAL,
    pattern ZMQ_GSSAPI_NT_USER_NAME,

    -- ** Socket transport events (TCP, IPC and TIPC only)
    pattern ZMQ_EVENT_ACCEPTED,
    pattern ZMQ_EVENT_ACCEPT_FAILED,
    pattern ZMQ_EVENT_ALL,
    pattern ZMQ_EVENT_BIND_FAILED,
    pattern ZMQ_EVENT_CLOSED,
    pattern ZMQ_EVENT_CLOSE_FAILED,
    pattern ZMQ_EVENT_CONNECTED,
    pattern ZMQ_EVENT_CONNECT_DELAYED,
    pattern ZMQ_EVENT_CONNECT_RETRIED,
    pattern ZMQ_EVENT_DISCONNECTED,
    pattern ZMQ_EVENT_HANDSHAKE_FAILED_AUTH,
    pattern ZMQ_EVENT_HANDSHAKE_FAILED_NO_DETAIL,
    pattern ZMQ_EVENT_HANDSHAKE_FAILED_PROTOCOL,
    pattern ZMQ_EVENT_HANDSHAKE_SUCCEEDED,
    pattern ZMQ_EVENT_LISTENING,
    pattern ZMQ_EVENT_MONITOR_STOPPED,

    -- ** Protocol errors
    pattern ZMQ_PROTOCOL_ERROR_WS_UNSPECIFIED,
    pattern ZMQ_PROTOCOL_ERROR_ZAP_BAD_REQUEST_ID,
    pattern ZMQ_PROTOCOL_ERROR_ZAP_BAD_VERSION,
    pattern ZMQ_PROTOCOL_ERROR_ZAP_INVALID_METADATA,
    pattern ZMQ_PROTOCOL_ERROR_ZAP_INVALID_STATUS_CODE,
    pattern ZMQ_PROTOCOL_ERROR_ZAP_MALFORMED_REPLY,
    pattern ZMQ_PROTOCOL_ERROR_ZAP_UNSPECIFIED,
    pattern ZMQ_PROTOCOL_ERROR_ZMTP_CRYPTOGRAPHIC,
    pattern ZMQ_PROTOCOL_ERROR_ZMTP_INVALID_METADATA,
    pattern ZMQ_PROTOCOL_ERROR_ZMTP_INVALID_SEQUENCE,
    pattern ZMQ_PROTOCOL_ERROR_ZMTP_KEY_EXCHANGE,
    pattern ZMQ_PROTOCOL_ERROR_ZMTP_MALFORMED_COMMAND_ERROR,
    pattern ZMQ_PROTOCOL_ERROR_ZMTP_MALFORMED_COMMAND_HELLO,
    pattern ZMQ_PROTOCOL_ERROR_ZMTP_MALFORMED_COMMAND_INITIATE,
    pattern ZMQ_PROTOCOL_ERROR_ZMTP_MALFORMED_COMMAND_MESSAGE,
    pattern ZMQ_PROTOCOL_ERROR_ZMTP_MALFORMED_COMMAND_READY,
    pattern ZMQ_PROTOCOL_ERROR_ZMTP_MALFORMED_COMMAND_UNSPECIFIED,
    pattern ZMQ_PROTOCOL_ERROR_ZMTP_MALFORMED_COMMAND_WELCOME,
    pattern ZMQ_PROTOCOL_ERROR_ZMTP_MECHANISM_MISMATCH,
    pattern ZMQ_PROTOCOL_ERROR_ZMTP_UNEXPECTED_COMMAND,
    pattern ZMQ_PROTOCOL_ERROR_ZMTP_UNSPECIFIED,

    -- ** Input/output multiplexing
    pattern ZMQ_POLLIN,
    pattern ZMQ_POLLOUT,
    pattern ZMQ_POLLERR,
    pattern ZMQ_POLLPRI,

    -- * Draft constants

    -- ** Socket types
    pattern ZMQ_CHANNEL,
    pattern ZMQ_CLIENT,
    pattern ZMQ_DGRAM,
    pattern ZMQ_DISH,
    pattern ZMQ_GATHER,
    pattern ZMQ_PEER,
    pattern ZMQ_RADIO,
    pattern ZMQ_SCATTER,
    pattern ZMQ_SERVER,

    -- ** Socket options
    pattern ZMQ_DISCONNECT_MSG,
    pattern ZMQ_HELLO_MSG,
    pattern ZMQ_IN_BATCH_SIZE,
    pattern ZMQ_LOOPBACK_FASTPATH,
    pattern ZMQ_METADATA,
    pattern ZMQ_MULTICAST_LOOP,
    pattern ZMQ_ONLY_FIRST_SUBSCRIBE,
    pattern ZMQ_OUT_BATCH_SIZE,
    pattern ZMQ_PRIORITY,
    pattern ZMQ_RECONNECT_STOP,
    pattern ZMQ_ROUTER_NOTIFY,
    pattern ZMQ_SOCKS_PASSWORD,
    pattern ZMQ_SOCKS_USERNAME,
    pattern ZMQ_WSS_CERT_PEM,
    pattern ZMQ_WSS_HOSTNAME,
    pattern ZMQ_WSS_KEY_PEM,
    pattern ZMQ_WSS_TRUST_PEM,
    pattern ZMQ_WSS_TRUST_SYSTEM,
    pattern ZMQ_XPUB_MANUAL_LAST_VALUE,
    pattern ZMQ_ZAP_ENFORCE_DOMAIN,

    -- ** @ZMQ_RECONNECT_STOP@ options
    -- pattern ZMQ_RECONNECT_STOP_AFTER_DISCONNECT,
    pattern ZMQ_RECONNECT_STOP_CONN_REFUSED,
    pattern ZMQ_RECONNECT_STOP_HANDSHAKE_FAILED,
  )
where

import Data.Coerce (coerce)
import Foreign.C (CInt)
import Foreign.C.Error (Errno (Errno), eAGAIN, eBADF, eFAULT, eINTR, eINVAL, eMFILE, eNODEV, eNOENT, eNOMEM)
import Libzmq.Bindings.Internal.Constants
import Libzmq.Bindings.Internal.Constants2
import Libzmq.Bindings.Internal.Functions
import Libzmq.Bindings.Internal.Types

------------------------------------------------------------------------------------------------------------------------
-- Errors

pattern EADDRINUSE :: CInt
pattern EADDRINUSE <- ((== _EADDRINUSE) -> True)
  where
    EADDRINUSE = _EADDRINUSE

pattern EADDRNOTAVAIL :: CInt
pattern EADDRNOTAVAIL <- ((== _EADDRNOTAVAIL) -> True)
  where
    EADDRNOTAVAIL = _EADDRNOTAVAIL

pattern EAFNOSUPPORT :: CInt
pattern EAFNOSUPPORT <- ((== _EAFNOSUPPORT) -> True)
  where
    EAFNOSUPPORT = _EAFNOSUPPORT

pattern EAGAIN :: CInt
pattern EAGAIN <- ((== coerce eAGAIN) -> True)
  where
    EAGAIN = coerce eAGAIN

pattern EBADF :: CInt
pattern EBADF <- ((== coerce eBADF) -> True)
  where
    EBADF = coerce eBADF

pattern ECONNABORTED :: CInt
pattern ECONNABORTED <- ((== _ECONNABORTED) -> True)
  where
    ECONNABORTED = _ECONNABORTED

pattern ECONNREFUSED :: CInt
pattern ECONNREFUSED <- ((== _ECONNREFUSED) -> True)
  where
    ECONNREFUSED = _ECONNREFUSED

pattern ECONNRESET :: CInt
pattern ECONNRESET <- ((== _ECONNRESET) -> True)
  where
    ECONNRESET = _ECONNRESET

pattern EFAULT :: CInt
pattern EFAULT <- ((== coerce eFAULT) -> True)
  where
    EFAULT = coerce eFAULT

pattern EHOSTUNREACH :: CInt
pattern EHOSTUNREACH <- ((== _EHOSTUNREACH) -> True)
  where
    EHOSTUNREACH = _EHOSTUNREACH

pattern EINPROGRESS :: CInt
pattern EINPROGRESS <- ((== _EINPROGRESS) -> True)
  where
    EINPROGRESS = _EINPROGRESS

pattern EINTR :: CInt
pattern EINTR <- ((== coerce eINTR) -> True)
  where
    EINTR = coerce eINTR

pattern EINVAL :: CInt
pattern EINVAL <- ((== coerce eINVAL) -> True)
  where
    EINVAL = coerce eINVAL

pattern EMFILE :: CInt
pattern EMFILE <- ((== coerce eMFILE) -> True)
  where
    EMFILE = coerce eMFILE

pattern EMSGSIZE :: CInt
pattern EMSGSIZE <- ((== _EMSGSIZE) -> True)
  where
    EMSGSIZE = _EMSGSIZE

pattern ENETDOWN :: CInt
pattern ENETDOWN <- ((== _ENETDOWN) -> True)
  where
    ENETDOWN = _ENETDOWN

pattern ENETRESET :: CInt
pattern ENETRESET <- ((== _ENETRESET) -> True)
  where
    ENETRESET = _ENETRESET

pattern ENETUNREACH :: CInt
pattern ENETUNREACH <- ((== _ENETUNREACH) -> True)
  where
    ENETUNREACH = _ENETUNREACH

pattern ENOBUFS :: CInt
pattern ENOBUFS <- ((== _ENOBUFS) -> True)
  where
    ENOBUFS = _ENOBUFS

pattern ENODEV :: CInt
pattern ENODEV <- ((== coerce eNODEV) -> True)
  where
    ENODEV = coerce eNODEV

pattern ENOENT :: CInt
pattern ENOENT <- ((== coerce eNOENT) -> True)
  where
    ENOENT = coerce eNOENT

pattern ENOMEM :: CInt
pattern ENOMEM <- ((== coerce eNOMEM) -> True)
  where
    ENOMEM = coerce eNOMEM

pattern ENOTCONN :: CInt
pattern ENOTCONN <- ((== _ENOTCONN) -> True)
  where
    ENOTCONN = _ENOTCONN

pattern ENOTSOCK :: CInt
pattern ENOTSOCK <- ((== _ENOTSOCK) -> True)
  where
    ENOTSOCK = _ENOTSOCK

pattern ENOTSUP :: CInt
pattern ENOTSUP <- ((== _ENOTSUP) -> True)
  where
    ENOTSUP = _ENOTSUP

pattern EPROTONOSUPPORT :: CInt
pattern EPROTONOSUPPORT <- ((== _EPROTONOSUPPORT) -> True)
  where
    EPROTONOSUPPORT = _EPROTONOSUPPORT

pattern ETIMEDOUT :: CInt
pattern ETIMEDOUT <- ((== _ETIMEDOUT) -> True)
  where
    ETIMEDOUT = _ETIMEDOUT
