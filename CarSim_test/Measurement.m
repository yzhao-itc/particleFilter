function [ Yrnd, Y ] = Measurement( X )
%measurement model for car like mobile robot
% X - state
% Y - measurement with noise
global R;
Y = [X(1);X(2);X(3)];
Yrnd = Y + R*randn(3,1);


end

