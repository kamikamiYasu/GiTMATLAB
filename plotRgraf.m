function plotRgraf(rTable)
 T = struct2table(rTable)
 hold on
 xlabel('n','FontSize',20);
 [row,col] = size(r);
 %x���ɃZ���̂P��ڂ��A����ȊO��y���ɂ��ꂼ��g�p���ăO���t���쐬
    plot(rTable{:,2},rTable{:,6},'r*-');
    plot(rTable{:,2},rTable{:,7},'b*-');
    legend('$$r^*$$','$$\overline{r}$$','Interpreter', 'Latex');

 hold off
end