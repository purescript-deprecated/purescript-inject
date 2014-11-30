# Module Documentation

## Module Data.Inject

### Type Classes

    class Inject f g where
      inj :: forall a. f a -> g a
      prj :: forall a. g a -> Maybe (f a)


### Type Class Instances

    instance injectLeft :: Inject f (Coproduct f g)

    instance injectReflexive :: Inject f f

    instance injectRight :: (Inject f g) => Inject f (Coproduct h g)



