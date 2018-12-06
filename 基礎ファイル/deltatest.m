%usematrix = nameとmatrixを持つ構造体,havedelta =
%使用した行列の名前とのそれぞれの情報漏えい料を持つ構造体,type = 初期化するのか追加7日を判断するもの
function deltadata = deltatest(usematrix,havedelta,type)
%ここでtypeをデルタの値をすべて計算する場合はini,これまでの値に追加する場合はaddに設定する
if type ~= 'ini'
    if type ~= 'add'
        disp("error in deltaddata , type false!")
    end
end


switch type
    case 'add'
        %デルタの値を読み込む
        %現在の行列とΔの個数を読み込む
        bottom = length(struct2cell(havedelta));
%         havedelta(bottom+1).name = usematrix(bottom+1).name;
%ハブデルタの一番下に今回計算したΔを追加
        havedelta(bottom+1) = adddelta(usematrix(bottom+1));
        deltadata = havedelta
%         [matirxrow,matrixcol] = size(usematrix(bottom+1).matrix);
%         buff1 = zeros(matrixcol,1);
%         for i = 1:matrixcol
%             buff1(i) = calcDelta1(usematrix(bottom+1).matrix,i);
%         end
%         havedelta(bottom+1).delta = buff1;
    case 'ini'
        
    for mi = 1:length(struct2cell(usematrix))
        %行列の名前をコピー
        havedelta(mi).name = usematrix(mi).name;
        [~,matrixcol] = size(usematrix(mi).matrix);
        %Δの値を一時的に格納するバッファを定義matrixcol = 漏れるビット数の最大値
        buff1 = zeros(matrixcol,1);
        %matrixに対してiビット漏れる場合の情報漏えい料を計算
        for i = 1:matrixcol
            buff1(i) = calcDelta1(usematrix(mi).matrix,i);
        end
        havedelta(mi).delta = buff1;
    end
    deltadata = havedelta;
end
end

function delta = adddelta(bottommatrix)
        delta = struct('name',[],'delta',[]);
        delta.name = bottommatrix.name;
        [~,matrixcol] = size(bottommatrix.matrix);
        buff1 = zeros(matrixcol,1);
        for i = 1:matrixcol
            buff1(i) = calcDelta1(bottommatrix.matrix,i);
        end
        delta.delta = buff1;
end
