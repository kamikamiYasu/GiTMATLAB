%まず各符号のRsecを確保
theoreticalvalue = plotDataTable;

[theoreticalvaluerow,theoreticalvaluecol] = size(theoreticalvalue);
%すべての符号に対して
for i = 2:(theoreticalvaluecol)
    for j = 2:theoreticalvaluerow
        %イプシロン=0の値を通るx軸に水平なグラフに変更
        theoreticalvalue{j,i} = theoreticalvalue{1,i};
    end
end
%すべての符号に対して
for i = 2:(theoreticalvaluecol)
    for j = 2:theoreticalvaluerow
        %その値が符号化定理から得られる限界の直線を上回っているなら
        if theoreticalvalue{j,i} >= plotgenkaiRsec{j,2};
            %値を符号化定理の限界に変更
            theoreticalvalue{j,i} = plotgenkaiRsec{j,2};
        end
    end
end
