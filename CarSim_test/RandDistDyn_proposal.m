function [ X, p ] = RandDistDyn_proposal( X, y, U, L, dt )
%discretized mobile robot dynamics
global Q2;
global gain;
[~,temp] = ode45(@(t,X)RobDyn(t,X,U,L),[0,dt],X);
X = temp(end,:).';
[~,ypred] = Measurement(X);
mean = X + gain*(y(:) - ypred);
X = mean + Q2*randn(4,1);
p = exp(-(X - mean).'*pinv(Q2.^2)*(X - mean)/2);
if p < 1e-9
    p = 1e-9;
end

end

