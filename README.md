# Module Documentation

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

#### `injectReflexive`

``` purescript
instance injectReflexive :: Inject f f
```

Any functor is isomorphic to the coproduct of itself with the 
constantly-`Void` functor.

#### `injectLeft`

``` purescript
instance injectLeft :: Inject f (Coproduct f g)
```

Left injection

#### `injectRight`

``` purescript
instance injectRight :: (Inject f g) => Inject f (Coproduct h g)
```

Right injection



