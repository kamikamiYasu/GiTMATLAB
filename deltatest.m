%使う行列を引っ張ってくる
usematrix = matrixstruct;
%ここでtypeをデルタの値をすべて計算する場合はini,これまでの値に追加する場合はaddに設定する
type = 'ini';

switch type
    case 'add'
        %デルタの値を読み込む
        %現在の行列とΔの個数を読み込む
        bottom = length(struct2cell(havedelta));
%         havedelta(bottom+1).name = usematrix(bottom+1).name;
%ハブデルタの一番下に今回計算したΔを追加
        havedelta(bottom+1) = adddelta(usematrix(bottom+1));
%         [matirxrow,matrixcol] = size(usematrix(bottom+1).matrix);
%         buff1 = zeros(matrixcol,1);
%         for i = 1:matrixcol
%             buff1(i) = calcDelta1(usematrix(bottom+1).matrix,i);
%         end
%         havedelta(bottom+1).delta = buff1;
    case 'ini'
        %havedeltaの初期化
        havedelta = struct('name','delta');
        %構造体のすべての行列に対して
    for mi = 1:length(struct2cell(usematrix))
        %行列の名前をコピー
        havedelta(mi).name = usematrix(mi).name;
        [matirxrow,matrixcol] = size(usematrix(mi).matrix);
        %Δの値を一時的に格納するバッファを定義matrixcol = 漏れるビット数の最大値
        buff1 = zeros(matrixcol,1);
        %matrixに対してiビット漏れる場合の情報漏えい料を計算
        for i = 1:matrixcol
            buff1(i) = calcDelta1(usematrix(mi).matrix,i);
        end
        havedelta(mi).delta = buff1;
    end
end
   
function deltadata = adddelta(bottommatrix)
        deltadata = struct('name',[],'delta',[]);
        deltadata.name = bottommatrix.name;
        [matirxrow,matrixcol] = size(bottommatrix.matrix);
        buff1 = zeros(matrixcol,1);
        for i = 1:matrixcol
            buff1(i) = calcDelta1(bottommatrix.matrix,i);
        end
        deltadata.delta = buff1;
end
