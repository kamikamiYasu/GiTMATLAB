%���͂Ɏg���f�[�^�Z�����w��
inputData = plotDataTable;

colordata = {'c-','m-','y-','r-','g-','b-'};
%�O���t�̏㏑���ݒ�
hold on 
%x�Cy���̃��x���ݒ�
xlabel('$$\varepsilon$$','Interpreter','Latex','FontSize',20);
ylabel('$$R_{sec}$$','Interpreter', 'Latex','FontSize',20);
[row,col] = size(inputData);
%x���ɃZ���̂P��ڂ��A����ȊO��y���ɂ��ꂼ��g�p���ăO���t���쐬
    plot(inputData{:,1},inputData{:,2:col},'-');
    legend(inputData.Properties.VariableNames{2:col});

 hold off