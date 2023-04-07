module Libzmq.Bindings.Internal.Constants (module Libzmq.Bindings.Internal.Constants) where

import Foreign.C (CInt, CShort)

------------------------------------------------------------------------------------------------------------------------
-- Errors

pattern EFSM :: CInt
pattern EFSM = 156384763

pattern EMTHREAD :: CInt
pattern EMTHREAD = 156384766

pattern ENOCOMPATPROTO :: CInt
pattern ENOCOMPATPROTO = 156384764

pattern ETERM :: CInt
pattern ETERM = 156384765

------------------------------------------------------------------------------------------------------------------------
-- Context options

pattern ZMQ_IO_THREADS :: CInt
pattern ZMQ_IO_THREADS = 1

pattern ZMQ_MAX_MSGSZ :: CInt
pattern ZMQ_MAX_MSGSZ = 5

pattern ZMQ_MAX_SOCKETS :: CInt
pattern ZMQ_MAX_SOCKETS = 2

pattern ZMQ_MSG_T_SIZE :: CInt
pattern ZMQ_MSG_T_SIZE = 6

pattern ZMQ_SOCKET_LIMIT :: CInt
pattern ZMQ_SOCKET_LIMIT = 3

pattern ZMQ_THREAD_AFFINITY_CPU_ADD :: CInt
pattern ZMQ_THREAD_AFFINITY_CPU_ADD = 7

pattern ZMQ_THREAD_AFFINITY_CPU_REMOVE :: CInt
pattern ZMQ_THREAD_AFFINITY_CPU_REMOVE = 8

pattern ZMQ_THREAD_NAME_PREFIX :: CInt
pattern ZMQ_THREAD_NAME_PREFIX = 9

pattern ZMQ_THREAD_PRIORITY :: CInt
pattern ZMQ_THREAD_PRIORITY = 3 -- not a typo; same as ZMQ_SOCKET_LIMIT

pattern ZMQ_THREAD_SCHED_POLICY :: CInt
pattern ZMQ_THREAD_SCHED_POLICY = 4

------------------------------------------------------------------------------------------------------------------------
-- Default for new contexts

pattern ZMQ_IO_THREADS_DFLT :: CInt
pattern ZMQ_IO_THREADS_DFLT = 1

pattern ZMQ_MAX_SOCKETS_DFLT :: CInt
pattern ZMQ_MAX_SOCKETS_DFLT = 1023

pattern ZMQ_THREAD_PRIORITY_DFLT :: CInt
pattern ZMQ_THREAD_PRIORITY_DFLT = -1

pattern ZMQ_THREAD_SCHED_POLICY_DFLT :: CInt
pattern ZMQ_THREAD_SCHED_POLICY_DFLT = -1

------------------------------------------------------------------------------------------------------------------------
-- Socket types

pattern ZMQ_DEALER :: CInt
pattern ZMQ_DEALER = 5

pattern ZMQ_PAIR :: CInt
pattern ZMQ_PAIR = 0

pattern ZMQ_PUB :: CInt
pattern ZMQ_PUB = 1

pattern ZMQ_PULL :: CInt
pattern ZMQ_PULL = 7

pattern ZMQ_PUSH :: CInt
pattern ZMQ_PUSH = 8

pattern ZMQ_REP :: CInt
pattern ZMQ_REP = 4

pattern ZMQ_REQ :: CInt
pattern ZMQ_REQ = 3

pattern ZMQ_ROUTER :: CInt
pattern ZMQ_ROUTER = 6

pattern ZMQ_STREAM :: CInt
pattern ZMQ_STREAM = 11

pattern ZMQ_SUB :: CInt
pattern ZMQ_SUB = 2

pattern ZMQ_XPUB :: CInt
pattern ZMQ_XPUB = 9

pattern ZMQ_XSUB :: CInt
pattern ZMQ_XSUB = 10

------------------------------------------------------------------------------------------------------------------------
-- Socket options

pattern ZMQ_AFFINITY :: CInt
pattern ZMQ_AFFINITY = 4

pattern ZMQ_BACKLOG :: CInt
pattern ZMQ_BACKLOG = 19

pattern ZMQ_BINDTODEVICE :: CInt
pattern ZMQ_BINDTODEVICE = 92

pattern ZMQ_BLOCKY :: CInt
pattern ZMQ_BLOCKY = 70

pattern ZMQ_CONFLATE :: CInt
pattern ZMQ_CONFLATE = 54

