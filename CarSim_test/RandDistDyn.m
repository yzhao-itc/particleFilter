function [ X, p ] = RandDistDyn( X, U, L, dt )
%discretized mobile robot dynamics
global Q;
[~,temp] = ode45(@(t,X)RobDyn(t,X,U,L),[0,dt],X);
mean = temp(end,:).';
X = mean + Q*randn(4,1);
p = exp(-(X-mean).'*pinv(Q.^2)*(X-mean)/2);
if p < 1e-9
    p = 1e-9;
end

end

