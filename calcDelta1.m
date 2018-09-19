 function delta1 = calcDelta1(matrix,leakbit)

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% 圧縮に使う行列Aの判定 (Aの条件：すべての列が非ゼロベクトルであること)
A = matrix;
Arank = gfrank(A);
[Arow,Acol] = size(A);
if Acol == leakbit
    delta1 = Arank;
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
rankvalArray = 1:Arank;
%その個数をカウントするための変数
rankcount = zeros(1,Arank);
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
%     buff1(:,1) = [];
    
    %rank A(n-l)がとった値とその個数を記録
    tes = gfrank(buff1); 
    for index = rankvalArray
        if tes == index
            rankcount(1,index) = rankcount(1,index) + 1;
        end
    end
    
end

%deの計算
delta1 = Arank;
buff2 = rankvalArray .* sym(rankcount ./ safepatrow);
delta1 = delta1 - sum(buff2);
% for i = 1:Arow
%     delta1 = delta1 - rankvalArray(i) * (rankcount(i) / safepatrow);
% end
end


