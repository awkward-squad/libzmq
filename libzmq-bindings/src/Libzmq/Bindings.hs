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
    pattern ECONNABORTED,
    pattern ECONNREFUSED,
    pattern ECONNRESET,
    pattern EFSM,
    pattern EHOSTUNREACH,
    pattern EINPROGRESS,
    pattern EMSGSIZE,
    pattern EMTHREAD,
    pattern ENETDOWN,
    pattern ENETRESET,
    pattern ENETUNREACH,
    pattern ENOBUFS,
    pattern ENOCOMPATPROTO,
    pattern ENOTCONN,
    pattern ENOTSOCK,
    pattern ENOTSUP,
    pattern EPROTONOSUPPORT,
    pattern ETERM,
    pattern ETIMEDOUT,
    --- *** Standard POSIX errors
    pattern EAGAIN,
    pattern EBADF,
    pattern EFAULT,
    pattern EINTR,
    pattern EINVAL,
    pattern EMFILE,
    pattern ENODEV,
    pattern ENOENT,
    pattern ENOMEM,

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

    -- ** Probe library capabilities
    pattern ZMQ_HAS_CAPABILITIES,
  )
where

import Data.Coerce (coerce)
import Foreign.C (CInt, CShort)
import Foreign.C.Error (Errno (Errno), eAGAIN, eBADF, eFAULT, eINTR, eINVAL, eMFILE, eNODEV, eNOENT, eNOMEM)
import Libzmq.Bindings.Internal.Constants
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

pattern EFSM :: CInt
pattern EFSM <- ((== _EFSM) -> True)
  where
    EFSM = _EFSM

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

pattern EMTHREAD :: CInt
pattern EMTHREAD <- ((== _EMTHREAD) -> True)
  where
    EMTHREAD = _EMTHREAD

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

pattern ENOCOMPATPROTO :: CInt
pattern ENOCOMPATPROTO <- ((== _ENOCOMPATPROTO) -> True)
  where
    ENOCOMPATPROTO = _ENOCOMPATPROTO

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

pattern ETERM :: CInt
pattern ETERM <- ((== _ETERM) -> True)
  where
    ETERM = _ETERM

pattern ETIMEDOUT :: CInt
pattern ETIMEDOUT <- ((== _ETIMEDOUT) -> True)
  where
    ETIMEDOUT = _ETIMEDOUT

------------------------------------------------------------------------------------------------------------------------
-- Context options

pattern ZMQ_IO_THREADS :: CInt
pattern ZMQ_IO_THREADS <- ((== _ZMQ_IO_THREADS) -> True)
  where
    ZMQ_IO_THREADS = _ZMQ_IO_THREADS

pattern ZMQ_MAX_MSGSZ :: CInt
pattern ZMQ_MAX_MSGSZ <- ((== _ZMQ_MAX_MSGSZ) -> True)
  where
    ZMQ_MAX_MSGSZ = _ZMQ_MAX_MSGSZ

pattern ZMQ_MAX_SOCKETS :: CInt
pattern ZMQ_MAX_SOCKETS <- ((== _ZMQ_MAX_SOCKETS) -> True)
  where
    ZMQ_MAX_SOCKETS = _ZMQ_MAX_SOCKETS

pattern ZMQ_MSG_T_SIZE :: CInt
pattern ZMQ_MSG_T_SIZE <- ((== _ZMQ_MSG_T_SIZE) -> True)
  where
    ZMQ_MSG_T_SIZE = _ZMQ_MSG_T_SIZE

pattern ZMQ_SOCKET_LIMIT :: CInt
pattern ZMQ_SOCKET_LIMIT <- ((== _ZMQ_SOCKET_LIMIT) -> True)
  where
    ZMQ_SOCKET_LIMIT = _ZMQ_SOCKET_LIMIT

pattern ZMQ_THREAD_AFFINITY_CPU_ADD :: CInt
pattern ZMQ_THREAD_AFFINITY_CPU_ADD <- ((== _ZMQ_THREAD_AFFINITY_CPU_ADD) -> True)
  where
    ZMQ_THREAD_AFFINITY_CPU_ADD = _ZMQ_THREAD_AFFINITY_CPU_ADD

pattern ZMQ_THREAD_AFFINITY_CPU_REMOVE :: CInt
pattern ZMQ_THREAD_AFFINITY_CPU_REMOVE <- ((== _ZMQ_THREAD_AFFINITY_CPU_REMOVE) -> True)
  where
    ZMQ_THREAD_AFFINITY_CPU_REMOVE = _ZMQ_THREAD_AFFINITY_CPU_REMOVE

pattern ZMQ_THREAD_NAME_PREFIX :: CInt
pattern ZMQ_THREAD_NAME_PREFIX <- ((== _ZMQ_THREAD_NAME_PREFIX) -> True)
  where
    ZMQ_THREAD_NAME_PREFIX = _ZMQ_THREAD_NAME_PREFIX

pattern ZMQ_THREAD_PRIORITY :: CInt
pattern ZMQ_THREAD_PRIORITY <- ((== _ZMQ_THREAD_PRIORITY) -> True)
  where
    ZMQ_THREAD_PRIORITY = _ZMQ_THREAD_PRIORITY

pattern ZMQ_THREAD_SCHED_POLICY :: CInt
pattern ZMQ_THREAD_SCHED_POLICY <- ((== _ZMQ_THREAD_SCHED_POLICY) -> True)
  where
    ZMQ_THREAD_SCHED_POLICY = _ZMQ_THREAD_SCHED_POLICY

------------------------------------------------------------------------------------------------------------------------
-- Default for new contexts

pattern ZMQ_IO_THREADS_DFLT :: CInt
pattern ZMQ_IO_THREADS_DFLT <- ((== _ZMQ_IO_THREADS_DFLT) -> True)
  where
    ZMQ_IO_THREADS_DFLT = _ZMQ_IO_THREADS_DFLT

pattern ZMQ_MAX_SOCKETS_DFLT :: CInt
pattern ZMQ_MAX_SOCKETS_DFLT <- ((== _ZMQ_MAX_SOCKETS_DFLT) -> True)
  where
    ZMQ_MAX_SOCKETS_DFLT = _ZMQ_MAX_SOCKETS_DFLT

pattern ZMQ_THREAD_PRIORITY_DFLT :: CInt
pattern ZMQ_THREAD_PRIORITY_DFLT <- ((== _ZMQ_THREAD_PRIORITY_DFLT) -> True)
  where
    ZMQ_THREAD_PRIORITY_DFLT = _ZMQ_THREAD_PRIORITY_DFLT

