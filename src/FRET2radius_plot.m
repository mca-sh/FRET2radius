function FRET2radius_plot(ax,Y3,Z3,Y4,Z4,r,sig,R0,SNR)

% default
clr1 = [0,0,0];
clr2 = [0.5,0.5,0.5];
clr3 = [0.7,0,0];

for a = 1:numel(ax)
    cla(ax(a));
end
set(ax,'nextplot','add');

histogram(ax(1),'bincounts',Z3/sum(Z3),'binedges',Y3,'FaceColor',clr1,...
    'Facealpha',1);
histogram(ax(2),'bincounts',Z4/sum(Z4),'binedges',Y4,'facecolor',clr1,...
    'Facealpha',1);

plot(ax(1),[r,r],ax(1).YLim,'linestyle','--','color',clr2,'linewidth',2);
plot(ax(1),[R0,R0],ax(1).YLim,'linestyle','--','color',clr3,'linewidth',2);
plot(ax(2),1./(1+([r,r]/R0).^6),ax(2).YLim,'linestyle','--','color',clr2,...
    'linewidth',2);

xlabel(ax(1),'app. radius');
xlabel(ax(2),'FRET');
ylabel(ax(1),'norm. counts');
ylabel(ax(2),'norm. counts');

xlim(ax(1),[0,3*R0]);
xlim(ax(2),[-0.1,1.1]);
ylim(ax,'auto');
ax(1).YLim(2) = 3*max(Z3/sum(Z3))/2;

legend(ax(1),{sprintf('shot-noise broadened, SNR=%0.1f',SNR),...
    ['r=',num2str(r),'±',num2str(sig),sprintf(' (E=%.2f)',1/(1+((r/R0)^6)))...
    ],['R0=',num2str(R0)]},'numcolumns',2);
