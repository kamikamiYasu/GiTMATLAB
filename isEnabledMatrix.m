function log = isEnabledMatrix(matrix)

if ismatrix(matrix) == false
    log = false;
    return
end

[matrixrow,matrixcol] = size(matrix);    
if gfrank(matrix) < matrixrow
        log = false;
    else if matrixrow > matrixcol
            log = false;
        else
            log = true;
        end
end
end
