{-# OPTIONS_GHC -Wno-duplicate-exports #-}

module Libzmq
  ( -- * Functions

    -- ** Error
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
    zmq_msg_init_data,
    zmq_msg_init_size,
    zmq_msg_free,
    zmq_msg_send,
    zmq_msg_send_dontwait,
    zmq_msg_recv,
    zmq_msg_recv_dontwait,
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
    zmq_getsockopt_int,
    zmq_getsockopt_word,
    zmq_bind,
    zmq_connect,
    zmq_unbind,
    zmq_disconnect,
    zmq_send,
    zmq_send__unsafe,
    zmq_send_const,
    zmq_send_const__unsafe,
    zmq_recv,
    zmq_recv_dontwait,
    zmq_socket_monitor,
    zmq_socket_unmonitor,

    -- ** Input/output multiplexing
    zmq_poll,

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
    Zmq_atomic_counter,
    Zmq_ctx,
    Zmq_ctx_option
      ( ZMQ_BLOCKY,
        ZMQ_IO_THREADS,
        ZMQ_IPV6,
        ZMQ_MAX_MSGSZ,
        ZMQ_MAX_SOCKETS,
        ZMQ_MSG_T_SIZE,
        ZMQ_SOCKET_LIMIT,
        ZMQ_THREAD_NAME_PREFIX,
        ZMQ_THREAD_SCHED_POLICY
      ),
    -- TODO CInt->Int these
    pattern ZMQ_IO_THREADS_DFLT,
    pattern ZMQ_MAX_SOCKETS_DFLT,
    pattern ZMQ_THREAD_PRIORITY_DFLT,
    pattern ZMQ_THREAD_SCHED_POLICY_DFLT,
    Zmq_error
      ( EADDRINUSE,
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
      ),
    Zmq_events,
    pattern ZMQ_POLLIN,
    pattern ZMQ_POLLOUT,
    pattern ZMQ_POLLERR,
    pattern ZMQ_POLLPRI,
    Libzmq.Bindings.Zmq_fd,
    Zmq_msg_option
      ( ZMQ_MORE,
        ZMQ_SHARED
      ),
    Zmq_msg,
    Libzmq.Bindings.Zmq_pollitem,
    pattern Zmq_pollitem_fd,
    pattern Zmq_pollitem_socket,
    Zmq_protocol_error
      ( ZMQ_PROTOCOL_ERROR_WS_UNSPECIFIED,
        ZMQ_PROTOCOL_ERROR_ZAP_BAD_REQUEST_ID,
        ZMQ_PROTOCOL_ERROR_ZAP_BAD_VERSION,
        ZMQ_PROTOCOL_ERROR_ZAP_INVALID_METADATA,
        ZMQ_PROTOCOL_ERROR_ZAP_INVALID_STATUS_CODE,
        ZMQ_PROTOCOL_ERROR_ZAP_MALFORMED_REPLY,
        ZMQ_PROTOCOL_ERROR_ZAP_UNSPECIFIED,
        ZMQ_PROTOCOL_ERROR_ZMTP_CRYPTOGRAPHIC,
        ZMQ_PROTOCOL_ERROR_ZMTP_INVALID_METADATA,
        ZMQ_PROTOCOL_ERROR_ZMTP_INVALID_SEQUENCE,
        ZMQ_PROTOCOL_ERROR_ZMTP_KEY_EXCHANGE,
        ZMQ_PROTOCOL_ERROR_ZMTP_MALFORMED_COMMAND_ERROR,
        ZMQ_PROTOCOL_ERROR_ZMTP_MALFORMED_COMMAND_HELLO,
        ZMQ_PROTOCOL_ERROR_ZMTP_MALFORMED_COMMAND_INITIATE,
        ZMQ_PROTOCOL_ERROR_ZMTP_MALFORMED_COMMAND_MESSAGE,
        ZMQ_PROTOCOL_ERROR_ZMTP_MALFORMED_COMMAND_READY,
        ZMQ_PROTOCOL_ERROR_ZMTP_MALFORMED_COMMAND_UNSPECIFIED,
        ZMQ_PROTOCOL_ERROR_ZMTP_MALFORMED_COMMAND_WELCOME,
        ZMQ_PROTOCOL_ERROR_ZMTP_MECHANISM_MISMATCH,
        ZMQ_PROTOCOL_ERROR_ZMTP_UNEXPECTED_COMMAND,
        ZMQ_PROTOCOL_ERROR_ZMTP_UNSPECIFIED
      ),
    Zmq_send_option,
    pattern ZMQ_DONTWAIT,
    pattern ZMQ_SNDMORE,
    Zmq_socket,
    Zmq_socket_events
      ( ZMQ_EVENT_ACCEPTED,
        ZMQ_EVENT_ACCEPT_FAILED,
        ZMQ_EVENT_ALL,
        ZMQ_EVENT_BIND_FAILED,
        ZMQ_EVENT_CLOSED,
        ZMQ_EVENT_CLOSE_FAILED,
        ZMQ_EVENT_CONNECTED,
        ZMQ_EVENT_CONNECT_DELAYED,
        ZMQ_EVENT_CONNECT_RETRIED,
        ZMQ_EVENT_DISCONNECTED,
        ZMQ_EVENT_HANDSHAKE_FAILED_AUTH,
        ZMQ_EVENT_HANDSHAKE_FAILED_NO_DETAIL,
        ZMQ_EVENT_HANDSHAKE_FAILED_PROTOCOL,
        ZMQ_EVENT_HANDSHAKE_SUCCEEDED,
        ZMQ_EVENT_LISTENING,
        ZMQ_EVENT_MONITOR_STOPPED
      ),
    Zmq_socket_option (..),
    Zmq_socket_type
      ( ZMQ_CHANNEL,
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
      ),

    -- ** Internals
    Zmq_atomic_counter (Zmq_atomic_counter),
    Zmq_ctx_option (Zmq_ctx_option),
    Zmq_ctx (Zmq_ctx),
    Zmq_error (Zmq_error),
    Zmq_events (Zmq_events),
    Zmq_msg_option (Zmq_msg_option),
    Zmq_msg (Zmq_msg),
    Libzmq.Bindings.Zmq_pollitem (..),
    Zmq_protocol_error (Zmq_protocol_error),
    Zmq_send_option (Zmq_send_option),
    Zmq_socket (Zmq_socket),
    Zmq_socket_events (Zmq_socket_events),
    Zmq_socket_type (Zmq_socket_type),
  )
where

import Libzmq.Bindings
  ( Zmq_fd,
    Zmq_pollitem (..),
    pattern ZMQ_IO_THREADS_DFLT,
    pattern ZMQ_MAX_SOCKETS_DFLT,
    pattern ZMQ_THREAD_PRIORITY_DFLT,
    pattern ZMQ_THREAD_SCHED_POLICY_DFLT,
  )
import Libzmq.Internal.Functions
import Libzmq.Internal.Types
