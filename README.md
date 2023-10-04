# SwiftBox2D


This is an example of how to use an external C++ Library (from homebrew) with Swift using C++-Interop.

The library used here is box2d (a 2D physics engine for games).

## Steps 1, install box2d:

`brew install box2d`

## Steps 2, clone this repo:

`git clone https://github.com/plotfi/SwiftBox2D`

## Step 3, set your homebrew path environment variable:

I put my homebrew in ~/opt/homebrew because I really dislike how homebrew modifies the sytsem library layout. I also really dislike that x64 homebrew is in /usr/local and arm64 homebrew is in /opt some place. Also, my employer's packaging system uses opt as well which makes homebrew in default dirs even more problematic.

Anyhow, I set mine to `export BREWDIR=$HOME/opt/homebrew`, set yours however you'd like.

## Steps 4, annotate types as reference types as needed:

At this point, for this particular library one of our libraries has to be a reference type.
Ideally you'd want to wire up ARC but here we are going to use immortal foreign references for brevity.

All you'll need to do is modify the line `class B2_API b2Body` at `$BREWDIR/Cellar/box2d/2.4.1/include/box2d/b2_body.h` to `class B2_API IMMORTAL_REF b2Body` so that it looks like so:

```c++
/// A rigid body. These are created via b2World::CreateBody.
class B2_API IMMORTAL_REF b2Body
{
public:
	/// Creates a fixture and attach it to this body. Use this function if you need
	/// to set some fixture parameters, like friction. Otherwise you can create the
	/// fixture directly from a shape.
```

## Step 5, build and run:

```bash
make
./Box2DHello.exe
```

The output should look like:

```
time step index: 42
0.0 1.3722225 0.0
time step index: 43
0.0 1.2500004 0.0
time step index: 44
0.0 1.1250004 0.0
time step index: 45
4.0935977e-14 1.0145822 0.00014126342
time step index: 46
-7.3666545e-11 1.0146508 0.0001100473
time step index: 47
4.118562e-09 1.0147082 8.584162e-05
```

