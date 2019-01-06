%�閧���
m = 5
%������
n = 10
MatrixSource =zeros(m,(2^m -1))
MatrixIndex = [1:(2^(m+1) - 1)];
for i = 1:(2^m - 1)
buff = fliplr(de2bi(i,m))

MatrixSource(:,i) = buff';
end
pickupIndex = nchoosek(MatrixIndex,m)
tempmatrix = zeros(m,n);
tempdelta = zeros(1,n);
maxmatrix = tempmatrix;
maxdelta = tempdelta;
buff = eye(m);
for i = 1:length(pickupIndex)
        tempmatrix = horzcat(MatrixSource(:,pickupIndex(i,:)),buff)
        if gfrank(tempmatrix) == m
            tempdelta = deltatest(tempmatrix,tempdelta,'ini');
            if maxdelta <= tempdelta
                maxdelta = tempdelta;
                maxmatrix = tempmatrix;
            end
        end
    
end
