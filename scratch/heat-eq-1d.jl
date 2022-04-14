using Pkg;
Pkg.add(["DifferentialEquations", "Plots", "PlotThemes", "PlotlyJS", "Latexify"]);

using DifferentialEquations
using Plots
plotlyjs()
theme(:vibrant)
# theme(:dracula)

using Latexify

Δt = 0.01
Δx = 0.01

t = 0:Δt:1
x = 0:Δx:5

func = :(u(x, t) = 15 * exp(sin(2π * t)))
eval(func)

latexify(func) |> render

# surface(t, x, u, xaxis="t [sec]", yaxis="x [m]", zaxis="T [°C]")
contour(
  t, x, u,
  levels=10,
  fill=true,
  xaxis="t [sec]",
  yaxis="x [m]",
  zaxis="T [°C]"
)
