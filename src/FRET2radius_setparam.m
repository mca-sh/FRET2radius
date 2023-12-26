function FRET2radius_setparam(fig)

% default
R0_def = 57;
r_def = 45;
dev_def = 0;
SNR_def = Inf;

h = guidata(fig);

% set Förster radius
R0 = str2num(h.ed(1).String);
if numel(R0)~=1 || R0<=0 || isinf(R0)
    R0 = R0_def;
    disp(['set R0 to default (',num2str(R0),')'])
end
h.ed(1).String = num2str(R0);

% set raidus
r = str2num(h.ed(2).String);
if numel(r)~=1 || r<=0 || isinf(r)
    r = r_def;
    disp(['set radius to default (',num2str(r),')'])
end
h.ed(2).String = num2str(r);

% set raidus deviation
dev = str2num(h.ed(3).String);
if numel(dev)~=1 || dev<0 || isinf(dev)
    dev = dev_def;
    disp(['set radius deviation to default (',num2str(dev),')'])
end
h.ed(3).String = num2str(dev);

% set signal-to-noise ratio
SNR = str2num(h.ed(4).String);
if numel(SNR)~=1 || SNR<=0
    SNR = SNR_def;
    disp(['set SNR to default (',num2str(SNR),')'])
end
h.ed(4).String = num2str(SNR);

