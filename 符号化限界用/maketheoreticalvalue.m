%まず各符号のRsecを確保
FTtheorval = plotFTRate;

[theoreticalvaluerow,theoreticalvaluecol] = size(FTtheorval);
%すべての符号に対して
for i = 2:(theoreticalvaluecol)
    for j = 2:theoreticalvaluerow
        %イプシロン=0の値を通るx軸に水平なグラフに変更
        FTtheorval{j,i} = FTtheorval{1,i};
    end
end
%すべての符号に対して
for i = 2:(theoreticalvaluecol)
    for j = 2:theoreticalvaluerow
        %その値が符号化定理から得られる限界の直線を上回っているなら
        if FTtheorval{j,i} >= plotgenkaiRsec{j,2};
            %値を符号化定理の限界に変更
            FTtheorval{j,i} = plotgenkaiRsec{j,2};
        end
    end
end
