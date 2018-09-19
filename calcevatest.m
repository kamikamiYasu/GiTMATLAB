function rsec = calcevatest(matrix,deltadeta,leakprovably)

[matrixrow,matrixcol] = size(deltadeta);
deltaSum = 0;
for i = 1:matrixrow
     deltaSum = deltaSum + deltadeta(i) * nchoosek(matrixrow,i) * (leakprovably^i) * (1-leakprovably)^(matrixrow - i);

end
rsec = (gfrank(matrix) - deltaSum) / matrixrow;
end

