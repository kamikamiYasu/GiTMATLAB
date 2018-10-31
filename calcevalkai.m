function rsec = calcevalkai(matrix,deltadeta,leakprovably)

[row,col] = size(deltadeta);
deltaSum = 0;
for i = 1:row
     deltaSum = deltaSum + deltadeta(i) * nchoosek(row,i) * (leakprovably^i) * (1-leakprovably)^(row - i);

end
sym(deltaSum)
rsec = (gfrank(matrix) - deltaSum) / row;
end

