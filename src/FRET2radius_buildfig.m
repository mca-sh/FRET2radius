function fig = FRET2radius_buildfig

un = 'pixels';
fun = 'points';
fsz = 8;
mg = 10;
warr = 20;
wed = 40;
wax = 400;
hax = 200;
hed = 20;
htxt = 14;
hpop = 22;
wbut = 20;
str0 = 'R0';
str1 = 'noise type';
str2 = {'poisson','normal'};
str3 = 'radius';
str4 = 'radius dev.';
str5 = 'SNR';
str6 = 'Refresh calculations';
tblfle = 'charDimTable.mat';

load(tblfle,'tbl');


% calculates dimensions
wpop = getUItextWidth(str1,fun,fsz,'normal',tbl)+warr;
wtxt3 = max([wed,getUItextWidth(str3,fun,fsz,'normal',tbl)]);
wtxt4 = max([wed,getUItextWidth(str4,fun,fsz,'normal',tbl)]);
wtxt5 = max([wed,getUItextWidth(str5,fun,fsz,'normal',tbl)]);
wprm = max([mg+wed+mg+wpop+mg,...
    mg+wtxt3+mg/2+wbut+mg/2+wbut+mg+wtxt4+mg/2+wbut+mg/2+wbut+mg+wtxt5+...
    mg/2+wbut+mg/2+wbut+mg]);
wfig = wprm+wax+mg;
hfig = mg+hax+mg+hax+mg;

fig = figure('menubar','none','numbertitle','off','name','FRET to radius',...
    'units',un);
fig.Position([3,4]) = [wfig,hfig];

% initialize structure
h.txt = [];
h.ed = [];
h.pop = [];
h.push = [];
h.ax = [];

% general settings
x = mg;
y = hfig-mg-htxt;

h.txt = cat(2,h.txt,uicontrol('parent',fig,'style','text','units',un,...
    'fontunits',fun,'fontsize',fsz,'position',[x,y,wed,htxt],'string',...
    str0));

x = x+wed+mg;

h.txt = cat(2,h.txt,uicontrol('parent',fig,'style','text','units',un,...
    'fontunits',fun,'fontsize',fsz,'position',[x,y,wpop,htxt],'string',...
    str1));

x = mg;
y = y-hpop+(hpop-hed)/2;

h.ed = cat(2,h.ed,uicontrol('parent',fig,'style','edit','units',un,...
    'fontunits',fun,'fontsize',fsz,'position',[x,y,wed,hed]));

x = x+wed+mg;
y = y-(hpop-hed)/2;

h.pop = cat(2,h.pop,uicontrol('parent',fig,'style','popup','units',un,...
    'fontunits',fun,'fontsize',fsz,'position',[x,y,wpop,hpop],'string',...
    str2,'callback',{@updatecalc,fig}));

% settings
x = mg;
y = y-mg-htxt;

h.txt = cat(2,h.txt,uicontrol('parent',fig,'style','text','units',un,...
    'fontunits',fun,'fontsize',fsz,'position',[x,y,wtxt3,htxt],'string',...
    str3));

x = x+wtxt3+mg/2+wbut+mg/2+wbut+mg;

h.txt = cat(2,h.txt,uicontrol('parent',fig,'style','text','units',un,...
    'fontunits',fun,'fontsize',fsz,'position',[x,y,wtxt4,htxt],'string',...
    str4));

x = x+wtxt4+mg/2+wbut+mg/2+wbut+mg;

h.txt = cat(2,h.txt,uicontrol('parent',fig,'style','text','units',un,...
    'fontunits',fun,'fontsize',fsz,'position',[x,y,wtxt5,htxt],'string',...
    str5));

x = mg;
y = y-hed;

h.ed = cat(2,h.ed,uicontrol('parent',fig,'style','edit','units',un,...
    'fontunits',fun,'fontsize',fsz,'position',[x,y,wtxt3,hed],'callback',...
    {@changeprm,1,0,fig}));

x = x+wtxt3+mg/2;

h.push = cat(2,h.push,uicontrol('parent',fig,'style','pushbutton','units',un,...
    'fontunits',fun,'fontsize',fsz,'position',[x,y,wbut,hed],'string',...
    '-','callback',{@changeprm,1,-1,fig}));

x = x+wbut+mg/2;

h.push = cat(2,h.push,uicontrol('parent',fig,'style','pushbutton','units',un,...
    'fontunits',fun,'fontsize',fsz,'position',[x,y,wbut,hed],'string',...
    '+','callback',{@changeprm,1,1,fig}));

x = x+wbut+mg;

h.ed = cat(2,h.ed,uicontrol('parent',fig,'style','edit','units',un,...
    'fontunits',fun,'fontsize',fsz,'position',[x,y,wtxt4,hed],'callback',...
    {@changeprm,2,0,fig}));

x = x+wtxt4+mg/2;

h.push = cat(2,h.push,uicontrol('parent',fig,'style','pushbutton','units',un,...
    'fontunits',fun,'fontsize',fsz,'position',[x,y,wbut,hed],'string',...
    '-','callback',{@changeprm,2,-1,fig}));

x = x+wbut+mg/2;

h.push = cat(2,h.push,uicontrol('parent',fig,'style','pushbutton','units',un,...
    'fontunits',fun,'fontsize',fsz,'position',[x,y,wbut,hed],'string',...
    '+','callback',{@changeprm,2,1,fig}));

x = x+wbut+mg;

h.ed = cat(2,h.ed,uicontrol('parent',fig,'style','edit','units',un,...
    'fontunits',fun,'fontsize',fsz,'position',[x,y,wtxt5,hed],'callback',...
    {@changeprm,3,0,fig}));

x = x+wtxt5+mg/2;

h.push = cat(2,h.push,uicontrol('parent',fig,'style','pushbutton','units',un,...
    'fontunits',fun,'fontsize',fsz,'position',[x,y,wbut,hed],'string',...
    '-','callback',{@changeprm,3,-1,fig}));

x = x+wbut+mg/2;

h.push = cat(2,h.push,uicontrol('parent',fig,'style','pushbutton','units',un,...
    'fontunits',fun,'fontsize',fsz,'position',[x,y,wbut,hed],'string',...
    '+','callback',{@changeprm,3,1,fig}));

x = mg;
y = y-mg-hed;

h.push = cat(2,h.push,uicontrol('parent',fig,'style','pushbutton','units',...
    un,'fontunits',fun,'fontsize',fsz,'position',[x,y,wprm-2*mg,hed],...
    'string',str6,'callback',{@updatecalc,fig}));

% plot
x = wprm;
y = hfig-mg-hax;

h.ax = cat(2,h.ax,axes('parent',fig,'units',un,'fontunits',fun,'fontsize',fsz,...
    'position',[x,y,wax,hax]));
xlabel(h.ax(1),'radius');
ylabel(h.ax(1),'norm. counts');
ylim(h.ax(1),[0,0.25]);
pos = getRealPosAxes([x,y,wax,hax],h.ax(1).TightInset,'traces');
h.ax(1).Position = pos;

y = y-mg-hax;

h.ax = cat(2,h.ax,axes('parent',fig,'units',un,'fontunits',fun,'fontsize',...
    fsz,'position',[x,y,wax,hax]));
xlabel(h.ax(2),'FRET');
ylabel(h.ax(2),'norm. counts');
ylim(h.ax(2),[0,0.25]);
pos = getRealPosAxes([x,y,wax,hax],h.ax(2).TightInset,'traces');
h.ax(2).Position = pos;

set(fig,'units','normalized');
for chld = fig.Children'
    chld.Units = 'normalized';
end

guidata(fig,h);



