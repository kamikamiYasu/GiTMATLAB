%matrix = m * n行列,leakbit = 1 * nのベクトルで中身は1:n
%これが前提条件
function delta1_2 = calcDelta1(matrix,leakbit)

A = matrix;
[Arow,Acol] = size(A);
%leakbitの列の長さを格納
leaklen = length(leakbit)
%delta1(leakbit)を格納する変数、leakbitの数分列がある
Deltade = zeros(1,leaklen);
%leakbitの中に符号長を超える部分がないか判定するための変数
B = leakbit(~(leakbit <= Acol));
%Bが空行列、つまり符号長を超えるものがない場合
if ~isempty(B)
    %BにAcolの値、つまり
    B = leakbit(~(leakbit < Acol))
    Deltade(1,B) = Acol;
else
    disp("error! leakbit over the range")
end
if Acol == leakbit
    delta1_2 = Arow;
    return
else if Acol < leakbit
        disp("error!")
        return
    end
end
% 列のインデックス
AcolIndex = [1:Acol];
%安全なビット数
s = Acol - leakbit;
%組み合わせの計算(leakpat = vCs * sの配列)
safepat = nchoosek(AcolIndex,s);
%safepatrow = vCs, safepatcol = s
[safepatrow,safepatcol] = size(safepat);

%取りうるランクの値一覧
rankvalArray = 1:Arow;
%その個数をカウントするための変数
rankcount = zeros(1,Arow);
%すべての組み合わせに対して
for i = 1:safepatrow
    %rank A(n-l) を計算するためのバッファ
    buff1 = zeros(Arow,s);
    %buff1に情報が漏れていないビットの列を結合
    for j = 1 : s
        safebit = safepat(i,j);
        buff1(:,j) = A(:,safebit);
    end
    %buff1から余分な0ベクトルを取り除きA(n-l)に変形
    buff1(:,1) = [];
    
    %rank A(n-l)がとった値とその個数を記録
    for index = rankvalArray
        if gfrank(buff1) == index
            rankcount(1,index) = rankcount(1,index) + 1;
        end
    end
    
end

%deの計算
delta1_2 = Arow;
buff2 = rankvalArray .* sym(rankcount ./ safepatrow);
delta1_2 = delta1_2 - sum(buff2);
% for i = 1:Arow
%     delta1 = delta1 - rankvalArray(i) * (rankcount(i) / safepatrow);
% end
end


