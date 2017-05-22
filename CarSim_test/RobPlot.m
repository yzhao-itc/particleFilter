function [ grahnd ] = RobPlot( grahnd, X, L, figind )
%Plot mobile robot
%   grahnd - graph handle for ploting
%   X - states [x,y,theta,phi]
%       x:      position of center of rear wheel
%       y:      position of center of rear wheel
%       theta:  angle of car body
%       phi:    angle of front wheel
%   L - length of carbot
%   figind - figure index
x = X(1);
y = X(2);
theta = X(3);
phi = X(4);
whlen = L/3;
thin = 1;
thick = 2;
mks = 3;

axiscod = [x,y;x+L*cos(theta),y+L*sin(theta)];
rearcod = [x+L/2*cos(theta+pi/2),y+L/2*sin(theta+pi/2);...
           x+L/2*cos(theta+pi*3/2),y+L/2*sin(theta+pi*3/2)];
frontcod = [rearcod(1,1)+L*cos(theta),rearcod(1,2)+L*sin(theta);...
            rearcod(2,1)+L*cos(theta),rearcod(2,2)+L*sin(theta)];
lrwcod = [rearcod(1,1)-whlen/2*cos(theta),rearcod(1,2)-whlen/2*sin(theta);...
              rearcod(1,1)+whlen/2*cos(theta),rearcod(1,2)+whlen/2*sin(theta)];
rrwcod = [rearcod(2,1)-whlen/2*cos(theta),rearcod(2,2)-whlen/2*sin(theta);...
              rearcod(2,1)+whlen/2*cos(theta),rearcod(2,2)+whlen/2*sin(theta)];
lfwcod = [frontcod(1,1)-whlen/2*cos(theta+phi),frontcod(1,2)-whlen/2*sin(theta+phi);...
              frontcod(1,1)+whlen/2*cos(theta+phi),frontcod(1,2)+whlen/2*sin(theta+phi)];
rfwcod = [frontcod(2,1)-whlen/2*cos(theta+phi),frontcod(2,2)-whlen/2*sin(theta+phi);...
              frontcod(2,1)+whlen/2*cos(theta+phi),frontcod(2,2)+whlen/2*sin(theta+phi)];

if isempty(grahnd)
    figure(figind);
    hold on;grid on;box on;
    axis equal;
    origin = plot(x,y,'mo','markersize',mks,'linewidth',thin);
    body = plot(axiscod(:,1),axiscod(:,2),'linewidth',thin,'color','b');
    rear = plot(rearcod(:,1),rearcod(:,2),'linewidth',thin,'color','b');
    front = plot(frontcod(:,1),frontcod(:,2),'linewidth',thin,'color','b');
    lrw = plot(lrwcod(:,1),lrwcod(:,2),'linewidth',thick,'color','b');
    rrw = plot(rrwcod(:,1),rrwcod(:,2),'linewidth',thick,'color','b');
    lfw = plot(lfwcod(:,1),lfwcod(:,2),'linewidth',thick,'color',[1,0.9,0]);
    rfw = plot(rfwcod(:,1),rfwcod(:,2),'linewidth',thick,'color',[1,0.9,0]);
    grahnd = [origin,body,rear,front,lrw,rrw,lfw,rfw];
else
    figure(figind);
    origin = grahnd(1);
    body = grahnd(2);
    rear = grahnd(3);
    front = grahnd(4);
    lrw = grahnd(5);
    rrw = grahnd(6);
    lfw = grahnd(7);
    rfw = grahnd(8);
    set(origin,'XData',x,'YData',y);
    set(body,'XData',axiscod(:,1),'YData',axiscod(:,2));
    set(rear,'XData',rearcod(:,1),'YData',rearcod(:,2));
    set(front,'XData',frontcod(:,1),'YData',frontcod(:,2));
    set(lrw,'XData',lrwcod(:,1),'YData',lrwcod(:,2));
    set(rrw,'XData',rrwcod(:,1),'YData',rrwcod(:,2));
    set(lfw,'XData',lfwcod(:,1),'YData',lfwcod(:,2));
    set(rfw,'XData',rfwcod(:,1),'YData',rfwcod(:,2));
end
xlim([-0.2,12]);
ylim([-1,4]);
    


end

