%�܂��e������Rsec���m��
FTtheorval = plotFTRate;

[theoreticalvaluerow,theoreticalvaluecol] = size(FTtheorval);
%���ׂĂ̕����ɑ΂���
for i = 2:(theoreticalvaluecol)
    for j = 2:theoreticalvaluerow
        %�C�v�V����=0�̒l��ʂ�x���ɐ����ȃO���t�ɕύX
        FTtheorval{j,i} = FTtheorval{1,i};
    end
end
%���ׂĂ̕����ɑ΂���
for i = 2:(theoreticalvaluecol)
    for j = 2:theoreticalvaluerow
        %���̒l���������藝���瓾������E�̒����������Ă���Ȃ�
        if FTtheorval{j,i} >= plotgenkaiRsec{j,2};
            %�l�𕄍����藝�̌��E�ɕύX
            FTtheorval{j,i} = plotgenkaiRsec{j,2};
        end
    end
end
