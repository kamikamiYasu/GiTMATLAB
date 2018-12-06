function plotData = setEvalutionData(usematrix,deltadeta,sps)
%どのぐらいの感覚でプロットするかをここで設定
epsilon = 0:sps:1;
%for文で回すためにイプシロンの列の長さを置く
[epsilonrow,epsiloncol] = size(epsilon);
%セキュリティレートを格納する変数を初期化
Rsec = zeros(epsilonrow,epsiloncol)';
%plotようにデータテーブルを作成、最初の列にx軸となるイプシロンを代入
plotData = array2table(epsilon','VariableNames',{'epsilon'});

%usematrixでforを回すため
for mi = 1:length(struct2cell(usematrix))
    for i = 1:epsiloncol
        Rsec(i) = calcevalkai(usematrix(mi).matrix,deltadeta(mi).delta,epsilon(i));
    end
    sym(Rsec);
%     T = array2table(evalution,'VariableNames',{usematrix(mi).name});
%     plotDataTable(:,mi+1) = T 
%データテーブルに行列の名前の列を作成し、そこにRsecを代入
 plotData(:,{usematrix(mi).name}) = array2table(Rsec) ;
end

end