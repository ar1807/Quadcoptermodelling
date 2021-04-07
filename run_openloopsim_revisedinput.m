clc
clear all
% close all
RTOD=180/pi;


U_init = 0;
V_init = 0;
W_init=0; % m/sec
P_init=0; %rad
Q_init=0; %rad
R_init=0; %rad
PHI_init=0;  % rad
THETA_init=0; %rad
PSSI_init=0; % rad
X_init=0;% rad/sec
Y_init = 0;
Z_init=-100;% rad/sec


Ts=0.01;  %Step Size
simutime=50; %Simulation  % Define starting position for navigation states
XIC=[U_init V_init W_init P_init Q_init R_init PHI_init THETA_init PSSI_init X_init...
    Y_init Z_init]';

 sim('mymodel',[0 simutime]);

subplot(4,3,1)
plot(tme,U,'linewidth',2);hold on
xlabel('Time (sec)','fontsize',14)
ylabel('U (m/sec)','fontsize',14)
xticks(0:2:120)
ax = gca;
c = ax.LineWidth;
ax.LineWidth = 1.5;
ax.GridLineStyle = ':';
grid on

subplot(4,3,2)
plot(tme,V,'linewidth',2);hold on
xlabel('Time (sec)','fontsize',14)
ylabel('V (m/sec)','fontsize',14)
xticks(0:2:120)
ax = gca;
c = ax.LineWidth;
ax.LineWidth = 1.5;
ax.GridLineStyle = ':';
grid on

subplot(4,3,3)
plot(tme,W,'linewidth',2);hold on
xlabel('Time (sec)','fontsize',14)
ylabel('W (m/sec)','fontsize',14)
xticks(0:2:120)
ax = gca;
c = ax.LineWidth;
ax.LineWidth = 1.5;
ax.GridLineStyle = ':';
grid on


subplot(4,3,5)
plot(tme,rad2deg(THETA),'linestyle','-','linewidth',2);hold on
xlabel('Time (sec)','fontsize',14)
ylabel('\theta (deg)','fontsize',14)
xticks(0:2:120)
ax = gca;
c = ax.LineWidth;
ax.LineWidth = 1.5;
ax.GridLineStyle = ':';
grid on


subplot(4,3,4)
plot(tme,rad2deg(PHI),'linestyle','-','linewidth',2);hold on
xlabel('Time (sec)','fontsize',14)
ylabel('\phi (deg)','fontsize',14)
xticks(0:2:120)
ax = gca;
c = ax.LineWidth;
ax.LineWidth = 1.5;
ax.GridLineStyle = ':';
grid on


subplot(4,3,6)
plot(tme,rad2deg(PSSI),'linestyle','-','linewidth',2);hold on
xlabel('Time (sec)','fontsize',14)
ylabel('\psi (deg)','fontsize',14)
xticks(0:2:120)
ax = gca;
c = ax.LineWidth;
ax.LineWidth = 1.5;
ax.GridLineStyle = ':';
grid on


subplot(4,3,7)
plot(tme,P,'linestyle','-','linewidth',2);hold on
xlabel('Time (sec)','fontsize',14)
ylabel('P(deg/sec)','fontsize',14)
xticks(0:2:120)
ax = gca;
c = ax.LineWidth;
ax.LineWidth = 1.5;
ax.GridLineStyle = ':';
grid on


subplot(4,3,8)
plot(tme,Q,'linestyle','-','linewidth',2);hold on
xlabel('Time (sec)','fontsize',14)
ylabel('Q (deg/sec)','fontsize',14)
xticks(0:2:120)
ax = gca;
c = ax.LineWidth;
ax.LineWidth = 1.5;
ax.GridLineStyle = ':';
grid on


subplot(4,3,9)
plot(tme,R,'linestyle','-','linewidth',2);hold on
xlabel('Time (sec)','fontsize',14)
ylabel('R (deg/sec)','fontsize',14)
xticks(0:2:120)
ax = gca;
c = ax.LineWidth;
ax.LineWidth = 1.5;
ax.GridLineStyle = ':';
grid on


subplot(4,3,10)
plot(tme,X,'linestyle','-','linewidth',2);hold on
xlabel('Time (sec)','fontsize',14)
ylabel('X (m)','fontsize',14)
xticks(0:2:120)
ax = gca;
c = ax.LineWidth;
ax.LineWidth = 1.5;
ax.GridLineStyle = ':';
grid on


subplot(4,3,11)
plot(tme,Y,'linestyle','-','linewidth',2);hold on
xlabel('Time (sec)','fontsize',14)
ylabel('Y (m)','fontsize',14)
xticks(0:2:120)
ax = gca;
c = ax.LineWidth;
ax.LineWidth = 1.5;
ax.GridLineStyle = ':';
grid on

subplot(4,3,12)
plot(tme,Z,'linestyle','-','linewidth',2);hold on
xlabel('Time (sec)','fontsize',14)
ylabel('Z (m)','fontsize',14)
xticks(0:2:120)
ax = gca;
c = ax.LineWidth;
ax.LineWidth = 1.5;
ax.GridLineStyle = ':';
grid on 