import box2d
import box2dTypeConvert

// Define the gravity vector.
var gravity = b2Vec2(0.0, -10.0)

// Construct a world object, which will hold and simulate the rigid bodies.
var world = b2World(gravity)

// Define the ground body.
var groundBodyDef = b2BodyDef()
groundBodyDef.position.Set(0.0, -10.0)

// Call the body factory which allocates memory for the ground body
// from a pool and creates the ground box shape (also from a pool).
// The body is also added to the world.
var groundBody = world.CreateBody(&groundBodyDef)

// Define the ground box shape.
var groundBox = b2PolygonShape()

// The extents are the half-widths of the box.
groundBox.SetAsBox(50.0, 10.0)

// Add the ground fixture to the ground body.
groundBody!.CreateFixture(fromB2PolygonShapeToB2Shape(&groundBox), 0.0);

// Define the dynamic body. We set its position and call the body factory.
var bodyDef = b2BodyDef()
bodyDef.type = b2_dynamicBody
bodyDef.position.Set(0.0, 4.0)
var body = world.CreateBody(&bodyDef)

// Define another box shape for our dynamic body.
var dynamicBox = b2PolygonShape()
dynamicBox.SetAsBox(1.0, 1.0)

// Define the dynamic body fixture.
var fixtureDef = b2FixtureDef()
fixtureDef.shape = fromB2PolygonShapeToB2Shape(&dynamicBox)

// Set the box density to be non-zero, so it will be dynamic.
fixtureDef.density = 1.0

// Override the default friction.
fixtureDef.friction = 0.3

// Add the shape to the body.
let fix = CreateFixtureOnBody(body, &fixtureDef)


// Prepare for simulation. Typically we use a time step of 1/60 of a
// second (60Hz) and 10 iterations. This provides a high quality simulation
// in most game scenarios.
var timeStep: Float = 1.0 / 60.0
var velocityIterations: Int32 = 6
var positionIterations: Int32 = 2

var position: b2Vec2 = body!.GetPosition().pointee
var angle = body!.GetAngle()

// This is our little game loop.
for i in 0..<60 {
  // Instruct the world to perform a single step of simulation.
  // It is generally best to keep the time step and iterations fixed.
  world.Step(timeStep, velocityIterations, positionIterations)

  print("time step index: \(i)")

  // Now print the position and angle of the body.
  position = body!.GetPosition().pointee
  angle = body!.GetAngle()

  print("\(position.x) \(position.y) \(angle)")
}

print("Done")
