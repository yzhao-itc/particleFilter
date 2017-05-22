function [ X ] = RandDistDyn( X, U, L, dt )
%discretized mobile robot dynamics

[~,temp] = ode45(@(t,X)RobDyn(t,X,U,L),[0,dt],X);
X = temp(end,:).';
Q = diag([0.5,0.5,0.02,0.3]);
X = X + Q*randn(4,1);

end

