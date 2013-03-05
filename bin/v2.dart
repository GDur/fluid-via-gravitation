part of fvg;

class v2 {
  num x, y;
  v2(this.x, this.y);
  v2.zero()                : x = 0, y = 0;
  operator +( v2 v)  => new v2(x + v.x, y + v.y);
  v2 add( v2 v)      => new v2(x + v.x, y + v.y);

  operator -( v2 v)  => new v2(x - v.x, y - v.y);
  v2 sub( v2 v)      => new v2(x - v.x, y - v.y);

  operator *( v2 v)  => new v2(x * v.x, y * v.y);
  v2 mult( v2 v)     => new v2(x * v.x, y * v.y);

  v2 multN( num f)   => new v2(x * f, y * f);
  num dot( v2 v)     => x * v.x + y * v.y;
  num mag2()              => x * x + y * y;
  num mag()               => sqrt(mag2());
  v2 reflect( v2 n)  => this.sub(n.multN(n.dot(this) * 2.0));
  v2 reflectN( v2 n) => reflect(n.norm());
  v2 negate()             => new v2(-x, -y);
  v2 inv()                => new v2(1 / x, 1 / y);
  v2 mirX()               => new v2(-x, y);
  v2 mirY()               => new v2(x, -y);
  v2 ortho()              => new v2(-y, x);
  v2 lerp(v2 v, num t)    => this.multN(1.0 - t).add(v.multN(t));
  v2 norm() {
     num length = mag();
    return new v2(x / length, y / length);
  }
  v2 rot( num angle) {
     num sinA = sin(angle);
     num cosA = cos(angle);
    return new v2(cosA * x - sinA * y, sinA * x + cosA * y);
  }
  v2.polar( num theta,  num radius) {
    x = cos(theta) * radius;
    y = sin(theta) * radius;
  }
  String toString()       => "v2($x, $y)";

}