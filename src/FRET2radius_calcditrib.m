function [P,iv] = FRET2radius_calcditrib(R0,rj,popj,sigj,SNR,I0,N,noise)
P = cell(1,4);
iv = cell(1,4);

J = numel(rj);
r_n = [];
for j = 1:J
    r_n = cat(2,r_n,random('normal',repmat(rj(j),1,round(N*popj(j))),...
        repmat(sigj(j),1,round(N*popj(j)))));
end
r_n(r_n<0) = 0;

E_n = 1./(1+((r_n/R0).^6));
switch noise
    case 1
        IA = random('poisson',I0*E_n/SNR)-I0*E_n/SNR+I0*E_n;
        ID = random('poisson',I0*(1-E_n)/SNR)-I0*(1-E_n)/SNR+I0*(1-E_n);
    case 2
        IA = random('normal',I0*E_n/SNR,sqrt(I0*E_n/SNR))-...
            I0*E_n/SNR+I0*E_n;
        ID = random('normal',I0*(1-E_n)/SNR,...
            sqrt(I0*(1-E_n)/SNR))-I0*(1-E_n)/SNR+I0*(1-E_n);
    otherwise
        disp('FRET2radius_calcditrib: noise type unknown.')
        return
end
E = IA./(IA+ID);
r = R0*(((1./E)-1).^(1/6));

[P{1},iv{1}] = histcounts(r_n,linspace(0,3*R0,100));
[P{2},iv{2}] = histcounts(E_n(imag(E_n)==0),linspace(-0.1,1.1,100));
[P{3},iv{3}] = histcounts(r(imag(r)==0),linspace(0,3*R0,100));
[P{4},iv{4}] = histcounts(E(imag(E)==0),linspace(-0.1,1.1,100));