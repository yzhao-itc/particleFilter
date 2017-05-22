function [ dX ] = RobDyn( t, X, U, L )
%mobile robot 'dynamics' equation
%   X - states [x,y,theta,phi]
%       x:      position of center of rear wheel
%       y:      position of center of rear wheel
%       theta:  angle of car body
%       phi:    angle of front wheel
%   U - controls [v,w]
%       v:      linear velocity command
%       w:      angular velocity command
%   L - length of carbot
theta = X(3);
phi = X(4);
v = U(1);
w = U(2);
dX = [v*cos(theta);...
      v*sin(theta);...
      v/L*tan(phi);...
      w];


end

