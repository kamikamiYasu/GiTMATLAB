%havedelta = 行列のシュミレーション値　idealdelta = その行列と同じ行、列数の行列での情報漏えい料の最高値
deltadeta = havedelta
%matrixstructは構造体でcell配列にすると1列目に行列の名前、２列めに行列が格納されている
usematrix = matrixstruct;
%どのぐらいの感覚でプロットするかをここで設定
epsilon = 0:0.01:1;
%for文で回すためにイプシロンの列の長さを置く
[epsilonrow,epsiloncol] = size(epsilon);
%セキュリティレートを格納する変数を初期化
Rsec = zeros(epsilonrow,epsiloncol)';
%構造体の最後尾の添字
bot = length(struct2cell(usematrix))

    for i = 1:epsiloncol
        Rsec(i) = calcevalkai(usematrix(bot).matrix,deltadeta(bot).delta,epsilon(i));
    end
    sym(Rsec)
%     T = array2table(evalution,'VariableNames',{usematrix(mi).name});
%     plotDataTable(:,mi+1) = T 
%データテーブルに行列の名前の列を作成し、そこにRsecを代入
 plotDataTable(:,{usematrix(bot).name}) = array2table(Rsec) ;