using Pkg;
Pkg.add("ModelingToolkit");
using ModelingToolkit

@variables t x(t) RHS(t) # indedendent and dependent variables
@parameters τ # parameters
D = Differential(t) # define an operator for the differentiation w.r.t. time

# your first ODE, consisting of a single equation, indicated by ~
@named fol_seperate = ODESystem(
  [RHS ~ (1 - x) / τ,
  D(x) ~ RHS]
)

using Latexify
latexify(fol_seperate) |> render

using DifferentialEquations: solve
using Plots: plot

fol_simplified = structural_simplify(fol_seperate)

equations(fol_model)
# equations(fol_seperate)
equations(fol_simplified)

@named fol_model = ODESystem(D(x) ~ (1 - x) / τ)
equations(fol_model) == equations(fol_simplified)

prob = ODEProblem(foo_simplified,
  [x => 0.0], (0.0, 10.0), [τ => 3.0]
)

sol = solve(prob)
plot(sol, vars=[x, RHS])
