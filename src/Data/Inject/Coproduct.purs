module Data.Inject.Either where

import Prelude

import Data.Either (Either(..))
import Data.Functor.Coproduct (Coproduct(..), coproduct)
import Data.Maybe (Maybe(..))

class Inject f g where
  inj :: forall a. f a -> g a
  prj :: forall a. g a -> Maybe (f a)

instance injectLeft :: Inject f g => Inject f (Coproduct g h) where
  inj = Coproduct <<< Left <<< inj
  prj = coproduct prj (const Nothing)

else instance injectRight :: Inject f g => Inject f (Coproduct h g) where
  inj = Coproduct <<< Right <<< inj
  prj = coproduct (const Nothing) prj

else instance injectReflexive :: Inject f f where
  inj = id
  prj = Just
