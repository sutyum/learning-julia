macro typeify(expre1)
  println("$(typeof(expre1))")
  return :($expre1)
end

@typeify z1 = z -> 2 + z

macro assert(ex)
  return :($ex ? nothing : throw(AssertionError($(string(ex)))))
end

@assert 2 + 2 == 3

