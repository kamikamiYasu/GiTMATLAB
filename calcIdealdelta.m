usematrix = matrixstruct;

type = 'ini'

switch type
    case 'add'
        
    case 'ini'
        idealdelta = struct('name','delta');
        for mi = 1:length(struct2cell(usematrix))
        %行列の名前をコピー
        idealdelta(mi).name = usematrix(mi).name;
        [matrixrow,matrixcol] = size(usematrix(mi).matrix);
        %Δの値を一時的に格納するバッファを定義matrixcol = 漏れるビット数の最大値
        buff1 = zeros(matrixcol,1);
        %matrixに対してiビット漏れる場合の情報漏えい料を計算
        for i = (matrixcol - matrixrow + 1) : matrixcol 
            buff1(i) = i -  (matrixcol - matrixrow);
        end
        idealdelta(mi).delta = buff1;
        end
end