pattern ZMQ_CONNECT_ROUTING_ID :: CInt
pattern ZMQ_CONNECT_ROUTING_ID = 61

pattern ZMQ_CONNECT_TIMEOUT :: CInt
pattern ZMQ_CONNECT_TIMEOUT = 79

pattern ZMQ_CURVE_PUBLICKEY :: CInt
pattern ZMQ_CURVE_PUBLICKEY = 48

pattern ZMQ_CURVE_SECRETKEY :: CInt
pattern ZMQ_CURVE_SECRETKEY = 49

pattern ZMQ_CURVE_SERVER :: CInt
pattern ZMQ_CURVE_SERVER = 47

pattern ZMQ_CURVE_SERVERKEY :: CInt
pattern ZMQ_CURVE_SERVERKEY = 50

pattern ZMQ_EVENTS :: CInt
pattern ZMQ_EVENTS = 15

pattern ZMQ_FD :: CInt
pattern ZMQ_FD = 14

pattern ZMQ_GSSAPI_PLAINTEXT :: CInt
pattern ZMQ_GSSAPI_PLAINTEXT = 65

pattern ZMQ_GSSAPI_PRINCIPAL :: CInt
pattern ZMQ_GSSAPI_PRINCIPAL = 63

pattern ZMQ_GSSAPI_PRINCIPAL_NAMETYPE :: CInt
pattern ZMQ_GSSAPI_PRINCIPAL_NAMETYPE = 90

pattern ZMQ_GSSAPI_SERVER :: CInt
pattern ZMQ_GSSAPI_SERVER = 62

pattern ZMQ_GSSAPI_SERVICE_PRINCIPAL :: CInt
pattern ZMQ_GSSAPI_SERVICE_PRINCIPAL = 64

pattern ZMQ_GSSAPI_SERVICE_PRINCIPAL_NAMETYPE :: CInt
pattern ZMQ_GSSAPI_SERVICE_PRINCIPAL_NAMETYPE = 91

pattern ZMQ_HANDSHAKE_IVL :: CInt
pattern ZMQ_HANDSHAKE_IVL = 66

pattern ZMQ_HEARTBEAT_IVL :: CInt
pattern ZMQ_HEARTBEAT_IVL = 75

pattern ZMQ_HEARTBEAT_TIMEOUT :: CInt
pattern ZMQ_HEARTBEAT_TIMEOUT = 77

pattern ZMQ_HEARTBEAT_TTL :: CInt
pattern ZMQ_HEARTBEAT_TTL = 76

pattern ZMQ_IMMEDIATE :: CInt
pattern ZMQ_IMMEDIATE = 39

pattern ZMQ_INVERT_MATCHING :: CInt
pattern ZMQ_INVERT_MATCHING = 74

pattern ZMQ_IPV6 :: CInt
pattern ZMQ_IPV6 = 42

pattern ZMQ_LAST_ENDPOINT :: CInt
pattern ZMQ_LAST_ENDPOINT = 32

pattern ZMQ_LINGER :: CInt
pattern ZMQ_LINGER = 17

pattern ZMQ_MAXMSGSIZE :: CInt
pattern ZMQ_MAXMSGSIZE = 22

pattern ZMQ_MECHANISM :: CInt
pattern ZMQ_MECHANISM = 43

pattern ZMQ_MULTICAST_HOPS :: CInt
pattern ZMQ_MULTICAST_HOPS = 25

pattern ZMQ_MULTICAST_MAXTPDU :: CInt
pattern ZMQ_MULTICAST_MAXTPDU = 84

pattern ZMQ_PLAIN_PASSWORD :: CInt
pattern ZMQ_PLAIN_PASSWORD = 46

pattern ZMQ_PLAIN_SERVER :: CInt
pattern ZMQ_PLAIN_SERVER = 44

pattern ZMQ_PLAIN_USERNAME :: CInt
pattern ZMQ_PLAIN_USERNAME = 45

pattern ZMQ_PROBE_ROUTER :: CInt
pattern ZMQ_PROBE_ROUTER = 51

pattern ZMQ_RATE :: CInt
pattern ZMQ_RATE = 8

pattern ZMQ_RCVBUF :: CInt
pattern ZMQ_RCVBUF = 12

pattern ZMQ_RCVHWM :: CInt
pattern ZMQ_RCVHWM = 24

pattern ZMQ_RCVMORE :: CInt
pattern ZMQ_RCVMORE = 13

pattern ZMQ_RCVTIMEO :: CInt
pattern ZMQ_RCVTIMEO = 27

