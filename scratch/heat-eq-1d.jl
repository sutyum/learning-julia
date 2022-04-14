using Pkg; Pkg.add(["DifferentialEquations", "Plots"])

using DifferentialEquations
using Plots

Δt = 0.01
Δx = 0.01

t = 0:Δt:1
x = 0:Δx:1

u = (x, t) -> 15*exp(sin(2π*t) + cos(π*t)) + x

surface(t, x, u, xaxis = "t [sec]", yaxis = "x [m]", zaxis = "T [°C]")
