import Control.Concurrent (threadDelay)
import Control.Exception (throwIO)
import Control.Monad (forever)
import Data.List.NonEmpty (pattern (:|))
import Zmq qualified
import Zmq.Responder qualified

main :: IO ()
main =
  zmq do
    Zmq.run Zmq.defaultOptions do
      Zmq.Responder.with \responder -> do
        zmq (Zmq.Responder.bind responder (Zmq.Tcp "*:5555"))

        forever do
          _ <- zmq (Zmq.Responder.receive responder)
          putStrLn "Received Hello"
          threadDelay 1_000_000
          zmq (Zmq.Responder.send responder ("World" :| []))

zmq :: IO (Either Zmq.Error a) -> IO a
zmq action =
  action >>= \case
    Left err -> throwIO err
    Right value -> pure value