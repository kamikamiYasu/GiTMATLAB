usematrix = matrixstruct;
havedelta = struct('name','delta');
for mi = 1:length(struct2cell(usematrix))
    havedelta(mi).name = usematrix(mi).name;
    [matirxrow,matrixcol] = size(usematrix(mi).matrix);
    buff1 = zeros(matrixcol,1);
    for i = 1:matrixcol
        buff1(i) = calcDelta1(usematrix(mi).matrix,i);
    end
    havedelta(mi).delta = buff1;
end
        