pattern ZMQ_RECONNECT_IVL :: CInt
pattern ZMQ_RECONNECT_IVL = 18

pattern ZMQ_RECONNECT_IVL_MAX :: CInt
pattern ZMQ_RECONNECT_IVL_MAX = 21

pattern ZMQ_RECOVERY_IVL :: CInt
pattern ZMQ_RECOVERY_IVL = 9

pattern ZMQ_REQ_CORRELATE :: CInt
pattern ZMQ_REQ_CORRELATE = 52

pattern ZMQ_REQ_RELAXED :: CInt
pattern ZMQ_REQ_RELAXED = 53

pattern ZMQ_ROUTER_HANDOVER :: CInt
pattern ZMQ_ROUTER_HANDOVER = 56

pattern ZMQ_ROUTER_MANDATORY :: CInt
pattern ZMQ_ROUTER_MANDATORY = 33

pattern ZMQ_ROUTER_RAW :: CInt
pattern ZMQ_ROUTER_RAW = 41

pattern ZMQ_ROUTING_ID :: CInt
pattern ZMQ_ROUTING_ID = 5

pattern ZMQ_SNDBUF :: CInt
pattern ZMQ_SNDBUF = 11

pattern ZMQ_SNDHWM :: CInt
pattern ZMQ_SNDHWM = 23

pattern ZMQ_SNDTIMEO :: CInt
pattern ZMQ_SNDTIMEO = 28

pattern ZMQ_SOCKS_PROXY :: CInt
pattern ZMQ_SOCKS_PROXY = 68

pattern ZMQ_STREAM_NOTIFY :: CInt
pattern ZMQ_STREAM_NOTIFY = 73

pattern ZMQ_SUBSCRIBE :: CInt
pattern ZMQ_SUBSCRIBE = 6

pattern ZMQ_TCP_KEEPALIVE :: CInt
pattern ZMQ_TCP_KEEPALIVE = 34

pattern ZMQ_TCP_KEEPALIVE_CNT :: CInt
pattern ZMQ_TCP_KEEPALIVE_CNT = 35

pattern ZMQ_TCP_KEEPALIVE_IDLE :: CInt
pattern ZMQ_TCP_KEEPALIVE_IDLE = 36

pattern ZMQ_TCP_KEEPALIVE_INTVL :: CInt
pattern ZMQ_TCP_KEEPALIVE_INTVL = 37

pattern ZMQ_TCP_MAXRT :: CInt
pattern ZMQ_TCP_MAXRT = 80

pattern ZMQ_THREAD_SAFE :: CInt
pattern ZMQ_THREAD_SAFE = 81

pattern ZMQ_TOS :: CInt
pattern ZMQ_TOS = 57

pattern ZMQ_TYPE :: CInt
pattern ZMQ_TYPE = 16

pattern ZMQ_UNSUBSCRIBE :: CInt
pattern ZMQ_UNSUBSCRIBE = 7

pattern ZMQ_USE_FD :: CInt
pattern ZMQ_USE_FD = 89

pattern ZMQ_VMCI_BUFFER_MAX_SIZE :: CInt
pattern ZMQ_VMCI_BUFFER_MAX_SIZE = 87

pattern ZMQ_VMCI_BUFFER_MIN_SIZE :: CInt
pattern ZMQ_VMCI_BUFFER_MIN_SIZE = 86

pattern ZMQ_VMCI_BUFFER_SIZE :: CInt
pattern ZMQ_VMCI_BUFFER_SIZE = 85

pattern ZMQ_VMCI_CONNECT_TIMEOUT :: CInt
pattern ZMQ_VMCI_CONNECT_TIMEOUT = 88

pattern ZMQ_XPUB_MANUAL :: CInt
pattern ZMQ_XPUB_MANUAL = 71

pattern ZMQ_XPUB_NODROP :: CInt
pattern ZMQ_XPUB_NODROP = 69

pattern ZMQ_XPUB_VERBOSE :: CInt
pattern ZMQ_XPUB_VERBOSE = 40

pattern ZMQ_XPUB_VERBOSER :: CInt
pattern ZMQ_XPUB_VERBOSER = 78

pattern ZMQ_XPUB_WELCOME_MSG :: CInt
pattern ZMQ_XPUB_WELCOME_MSG = 72

pattern ZMQ_ZAP_DOMAIN :: CInt
pattern ZMQ_ZAP_DOMAIN = 55

------------------------------------------------------------------------------------------------------------------------
-- Message options

pattern ZMQ_MORE :: CInt
pattern ZMQ_MORE = 1

