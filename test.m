clc
clear

TransformPrcode_en = 1; %1:ʹ�ܴ���Ԥ���� 0����ʹ�ܴ���Ԥ����
cellid = 0;%С��ID
nslotnum = 2; %������֡ʱ϶��
beltaDMRS = 1; %DMRS�Ĺ�������
UL_DMRS_Config_type =1; %DMRS���������ͣ��߲��ָʾ������DMRS��ʹ��
Frist_DMRS_L0 = 3; %Type A��ӳ�䷽ʽ��L0ֵ��
Second_DMRS_L = 10;%Type A��ӳ�䷽ʽ�����ݱ�6.4.1.1.3-4���õ��ڶ������ŵ�l'
prb_num = 100;      %RB����,��ѡ50��100���˴�=100
EN_CHES =1;         %�ŵ����ƿ��أ�1:on ,0��off �˴�=1
DMRS_symbol =2; %����ο��źŵķ��Ÿ���
Nsym_slot =14;% ÿ��slotռ�õ�symbol��
 
load deremapdata0.mat %�����׼��������  1:ʹ�ܴ���Ԥ���� ��deremapdata��0:��ʹ�ܴ���Ԥ����  deremapdata0
load equdata.mat % �����׼������ݡ� ��Ƶ��������� 1:ʹ�ܴ���Ԥ���� ��equdata��0:��ʹ�ܴ���Ԥ����  equdata0

equdatar = NR_LSChannel( deremapdata,TransformPrcode_en,cellid,nslotnum,beltaDMRS,UL_DMRS_Config_type,Frist_DMRS_L0,Second_DMRS_L,prb_num,EN_CHES,DMRS_symbol,Nsym_slot);
 
errnum = sum(sum(abs(equdata-equdatar).^2))%�Ƚϱ�׼�����ʵ�ʳ��������
% errnumΪ����ƽ���ͣ���С��10^-6������д��ȷ����������д���
 if errnum >=0.000001
 disp('���������������¼�����');
 else
    disp('����У����ȷ');
 end %  