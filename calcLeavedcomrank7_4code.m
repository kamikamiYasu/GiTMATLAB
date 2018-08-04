% 検査行列A(7,4)ハミング符号
A = [1 1 1; 1 1 0; 1 0 1; 0 1 1; 1 0 0; 0 1 0; 0 0 1;]';
[Arow,Acol] = size(A);
% 漏れる列の組み合わせ計算用
v = [1:7];
%漏れるビット数
s = 4;
%情報漏えいが起きてしまう組み合わせの数
counter = 0;


leakpat = nchoosek(v,s);
[leakpatrow,leakpatcol] = size(leakpat);
for i = 1:leakpatrow
    buff1 = zeros(3,1);
    for j = 1 : s
        safebit = leakpat(i,j);
        buff1 = horzcat(buff1,A(:,safebit));
    end
    buff1(:,1) = [];
    if gfrank(buff1) ~= Arow
        counter = counter +1;
    end
end
    sprintf('ランクが下回った組み合わせは%d個です',counter)
    