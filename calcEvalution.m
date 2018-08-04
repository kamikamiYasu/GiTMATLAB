function evalution = calcEvalution(matrix, leakprovably)
[matrixrow,matrixcol] = size(matrix);
deltaL = zeros(1,matrixcol);
deltaSum = 0;
leakbit = 1:matrixcol;
for i = 1:matrixcol
    deltaL(i) = calcDelta1(matrix,leakbit(i));

end
  deltaL = sym(deltaL);
for i = 1:matrixcol
    deltaSum = deltaSum + deltaL(i) * nchoosek(matrixcol,i) * (leakprovably^i) * (1-leakprovably)^(matrixcol - i);
end
evalution = (matrixrow - deltaSum) / matrixcol;