pattern ZMQ_SHARED :: CInt
pattern ZMQ_SHARED = 3

------------------------------------------------------------------------------------------------------------------------
-- Send/recv options

pattern ZMQ_DONTWAIT :: CInt
pattern ZMQ_DONTWAIT = 1

pattern ZMQ_SNDMORE :: CInt
pattern ZMQ_SNDMORE = 2

------------------------------------------------------------------------------------------------------------------------
-- Security mechanisms

pattern ZMQ_CURVE :: CInt
pattern ZMQ_CURVE = 2

pattern ZMQ_GSSAPI :: CInt
pattern ZMQ_GSSAPI = 3

pattern ZMQ_NULL :: CInt
pattern ZMQ_NULL = 0

pattern ZMQ_PLAIN :: CInt
pattern ZMQ_PLAIN = 1

------------------------------------------------------------------------------------------------------------------------
-- RADIO-DISH protocol

pattern ZMQ_GROUP_MAX_LENGTH :: CInt
pattern ZMQ_GROUP_MAX_LENGTH = 255

------------------------------------------------------------------------------------------------------------------------
-- GSSAPI principal name types

pattern ZMQ_GSSAPI_NT_HOSTBASED :: CInt
pattern ZMQ_GSSAPI_NT_HOSTBASED = 0

pattern ZMQ_GSSAPI_NT_KRB5_PRINCIPAL :: CInt
pattern ZMQ_GSSAPI_NT_KRB5_PRINCIPAL = 2

pattern ZMQ_GSSAPI_NT_USER_NAME :: CInt
pattern ZMQ_GSSAPI_NT_USER_NAME = 1

------------------------------------------------------------------------------------------------------------------------
-- Socket transport events (TCP, IPC and TIPC only)

pattern ZMQ_EVENT_ACCEPTED :: CInt
pattern ZMQ_EVENT_ACCEPTED = 0x0020

pattern ZMQ_EVENT_ACCEPT_FAILED :: CInt
pattern ZMQ_EVENT_ACCEPT_FAILED = 0x0040

pattern ZMQ_EVENT_ALL :: CInt
pattern ZMQ_EVENT_ALL = 0xFFFF

pattern ZMQ_EVENT_BIND_FAILED :: CInt
pattern ZMQ_EVENT_BIND_FAILED = 0x0010

pattern ZMQ_EVENT_CLOSED :: CInt
pattern ZMQ_EVENT_CLOSED = 0x0080

pattern ZMQ_EVENT_CLOSE_FAILED :: CInt
pattern ZMQ_EVENT_CLOSE_FAILED = 0x0100

pattern ZMQ_EVENT_CONNECTED :: CInt
pattern ZMQ_EVENT_CONNECTED = 0x0001

pattern ZMQ_EVENT_CONNECT_DELAYED :: CInt
pattern ZMQ_EVENT_CONNECT_DELAYED = 0x0002

pattern ZMQ_EVENT_CONNECT_RETRIED :: CInt
pattern ZMQ_EVENT_CONNECT_RETRIED = 0x0004

pattern ZMQ_EVENT_DISCONNECTED :: CInt
pattern ZMQ_EVENT_DISCONNECTED = 0x0200

pattern ZMQ_EVENT_HANDSHAKE_FAILED_AUTH :: CInt
pattern ZMQ_EVENT_HANDSHAKE_FAILED_AUTH = 0x4000

pattern ZMQ_EVENT_HANDSHAKE_FAILED_NO_DETAIL :: CInt
pattern ZMQ_EVENT_HANDSHAKE_FAILED_NO_DETAIL = 0x0800

pattern ZMQ_EVENT_HANDSHAKE_FAILED_PROTOCOL :: CInt
pattern ZMQ_EVENT_HANDSHAKE_FAILED_PROTOCOL = 0x2000

pattern ZMQ_EVENT_HANDSHAKE_SUCCEEDED :: CInt
pattern ZMQ_EVENT_HANDSHAKE_SUCCEEDED = 0x1000

pattern ZMQ_EVENT_LISTENING :: CInt
pattern ZMQ_EVENT_LISTENING = 0x0008

pattern ZMQ_EVENT_MONITOR_STOPPED :: CInt
pattern ZMQ_EVENT_MONITOR_STOPPED = 0x0400

------------------------------------------------------------------------------------------------------------------------
-- Protocol errors

pattern ZMQ_PROTOCOL_ERROR_WS_UNSPECIFIED :: CInt
pattern ZMQ_PROTOCOL_ERROR_WS_UNSPECIFIED = 0x30000000