pattern ZMQ_THREAD_SCHED_POLICY_DFLT :: CInt
pattern ZMQ_THREAD_SCHED_POLICY_DFLT <- ((== _ZMQ_THREAD_SCHED_POLICY_DFLT) -> True)
  where
    ZMQ_THREAD_SCHED_POLICY_DFLT = _ZMQ_THREAD_SCHED_POLICY_DFLT

------------------------------------------------------------------------------------------------------------------------
-- Socket types

pattern ZMQ_DEALER :: CInt
pattern ZMQ_DEALER <- ((== _ZMQ_DEALER) -> True)
  where
    ZMQ_DEALER = _ZMQ_DEALER

pattern ZMQ_PAIR :: CInt
pattern ZMQ_PAIR <- ((== _ZMQ_PAIR) -> True)
  where
    ZMQ_PAIR = _ZMQ_PAIR

pattern ZMQ_PUB :: CInt
pattern ZMQ_PUB <- ((== _ZMQ_PUB) -> True)
  where
    ZMQ_PUB = _ZMQ_PUB

pattern ZMQ_PULL :: CInt
pattern ZMQ_PULL <- ((== _ZMQ_PULL) -> True)
  where
    ZMQ_PULL = _ZMQ_PULL

pattern ZMQ_PUSH :: CInt
pattern ZMQ_PUSH <- ((== _ZMQ_PUSH) -> True)
  where
    ZMQ_PUSH = _ZMQ_PUSH

pattern ZMQ_REP :: CInt
pattern ZMQ_REP <- ((== _ZMQ_REP) -> True)
  where
    ZMQ_REP = _ZMQ_REP

pattern ZMQ_REQ :: CInt
pattern ZMQ_REQ <- ((== _ZMQ_REQ) -> True)
  where
    ZMQ_REQ = _ZMQ_REQ

pattern ZMQ_ROUTER :: CInt
pattern ZMQ_ROUTER <- ((== _ZMQ_ROUTER) -> True)
  where
    ZMQ_ROUTER = _ZMQ_ROUTER

pattern ZMQ_STREAM :: CInt
pattern ZMQ_STREAM <- ((== _ZMQ_STREAM) -> True)
  where
    ZMQ_STREAM = _ZMQ_STREAM

pattern ZMQ_SUB :: CInt
pattern ZMQ_SUB <- ((== _ZMQ_SUB) -> True)
  where
    ZMQ_SUB = _ZMQ_SUB

pattern ZMQ_XPUB :: CInt
pattern ZMQ_XPUB <- ((== _ZMQ_XPUB) -> True)
  where
    ZMQ_XPUB = _ZMQ_XPUB

pattern ZMQ_XSUB :: CInt
pattern ZMQ_XSUB <- ((== _ZMQ_XSUB) -> True)
  where
    ZMQ_XSUB = _ZMQ_XSUB

------------------------------------------------------------------------------------------------------------------------
-- Socket options

pattern ZMQ_AFFINITY :: CInt
pattern ZMQ_AFFINITY <- ((== _ZMQ_AFFINITY) -> True)
  where
    ZMQ_AFFINITY = _ZMQ_AFFINITY

pattern ZMQ_BACKLOG :: CInt
pattern ZMQ_BACKLOG <- ((== _ZMQ_BACKLOG) -> True)
  where
    ZMQ_BACKLOG = _ZMQ_BACKLOG

pattern ZMQ_BINDTODEVICE :: CInt
pattern ZMQ_BINDTODEVICE <- ((== _ZMQ_BINDTODEVICE) -> True)
  where
    ZMQ_BINDTODEVICE = _ZMQ_BINDTODEVICE

pattern ZMQ_BLOCKY :: CInt
pattern ZMQ_BLOCKY <- ((== _ZMQ_BLOCKY) -> True)
  where
    ZMQ_BLOCKY = _ZMQ_BLOCKY

pattern ZMQ_CONFLATE :: CInt
pattern ZMQ_CONFLATE <- ((== _ZMQ_CONFLATE) -> True)
  where
    ZMQ_CONFLATE = _ZMQ_CONFLATE

pattern ZMQ_CONNECT_ROUTING_ID :: CInt
pattern ZMQ_CONNECT_ROUTING_ID <- ((== _ZMQ_CONNECT_ROUTING_ID) -> True)
  where
    ZMQ_CONNECT_ROUTING_ID = _ZMQ_CONNECT_ROUTING_ID

pattern ZMQ_CONNECT_TIMEOUT :: CInt
pattern ZMQ_CONNECT_TIMEOUT <- ((== _ZMQ_CONNECT_TIMEOUT) -> True)
  where
    ZMQ_CONNECT_TIMEOUT = _ZMQ_CONNECT_TIMEOUT

pattern ZMQ_CURVE_PUBLICKEY :: CInt
pattern ZMQ_CURVE_PUBLICKEY <- ((== _ZMQ_CURVE_PUBLICKEY) -> True)
  where
    ZMQ_CURVE_PUBLICKEY = _ZMQ_CURVE_PUBLICKEY

pattern ZMQ_CURVE_SECRETKEY :: CInt
pattern ZMQ_CURVE_SECRETKEY <- ((== _ZMQ_CURVE_SECRETKEY) -> True)
  where
    ZMQ_CURVE_SECRETKEY = _ZMQ_CURVE_SECRETKEY

pattern ZMQ_CURVE_SERVER :: CInt
pattern ZMQ_CURVE_SERVER <- ((== _ZMQ_CURVE_SERVER) -> True)
  where
    ZMQ_CURVE_SERVER = _ZMQ_CURVE_SERVER

pattern ZMQ_CURVE_SERVERKEY :: CInt
pattern ZMQ_CURVE_SERVERKEY <- ((== _ZMQ_CURVE_SERVERKEY) -> True)
  where
    ZMQ_CURVE_SERVERKEY = _ZMQ_CURVE_SERVERKEY

pattern ZMQ_EVENTS :: CInt
pattern ZMQ_EVENTS <- ((== _ZMQ_EVENTS) -> True)
  where
    ZMQ_EVENTS = _ZMQ_EVENTS

pattern ZMQ_FD :: CInt
pattern ZMQ_FD <- ((== _ZMQ_FD) -> True)
  where
    ZMQ_FD = _ZMQ_FD

pattern ZMQ_GSSAPI_PLAINTEXT :: CInt
pattern ZMQ_GSSAPI_PLAINTEXT <- ((== _ZMQ_GSSAPI_PLAINTEXT) -> True)
  where
    ZMQ_GSSAPI_PLAINTEXT = _ZMQ_GSSAPI_PLAINTEXT

