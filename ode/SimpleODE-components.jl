using Pkg;
Pkg.add(["BenchmarkTools", "DifferentialEquations", "ModelingToolkit", "Plots", "Latexify"]);

using ModelingToolkit, Plots, Latexify, DifferentialEquations, BenchmarkTools

function fol_factory(seperate=false; name)
  @parameters τ
  @variables t x(t) f(t) RHS(t)
  D = Differential(t)
  eqs = seperate ? [RHS ~ (f - x) / τ, D(x) ~ RHS] : D(x) ~ (f - x) / τ

  ODESystem(eqs; name)
end

function unitstep_fol_factory(; name)
  @parameters τ
  @variables t x(t)
  D = Differential(t)

  ODESystem(D(x) ~ (1 - x) / τ; name, defaults=Dict(x => 0.0, τ => 1.0))
end

ODEProblem(unitstep_fol_factory(name=:fol), [], (0.0, 5.0), []) |> solve |> plot

@named f1 = fol_factory()
@named f2 = fol_factory(true)

connections = [f1.f ~ 1.5, f2.f ~ f1.x]
connected = compose(ODESystem(connections, name=:connected), f1, f2)
latexify(connected) |> render

connected_simp = structural_simplify(connected)

equations(connected_simp)
latexify(connected_simp) |> render

u0 = [f1.x => -0.5, f2.x => 1.0]
p = [f1.τ => 2.0, f2.τ => 4.0]

prob = ODEProblem(
  connected_simp,
  u0,
  (0.0, 10.0),
  p;
  jac=true
  # sparse=true
)

@btime sol = solve(prob);
plot(sol)
