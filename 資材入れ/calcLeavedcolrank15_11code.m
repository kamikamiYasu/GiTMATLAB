% 検査行列A(15,11)ハミング符号
A = [1 1 1 1; 1 1 1 0; 1 1 0 1;1 1 0 0; 1 0 1 1 ;1 0 0 1;1 0 1 0; 0 1 1 1; 0 1 1 0; 0 1 0 1; 0 0 1 1 ; 1 0 0 0 ; 0 1 0 0; 0 0 1 0;0 0 0 1]';


[Arow,Acol] = size(A);
% 漏れる列の組み合わせ計算用
v = [1:Acol];
% 漏れるビット数
l = 5;
%安全なビット数
s = Acol - l;
%情報漏えいが起きてしまう組み合わせの数
counter = 0;
%組み合わせの計算(leakpat = vCs * sの配列)
leakpat = nchoosek(v,s);
[leakpatrow,leakpatcol] = size(leakpat);
%情報漏えいが起きてしまう組み合わせを格納
falselist = zeros(leakpatrow,leakpatcol);
%ランクがどれほど落ちるかを格納
ranklist = zeros(leakpatrow,1);

rank1 = 0;
rank2 = 0;
rank3 = 0;

for i = 1:leakpatrow
    buff1 = zeros(Arow,1);
    for j = 1 : s
        safebit = leakpat(i,j);
        buff1 = horzcat(buff1,A(:,safebit));
    end
    buff1(:,1) = [];
    if gfrank(buff1) ~= Arow
        counter = counter +1;
        falselist(i,:) = leakpat(i,:);
        ranklist(i) = gfrank(buff1);
    end
    switch gfrank(buff1)
        case 1
            rank1 = rank1 + 1;
        case 2
            rank2 = rank2 + 1;
        case 3
            rank3 = rank3 + 1;
        otherwise
            
    end
end
    sprintf('ランクが下回った組み合わせは%d個です',counter)