pattern ZMQ_GSSAPI_PRINCIPAL :: CInt
pattern ZMQ_GSSAPI_PRINCIPAL <- ((== _ZMQ_GSSAPI_PRINCIPAL) -> True)
  where
    ZMQ_GSSAPI_PRINCIPAL = _ZMQ_GSSAPI_PRINCIPAL

pattern ZMQ_GSSAPI_PRINCIPAL_NAMETYPE :: CInt
pattern ZMQ_GSSAPI_PRINCIPAL_NAMETYPE <- ((== _ZMQ_GSSAPI_PRINCIPAL_NAMETYPE) -> True)
  where
    ZMQ_GSSAPI_PRINCIPAL_NAMETYPE = _ZMQ_GSSAPI_PRINCIPAL_NAMETYPE

pattern ZMQ_GSSAPI_SERVER :: CInt
pattern ZMQ_GSSAPI_SERVER <- ((== _ZMQ_GSSAPI_SERVER) -> True)
  where
    ZMQ_GSSAPI_SERVER = _ZMQ_GSSAPI_SERVER

pattern ZMQ_GSSAPI_SERVICE_PRINCIPAL :: CInt
pattern ZMQ_GSSAPI_SERVICE_PRINCIPAL <- ((== _ZMQ_GSSAPI_SERVICE_PRINCIPAL) -> True)
  where
    ZMQ_GSSAPI_SERVICE_PRINCIPAL = _ZMQ_GSSAPI_SERVICE_PRINCIPAL

pattern ZMQ_GSSAPI_SERVICE_PRINCIPAL_NAMETYPE :: CInt
pattern ZMQ_GSSAPI_SERVICE_PRINCIPAL_NAMETYPE <- ((== _ZMQ_GSSAPI_SERVICE_PRINCIPAL_NAMETYPE) -> True)
  where
    ZMQ_GSSAPI_SERVICE_PRINCIPAL_NAMETYPE = _ZMQ_GSSAPI_SERVICE_PRINCIPAL_NAMETYPE

pattern ZMQ_HANDSHAKE_IVL :: CInt
pattern ZMQ_HANDSHAKE_IVL <- ((== _ZMQ_HANDSHAKE_IVL) -> True)
  where
    ZMQ_HANDSHAKE_IVL = _ZMQ_HANDSHAKE_IVL

pattern ZMQ_HEARTBEAT_IVL :: CInt
pattern ZMQ_HEARTBEAT_IVL <- ((== _ZMQ_HEARTBEAT_IVL) -> True)
  where
    ZMQ_HEARTBEAT_IVL = _ZMQ_HEARTBEAT_IVL

pattern ZMQ_HEARTBEAT_TIMEOUT :: CInt
pattern ZMQ_HEARTBEAT_TIMEOUT <- ((== _ZMQ_HEARTBEAT_TIMEOUT) -> True)
  where
    ZMQ_HEARTBEAT_TIMEOUT = _ZMQ_HEARTBEAT_TIMEOUT

pattern ZMQ_HEARTBEAT_TTL :: CInt
pattern ZMQ_HEARTBEAT_TTL <- ((== _ZMQ_HEARTBEAT_TTL) -> True)
  where
    ZMQ_HEARTBEAT_TTL = _ZMQ_HEARTBEAT_TTL

pattern ZMQ_IMMEDIATE :: CInt
pattern ZMQ_IMMEDIATE <- ((== _ZMQ_IMMEDIATE) -> True)
  where
    ZMQ_IMMEDIATE = _ZMQ_IMMEDIATE

pattern ZMQ_INVERT_MATCHING :: CInt
pattern ZMQ_INVERT_MATCHING <- ((== _ZMQ_INVERT_MATCHING) -> True)
  where
    ZMQ_INVERT_MATCHING = _ZMQ_INVERT_MATCHING

pattern ZMQ_IPV6 :: CInt
pattern ZMQ_IPV6 <- ((== _ZMQ_IPV6) -> True)
  where
    ZMQ_IPV6 = _ZMQ_IPV6

pattern ZMQ_LAST_ENDPOINT :: CInt
pattern ZMQ_LAST_ENDPOINT <- ((== _ZMQ_LAST_ENDPOINT) -> True)
  where
    ZMQ_LAST_ENDPOINT = _ZMQ_LAST_ENDPOINT

pattern ZMQ_LINGER :: CInt
pattern ZMQ_LINGER <- ((== _ZMQ_LINGER) -> True)
  where
    ZMQ_LINGER = _ZMQ_LINGER

pattern ZMQ_MAXMSGSIZE :: CInt
pattern ZMQ_MAXMSGSIZE <- ((== _ZMQ_MAXMSGSIZE) -> True)
  where
    ZMQ_MAXMSGSIZE = _ZMQ_MAXMSGSIZE

pattern ZMQ_MECHANISM :: CInt
pattern ZMQ_MECHANISM <- ((== _ZMQ_MECHANISM) -> True)
  where
    ZMQ_MECHANISM = _ZMQ_MECHANISM

pattern ZMQ_MULTICAST_HOPS :: CInt
pattern ZMQ_MULTICAST_HOPS <- ((== _ZMQ_MULTICAST_HOPS) -> True)
  where
    ZMQ_MULTICAST_HOPS = _ZMQ_MULTICAST_HOPS

pattern ZMQ_MULTICAST_MAXTPDU :: CInt
pattern ZMQ_MULTICAST_MAXTPDU <- ((== _ZMQ_MULTICAST_MAXTPDU) -> True)
  where
    ZMQ_MULTICAST_MAXTPDU = _ZMQ_MULTICAST_MAXTPDU

pattern ZMQ_PLAIN_PASSWORD :: CInt
pattern ZMQ_PLAIN_PASSWORD <- ((== _ZMQ_PLAIN_PASSWORD) -> True)
  where
    ZMQ_PLAIN_PASSWORD = _ZMQ_PLAIN_PASSWORD

pattern ZMQ_PLAIN_SERVER :: CInt
pattern ZMQ_PLAIN_SERVER <- ((== _ZMQ_PLAIN_SERVER) -> True)
  where
    ZMQ_PLAIN_SERVER = _ZMQ_PLAIN_SERVER

pattern ZMQ_PLAIN_USERNAME :: CInt
pattern ZMQ_PLAIN_USERNAME <- ((== _ZMQ_PLAIN_USERNAME) -> True)
  where
    ZMQ_PLAIN_USERNAME = _ZMQ_PLAIN_USERNAME

pattern ZMQ_PROBE_ROUTER :: CInt
pattern ZMQ_PROBE_ROUTER <- ((== _ZMQ_PROBE_ROUTER) -> True)
  where
    ZMQ_PROBE_ROUTER = _ZMQ_PROBE_ROUTER

