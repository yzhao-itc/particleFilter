function [ X ] = DistDyn( X, U, L, dt )
%discretized mobile robot dynamics

[~,temp] = ode45(@(t,X)RobDyn(t,X,U,L),[0,dt],X);
X = temp(end,:).';

end

