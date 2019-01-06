function plotRgraf(rTable)
 T = struct2table(rTable)
 hold on
 xlabel('n','FontSize',20);
 [row,col] = size(r);
 %x軸にセルの１列目を、それ以外をy軸にそれぞれ使用してグラフを作成
    plot(rTable{:,2},rTable{:,6},'r*-');
    plot(rTable{:,2},rTable{:,7},'b*-');
    legend('$$r^*$$','$$\overline{r}$$','Interpreter', 'Latex');

 hold off
end