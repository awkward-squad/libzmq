module Zmq.API.Socket
  ( socket
  , SocketError
  ) where

import Zmq.Context (context)
import Zmq.Error
import Zmq.Function
import Zmq.Prelude
import Zmq.Socket
import qualified Zmq.FFI as FFI


type SocketError
  = Error 'Function'Socket

-- | <http://api.zeromq.org/4-3:zmq-socket>
socket
  :: forall a m.
     ( IsSocketType a
     , MonadIO m
     )
  => m ( Either SocketError ( Socket a ) )
socket =
  liftIO socketIO

socketIO
  :: forall a.
     IsSocketType a
  => IO ( Either SocketError ( Socket a ) )
socketIO =
  mask \unmask -> do
    ptr :: Ptr () <-
      FFI.zmq_socket context ( socketType @a )

    if ptr == nullPtr
      then
        unmask do
          FFI.zmq_errno <&> \case
            EMFILE_ -> Left EMFILE

            EFAULT_ -> errInvalidContext
            ETERM_  -> errInvalidContext

            -- EINVAL: type system should prevent it

            n -> errUnexpectedErrno "zmq_socket" n

      else do
        foreignPtr :: ForeignPtr () <-
          newForeignPtr FFI.zmq_close ptr

        unmask ( pure ( Right ( coerce foreignPtr ) ) )
