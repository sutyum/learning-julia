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

func = :(u(x, t) = 15 * exp(sin(π * x * t)))
eval(func)

latexify(func) |> render

threshold = 20;
v(x, t) = (u(x, t) > threshold) * threshold

plt = surface(t, x, u, xaxis="t [sec]", yaxis="x [m]", zaxis="T [°C]")
wireframe!(t, x, v, transparency=true)

contour(t, x, u, levels=5, fill=true, xaxis="t [sec]", yaxis="x [m]", zaxis="T [°C]")

savefig(plt, "plt.png")
