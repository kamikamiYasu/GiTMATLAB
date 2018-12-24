%”é–§î•ñ”
m = 5
%•„†’·
n = 10
MatrixSource =zeros(m,(2^m -1))
MatrixIndex = [1:(2^m - 1)];
for i = 1:(2^m - 1)
buff = fliplr(de2bi(i,m))

MatrixSource(:,i) = buff';
end

pickupIndex = nchoosek(MatrixIndex,n);