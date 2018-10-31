usedatatable = plotDataTable;

[row,col] = size(usedatatable);
max = 0;
buff = zeros(2,(col-1));
for i = 2:col
    max = table2array(usedatatable(1,i));
    for j = 1:row
        if table2array(usedatatable(j,i)) < (max * 0.99)
            max = table2array(usedatatable(j,i));
            break;
        end
    end
    buff(1,(i-1)) = table2array(usedatatable(j,1));
    buff(2,(i-1)) = max;
end
% sz = [row col];
% vartype = {'double','double','double','double','double','double'};
% suisendata = table('size' , sz ,'VariableTypes' ,vartype,'VariableNames',usedatatable.Properties.VariableNames)
% suisendata.epsilon = usedatatable.epsilon;
% for i = 2:col
%     epspot = buff(1,(i-1))
%     for j = 1:row
%         if table2array(suisendata(j,1)) == epspot
%             suisendata(j,i) = array2table(buff(2,(i-1)))
%             break
%         end
%     end
% end
hold on 
   stem(buff(1,:),buff(2,:),'k*','DisplayName','ˆÀ’è’l * 0.99');
hold off
   
