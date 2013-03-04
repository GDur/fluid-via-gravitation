part of fvg;

class Particles {
  final CanvasRenderingContext2D context;

  List<Particles> particles;

  Particles(this.context, num count) {
    particles = [];
    Random random = new Random();

    // Asteroids are generally between 2.06 and 3.27 AUs.
    for (int i = 0; i < count; i++) {
      var radius = 2.06 + random.nextDouble() * (3.27 - 2.06);
    }
  }

  void addp(Particles p) {
    particles.add(p);
  }

  void draw() {
    v2 pos = _calculatePos();
    drawSelf();
  }

  void drawSelf() {
    /*
    // Check for clipping.
    if (x + bodySize < 0 || x - bodySize >= context.canvas.width) {
      return;
    }
    if (y + bodySize < 0 || y - bodySize >= context.canvas.height) {
      return;
    }

    // Draw the figure.
    context.lineWidth = 0.5;
    context.fillStyle = color;
    context.strokeStyle = color;

    if (bodySize >= 2.0) {
      context.shadowOffsetX = 2;
      context.shadowOffsetY = 2;
      context.shadowBlur = 2;
      context.shadowColor = "#ddd";
    }

    context.beginPath();
    context.arc(x, y, bodySize, 0, PI * 2, false);
    context.fill();
    context.closePath();

    context.shadowOffsetX = 0;
    context.shadowOffsetY = 0;
    context.shadowBlur = 0;

    context.beginPath();
    context.arc(x, y, bodySize, 0, PI * 2, false);
    context.fill();
    context.closePath();
    context.stroke();
    */
  }

  void drawChildren(CanvasRenderingContext2D context, num x, num y) {
    for (var p in particles) {
      p.draw();
    }
  }

  num _calculateSpeed(num period) {
    if (period == 0.0) {
      return 0.0;
    } else {
      return 1 / (60.0 * 24.0 * 2 * period);
    }
  }

  v2 _calculatePos() {
    /*
    if (orbitSpeed == 0.0) {
      return new v2(x, y);
    } else {
      num angle = solarSystem.renderTime * orbitSpeed;

      return new v2(
        orbitRadius * cos(angle) + x,
        orbitRadius * sin(angle) + y
      );
    }*/
  }
}