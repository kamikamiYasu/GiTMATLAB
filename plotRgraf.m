function plotRgraf(rTable)
 T = struct2table(rTable)
 hold on
 xlabel('n','FontSize',20);
 %x軸にセルの１列目を、それ以外をy軸にそれぞれ使用してグラフを作成
    plot(T{:,2},T{:,6},'r*-');
    plot(T{:,2},T{:,7},'b*-');
    legend('r^*','\overline{r}');

 hold off
end