pattern ZMQ_PROTOCOL_ERROR_ZAP_BAD_REQUEST_ID :: CInt
pattern ZMQ_PROTOCOL_ERROR_ZAP_BAD_REQUEST_ID = 0x20000002

pattern ZMQ_PROTOCOL_ERROR_ZAP_BAD_VERSION :: CInt
pattern ZMQ_PROTOCOL_ERROR_ZAP_BAD_VERSION = 0x20000003

pattern ZMQ_PROTOCOL_ERROR_ZAP_INVALID_METADATA :: CInt
pattern ZMQ_PROTOCOL_ERROR_ZAP_INVALID_METADATA = 0x20000005

pattern ZMQ_PROTOCOL_ERROR_ZAP_INVALID_STATUS_CODE :: CInt
pattern ZMQ_PROTOCOL_ERROR_ZAP_INVALID_STATUS_CODE = 0x20000004

pattern ZMQ_PROTOCOL_ERROR_ZAP_MALFORMED_REPLY :: CInt
pattern ZMQ_PROTOCOL_ERROR_ZAP_MALFORMED_REPLY = 0x20000001

pattern ZMQ_PROTOCOL_ERROR_ZAP_UNSPECIFIED :: CInt
pattern ZMQ_PROTOCOL_ERROR_ZAP_UNSPECIFIED = 0x20000000

pattern ZMQ_PROTOCOL_ERROR_ZMTP_CRYPTOGRAPHIC :: CInt
pattern ZMQ_PROTOCOL_ERROR_ZMTP_CRYPTOGRAPHIC = 0x11000001

pattern ZMQ_PROTOCOL_ERROR_ZMTP_INVALID_METADATA :: CInt
pattern ZMQ_PROTOCOL_ERROR_ZMTP_INVALID_METADATA = 0x10000018

pattern ZMQ_PROTOCOL_ERROR_ZMTP_INVALID_SEQUENCE :: CInt
pattern ZMQ_PROTOCOL_ERROR_ZMTP_INVALID_SEQUENCE = 0x10000002

pattern ZMQ_PROTOCOL_ERROR_ZMTP_KEY_EXCHANGE :: CInt
pattern ZMQ_PROTOCOL_ERROR_ZMTP_KEY_EXCHANGE = 0x10000003

pattern ZMQ_PROTOCOL_ERROR_ZMTP_MALFORMED_COMMAND_ERROR :: CInt
pattern ZMQ_PROTOCOL_ERROR_ZMTP_MALFORMED_COMMAND_ERROR = 0x10000015

pattern ZMQ_PROTOCOL_ERROR_ZMTP_MALFORMED_COMMAND_HELLO :: CInt
pattern ZMQ_PROTOCOL_ERROR_ZMTP_MALFORMED_COMMAND_HELLO = 0x10000013

pattern ZMQ_PROTOCOL_ERROR_ZMTP_MALFORMED_COMMAND_INITIATE :: CInt
pattern ZMQ_PROTOCOL_ERROR_ZMTP_MALFORMED_COMMAND_INITIATE = 0x10000014

pattern ZMQ_PROTOCOL_ERROR_ZMTP_MALFORMED_COMMAND_MESSAGE :: CInt
pattern ZMQ_PROTOCOL_ERROR_ZMTP_MALFORMED_COMMAND_MESSAGE = 0x10000012

pattern ZMQ_PROTOCOL_ERROR_ZMTP_MALFORMED_COMMAND_READY :: CInt
pattern ZMQ_PROTOCOL_ERROR_ZMTP_MALFORMED_COMMAND_READY = 0x10000016

pattern ZMQ_PROTOCOL_ERROR_ZMTP_MALFORMED_COMMAND_UNSPECIFIED :: CInt
pattern ZMQ_PROTOCOL_ERROR_ZMTP_MALFORMED_COMMAND_UNSPECIFIED = 0x10000011

pattern ZMQ_PROTOCOL_ERROR_ZMTP_MALFORMED_COMMAND_WELCOME :: CInt
pattern ZMQ_PROTOCOL_ERROR_ZMTP_MALFORMED_COMMAND_WELCOME = 0x10000017

pattern ZMQ_PROTOCOL_ERROR_ZMTP_MECHANISM_MISMATCH :: CInt
pattern ZMQ_PROTOCOL_ERROR_ZMTP_MECHANISM_MISMATCH = 0x11000002

