class Problem39 {
   Void main() {
     Int[] solutions := (0..1000).map { 0 }
     (1..1000).each |a| {
       (a + 1..1000).each |b| {
         (b + 1..1000).each |c| {
           if (a + b + c <= 1000 && a * a + b * b == c * c) {
             solutions[a + b + c]++
           }
         }
       }
     }
     res := solutions.index(solutions.max)
     echo(res)
   }
}