pattern ZMQ_RATE :: CInt
pattern ZMQ_RATE <- ((== _ZMQ_RATE) -> True)
  where
    ZMQ_RATE = _ZMQ_RATE

pattern ZMQ_RCVBUF :: CInt
pattern ZMQ_RCVBUF <- ((== _ZMQ_RCVBUF) -> True)
  where
    ZMQ_RCVBUF = _ZMQ_RCVBUF

pattern ZMQ_RCVHWM :: CInt
pattern ZMQ_RCVHWM <- ((== _ZMQ_RCVHWM) -> True)
  where
    ZMQ_RCVHWM = _ZMQ_RCVHWM

pattern ZMQ_RCVMORE :: CInt
pattern ZMQ_RCVMORE <- ((== _ZMQ_RCVMORE) -> True)
  where
    ZMQ_RCVMORE = _ZMQ_RCVMORE

pattern ZMQ_RCVTIMEO :: CInt
pattern ZMQ_RCVTIMEO <- ((== _ZMQ_RCVTIMEO) -> True)
  where
    ZMQ_RCVTIMEO = _ZMQ_RCVTIMEO

pattern ZMQ_RECONNECT_IVL :: CInt
pattern ZMQ_RECONNECT_IVL <- ((== _ZMQ_RECONNECT_IVL) -> True)
  where
    ZMQ_RECONNECT_IVL = _ZMQ_RECONNECT_IVL

pattern ZMQ_RECONNECT_IVL_MAX :: CInt
pattern ZMQ_RECONNECT_IVL_MAX <- ((== _ZMQ_RECONNECT_IVL_MAX) -> True)
  where
    ZMQ_RECONNECT_IVL_MAX = _ZMQ_RECONNECT_IVL_MAX

pattern ZMQ_RECOVERY_IVL :: CInt
pattern ZMQ_RECOVERY_IVL <- ((== _ZMQ_RECOVERY_IVL) -> True)
  where
    ZMQ_RECOVERY_IVL = _ZMQ_RECOVERY_IVL

pattern ZMQ_REQ_CORRELATE :: CInt
pattern ZMQ_REQ_CORRELATE <- ((== _ZMQ_REQ_CORRELATE) -> True)
  where
    ZMQ_REQ_CORRELATE = _ZMQ_REQ_CORRELATE

pattern ZMQ_REQ_RELAXED :: CInt
pattern ZMQ_REQ_RELAXED <- ((== _ZMQ_REQ_RELAXED) -> True)
  where
    ZMQ_REQ_RELAXED = _ZMQ_REQ_RELAXED

pattern ZMQ_ROUTER_HANDOVER :: CInt
pattern ZMQ_ROUTER_HANDOVER <- ((== _ZMQ_ROUTER_HANDOVER) -> True)
  where
    ZMQ_ROUTER_HANDOVER = _ZMQ_ROUTER_HANDOVER

pattern ZMQ_ROUTER_MANDATORY :: CInt
pattern ZMQ_ROUTER_MANDATORY <- ((== _ZMQ_ROUTER_MANDATORY) -> True)
  where
    ZMQ_ROUTER_MANDATORY = _ZMQ_ROUTER_MANDATORY

pattern ZMQ_ROUTER_RAW :: CInt
pattern ZMQ_ROUTER_RAW <- ((== _ZMQ_ROUTER_RAW) -> True)
  where
    ZMQ_ROUTER_RAW = _ZMQ_ROUTER_RAW

pattern ZMQ_ROUTING_ID :: CInt
pattern ZMQ_ROUTING_ID <- ((== _ZMQ_ROUTING_ID) -> True)
  where
    ZMQ_ROUTING_ID = _ZMQ_ROUTING_ID

pattern ZMQ_SNDBUF :: CInt
pattern ZMQ_SNDBUF <- ((== _ZMQ_SNDBUF) -> True)
  where
    ZMQ_SNDBUF = _ZMQ_SNDBUF

pattern ZMQ_SNDHWM :: CInt
pattern ZMQ_SNDHWM <- ((== _ZMQ_SNDHWM) -> True)
  where
    ZMQ_SNDHWM = _ZMQ_SNDHWM

pattern ZMQ_SNDTIMEO :: CInt
pattern ZMQ_SNDTIMEO <- ((== _ZMQ_SNDTIMEO) -> True)
  where
    ZMQ_SNDTIMEO = _ZMQ_SNDTIMEO

pattern ZMQ_SOCKS_PROXY :: CInt
pattern ZMQ_SOCKS_PROXY <- ((== _ZMQ_SOCKS_PROXY) -> True)
  where
    ZMQ_SOCKS_PROXY = _ZMQ_SOCKS_PROXY

pattern ZMQ_STREAM_NOTIFY :: CInt
pattern ZMQ_STREAM_NOTIFY <- ((== _ZMQ_STREAM_NOTIFY) -> True)
  where
    ZMQ_STREAM_NOTIFY = _ZMQ_STREAM_NOTIFY

pattern ZMQ_SUBSCRIBE :: CInt
pattern ZMQ_SUBSCRIBE <- ((== _ZMQ_SUBSCRIBE) -> True)
  where
    ZMQ_SUBSCRIBE = _ZMQ_SUBSCRIBE

pattern ZMQ_TCP_KEEPALIVE :: CInt
pattern ZMQ_TCP_KEEPALIVE <- ((== _ZMQ_TCP_KEEPALIVE) -> True)
  where
    ZMQ_TCP_KEEPALIVE = _ZMQ_TCP_KEEPALIVE

pattern ZMQ_TCP_KEEPALIVE_CNT :: CInt
pattern ZMQ_TCP_KEEPALIVE_CNT <- ((== _ZMQ_TCP_KEEPALIVE_CNT) -> True)
  where
    ZMQ_TCP_KEEPALIVE_CNT = _ZMQ_TCP_KEEPALIVE_CNT

pattern ZMQ_TCP_KEEPALIVE_IDLE :: CInt
pattern ZMQ_TCP_KEEPALIVE_IDLE <- ((== _ZMQ_TCP_KEEPALIVE_IDLE) -> True)
  where
    ZMQ_TCP_KEEPALIVE_IDLE = _ZMQ_TCP_KEEPALIVE_IDLE

pattern ZMQ_TCP_KEEPALIVE_INTVL :: CInt
pattern ZMQ_TCP_KEEPALIVE_INTVL <- ((== _ZMQ_TCP_KEEPALIVE_INTVL) -> True)
  where
    ZMQ_TCP_KEEPALIVE_INTVL = _ZMQ_TCP_KEEPALIVE_INTVL

pattern ZMQ_TCP_MAXRT :: CInt
pattern ZMQ_TCP_MAXRT <- ((== _ZMQ_TCP_MAXRT) -> True)
  where
    ZMQ_TCP_MAXRT = _ZMQ_TCP_MAXRT

