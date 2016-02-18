square = (x) -> x * x

math =
  root:   Math.sqrt
  square: square
  cube:   (x) -> x * square x

test = math.root 9

console.log "CoffeeScript: Square root of 9 is " + test