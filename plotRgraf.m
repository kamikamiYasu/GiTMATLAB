function plotRgraf(rTable)
 T = struct2table(rTable)
 hold on
 xlabel('n','FontSize',20);
 %x���ɃZ���̂P��ڂ��A����ȊO��y���ɂ��ꂼ��g�p���ăO���t���쐬
    plot(T{:,2},T{:,6},'r*-');
    plot(T{:,2},T{:,7},'b*-');
    legend('r^*','\overline{r}');

 hold off
end