pattern ZMQ_THREAD_SAFE :: CInt
pattern ZMQ_THREAD_SAFE <- ((== _ZMQ_THREAD_SAFE) -> True)
  where
    ZMQ_THREAD_SAFE = _ZMQ_THREAD_SAFE

pattern ZMQ_TOS :: CInt
pattern ZMQ_TOS <- ((== _ZMQ_TOS) -> True)
  where
    ZMQ_TOS = _ZMQ_TOS

pattern ZMQ_TYPE :: CInt
pattern ZMQ_TYPE <- ((== _ZMQ_TYPE) -> True)
  where
    ZMQ_TYPE = _ZMQ_TYPE

pattern ZMQ_UNSUBSCRIBE :: CInt
pattern ZMQ_UNSUBSCRIBE <- ((== _ZMQ_UNSUBSCRIBE) -> True)
  where
    ZMQ_UNSUBSCRIBE = _ZMQ_UNSUBSCRIBE

pattern ZMQ_USE_FD :: CInt
pattern ZMQ_USE_FD <- ((== _ZMQ_USE_FD) -> True)
  where
    ZMQ_USE_FD = _ZMQ_USE_FD

pattern ZMQ_VMCI_BUFFER_MAX_SIZE :: CInt
pattern ZMQ_VMCI_BUFFER_MAX_SIZE <- ((== _ZMQ_VMCI_BUFFER_MAX_SIZE) -> True)
  where
    ZMQ_VMCI_BUFFER_MAX_SIZE = _ZMQ_VMCI_BUFFER_MAX_SIZE

pattern ZMQ_VMCI_BUFFER_MIN_SIZE :: CInt
pattern ZMQ_VMCI_BUFFER_MIN_SIZE <- ((== _ZMQ_VMCI_BUFFER_MIN_SIZE) -> True)
  where
    ZMQ_VMCI_BUFFER_MIN_SIZE = _ZMQ_VMCI_BUFFER_MIN_SIZE

pattern ZMQ_VMCI_BUFFER_SIZE :: CInt
pattern ZMQ_VMCI_BUFFER_SIZE <- ((== _ZMQ_VMCI_BUFFER_SIZE) -> True)
  where
    ZMQ_VMCI_BUFFER_SIZE = _ZMQ_VMCI_BUFFER_SIZE

pattern ZMQ_VMCI_CONNECT_TIMEOUT :: CInt
pattern ZMQ_VMCI_CONNECT_TIMEOUT <- ((== _ZMQ_VMCI_CONNECT_TIMEOUT) -> True)
  where
    ZMQ_VMCI_CONNECT_TIMEOUT = _ZMQ_VMCI_CONNECT_TIMEOUT

pattern ZMQ_XPUB_MANUAL :: CInt
pattern ZMQ_XPUB_MANUAL <- ((== _ZMQ_XPUB_MANUAL) -> True)
  where
    ZMQ_XPUB_MANUAL = _ZMQ_XPUB_MANUAL

pattern ZMQ_XPUB_NODROP :: CInt
pattern ZMQ_XPUB_NODROP <- ((== _ZMQ_XPUB_NODROP) -> True)
  where
    ZMQ_XPUB_NODROP = _ZMQ_XPUB_NODROP

pattern ZMQ_XPUB_VERBOSE :: CInt
pattern ZMQ_XPUB_VERBOSE <- ((== _ZMQ_XPUB_VERBOSE) -> True)
  where
    ZMQ_XPUB_VERBOSE = _ZMQ_XPUB_VERBOSE

pattern ZMQ_XPUB_VERBOSER :: CInt
pattern ZMQ_XPUB_VERBOSER <- ((== _ZMQ_XPUB_VERBOSER) -> True)
  where
    ZMQ_XPUB_VERBOSER = _ZMQ_XPUB_VERBOSER

pattern ZMQ_XPUB_WELCOME_MSG :: CInt
pattern ZMQ_XPUB_WELCOME_MSG <- ((== _ZMQ_XPUB_WELCOME_MSG) -> True)
  where
    ZMQ_XPUB_WELCOME_MSG = _ZMQ_XPUB_WELCOME_MSG

pattern ZMQ_ZAP_DOMAIN :: CInt
pattern ZMQ_ZAP_DOMAIN <- ((== _ZMQ_ZAP_DOMAIN) -> True)
  where
    ZMQ_ZAP_DOMAIN = _ZMQ_ZAP_DOMAIN

------------------------------------------------------------------------------------------------------------------------
-- Message options

pattern ZMQ_MORE :: CInt
pattern ZMQ_MORE <- ((== _ZMQ_MORE) -> True)
  where
    ZMQ_MORE = _ZMQ_MORE

pattern ZMQ_SHARED :: CInt
pattern ZMQ_SHARED <- ((== _ZMQ_SHARED) -> True)
  where
    ZMQ_SHARED = _ZMQ_SHARED

------------------------------------------------------------------------------------------------------------------------
-- Send/recv options

pattern ZMQ_DONTWAIT :: CInt
pattern ZMQ_DONTWAIT <- ((== _ZMQ_DONTWAIT) -> True)
  where
    ZMQ_DONTWAIT = _ZMQ_DONTWAIT

pattern ZMQ_SNDMORE :: CInt
pattern ZMQ_SNDMORE <- ((== _ZMQ_SNDMORE) -> True)
  where
    ZMQ_SNDMORE = _ZMQ_SNDMORE

------------------------------------------------------------------------------------------------------------------------
-- Security mechanisms

pattern ZMQ_CURVE :: CInt
pattern ZMQ_CURVE <- ((== _ZMQ_CURVE) -> True)
  where
    ZMQ_CURVE = _ZMQ_CURVE

pattern ZMQ_GSSAPI :: CInt
pattern ZMQ_GSSAPI <- ((== _ZMQ_GSSAPI) -> True)
  where
    ZMQ_GSSAPI = _ZMQ_GSSAPI

pattern ZMQ_NULL :: CInt
pattern ZMQ_NULL <- ((== _ZMQ_NULL) -> True)
  where
    ZMQ_NULL = _ZMQ_NULL

pattern ZMQ_PLAIN :: CInt
pattern ZMQ_PLAIN <- ((== _ZMQ_PLAIN) -> True)
  where
    ZMQ_PLAIN = _ZMQ_PLAIN

------------------------------------------------------------------------------------------------------------------------
-- RADIO-DISH protocol

pattern ZMQ_GROUP_MAX_LENGTH :: CInt
pattern ZMQ_GROUP_MAX_LENGTH <- ((== _ZMQ_GROUP_MAX_LENGTH) -> True)
  where
    ZMQ_GROUP_MAX_LENGTH = _ZMQ_GROUP_MAX_LENGTH

