function [ X ] = resampling_rw( X, w )
%roulette-wheel selection technique (often used in genetic algorithms)
% for sampling with replacement
%   X - states samples (each row a sample)
%   w - weights
%   N - number of samples
global dist;
dimout = size(X,2);
w = w(:);
N = length(w);

X = X(sum( bsxfun(@ge, rand(N,1), cumsum(w./sum(w))), 2) + 1,:);

% X = X + randn(N,dimout)*dist;



end

