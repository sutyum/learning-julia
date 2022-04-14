### A Pluto.jl notebook ###
# v0.19.0

using Markdown
using InteractiveUtils

# ╔═╡ db652110-bb66-11ec-1a6a-c3c8bea7d8e2
begin 
	using Pkg
	Pkg.add(["DifferentialEquations", "Latexify", "Plots"])
	
	using Latexify
	using DifferentialEquations
	using Plots
end

# ╔═╡ bb21aefe-bda0-4bab-a16d-8c8bf334640c
md"""
# Metaporgramming
"""

# ╔═╡ 370f538e-b430-434e-9fab-b2724be05126
exp1 = :(4 + Δx)

# ╔═╡ 5d4e6834-a6d7-4a33-826f-76109cf03594
dump(exp1)

# ╔═╡ 7e3220d6-1dc6-42e6-80a6-e413c0e24823
md"""
# Plotting Simple Equations
"""

# ╔═╡ ba27437a-8fc5-4a3e-9ee4-3f55fa097ab4
Δx = 0.01

# ╔═╡ f1ef3d65-db9c-4c47-ab8b-db32b3409ea0
Δt = 0.01

# ╔═╡ bcd64de9-a320-47cd-8862-fab198226a65
x = 0:Δx:10

# ╔═╡ dc541c58-3011-4b33-a32b-012eef1a5fa4
t = 0:Δt:5

# ╔═╡ 903ef0c2-5310-42df-9a05-8d4740b33222
func = :(u(x, t) = x^π*(cos(t)+sin(π*t)))

# ╔═╡ 60c32fb0-d3af-48a6-9ef7-f72a6cd2e6c0
eval(func)

# ╔═╡ 6ee6af5f-bba7-41f5-96c3-d26be49aa4a3
typeof(u)

# ╔═╡ 142fc9a4-a9c8-47c5-b742-6bbc20220880
f_str = latexify(func)

# ╔═╡ 19ebb1b7-0c7c-429a-8ac3-a952a330a22e
surface(
	x, t, u, 
	title=f_str, 
	xlabel="x [m]", 
	ylabel="t [s]", 
	zlabel="T [°C]"
)

# ╔═╡ 30061920-17cb-4906-9b48-31e4836b4409
wireframe!(
	x, t, u
)

# ╔═╡ Cell order:
# ╟─bb21aefe-bda0-4bab-a16d-8c8bf334640c
# ╟─370f538e-b430-434e-9fab-b2724be05126
# ╟─5d4e6834-a6d7-4a33-826f-76109cf03594
# ╟─7e3220d6-1dc6-42e6-80a6-e413c0e24823
# ╟─db652110-bb66-11ec-1a6a-c3c8bea7d8e2
# ╟─ba27437a-8fc5-4a3e-9ee4-3f55fa097ab4
# ╟─f1ef3d65-db9c-4c47-ab8b-db32b3409ea0
# ╟─bcd64de9-a320-47cd-8862-fab198226a65
# ╟─dc541c58-3011-4b33-a32b-012eef1a5fa4
# ╠═903ef0c2-5310-42df-9a05-8d4740b33222
# ╟─60c32fb0-d3af-48a6-9ef7-f72a6cd2e6c0
# ╟─6ee6af5f-bba7-41f5-96c3-d26be49aa4a3
# ╟─142fc9a4-a9c8-47c5-b742-6bbc20220880
# ╠═19ebb1b7-0c7c-429a-8ac3-a952a330a22e
# ╠═30061920-17cb-4906-9b48-31e4836b4409
