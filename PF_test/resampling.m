function [ X ] = resampling( X, w )
%stochastic universal sampling for resampling
%   X - states samples (each row a sample)
%   w - weights
%   N - number of samples
w = w(:);
N = length(w);
sample = rand/N + linspace(0,1,N+1);
sample = sample(:);
sample = sample(1:end-1);
wbin = tril(ones(N),0)*w;
wbin = [0;wbin];
cnts=zeros(N,1);
for i=1:N
    cnts(i) = sum((sample>=wbin(i))&(sample<wbin(i+1)));
end
inds=[];
for i=1:N
    for j=1:cnts(i)
        inds=[inds,i];
    end
end

X = X(inds,:);



end

