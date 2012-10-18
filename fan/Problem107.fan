class Problem107 {
  Void main() {
    lines := (`fan://eulerFantom/res/network.txt`.get as File)
        .readAllLines
    Edge[] edges := lines 
        .map |line, x| {
            line.split(',').map |weight, y| {
                weight != "-" && x > y ? Edge(x, y, weight.toInt) : null
            }
        }
        .flatten
        .findAll { it != null }
    set := UnionFindSet(lines.size)
    spanTreeSum := 0
    edges.sort |e1, e2| { e1.weight <=> e2.weight }.each |e| {
      if (set.find(e.v1) != set.find(e.v2)) {
        set.union(e.v1, e.v2)
        spanTreeSum += e.weight
      }
    }
    res := sum(edges.map { it.weight }) - spanTreeSum
    echo(res)
  }

  Int sum(Int[] list) {
    return list.reduce(0, |Int a, Int b -> Int| { a + b })
  }
}

const class Edge {
  const Int v1
  const Int v2
  const Int weight

  new make(Int v1, Int v2, Int weight) {
    this.v1 = v1
    this.v2 = v2
    this.weight = weight
  }

  override Str toStr() {
    return [v1, v2, weight].toStr
  }
}

class UnionFindSet {
  private Int[] parent

  new make(Int size) {
    parent = (0..<size).map { it }
  }

  Int find(Int idx) {
    if (parent[idx] == idx) {
      return idx
    } else {
      return find(parent[idx])
    }
  }

  Void union(Int a, Int b) {
    pa := find(a)
    pb := find(b)
    parent[pa] = pb
  }
}
