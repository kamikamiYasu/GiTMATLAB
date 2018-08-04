% 圧縮に使う行列A (Aの条件：すべての列が非ゼロベクトルであること)
A = getMatrix("Lin63");
if A == 0
    disp('matrix A is undefined')
    return
end
[Arow,Acol] = size(A);
% 漏れる列の組み合わせ計算用 (v = [1 2 ,,, Acol])
v = [1:Acol];
% 漏れるビット数
l = 4;
%安全なビット数
s = Acol - l;
%組み合わせの計算(leakpat = vCs * sの配列)
safepat = nchoosek(v,s);
%leakpatrow = vCs, leakpatcol = s
[safepatrow,safepatcol] = size(safepat);
%情報漏えいが起きてしまう組み合わせを格納
dawnranklist = zeros(safepatrow,safepatcol);
%ランクがどれほど落ちるかを格納
rankvalue = zeros(safepatrow,1);
%取りうるランクの値一覧
rankvalArray = 1:Arow;
%その個数をカウントするための変数
rankcount = zeros(1,Arow);
%すべての組み合わせに対して
for i = 1:safepatrow
    %rank A(n-l) を計算するためのバッファ
    buff1 = zeros(Arow,1);
    %buff1に情報が漏れていないビットの列を結合
    for j = 1 : s
        safebit = safepat(i,j);
        buff1 = horzcat(buff1,A(:,safebit));
    end
    %buff1から余分な0ベクトルを取り除きA(n-l)に変形
    buff1(:,1) = [];
    %Arank A(n-l) != rankA,つまりランクが落ちてしまった場合について
    if gfrank(buff1) ~= Arow
        %ランクが落ちる組み合わせを記憶
        dawnranklist(i,:) = safepat(i,:);
        %その際のランクを記憶
        rankvalue(i) = gfrank(buff1);
    end
    %rank A(n-l)がとった値とその個数を記録
    for index = rankvalArray
        if gfrank(buff1) == index
            rankcount(1,index) = rankcount(1,index) + 1;
        end
    end
    
end
%ランクが落ちる組み合わせとそのランクを結合
drlist = horzcat(dawnranklist,rankvalue)';

[drlistrow,drlistcol] = size(drlist);
%dawnranklistの中で列が０の場所を記憶
count = 0;
for i = 1:drlistcol
    if drlist(:,i) == zeros(drlistrow,1)
        count = [count;i];
    end
end
%count作成時に入力した０を削除
if count ==  0
else
    count(1) = [];
    [countrow,countcol] = size(count);
    %これでdawnranklistの０部分を全部削除できる
    drlist(:,count(:,1)) = [];
drlist = drlist';
end
%情報漏えい量の計算
delta1 = Arow;
for i = 1:Arow
    delta1 = delta1 - rankvalArray(i) * (rankcount(i) / safepatrow);
end

sprintf('Delta1 = %f',delta1)

    
