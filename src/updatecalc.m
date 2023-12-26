function updatecalc(~,~,fig)

% adjust parameters in GUI
FRET2radius_setparam(fig);

% collect parameters
h = guidata(fig);
R0 = str2num(h.ed(1).String);
noise = h.pop(1).Value;
r = str2num(h.ed(2).String);
sig = str2num(h.ed(3).String);
SNR = str2num(h.ed(4).String);

% calculates distributions
[P,iv] = FRET2radius_updatecalc(R0,noise,r,sig,SNR);

% plot distributions
FRET2radius_plot(h.ax,iv{3},P{3},iv{4},P{4},r,sig,R0,SNR);