pattern ZMQ_PROTOCOL_ERROR_ZMTP_UNEXPECTED_COMMAND :: CInt
pattern ZMQ_PROTOCOL_ERROR_ZMTP_UNEXPECTED_COMMAND = 0x10000001

pattern ZMQ_PROTOCOL_ERROR_ZMTP_UNSPECIFIED :: CInt
pattern ZMQ_PROTOCOL_ERROR_ZMTP_UNSPECIFIED = 0x10000000

------------------------------------------------------------------------------------------------------------------------
-- I/O multiplexing

pattern ZMQ_POLLIN :: CShort
pattern ZMQ_POLLIN = 1

pattern ZMQ_POLLOUT :: CShort
pattern ZMQ_POLLOUT = 2

pattern ZMQ_POLLERR :: CShort
pattern ZMQ_POLLERR = 4

pattern ZMQ_POLLPRI :: CShort
pattern ZMQ_POLLPRI = 8

------------------------------------------------------------------------------------------------------------------------
-- DRAFT socket types

pattern ZMQ_CHANNEL :: CInt
pattern ZMQ_CHANNEL = 20

pattern ZMQ_CLIENT :: CInt
pattern ZMQ_CLIENT = 13

pattern ZMQ_DGRAM :: CInt
pattern ZMQ_DGRAM = 18

pattern ZMQ_DISH :: CInt
pattern ZMQ_DISH = 15

pattern ZMQ_GATHER :: CInt
pattern ZMQ_GATHER = 16

pattern ZMQ_PEER :: CInt
pattern ZMQ_PEER = 19

pattern ZMQ_RADIO :: CInt
pattern ZMQ_RADIO = 14

pattern ZMQ_SCATTER :: CInt
pattern ZMQ_SCATTER = 17

pattern ZMQ_SERVER :: CInt
pattern ZMQ_SERVER = 12

------------------------------------------------------------------------------------------------------------------------
-- DRAFT socket options

pattern ZMQ_DISCONNECT_MSG :: CInt
pattern ZMQ_DISCONNECT_MSG = 111

pattern ZMQ_HELLO_MSG :: CInt
pattern ZMQ_HELLO_MSG = 110

pattern ZMQ_IN_BATCH_SIZE :: CInt
pattern ZMQ_IN_BATCH_SIZE = 101

pattern ZMQ_LOOPBACK_FASTPATH :: CInt
pattern ZMQ_LOOPBACK_FASTPATH = 94

pattern ZMQ_METADATA :: CInt
pattern ZMQ_METADATA = 95

pattern ZMQ_MULTICAST_LOOP :: CInt
pattern ZMQ_MULTICAST_LOOP = 96

pattern ZMQ_ONLY_FIRST_SUBSCRIBE :: CInt
pattern ZMQ_ONLY_FIRST_SUBSCRIBE = 108

pattern ZMQ_OUT_BATCH_SIZE :: CInt
pattern ZMQ_OUT_BATCH_SIZE = 102

pattern ZMQ_PRIORITY :: CInt
pattern ZMQ_PRIORITY = 112

pattern ZMQ_RECONNECT_STOP :: CInt
pattern ZMQ_RECONNECT_STOP = 109

pattern ZMQ_ROUTER_NOTIFY :: CInt
pattern ZMQ_ROUTER_NOTIFY = 97

pattern ZMQ_SOCKS_PASSWORD :: CInt
pattern ZMQ_SOCKS_PASSWORD = 100

pattern ZMQ_SOCKS_USERNAME :: CInt
pattern ZMQ_SOCKS_USERNAME = 99

pattern ZMQ_WSS_CERT_PEM :: CInt
pattern ZMQ_WSS_CERT_PEM = 104

pattern ZMQ_WSS_HOSTNAME :: CInt
pattern ZMQ_WSS_HOSTNAME = 106

pattern ZMQ_WSS_KEY_PEM :: CInt
pattern ZMQ_WSS_KEY_PEM = 103

pattern ZMQ_WSS_TRUST_PEM :: CInt
pattern ZMQ_WSS_TRUST_PEM = 105

pattern ZMQ_WSS_TRUST_SYSTEM :: CInt
pattern ZMQ_WSS_TRUST_SYSTEM = 107

pattern ZMQ_XPUB_MANUAL_LAST_VALUE :: CInt
pattern ZMQ_XPUB_MANUAL_LAST_VALUE = 98

pattern ZMQ_ZAP_ENFORCE_DOMAIN :: CInt
pattern ZMQ_ZAP_ENFORCE_DOMAIN = 93
