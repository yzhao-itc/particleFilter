function [ X ] = resampling_gaus( X, w )
%stochastic universal sampling for resampling
%   X - states samples (each row a sample)
%   w - weights
%   N - number of samples
N = length(w);
w = w(:);
wX = diag(w)*X;
miu = sum(wX);
sigma = (X-miu).'*diag(w)*(X-miu);
[U,S,~]=svd(sigma);
sigma = U*sqrt(S)*U.';

X = randn(N,4)*sigma + miu;

end

