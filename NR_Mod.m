function out = NR_Mod(inputdata,prbnum,modutype)

load('qam256.mat'); %����256QAM�������

temp = 1/(2^0.5);
QPSK_table = temp*[(1+1i),(1-1i),(-1+1i),(-1-1i)];
temp = 1/(10^0.5);
QAM16_table = temp*[(1+1i), (1+3j), (3+1i), (3+3j), (1-1i), (1-3j), (3-1i), (3-3j), ...
    (-1+1i),(-1+3j),(-3+1i),(-3+3j),(-1-1i),(-1-3j),(-3-1i),(-3-3j)];
temp = 1/(42^0.5);
QAM64_table = temp*[ (3+3j),  (3+1i),  (1+3j),  (1+1i), (3+5j), (3+7j), (1+5j), (1+7j),  ...
    (5+3j),  (5+1i),  (7+3j),  (7+1i), (5+5j), (5+7j), (7+5j), (7+7j),  ...
    (3-3j),  (3-1i),  (1-3j),  (1-1i), (3-5j), (3-7j), (1-5j), (1-7j),  ...
    (5-3j),  (5-1i),  (7-3j),  (7-1i), (5-5j), (5-7j), (7-5j), (7-7j),  ...
    (-3+3j), (-3+1i), (-1+3j), (-1+1i),(-3+5j),(-3+7j),(-1+5j),(-1+7j),  ...
    (-5+3j), (-5+1i), (-7+3j), (-7+1i),(-5+5j),(-5+7j),(-7+5j),(-7+7j),  ...
    (-3-3j), (-3-1i), (-1-3j), (-1-1i),(-3-5j),(-3-7j),(-1-5j),(-1-7j),  ...
    (-5-3j), (-5-1i), (-7-3j), (-7-1i),(-5-5j),(-5-7j),(-7-5j),(-7-7j)];
symbol_len = 12*12*prbnum;
if(modutype == 1) %QPSK
    for(kkk=1:symbol_len)
        temp  = inputdata(2*kkk-1)*2+inputdata(2*kkk)+1;
        out(kkk) = QPSK_table(temp);
    end
elseif(modutype == 2) %16QAM
    for(kkk=1:symbol_len)
        temp  = inputdata(4*kkk-3)*8+inputdata(4*kkk-2)*4+inputdata(4*kkk-1)*2+inputdata(4*kkk)+1;
        out(kkk) = QAM16_table(temp);
    end
elseif(modutype == 3) %64QAM
    for(kkk=1:symbol_len)
        temp  = inputdata(6*kkk-5)*32+inputdata(6*kkk-4)*16+inputdata(6*kkk-3)*8 ...
            + inputdata(6*kkk-2)*4+inputdata(6*kkk-1)*2 +inputdata(6*kkk)+1;
        out(kkk) = QAM64_table(temp);
    end
else %256QAM
    for(kkk=1:symbol_len)
        %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% student code
        %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% %%%%%%%%%%%%%%%%%%%%%%%%%%
        %task: 1.��������inputdata������256QAM���ƣ���������temp.
        % %        2.����qam256������ݣ�ʹ������temp�����ɵ��ƺ�����out,���256QAM���ơ�
        temp  =  inputdata(8*kkk-7)*128+inputdata(8*kkk-6)*64+inputdata(8*kkk-5)*32 + ...
            inputdata(8*kkk-4)*16 + inputdata(8*kkk-3)*8 + inputdata(8*kkk-2)*4 + ...
            inputdata(8*kkk-1)*2 + inputdata(8*kkk) + 1;

        out(kkk) =  qam256(temp);
        %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% end
        %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
    end
end