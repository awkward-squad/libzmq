module Libzmq.Bindings.Internal.DraftConstants (module Libzmq.Bindings.Internal.DraftConstants) where

import Foreign.C (CInt)

------------------------------------------------------------------------------------------------------------------------
-- Socket types

pattern ZMQ_SERVER :: CInt
pattern ZMQ_SERVER = 12

pattern ZMQ_CLIENT :: CInt
pattern ZMQ_CLIENT = 13

pattern ZMQ_RADIO :: CInt
pattern ZMQ_RADIO = 14

pattern ZMQ_DISH :: CInt
pattern ZMQ_DISH = 15

pattern ZMQ_GATHER :: CInt
pattern ZMQ_GATHER = 16

pattern ZMQ_SCATTER :: CInt
pattern ZMQ_SCATTER = 17

pattern ZMQ_DGRAM :: CInt
pattern ZMQ_DGRAM = 18

pattern ZMQ_PEER :: CInt
pattern ZMQ_PEER = 19

pattern ZMQ_CHANNEL :: CInt
pattern ZMQ_CHANNEL = 20
