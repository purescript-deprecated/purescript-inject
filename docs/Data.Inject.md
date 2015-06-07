## Module Data.Inject

This module defines a type class `Inject` which is useful
when working with coproducts of functors.

#### `Inject`

``` purescript
class Inject f g where
  inj :: forall a. f a -> g a
  prj :: forall a. g a -> Maybe (f a)
```

The `Inject` class asserts a coproduct relationship between two functors.

Specifically, an instance `Inject f g` indicates that `g` is isomorphic to
a coproduct of `f` and some third functor.

Laws:

- `prj g = Just f` if and only if `inj f = g`

##### Instances
``` purescript
instance injectReflexive :: Inject f f
instance injectLeft :: Inject f (Coproduct f g)
instance injectRight :: (Inject f g) => Inject f (Coproduct h g)
```


