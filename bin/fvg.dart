library fvg;

import 'dart:html';
import 'dart:math';

part 'v2.dart';
//part 'Particles.dart';

double fpsAverage;
/**
 * The entry point to the application.
 */
void main() {
  var system = new Main(query("#container"));
  system.start();
}

class Main {
  CanvasElement canvas;
  final num count = 34;
  CanvasRenderingContext2D context;
  num _width;
  num _height;
  num renderTime;
 // Particles particles;

  Main(this.canvas) {
  }

  _start() {
    final f = 0.1;
    final h = 1 / 1500.0;
    final g = 1 / 72.0;
    context = canvas.context2d;
   // particles = new Particles(context, count);

    // Start the animation loop.
    requestRedraw();
  }

  void draw(num _) {
    num time = new DateTime.now().millisecondsSinceEpoch;
    if (renderTime != null) {
      showFps((1000 / (time - renderTime)).round());
    }
    renderTime = time;
    drawBackground();
   // particles.draw();
    requestRedraw();
  }

  void drawBackground() {
    context.clearRect(0, 0, width, height);
  }

  void requestRedraw() {
    window.requestAnimationFrame(draw);
  }

  num get width => _width;

  num get height => _height;

  start() {
    // Measure the canvas element.
    window.setImmediate(() {
      _width = (canvas.parent as Element).clientWidth;
      _height = (canvas.parent as Element).clientHeight;

      canvas.width = _width;

      // Initialize the planets and start the simulation.
      _start();
    });
  }
}


/**
 * Display the animation's FPS in a div.
 */
void showFps(num fps) {
  if (fpsAverage == null) {
    fpsAverage = fps;
  }

  fpsAverage = fps * 0.05 + fpsAverage * 0.95;

  query("#notes").text = "${fpsAverage.round().toInt()} fps";
}

