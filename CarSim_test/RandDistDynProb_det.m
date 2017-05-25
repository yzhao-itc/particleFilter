function [ p ] = RandDistDynProb_det( X_next, X, U, L, dt )
%probability of random discrete dynamics
global Q;
X_next = X_next(:);
[~,temp] = ode45(@(t,X)RobDyn(t,X,U,L),[0,dt],X);
mean = temp(end,:).';
p = exp(-(X_next - mean).'*pinv(Q.^2/1e6)*(X_next - mean)/2);
if p < 1e-9
    p = 1e-9;
end


end

