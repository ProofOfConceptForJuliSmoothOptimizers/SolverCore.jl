# TO BE REMOVED
using ADNLPModels, LinearAlgebra, NLPModels, SolverCore

include("test/dummy_solver.jl")

nlp = ADNLPModel(
  x -> (x[1] - 1)^2 + 4 * (x[2] - x[1]^2)^2,
  [-1.2; 1.0],
  x -> [x[1]^2 + x[2]^2 - 1],
  [0.0],
  [0.0]
)
solver = DummySolver(Float16, nlp.meta)
output = solve!(solver, nlp, δ = 1e-2)

#%%
include("test/dummy_solver.jl")
solver = DummySolver(Val(:nosolve), nlp)
output = solve!(solver, nlp, δ = 1e-2)
@allocated output = solve!(solver, nlp, δ = 1e-2)

#%%
include("test/dummy_solver.jl")
output, solver = DummySolver(nlp)