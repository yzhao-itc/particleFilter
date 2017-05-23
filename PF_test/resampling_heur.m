function [ X ] = resampling_heur( X, w )
%stochastic universal sampling for resampling
%   X - states samples (each row a sample)
%   w - weights
%   N - number of samples
global dist;
dimout = size(X,2);
w = w(:);
N = length(w);
cnts = round(N*w);

inds=[];

for i=1:N
    for j=1:cnts(i)
        inds=[inds,i];
    end
end

X = X(inds,:);
% if size(X,1) > N
%     X = X(1:N,end);
% elseif size(X,1) < N
%     X = [X;mean(X)+randn(N-size(X,1),dimout)*dist];
% end
X = X + randn(size(X,1),dimout)*dist;



end

