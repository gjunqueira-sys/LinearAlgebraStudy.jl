module LinearAlgebraStudy
using Symbolics
using SymbolicUtils
using Plots

export drawVector

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


end
