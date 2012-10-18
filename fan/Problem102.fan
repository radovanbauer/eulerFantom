class Problem102 {
  Void main() {
    Int[][] triangles := (`fan://eulerFantom/res/triangles.txt`.get as File)
        .readAllLines
        .map { it.split(',').map { it.toInt } }
    res := triangles
        .findAll { inTriangle(
            Point(it[0], it[1]),
            Point(it[2], it[3]),
            Point(it[4], it[5]),
            Point(0, 0)) }
        .size
    echo(res)
  }

  Bool inTriangle(Point p1, Point p2, Point p3, Point p4) {
    return inHalfPlane(p1, p2, p3, p4)
        && inHalfPlane(p2, p3, p1, p4)
        && inHalfPlane(p3, p1, p2, p4)
  }

  Bool inHalfPlane(Point p1, Point p2, Point p3, Point p4) {
    line := line(p1, p2)
    x := line[0] * p3.x + line[1] * p3.y + line[2]
    y := line[0] * p4.x + line[1] * p4.y + line[2]
    return (x <=> 0) * (y <=> 0) >= 0
  }

  Int[] line(Point p1, Point p2) {
    a := p1.y - p2.y
    b := p2.x - p1.x
    c := p1.x * p2.y - p2.x * p1.y
    return [a, b, c]
  }
}

const class Point {
  const Int x
  const Int y

  new make(Int x, Int y) {
    this.x = x
    this.y = y
  }
}