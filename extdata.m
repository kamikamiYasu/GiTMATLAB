T = plotDataTable;

[row,col] = size(T);
max = 0;
buff = zeros(5,2);
for i = 2:col
    max = table2array(T(1,i));
    for j = 1:row
        if table2array(T(j,i)) < (max * 0.7)
            max = table2array(T(j,i));
            break
        end
    end
    buff((i-1),1) = j;
    buff((i-1),2) = max;
end

%全部が０のてーぶるをbuffの行の数だけ作る
%for分でまわして添え字がバッファの１列目の値になったときにバッファの値を代入
%あらかじめプロットの色指定の文字を格納した変数を作っておく