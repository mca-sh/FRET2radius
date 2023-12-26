function [P,iv] = FRET2radius_updatecalc(R0,noise,r,sig,SNR)

N = 100000; % number of bursts
I0 = 100; % PC per burst

[P,iv] = FRET2radius_calcditrib(R0,r,1,sig,SNR,I0,N,noise);

