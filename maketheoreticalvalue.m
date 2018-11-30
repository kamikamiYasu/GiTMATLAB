theoreticalvalue = plotDataTable;

[theoreticalvaluerow,theoreticalvaluecol] = size(theoreticalvalue);
for i = 2:(theoreticalvaluecol)
    for j = 2:theoreticalvaluerow
        theoreticalvalue{j,i} = theoreticalvalue{1,i};
    end
end

for i = 2:(theoreticalvaluecol)
    for j = 2:theoreticalvaluerow
        if theoreticalvalue{j,i} >= plotgenkaiRsec{j,2};
            theoreticalvalue{j,i} = plotgenkaiRsec{j,2};
        end
    end
end
