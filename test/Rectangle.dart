import 'dart:math';

class Rectangle {
  int width;
  int height;
  Point origin;

  Rectangle({this.origin = const Point(0, 0), this.width = 0, this.height = 0});
  String scream(int length) => "A${'a' * length}h!";
  @override
  String toString() =>
      'Origin: (${origin.x}, ${origin.y}), width: $width, height: $height';
}

main() {
  var rec=Rectangle(origin: const Point(10, 20), width: 100, height: 200);
  print(rec);
  print(rec.scream(10));
  final circle = Circle(2);
  final square = Square(2);
  print(circle.area);
  print(square.area);
}

abstract class Shape {
  num get area;
}

class Circle implements Shape {
  final num radius;
  Circle(this.radius);
  num get area => pi * pow(radius, 2);
}

class Square implements Shape {
  final num side;
  Square(this.side);
  num get area => pow(side, 2);
}
