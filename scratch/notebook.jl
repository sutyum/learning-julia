### A Pluto.jl notebook ###
# v0.14.5

using Markdown
using InteractiveUtils

# ╔═╡ bd8820c0-7644-433e-bdeb-1f634a7d2c35
begin
	import Pkg;
	Pkg.add("DifferentialEquations")
	Pkg.add("Plots")
end

# ╔═╡ 33c2324e-b991-11ec-0e1d-a5d3993f3db8
begin
	using Plots
	using DifferentialEquations

	l = 1.0
	m = 1.0
	g = 9.81

	function pendulum!(du, u, p, t)
		du[1] = u[2]
		du[2] = -3g/(2l)*sin(u[1]) + 3/(m*l^2)*p(t)
	end
	
	θ₀ = 0.01
	ω₀ = 0.0
	u₀ = [θ₀, ω₀]
	tspan = (0.0, 10.0)
	
	M = t -> 0.1sin(t)
	
	prob = ODEProblem(pendulum!, u₀, tspan, M)
	sol = solve(prob)
	
	plot(sol, linewidth=2, xaxis="t", label=["θ [rad]" "ω [rad/s]"], layout=(2,1))
end

# ╔═╡ eaa86018-7ace-4905-b21e-31c197c47844
md"""
# Starting with Differential Equations
"""

# ╔═╡ 0224ae86-e66f-4df2-9523-bcc0c6d05b49
md"""
$ \frac{d \theta (t)}{dt} = ω(t) $
"""

# ╔═╡ c886fb30-9cfa-4ff5-b037-27f9d9cf4e79
md"""
$ \frac{d \omega (t)}{dt} = - \frac {3}{2} \frac {g}{l} sin \theta (t) - \frac {3}{ml^2} M(t)' $
"""

# ╔═╡ 15298628-751e-4db6-89d1-dcd90d50dca7


# ╔═╡ Cell order:
# ╟─eaa86018-7ace-4905-b21e-31c197c47844
# ╟─bd8820c0-7644-433e-bdeb-1f634a7d2c35
# ╟─0224ae86-e66f-4df2-9523-bcc0c6d05b49
# ╟─c886fb30-9cfa-4ff5-b037-27f9d9cf4e79
# ╠═33c2324e-b991-11ec-0e1d-a5d3993f3db8
# ╠═15298628-751e-4db6-89d1-dcd90d50dca7
