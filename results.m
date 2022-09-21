close all;
clc;
clear;

y1=[0.0657	0.159	0.3221	0.5333	0.7928	1.1165	1.58	1.8999	2.3242	2.9181];
y2=[0.1879	0.7141	1.704	2.8988	4.5447	6.3505	8.7331	11.0443	13.9452	16.8105];
y3=[0.1199	0.3692	0.8461	1.5048	2.2893	3.185	4.678	5.8718	7.1608	9.3792];
y4=[0.1278	0.4023	0.9362	1.6606	2.5391	3.5434	5.189	6.5401	8.0405	10.491];
x=0.1:0.1:1;

% figure(1);
% b=bar(y,0.7,'stacked','FaceColor','r');
% % box off;

figure(1);
hold on;
box off;
plot(x,y2,'color',[255*0,255*0.842,255*0.988]/255,'linestyle','--','marker','o','LineWidth',2,'MarkerSize',10);
plot(x,y1,'color',[255*1,255*0.435,255*0.569]/255,'linestyle',':','marker','s','LineWidth',2,'MarkerSize',10);
xlabel('噪声等级 (pixel)','fontsize',18','fontname', 'Times New Roman');
ylabel('误差 (pixel)','fontsize',18','fontname', 'Times New Roman');
legend('文献[16]算法','本文算法','Location','Northwest');
set(gca,'FontSize',18);

figure(2);
hold on;
box off;
plot(x,y4,'color',[255*0,255*0.842,255*0.988]/255,'linestyle','--','marker','o','LineWidth',2,'MarkerSize',10);
plot(x,y3,'color',[255*1,255*0.435,255*0.569]/255,'linestyle',':','marker','s','LineWidth',2,'MarkerSize',10);
xlabel('噪声等级 (pixel)','fontsize',18','fontname', 'Times New Roman');
ylabel('百分比 (%)','fontsize',18','fontname', 'Times New Roman');
legend('文献[16]算法','本文算法','fontname', 'Times New Roman','Location','Northwest');
set(gca,'FontSize',18);

% 
% set(gca,'XTickLabel',{'0.5','0.6','0.7','0.8','0.9','1'},'looseInset', [0 0 0.01 0],'fontname', 'Times New Roman'); %横坐标
% xlabel('噪声等级 (pixel)','fontsize',18');
% ylabel('百分比 (%)','fontsize',18');
% set(gca,'FontSize',18) 
% % for i = 1:6
% %     text(i-0.5,y(i)+0.25,num2str(y(i)),'fontsize',18,'fontname', 'Times New Roman');
% % end
% for i = 1:6
%     text(i-0.3,y(i)+0.4,num2str(y(i)),'fontsize',18,'fontname', 'Times New Roman');
% end
