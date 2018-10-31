theoreticalvalue = plotDataTable;

[theoreticalvaluerow,theoreticalvaluecol] = size(theoreticalvalue);
for i = 2:(theoreticalvaluecol - 1)
    for j = 2:theoreticalvaluerow
        theoreticalvalue{j,i} = theoreticalvalue{1,i};
    end
end

for i = 2:(theoreticalvaluecol - 1)
    for j = 2:theoreticalvaluerow
        if theoreticalvalue{j,i} >= theoreticalvalue{j,theoreticalvaluecol}
            theoreticalvalue{j,i} = theoreticalvalue{j,theoreticalvaluecol};
        end
    end
end

theoreticalvalue(:,theoreticalvaluecol) = [];