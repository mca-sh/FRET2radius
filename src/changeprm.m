function changeprm(~,~,prm,change,fig)
% default
incr_r = 2;
incr_dev = 1;

h = guidata(fig);
switch prm
    case 1 % radius
        r = str2num(h.ed(2).String);
        r = r+incr_r*change;
        r(r<1) = 1;
        h.ed(2).String = num2str(r);
    case 2 % radius dev
        dev = str2num(h.ed(3).String);
        dev = dev+incr_dev*change;
        dev(dev<0) = 0;
        h.ed(3).String = num2str(dev);
    case 3 % SNR
        SNR = str2num(h.ed(4).String);
        if isinf(SNR) && change==-1
            SNR = 10000;
        elseif SNR>10000
            SNR = Inf;
        end
        SNR = 10^(log10(SNR)+0.1*change);
        SNR(SNR<0) = 0.0001;
        h.ed(4).String = num2str(SNR);
    otherwise
        disp('changeprm: wrong parameter value.')
        return
end

updatecalc([],[],fig);


function ord = calcorder(n)
ord = 0;
