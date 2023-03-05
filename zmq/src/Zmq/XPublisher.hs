module Zmq.XPublisher
  ( XPublisher,
    open,
    bind,
    unbind,
    connect,
    disconnect,
    send,
    receive,
    canSend,
    canReceive,
  )
where

import Control.Concurrent.MVar
import Data.ByteString (ByteString)
import Data.Coerce (coerce)
import Data.Text (Text)
import Libzmq
import Zmq.Error (Error)
import Zmq.Internal.Socket (CanReceive, CanSend, Event, Socket (withSocket), ThreadSafeSocket)
import Zmq.Internal.Socket qualified as Socket

-- | A thread-safe __xpublisher__ socket.
--
-- Valid peers: __subscriber__, __xsubscriber__
newtype XPublisher
  = XPublisher (MVar Zmq_socket)
  deriving stock (Eq)
  deriving (Socket) via (ThreadSafeSocket)

instance CanSend XPublisher

instance CanReceive XPublisher

-- | Open an __xpublisher__.
open :: IO (Either Error XPublisher)
open =
  coerce (Socket.openThreadSafeSocket ZMQ_XPUB)

-- | Bind an __xpublisher__ to an __endpoint__.
--
-- /Alias/: 'Zmq.bind'
bind :: XPublisher -> Text -> IO (Either Error ())
bind =
  Socket.bind

-- | Unbind an __xpublisher__ from an __endpoint__.
--
-- /Alias/: 'Zmq.unbind'
unbind :: XPublisher -> Text -> IO ()
unbind =
  Socket.unbind

-- | Connect an __xpublisher__ to an __endpoint__.
--
-- /Alias/: 'Zmq.connect'
connect :: XPublisher -> Text -> IO (Either Error ())
connect =
  Socket.connect

-- | Disconnect an __xpublisher__ from an __endpoint__.
--
-- /Alias/: 'Zmq.disconnect'
disconnect :: XPublisher -> Text -> IO ()
disconnect =
  Socket.disconnect

-- | Send a __topic message__ on an __xpublisher__ to all peers.
--
-- If a peer has a full message queue, it will not receive the message.
send :: XPublisher -> ByteString -> ByteString -> IO (Either Error ())
send socket0 topic message =
  withSocket socket0 \socket ->
    Socket.send2 socket topic message

-- | Receive a __message__ on an __xpublisher__ from any peer (fair-queued).
receive :: XPublisher -> IO (Either Error ByteString)
receive socket =
  withSocket socket Socket.receive

-- | /Alias/: 'Zmq.canSend'
canSend :: XPublisher -> a -> Event a
canSend =
  Socket.canSend

-- | /Alias/: 'Zmq.canReceive'
canReceive :: XPublisher -> a -> Event a
canReceive =
  Socket.canReceive
