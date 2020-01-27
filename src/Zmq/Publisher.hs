module Zmq.Publisher
  ( Publisher

  , open
  , close

  , bind
  , unbind

  , connect
  , disconnect

  , send
  ) where

import Zmq.Endpoint
import Zmq.Prelude
import Zmq.Socket
import qualified Zmq.API.Bind as API
import qualified Zmq.API.Close as API
import qualified Zmq.API.Connect as API
import qualified Zmq.API.Disconnect as API
import qualified Zmq.API.Send as API
import qualified Zmq.API.Socket as API
import qualified Zmq.API.Unbind as API
import qualified Zmq.FFI as FFI


newtype Publisher
  = Publisher { unPublisher :: ForeignPtr FFI.Socket }
  deriving stock ( Eq, Data, Ord, Show )

open
  :: MonadIO m
  => m ( Maybe Publisher )
open =
  liftIO ( coerce ( API.socketIO' FFI.zMQ_PUB ) )

close
  :: MonadIO m
  => Publisher
  -> m ()
close publisher =
  liftIO ( coerce API.closeIO publisher )

bind
  :: MonadIO m
  => Publisher
  -> Endpoint transport
  -> m ( Either API.BindError () )
bind publisher endpoint =
  liftIO ( coerce API.bindIO' publisher endpoint )

unbind
  :: MonadIO m
  => Publisher
  -> Endpoint transport
  -> m ()
unbind publisher endpoint =
  liftIO ( coerce API.unbindIO' publisher endpoint )

connect
  :: MonadIO m
  => Publisher
  -> Endpoint transport
  -> m ( Either API.ConnectError () )
connect publisher endpoint =
  liftIO ( coerce API.connectIO' publisher endpoint )

disconnect
  :: MonadIO m
  => Publisher
  -> Endpoint transport
  -> m ()
disconnect publisher endpoint =
  liftIO ( coerce API.disconnectIO' publisher endpoint )

send
  :: MonadIO m
  => Publisher
  -> ByteString
  -> m ( Either API.SendError () )
send publisher message =
  liftIO ( coerce API.nonThreadsafeSend publisher message )