part of fvg;

class Particle {
  v2 pos, vel;
  Particle(this.pos) {
    vel = new v2(0,0);
  }
}

class Particles {
  final CanvasRenderingContext2D context;
  List<Particle> particles;
  num count;

  Particles(this.context, this.count) {
    particles = [];
    Random random = new Random();
/*
    forAll((int i) {
    });*/
    var x = random.nextDouble() * context.canvas.width;
    var y = random.nextDouble() * context.canvas.height;
    particles.add(new Particle(new v2(x,y)));
  }
/*
  void forAll(Function fn){
    for (int i = 0; i < count; i++) {
      fn(i);
    }
  }
*/
  void draw() {
    //forAll((int i) {
    //});
    drawSelf(0);
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

    context.beginPath();
    v2 pos = p.pos;
    context.arc(pos.x, pos.y, 10, 0, PI * 2, false);
    //context.fill();
    context.closePath();
    context.stroke();
  }


}