% 検査行列A(7,4)ハミング符号
A = B
[Arow,Acol] = size(A);
% 漏れる列の組み合わせ計算用
v = [1:7];
%漏れるビット数
s = 3;
%情報漏えいが起きてしまう組み合わせの数
counter = 0;


leakpat = nchoosek(v,s);
[leakpatrow,leakpatcol] = size(leakpat);
for i = 1:leakpatrow
    buff1 = zeros(7,1);
    for j = 1 : s
        safebit = leakpat(i,j);
        buff1 = horzcat(buff1,A(:,safebit));
    end
    buff1(:,1) = [];
    if gfrank(buff1) ~= 4
        counter = counter +1;
        buff1
    end
end
    sprintf('ランクが下回った組み合わせは%d個です',counter)
    