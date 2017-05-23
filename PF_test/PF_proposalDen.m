function [ X_next ] = PF_proposalDen( X, U, y, f_prob, f_proposal, pmdl )
%basic particle filter by basic importance sampling and stochastic
%universal sampling for resampling
%   model:
%           x(k+1) = f(x(k), u(k)) + noise
%           y(k+1) = g(x(k)) + noise
%   X - samples of states (each row a sample)
%   U - controls
%   y - output measurement
%   f_prob - state transition probability
%   f_proposal - proposal state transition function, include q(x_next|x,y_next)
%   g - output measurement model
%   pmdl - probability model of posterior, i.e. p(y|x)
N = size(X,1);
X_next = nan(size(X));
w = nan(N,1);
for i=1:N
    [temp, p_prop] = f_proposal(X(i,:),y,U);
    X_next(i,:) = temp(:).';
    p_pre = f_prob(X_next(i,:),X(i,:),U);
    p_post = pmdl(X_next(i,:),y);
    w(i) = p_post*p_pre/p_prop;
%     w(i) = p_post*p_prop;
%     w(i) = p_post*p_pre/p_prop*w0(i);
%     post(i)=p_post;
%     prop(i)=p_prop;
%     pre(i)=p_pre;
end
w = w/sum(w);
if sum(w)<1-1e-4
    return;
end

X_next = resampling(X_next,w);



end

