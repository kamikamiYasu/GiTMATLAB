T = plotDataTable;

[row,col] = size(T);
max = 0;
buff = zeros(5,2);
for i = 2:col
    max = table2array(T(1,i));
    for j = 1:row
        if table2array(T(j,i)) < (max * 0.7)
            max = table2array(T(j,i));
            break
        end
    end
    buff((i-1),1) = j;
    buff((i-1),2) = max;
end

%�S�����O�̂ā[�Ԃ��buff�̍s�̐��������
%for���ł܂킵�ēY�������o�b�t�@�̂P��ڂ̒l�ɂȂ����Ƃ��Ƀo�b�t�@�̒l����
%���炩���߃v���b�g�̐F�w��̕������i�[�����ϐ�������Ă���