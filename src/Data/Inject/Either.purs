module Data.Inject.Either where

import Prelude

import Data.Either (Either(..), either)
import Data.Maybe (Maybe(..))

class Inject a b where
  inj :: a -> b
  prj :: b -> Maybe a

instance injectLeft :: Inject a b => Inject a (Either b c) where
  inj = Left <<< inj
  prj = either prj (const Nothing)

else instance injectRight :: Inject a b => Inject a (Either c b) where
  inj = Right <<< inj
  prj = either (const Nothing) prj

else instance injectReflexive :: Inject a a where
  inj = identity
  prj = Just
