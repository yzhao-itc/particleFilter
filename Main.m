clear;clc;clf;
% initialize random generator
rng('shuffle');
addpath('PF_test','CarSim_test');
global Q R gain Q2 R2;
Q = diag([0.02,0.02,0.04,0.02]);
R = diag([0.05,0.05,0.03]);
Q2 = diag([0.2,0.2,0.4,0.2]);
R2 = R;
gain = [diag([1,1,1]);[1/3 1/3 1/3]];
global dist;
% dist = Q*3;
dist = diag([0.01,0.01,0.01,0.01]);

N = 30;
X = randn(N,4)*diag([0.25,0.25,0.2,0.02]);
samples = plot(X(:,1),X(:,2),'g.');
hold on;
filted = mean(X);
filt = plot(filted(1),filted(2),'ks');
% simulation
dt = 0.05;
initialPose = [0 0 0 0].';
L = 0.25;
timedue = 20;

simulationTime = 0;

states = initialPose;
statedis = states;
grahnddis = RobPlot([],initialPose,L,1);
y = Measurement(states);
output = plot(y(1),y(2),'ro');
outdir = quiver(y(1),y(2),L*cos(y(3)),L*sin(y(3)),'color','m');

trj = plot(states(1,:),states(2,:),'color','r');
w = ones(N,1)/N;

measurement = [];
filtered = [];

while simulationTime < timedue
    % control and measure
    uCmd(1) = 0.7*abs(sin(simulationTime))+0.1;
    uCmd(2) = 0.08*cos(simulationTime);
    statedis = DistDyn(statedis,uCmd,L,dt);
    states = [states,statedis];
    y = Measurement(statedis);
    % plot
    grahnddis = RobPlot(grahnddis,statedis,L,1);
    set(trj,'XData',states(1,:),'YData',states(2,:));
    set(output,'XData',y(1),'YData',y(2));
    set(outdir,'xdata',y(1),'ydata',y(2),'udata',L*cos(y(3)),'vdata',L*sin(y(3)));
    % filter
    X = PF(X,uCmd,y,@(x,u)DistDyn(x,u,L,dt),@MeasureProb);
%     [X,w] = PF_proposalDen(X,uCmd,y,...
%         @(xn,x,u)RandDistDynProb(xn,x,u,L,dt),...
%         @(x,y,u)RandDistDyn_proposal(x,y,u,L,dt),...
%         @MeasureProb,w);
%     for i=1:N
%         X(i,:) = RandDistDyn_proposal(X(i,:),y,uCmd,L,dt);
%     end
    filted = mean(X);
    set(filt,'XData',filted(1),'YData',filted(2));
    set(samples,'XData',X(:,1),'YData',X(:,2));
    pause(0.0001);
    simulationTime = simulationTime + dt;
    measurement = [measurement;y(:).'];
    filtered = [filtered;mean(X)];
end
    