##
# Simple Macros
##

macro sayHello(text::AbstractString)
  return :(println("Hello ", $text))
end

@sayHello("Satyam")
@sayHello "Satyam"

@macroexpand @sayHello "Satyam"

ex = @macroexpand @sayHello "Satyam"
typeof(ex)

macro showargs(args...)
  # display(:args)
  println("$(length(args)) args: $(:(args))")

  type = typeof(args)
  if type != Tuple
    display("Not a tuple")
  end
end

function showArgs(args...)
  println("$(length(args)) args: $(:(args)) $(typeof(args))")
end

@showargs 7 8 9
showArgs(7, 8, 9)
showArgs(x -> x^2)

@showargs x -> x^2

macro m(args...)
  println("$(length(args)) arguments")
end

@m 7 8 9

##
# Program Representation
##

# example 1
julia_expression = "2+3"

# Go from string to parsed julia
parsed_expression = Meta.parse(julia_expression)
typeof(parsed_expression)

eval(parsed_expression)
parsed_expression.head

# example 2
ex1 = "x = 2 + 4"
parsed_ex1 = Meta.parse(ex1)
eval(parsed_ex1)

x

dump(ex1)
dump(parsed_ex1)

Meta.show_sexpr(parsed_ex1)

eq_func = Expr(:call, :+, 1, 2)
eval(eq_func)

eq_func1 = Expr(:call, :*, 3, 4)
eval(eq_func1)

eq_func2 = Expr(:call, :showArgs, "hello")
eval(eq_func2)

# Symbols
goo = 42
foo = Symbol("goo")

eval(foo)

##
# Multiline Quotes (unline ``:()`)
##
comp_ex1 = quote
  function Hello()
    display("hello")
  end

  function sayBye(name::AbstractString="Satyam")
    display("Bye $name !")
  end
end

eval(comp_ex1)

Hello()
sayBye()
sayBye("Satyam")

## Interpolation
num = 43
exp1 = :(y = x -> x + $num + 2)
eval(exp1)

y(9)

a = 2
expr1 = :(a in $:((1, 2, 3)))
eval(expr1)

args = [:x, :y, :z]
expr = :(f = $(args...) -> display($(args...)))

# f = :+

eval(expr)
dump(expr)
f(2, 3, 4)
