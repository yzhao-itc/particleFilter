clear;clc;
dt = 0.05;
initialPose = [0 0 0 0].';
L = 0.25;
timedue = 20;

simulationTime = 0;

states = initialPose;
statedis = states;
grahnddis = RobPlot([],initialPose,L,1);

trj = plot(states(1,:),states(2,:),'color','r');

while simulationTime < timedue
    uCmd(1) = 0.7*abs(sin(simulationTime))+0.1;
    uCmd(2) = 0.08*cos(simulationTime);
    statedis = DistDyn(statedis,uCmd,L,dt);
    states = [states,statedis];
    grahnddis = RobPlot(grahnddis,statedis,L,1);
    set(trj,'XData',states(1,:),'YData',states(2,:));
    pause(0.001);
    simulationTime = simulationTime + dt;
end
    