module LinearAlgebraStudy
using Symbolics
using SymbolicUtils
using Plots
using LinearAlgebra


export drawVector, testVectorsIndependance, transformVectorBasis2D, transformVectorBasis4D



"""
    drawVector(f, V::Vector, origin::Vector = [0,0], xlim=(0,5), ylim=(0,5), title="Vector Plot", label = "Vector 1"))

    Draws a Vector V in the current plot at the origin.

    # Parameters
    f: Plot function
        plot or plot!
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
    drawVector(V, origin, (0,5), (0,5), "Vector Plot", "Vector 1")
    ```
"""
function drawVector(f, V::Vector, origin::Vector = [0,0], xlim=(0,5), ylim=(0,5), title="Vector Plot", label = "Vector 1")

    return f([origin[1], V[1] + origin[1]], [origin[2], V[2] + origin[2]],  xlims = xlim, ylims = ylim, line=:arrow, title = title, label = label)

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

   

"""
    transformVectorBasis2D(P::Vector, BX::Vector, BY::Vector) 
        Function to transform a given Vector P point to a new Basis. Original Basis is assumed to be
        the standard cartesian basis.
        The transformed Vector is the equivalent of the original Vector P in the new Basis.

        Vectors can be described in terms of scalar multiplication of the basis vectors:
        Example:
            P=[2,1] is the original Vector with standard cartersian basis (X=[1,0],Y=[0,1]).
            This can be written as linear combination of the basis vectors:
                P=2*X+1*Y
            
            If we want to transform this Vector to a new basis (X'=[1,1],Y'=[0,2]), we can write the
            new vector on the new basis as a linear combination and then solve for the new scalar coefficients:
                
             ```
            
            P'=c₁*X'+ c₂*Y'  ⟹ c₁ * [1,1] + c₂ * [0,2] = [2,1]

            let A = [1 0   # Matrix A with new basis vectors
                     1 2]
            
            let b = [2 1] # Vector b with original coordinates of point P.

            let c = Vector of new coordinates on new Basis corresponding to original coordinates point P.

                c = A\b

            ```

    # Parameters
    b::Vector
        Vector to be transformed.
    BX::Vector
        X-component of the new basis.
    BY::Vector
        Y-component of the new basis.

    # Returns
    p::Vector
        Transformed vector.

    # Examples

    
    
        


"""
function transformVectorBasis2D(b::Vector, BX::Vector, BY::Vector)
    A = [BX BY] # Matrix A with new basis vectors as columns
    
    c = A\b # Solve for new coordinates on new Basis corresponding to original coordinates point P.

    return c
end

"""
    transformVectorBasis2D(P::Vector, BX::Vector, BY::Vector) 
        Function to transform a given Vector P point to a new Basis. Original Basis is assumed to be
        the standard cartesian basis.
        The transformed Vector is the equivalent of the original Vector P in the new Basis.

        Vectors can be described in terms of scalar multiplication of the basis vectors:
        Example:
            P=[2,1] is the original Vector with standard cartersian basis (X=[1,0],Y=[0,1]).
            This can be written as linear combination of the basis vectors:
                P=2*X+1*Y
            
            If we want to transform this Vector to a new basis (X'=[1,1],Y'=[0,2]), we can write the
            new vector on the new basis as a linear combination and then solve for the new scalar coefficients:
                
             ```
            
            P'=c₁*X'+ c₂*Y'  ⟹ c₁ * [1,1] + c₂ * [0,2] = [2,1]

            let A = [1 0   # Matrix A with new basis vectors
                     1 2]
            
            let b = [2 1] # Vector b with original coordinates of point P.

            let c = Vector of new coordinates on new Basis corresponding to original coordinates point P.

                c = A\b

            ```

    # Parameters
    b::Vector
        Vector to be transformed.
    BX::Vector
        X-component of the new basis.
    BY::Vector
        Y-component of the new basis.

    # Returns
    p::Vector
        Transformed vector.

    # Examples

    
    
        


"""
function transformVectorBasis4D(b::Vector, BX::Vector, BY::Vector, BZ::Vector, BW::Vector)
    A = [BX BY BZ BW] # Matrix A with new basis vectors as columns
    
    c = A\b # Solve for new coordinates on new Basis corresponding to original coordinates point P.

    return c
end



end
