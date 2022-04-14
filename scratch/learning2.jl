using Plots, DifferentialEquations

uₜ = (u, p, t) -> 1.01 * u
u₀ = 0.5
tspan = (0.0, 1.0)

prob = ODEProblem(uₜ, u₀, tspan)
sol = solve(prob)

plot(sol, linewidth = 1, xaxis = "t", yaxis = "uₜ", label = "t [seconds]")
