part of fvg;

final InputElement GSlider = query("#GSlider");
final InputElement repulsionSlider = query("#repulsionSlider");
final InputElement radiusSlider = query("#radiusSlider");
final InputElement attractionSlider = query("#attractionSlider");

class Particle {
  v2     pos, vel;
  double m;
  double radius;

  Particle(this.pos, this.m) {

    Random random = new Random();
    num ff = 5;
    num f = ff/2;
     vel = new v2((random.nextDouble()*ff)-f, (random.nextDouble()*ff)-f);
    //vel = new v2(0.0, 0.0);
    radius = sqrt(m / PI);
  }

  num r() {
    return radius;
  }
}

class Particles {
  final CanvasRenderingContext2D context;
  List<Particle> particles;
  num count;
  double G = 1.0;
  double attraction = 1.0;
  double repulsion = 1.0;
  double radius = 1.0;

  Particles(this.context, this.count) {
    particles = [];
    Random random = new Random();

    particles.add(new Particle(new v2(context.canvas.width/2,context.canvas.height/2), 350.0));

    forAll((int i) {
      var x = random.nextDouble() * context.canvas.width;
      var y = random.nextDouble() * context.canvas.height;

      particles.add(new Particle(new v2(x,y), 50+( random.nextDouble()*50)));
    });
    count++;
  }

  void forAll(Function fn){
    for (int i = 0; i < count; i++) {
      fn(i);
    }
  }

  void draw() {
     G = double.parse(GSlider.value) / 100;
     repulsion = double.parse(repulsionSlider.value) / 500;
     radius = double.parse(radiusSlider.value);
     attraction = double.parse(attractionSlider.value);

    forAll((int i) {
      calcVel(i);
    });
    forAll((int i) {
      drawSelf(i);
    });
  }

  void calcVel(int i) {
    Particle p       = particles[i];
    //double force   = 0;
    forAll((int y) {
      if(y != i) {
        Particle p2  = particles[y];
        v2 delta     = p2.pos - p.pos;
        double dist2 = delta.mag2();
        double m     = p2.m * p.m;
        double force = G/p.m * (attraction * (m / dist2) - (m*repulsion / (pow(dist2/radius, 3)))); // (m/x^2) - (m/x^4 *0.6)
        p.vel        += (delta.norm().multN(force));
      }
      p.vel = p.vel.multN(0.999);
    });
  }

  void drawSelf(int i) {
    Particle p = particles[i];
    /*
    // Check for clipping.
    if (x + bodySize < 0 || x - bodySize >= context.canvas.width) {
      return;
    }
    if (y + bodySize < 0 || y - bodySize >= context.canvas.height) {
      return;
    }
*/
    if(i != 0)
     p.pos += p.vel;

    context.beginPath();
    context.arc(p.pos.x, p.pos.y, p.r(), 0, PI * 2, false);
    //context.fill();
    context.closePath();
    context.stroke();
  }


}