------------------------------------------------------------------------------------------------------------------------
-- GSSAPI principal name types

pattern ZMQ_GSSAPI_NT_HOSTBASED :: CInt
pattern ZMQ_GSSAPI_NT_HOSTBASED <- ((== _ZMQ_GSSAPI_NT_HOSTBASED) -> True)
  where
    ZMQ_GSSAPI_NT_HOSTBASED = _ZMQ_GSSAPI_NT_HOSTBASED

pattern ZMQ_GSSAPI_NT_KRB5_PRINCIPAL :: CInt
pattern ZMQ_GSSAPI_NT_KRB5_PRINCIPAL <- ((== _ZMQ_GSSAPI_NT_KRB5_PRINCIPAL) -> True)
  where
    ZMQ_GSSAPI_NT_KRB5_PRINCIPAL = _ZMQ_GSSAPI_NT_KRB5_PRINCIPAL

pattern ZMQ_GSSAPI_NT_USER_NAME :: CInt
pattern ZMQ_GSSAPI_NT_USER_NAME <- ((== _ZMQ_GSSAPI_NT_USER_NAME) -> True)
  where
    ZMQ_GSSAPI_NT_USER_NAME = _ZMQ_GSSAPI_NT_USER_NAME

------------------------------------------------------------------------------------------------------------------------
-- Socket transport events (TCP, IPC and TIPC only)

pattern ZMQ_EVENT_ACCEPTED :: CInt
pattern ZMQ_EVENT_ACCEPTED <- ((== _ZMQ_EVENT_ACCEPTED) -> True)
  where
    ZMQ_EVENT_ACCEPTED = _ZMQ_EVENT_ACCEPTED

pattern ZMQ_EVENT_ACCEPT_FAILED :: CInt
pattern ZMQ_EVENT_ACCEPT_FAILED <- ((== _ZMQ_EVENT_ACCEPT_FAILED) -> True)
  where
    ZMQ_EVENT_ACCEPT_FAILED = _ZMQ_EVENT_ACCEPT_FAILED

pattern ZMQ_EVENT_ALL :: CInt
pattern ZMQ_EVENT_ALL <- ((== _ZMQ_EVENT_ALL) -> True)
  where
    ZMQ_EVENT_ALL = _ZMQ_EVENT_ALL

pattern ZMQ_EVENT_BIND_FAILED :: CInt
pattern ZMQ_EVENT_BIND_FAILED <- ((== _ZMQ_EVENT_BIND_FAILED) -> True)
  where
    ZMQ_EVENT_BIND_FAILED = _ZMQ_EVENT_BIND_FAILED

pattern ZMQ_EVENT_CLOSED :: CInt
pattern ZMQ_EVENT_CLOSED <- ((== _ZMQ_EVENT_CLOSED) -> True)
  where
    ZMQ_EVENT_CLOSED = _ZMQ_EVENT_CLOSED

pattern ZMQ_EVENT_CLOSE_FAILED :: CInt
pattern ZMQ_EVENT_CLOSE_FAILED <- ((== _ZMQ_EVENT_CLOSE_FAILED) -> True)
  where
    ZMQ_EVENT_CLOSE_FAILED = _ZMQ_EVENT_CLOSE_FAILED

pattern ZMQ_EVENT_CONNECTED :: CInt
pattern ZMQ_EVENT_CONNECTED <- ((== _ZMQ_EVENT_CONNECTED) -> True)
  where
    ZMQ_EVENT_CONNECTED = _ZMQ_EVENT_CONNECTED

pattern ZMQ_EVENT_CONNECT_DELAYED :: CInt
pattern ZMQ_EVENT_CONNECT_DELAYED <- ((== _ZMQ_EVENT_CONNECT_DELAYED) -> True)
  where
    ZMQ_EVENT_CONNECT_DELAYED = _ZMQ_EVENT_CONNECT_DELAYED

pattern ZMQ_EVENT_CONNECT_RETRIED :: CInt
pattern ZMQ_EVENT_CONNECT_RETRIED <- ((== _ZMQ_EVENT_CONNECT_RETRIED) -> True)
  where
    ZMQ_EVENT_CONNECT_RETRIED = _ZMQ_EVENT_CONNECT_RETRIED

pattern ZMQ_EVENT_DISCONNECTED :: CInt
pattern ZMQ_EVENT_DISCONNECTED <- ((== _ZMQ_EVENT_DISCONNECTED) -> True)
  where
    ZMQ_EVENT_DISCONNECTED = _ZMQ_EVENT_DISCONNECTED

pattern ZMQ_EVENT_HANDSHAKE_FAILED_AUTH :: CInt
pattern ZMQ_EVENT_HANDSHAKE_FAILED_AUTH <- ((== _ZMQ_EVENT_HANDSHAKE_FAILED_AUTH) -> True)
  where
    ZMQ_EVENT_HANDSHAKE_FAILED_AUTH = _ZMQ_EVENT_HANDSHAKE_FAILED_AUTH

pattern ZMQ_EVENT_HANDSHAKE_FAILED_NO_DETAIL :: CInt
pattern ZMQ_EVENT_HANDSHAKE_FAILED_NO_DETAIL <- ((== _ZMQ_EVENT_HANDSHAKE_FAILED_NO_DETAIL) -> True)
  where
    ZMQ_EVENT_HANDSHAKE_FAILED_NO_DETAIL = _ZMQ_EVENT_HANDSHAKE_FAILED_NO_DETAIL

pattern ZMQ_EVENT_HANDSHAKE_FAILED_PROTOCOL :: CInt
pattern ZMQ_EVENT_HANDSHAKE_FAILED_PROTOCOL <- ((== _ZMQ_EVENT_HANDSHAKE_FAILED_PROTOCOL) -> True)
  where
    ZMQ_EVENT_HANDSHAKE_FAILED_PROTOCOL = _ZMQ_EVENT_HANDSHAKE_FAILED_PROTOCOL

pattern ZMQ_EVENT_HANDSHAKE_SUCCEEDED :: CInt
pattern ZMQ_EVENT_HANDSHAKE_SUCCEEDED <- ((== _ZMQ_EVENT_HANDSHAKE_SUCCEEDED) -> True)
  where
    ZMQ_EVENT_HANDSHAKE_SUCCEEDED = _ZMQ_EVENT_HANDSHAKE_SUCCEEDED

pattern ZMQ_EVENT_LISTENING :: CInt
pattern ZMQ_EVENT_LISTENING <- ((== _ZMQ_EVENT_LISTENING) -> True)
  where
    ZMQ_EVENT_LISTENING = _ZMQ_EVENT_LISTENING

