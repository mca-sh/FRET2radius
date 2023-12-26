function FRET2radius()

% add source folders to MATLAB search path
disp('set MATLAB search path...')
codePath = fileparts(mfilename('fullpath'));
addpath(genpath(codePath));

% create GUI
disp('create GUI...')
fig = FRET2radius_buildfig;

% update calculations
disp('update calculations...')
updatecalc([],[],fig);

% show success
disp('FRET2radius is ready!')











