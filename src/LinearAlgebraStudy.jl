module LinearAlgebraStudy
using Symbolics
using SymbolicUtils
using Plots
using LinearAlgebra


export drawVector, testVectorsIndependance



"""
    drawVector(V, origin = [0,0])

    Draws a Vector V in the current plot at the origin.

    # Parameters
    V : Vector
        The vector to be drawn.
    origin : Origin Coordinate
        The origin of the coordinate system. 

    # Returns
    plot : 
        The plot of the vector.

    # Example
   ```julia
    using LinearAlgebraStudy
    V = Vector([1,2])
    origin = [0,0]
    drawVector(V, origin)
    ```
"""
function drawVector(V, origin = [0,0], xlim=5, ylim=5)
    plot!([origin[1], V[1]+origin[1]], [origin[2], V[2]+origin[2]],  xlims = [0,xlim], ylims = [0,ylim], line=:arrow)

end

"""
testVectorsIndependance(kwargs...)
    This function will take a variable number of vectors and test if they are independant.
    A Matrix "M" will be created with the vectors as columns.
    The rank of the Matrix will then be calculated.
    If the rank is equal to the number of vectors, then the vectors are independant.

    # Parameters
    kwargs : Vectors
        The vectors to be tested.

    # Returns
    result : Bool
        True if the vectors are independant, false otherwise.

"""
function testVectorsIndependance(kwargs...)
    M = hcat(kwargs...)
    rk = rank(M)
    if rk == size(M)[2]
        return true
    else
        return false
    end
end

   


end