pattern ZMQ_EVENT_MONITOR_STOPPED :: CInt
pattern ZMQ_EVENT_MONITOR_STOPPED <- ((== _ZMQ_EVENT_MONITOR_STOPPED) -> True)
  where
    ZMQ_EVENT_MONITOR_STOPPED = _ZMQ_EVENT_MONITOR_STOPPED

------------------------------------------------------------------------------------------------------------------------
-- Protocol errors

pattern ZMQ_PROTOCOL_ERROR_WS_UNSPECIFIED :: CInt
pattern ZMQ_PROTOCOL_ERROR_WS_UNSPECIFIED <- ((== _ZMQ_PROTOCOL_ERROR_WS_UNSPECIFIED) -> True)
  where
    ZMQ_PROTOCOL_ERROR_WS_UNSPECIFIED = _ZMQ_PROTOCOL_ERROR_WS_UNSPECIFIED

pattern ZMQ_PROTOCOL_ERROR_ZAP_BAD_REQUEST_ID :: CInt
pattern ZMQ_PROTOCOL_ERROR_ZAP_BAD_REQUEST_ID <- ((== _ZMQ_PROTOCOL_ERROR_ZAP_BAD_REQUEST_ID) -> True)
  where
    ZMQ_PROTOCOL_ERROR_ZAP_BAD_REQUEST_ID = _ZMQ_PROTOCOL_ERROR_ZAP_BAD_REQUEST_ID

pattern ZMQ_PROTOCOL_ERROR_ZAP_BAD_VERSION :: CInt
pattern ZMQ_PROTOCOL_ERROR_ZAP_BAD_VERSION <- ((== _ZMQ_PROTOCOL_ERROR_ZAP_BAD_VERSION) -> True)
  where
    ZMQ_PROTOCOL_ERROR_ZAP_BAD_VERSION = _ZMQ_PROTOCOL_ERROR_ZAP_BAD_VERSION

pattern ZMQ_PROTOCOL_ERROR_ZAP_INVALID_METADATA :: CInt
pattern ZMQ_PROTOCOL_ERROR_ZAP_INVALID_METADATA <- ((== _ZMQ_PROTOCOL_ERROR_ZAP_INVALID_METADATA) -> True)
  where
    ZMQ_PROTOCOL_ERROR_ZAP_INVALID_METADATA = _ZMQ_PROTOCOL_ERROR_ZAP_INVALID_METADATA

pattern ZMQ_PROTOCOL_ERROR_ZAP_INVALID_STATUS_CODE :: CInt
pattern ZMQ_PROTOCOL_ERROR_ZAP_INVALID_STATUS_CODE <- ((== _ZMQ_PROTOCOL_ERROR_ZAP_INVALID_STATUS_CODE) -> True)
  where
    ZMQ_PROTOCOL_ERROR_ZAP_INVALID_STATUS_CODE = _ZMQ_PROTOCOL_ERROR_ZAP_INVALID_STATUS_CODE

pattern ZMQ_PROTOCOL_ERROR_ZAP_MALFORMED_REPLY :: CInt
pattern ZMQ_PROTOCOL_ERROR_ZAP_MALFORMED_REPLY <- ((== _ZMQ_PROTOCOL_ERROR_ZAP_MALFORMED_REPLY) -> True)
  where
    ZMQ_PROTOCOL_ERROR_ZAP_MALFORMED_REPLY = _ZMQ_PROTOCOL_ERROR_ZAP_MALFORMED_REPLY

pattern ZMQ_PROTOCOL_ERROR_ZAP_UNSPECIFIED :: CInt
pattern ZMQ_PROTOCOL_ERROR_ZAP_UNSPECIFIED <- ((== _ZMQ_PROTOCOL_ERROR_ZAP_UNSPECIFIED) -> True)
  where
    ZMQ_PROTOCOL_ERROR_ZAP_UNSPECIFIED = _ZMQ_PROTOCOL_ERROR_ZAP_UNSPECIFIED

pattern ZMQ_PROTOCOL_ERROR_ZMTP_CRYPTOGRAPHIC :: CInt
pattern ZMQ_PROTOCOL_ERROR_ZMTP_CRYPTOGRAPHIC <- ((== _ZMQ_PROTOCOL_ERROR_ZMTP_CRYPTOGRAPHIC) -> True)
  where
    ZMQ_PROTOCOL_ERROR_ZMTP_CRYPTOGRAPHIC = _ZMQ_PROTOCOL_ERROR_ZMTP_CRYPTOGRAPHIC

pattern ZMQ_PROTOCOL_ERROR_ZMTP_INVALID_METADATA :: CInt
pattern ZMQ_PROTOCOL_ERROR_ZMTP_INVALID_METADATA <- ((== _ZMQ_PROTOCOL_ERROR_ZMTP_INVALID_METADATA) -> True)
  where
    ZMQ_PROTOCOL_ERROR_ZMTP_INVALID_METADATA = _ZMQ_PROTOCOL_ERROR_ZMTP_INVALID_METADATA

pattern ZMQ_PROTOCOL_ERROR_ZMTP_INVALID_SEQUENCE :: CInt
pattern ZMQ_PROTOCOL_ERROR_ZMTP_INVALID_SEQUENCE <- ((== _ZMQ_PROTOCOL_ERROR_ZMTP_INVALID_SEQUENCE) -> True)
  where
    ZMQ_PROTOCOL_ERROR_ZMTP_INVALID_SEQUENCE = _ZMQ_PROTOCOL_ERROR_ZMTP_INVALID_SEQUENCE

pattern ZMQ_PROTOCOL_ERROR_ZMTP_KEY_EXCHANGE :: CInt
pattern ZMQ_PROTOCOL_ERROR_ZMTP_KEY_EXCHANGE <- ((== _ZMQ_PROTOCOL_ERROR_ZMTP_KEY_EXCHANGE) -> True)
  where
    ZMQ_PROTOCOL_ERROR_ZMTP_KEY_EXCHANGE = _ZMQ_PROTOCOL_ERROR_ZMTP_KEY_EXCHANGE

pattern ZMQ_PROTOCOL_ERROR_ZMTP_MALFORMED_COMMAND_ERROR :: CInt
pattern ZMQ_PROTOCOL_ERROR_ZMTP_MALFORMED_COMMAND_ERROR <- ((== _ZMQ_PROTOCOL_ERROR_ZMTP_MALFORMED_COMMAND_ERROR) -> True)
  where
    ZMQ_PROTOCOL_ERROR_ZMTP_MALFORMED_COMMAND_ERROR = _ZMQ_PROTOCOL_ERROR_ZMTP_MALFORMED_COMMAND_ERROR

