abstract type AbstractOptSolver{T} <: AbstractSolver{T}

#=
Constructors:
- Solver(T, Val(:nosolve), nlp)
- Solver(T, nlp)
- Solver(meta)
- Solver(Val(:nosolve), nlp)
- Solver(nlp)
=#
function (::Type{S})(::Type{T}, nlp :: AbstractNLPModel) where {T, S <: AbstractOptSolver}
  solver = S(T, nlp.meta)
  output = solve!(solver, nlp)
  return output, solver
end
(::Type{S})(::Type{T}, ::Val{:nosolve}, nlp :: AbstractNLPModel) where {T, S <: AbstractOptSolver} = S(T, nlp.meta)
(::Type{S})(::Val{:nosolve}, nlp :: AbstractNLPModel) where {S <: AbstractOptSolver} = S(Float64, Val(:nosolve), nlp)
(::Type{S})(nlp :: AbstractNLPModel) where {S <: AbstractOptSolver} = S(Float64, nlp)
(::Type{S})(meta :: AbstractNLPModelMeta) where {S <: AbstractOptSolver} = S(Float64, meta)
