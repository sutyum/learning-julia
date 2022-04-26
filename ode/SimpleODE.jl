using ModelingToolkit

@variables t x(t)
@parameters τ
D = Differential(t)

@named fol_model = ODESystem(D(x) ~ (1 - x) / τ)

using Latexify
latexify(fol_model) |> render

using DifferentialEquations
using Plots

plot(solve(prob))