pattern ZMQ_PROTOCOL_ERROR_ZMTP_MALFORMED_COMMAND_HELLO :: CInt
pattern ZMQ_PROTOCOL_ERROR_ZMTP_MALFORMED_COMMAND_HELLO <- ((== _ZMQ_PROTOCOL_ERROR_ZMTP_MALFORMED_COMMAND_HELLO) -> True)
  where
    ZMQ_PROTOCOL_ERROR_ZMTP_MALFORMED_COMMAND_HELLO = _ZMQ_PROTOCOL_ERROR_ZMTP_MALFORMED_COMMAND_HELLO

pattern ZMQ_PROTOCOL_ERROR_ZMTP_MALFORMED_COMMAND_INITIATE :: CInt
pattern ZMQ_PROTOCOL_ERROR_ZMTP_MALFORMED_COMMAND_INITIATE <- ((== _ZMQ_PROTOCOL_ERROR_ZMTP_MALFORMED_COMMAND_INITIATE) -> True)
  where
    ZMQ_PROTOCOL_ERROR_ZMTP_MALFORMED_COMMAND_INITIATE = _ZMQ_PROTOCOL_ERROR_ZMTP_MALFORMED_COMMAND_INITIATE

pattern ZMQ_PROTOCOL_ERROR_ZMTP_MALFORMED_COMMAND_MESSAGE :: CInt
pattern ZMQ_PROTOCOL_ERROR_ZMTP_MALFORMED_COMMAND_MESSAGE <- ((== _ZMQ_PROTOCOL_ERROR_ZMTP_MALFORMED_COMMAND_MESSAGE) -> True)
  where
    ZMQ_PROTOCOL_ERROR_ZMTP_MALFORMED_COMMAND_MESSAGE = _ZMQ_PROTOCOL_ERROR_ZMTP_MALFORMED_COMMAND_MESSAGE

pattern ZMQ_PROTOCOL_ERROR_ZMTP_MALFORMED_COMMAND_READY :: CInt
pattern ZMQ_PROTOCOL_ERROR_ZMTP_MALFORMED_COMMAND_READY <- ((== _ZMQ_PROTOCOL_ERROR_ZMTP_MALFORMED_COMMAND_READY) -> True)
  where
    ZMQ_PROTOCOL_ERROR_ZMTP_MALFORMED_COMMAND_READY = _ZMQ_PROTOCOL_ERROR_ZMTP_MALFORMED_COMMAND_READY

pattern ZMQ_PROTOCOL_ERROR_ZMTP_MALFORMED_COMMAND_UNSPECIFIED :: CInt
pattern ZMQ_PROTOCOL_ERROR_ZMTP_MALFORMED_COMMAND_UNSPECIFIED <- ((== _ZMQ_PROTOCOL_ERROR_ZMTP_MALFORMED_COMMAND_UNSPECIFIED) -> True)
  where
    ZMQ_PROTOCOL_ERROR_ZMTP_MALFORMED_COMMAND_UNSPECIFIED = _ZMQ_PROTOCOL_ERROR_ZMTP_MALFORMED_COMMAND_UNSPECIFIED

pattern ZMQ_PROTOCOL_ERROR_ZMTP_MALFORMED_COMMAND_WELCOME :: CInt
pattern ZMQ_PROTOCOL_ERROR_ZMTP_MALFORMED_COMMAND_WELCOME <- ((== _ZMQ_PROTOCOL_ERROR_ZMTP_MALFORMED_COMMAND_WELCOME) -> True)
  where
    ZMQ_PROTOCOL_ERROR_ZMTP_MALFORMED_COMMAND_WELCOME = _ZMQ_PROTOCOL_ERROR_ZMTP_MALFORMED_COMMAND_WELCOME

pattern ZMQ_PROTOCOL_ERROR_ZMTP_MECHANISM_MISMATCH :: CInt
pattern ZMQ_PROTOCOL_ERROR_ZMTP_MECHANISM_MISMATCH <- ((== _ZMQ_PROTOCOL_ERROR_ZMTP_MECHANISM_MISMATCH) -> True)
  where
    ZMQ_PROTOCOL_ERROR_ZMTP_MECHANISM_MISMATCH = _ZMQ_PROTOCOL_ERROR_ZMTP_MECHANISM_MISMATCH

pattern ZMQ_PROTOCOL_ERROR_ZMTP_UNEXPECTED_COMMAND :: CInt
pattern ZMQ_PROTOCOL_ERROR_ZMTP_UNEXPECTED_COMMAND <- ((== _ZMQ_PROTOCOL_ERROR_ZMTP_UNEXPECTED_COMMAND) -> True)
  where
    ZMQ_PROTOCOL_ERROR_ZMTP_UNEXPECTED_COMMAND = _ZMQ_PROTOCOL_ERROR_ZMTP_UNEXPECTED_COMMAND

pattern ZMQ_PROTOCOL_ERROR_ZMTP_UNSPECIFIED :: CInt
pattern ZMQ_PROTOCOL_ERROR_ZMTP_UNSPECIFIED <- ((== _ZMQ_PROTOCOL_ERROR_ZMTP_UNSPECIFIED) -> True)
  where
    ZMQ_PROTOCOL_ERROR_ZMTP_UNSPECIFIED = _ZMQ_PROTOCOL_ERROR_ZMTP_UNSPECIFIED

------------------------------------------------------------------------------------------------------------------------
-- I/O multiplexint

pattern ZMQ_POLLIN :: CShort
pattern ZMQ_POLLIN <- ((== _ZMQ_POLLIN) -> True)
  where
    ZMQ_POLLIN = _ZMQ_POLLIN

pattern ZMQ_POLLOUT :: CShort
pattern ZMQ_POLLOUT <- ((== _ZMQ_POLLOUT) -> True)
  where
    ZMQ_POLLOUT = _ZMQ_POLLOUT

pattern ZMQ_POLLERR :: CShort
pattern ZMQ_POLLERR <- ((== _ZMQ_POLLERR) -> True)
  where
    ZMQ_POLLERR = _ZMQ_POLLERR

pattern ZMQ_POLLPRI :: CShort
pattern ZMQ_POLLPRI <- ((== _ZMQ_POLLPRI) -> True)
  where
    ZMQ_POLLPRI = _ZMQ_POLLPRI

------------------------------------------------------------------------------------------------------------------------
-- Probe library capabilities

pattern ZMQ_HAS_CAPABILITIES :: CInt
pattern ZMQ_HAS_CAPABILITIES <- ((== _ZMQ_HAS_CAPABILITIES) -> True)
  where
    ZMQ_HAS_CAPABILITIES = _ZMQ_HAS_CAPABILITIES
