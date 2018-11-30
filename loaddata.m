% 情報漏えい量や秘密情報伝送料のロード。開始時にはこれを実行
clear
%各行列のRsecとεが格納されたセル行列。列にそれぞれの名前がついていて１列ずつ値が格納されている
load('plotDataTable.mat')
%使用する行列とその名前が格納された構造体。行ごとに格納されている
load('matrixstruct.mat')
%行列の名前とΔが格納された構造体。新しいものは一番下の行に追加される。デルタは１列に格納されている
load('havedelta.mat')
%それぞれの行列のRsecの理論値とそのデルタが格納されている
load('plotIdealTable.mat')
load('plotgenkaiRsecOthers.mat')

