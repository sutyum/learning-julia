# https://mtk.sciml.ai/stable/tutorials/ode_modeling/#Your-very-first-ODE

using ModelingToolkit
using Plots
using Latexify

@variables t f(t)
# @named fol_variable_f = ODESystem([f ~ sin(t), D(x) ~ (f - x) / τ])

##
## Constant Forcing Term
##

@named fol_f = ODESystem([D(x) ~ (1 - x) / τ])
latexify(fol_f) |> render

# Response against Constant input
prob = ODEProblem(structural_simplify(fol_f),
  [x => 0.0],
  (0.0, 10.0),
  [τ => 0.75]
)

plot(solve(prob), vars=[x])

##
## System with a Forcing Term
##

# Arbitrary Forcing Term
value_vector = randn(10)
f_func(t) = t >= 10 ? value_vector[end] : value_vector[Int(floor(t))+1]

# `f_func` is the forcing term (External Input) f(t) is not contant
# This essentially models a time series input, such as measurement data from an experiment
# For this, MTK allows to "register" arbitrary Julia functions, which are excluded from symbolic transformations 
# but are just used as-is. So, you could, for example, interpolate a given time series using DataInterpolations.jl. 
# Here, we illustrate this option by a simple lookup ("zero-order hold") of a vector of random values

plot(f_func)

@register_symbolic f_func(t)

@named fol_external_f = ODESystem([f ~ f_func(t), D(x) ~ (f - x) / τ])
latexify(fol_external_f) |> render

# Response against a Data Driven Forcing Term
prob_forcing = ODEProblem(structural_simplify(fol_external_f),
  [x => 0.0],
  (0.0, 10.0),
  [τ => 0.75]
)

sol = solve(prob_forcing)
plot(solve(prob_forcing), vars=[x, f])
