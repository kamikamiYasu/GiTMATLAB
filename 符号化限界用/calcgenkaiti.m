genkaidelta;
keisanyoumatirix = eye(7);

epsilon = 0:0.01:1;
%for文で回すためにイプシロンの列の長さを置く
[epsilonrow,epsiloncol] = size(epsilon);
%セキュリティレートを格納する変数を初期化
Rsec = zeros(epsilonrow,epsiloncol)';
%plotようにデータテーブルを作成、最初の列にx軸となるイプシロンを代入
plotgenkaiRsec = array2table(epsilon','VariableNames',{'epsilon'});
    for i = 1:epsiloncol
        Rsec(i) = calcevalkai(keisanyoumatirix,genkaidelta,epsilon(i));
    end
    sym(Rsec);
%     T = array2table(evalution,'VariableNames',{usematrix(mi).name});
%     plotDataTable(:,mi+1) = T 
%データテーブルに行列の名前の列を作成し、そこにRsecを代入
 plotgenkaiRsec(:,2) = array2table(Rsec) ;
%  plotIgenkaiRsec(:,2).Propertry.Valiablenames = 'keisanyougenkai'
plotgenkaiRsec.Properties.VariableNames{'Var2'} = 'keisanyougenkai';