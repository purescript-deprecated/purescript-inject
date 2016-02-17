-- | This module defines a type class `Inject` which is useful
-- | when working with coproducts of functors.

module Data.Inject
  ( class Inject
  , inj, prj
  ) where

import Prelude (const, (<<<), id)

import Data.Either (Either(..))
import Data.Functor.Coproduct (Coproduct(..), coproduct)
import Data.Maybe (Maybe(..))

-- | The `Inject` class asserts a coproduct relationship between two functors.
-- |
-- | Specifically, an instance `Inject f g` indicates that `g` is isomorphic to
-- | a coproduct of `f` and some third functor.
-- |
-- | Laws:
-- |
-- | - `prj g = Just f` if and only if `inj f = g`
class Inject f g where
  inj :: forall a. f a -> g a
  prj :: forall a. g a -> Maybe (f a)

-- | Any functor is isomorphic to the coproduct of itself with the
-- | constantly-`Void` functor.
instance injectReflexive :: Inject f f where
  inj = id
  prj = Just

-- | Left injection
instance injectLeft :: Inject f (Coproduct f g) where
  inj = Coproduct <<< Left
  prj = coproduct Just (const Nothing)

-- | Right injection
instance injectRight :: (Inject f g) => Inject f (Coproduct h g) where
  inj = Coproduct <<< Right <<< inj
  prj = coproduct (const Nothing) prj
