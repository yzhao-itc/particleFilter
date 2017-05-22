function [ Y ] = Measurement( X )
%measurement model for car like mobile robot
% X - state
% Y - measurement with noise
R = diag([1.5,1.5,0.5]);
Y = [X(1);X(2);X(3)]+R*randn(3,1);


end

