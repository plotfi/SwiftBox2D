#include "box2d/box2d.h"

inline
const b2Shape *fromB2BodyToB2Shape(const b2Body* from) {
  return ((const b2Shape*)from);
}


inline
const b2Shape *fromB2FixtureDefToB2Shape(const b2FixtureDef* from) {
  return ((const b2Shape*)from);
}

inline
const b2Shape *fromB2PolygonShapeToB2Shape(const b2PolygonShape* from) {
  return ((const b2Shape*)from);
}


b2Fixture* CreateFixtureOnBody(b2Body *body, const b2FixtureDef* def) {
  return body->CreateFixture(def);
}


