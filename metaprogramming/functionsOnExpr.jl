function make_expr(op, op1, op2)
  return Expr(:call, op, op1, op2)
end

make_expr(:+, 2, 3)

say = (x, y) -> println("$x , $y")
eval(make_expr(:say, "hello", "Satyam"))

function math_expr(op, op1, op2)
  # transform the inputs
  opr1f, opr2f = map(x -> isa(x, Number) ? x + 1 : x, (op1, op2))

  # construct and return tranformed expression
  return Expr(:call, op, opr1f, opr2f)
end

math_expr(:+, 2, 3)

