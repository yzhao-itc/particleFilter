function [ output_args ] = PF( X, U, y, f, g )
%basic particle filter by basic importance sampling and stochastic
%universal sampling for resampling
%   model:
%           x(k+1) = f(x(k), u(k)) + noise
%           y(k+1) = g(x(k)) + noise
%   X - samples of states (each row a sample)
%   U - controls
%   y - output measurement
%   f - state transition function
%   g - output measurement model
N = size(X,1);
X_next = nan(size(X));
for i=1:N
    temp = f(X(i,:),U);
    X_next(i,:) = temp(:).'; % forward
    



end

