function [Xd] = quad_derivative_function_input(u)
% function for calculating state derivatives of a Quadcopter 

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%% Conversion Factors
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

RTOD=180/pi; % Is required because aerodynamic data provided in degrees
DTOR=pi/180; % Used to convert back to radians for computing sin cos etc


U = u(1);
V = u(2);
W = u(3); % Body axis pitch rate
P =u(4); % translational velocity in y axis
Q =u(5); % Rotational velocity in x direction
R=u(6); % Rotational velocity in z direction 
PH =u(7); % translational velocity in x axis
THETA =u(8); % translational velocity in z axis
PSSI =u(9); % Rotational velocity in y direction
X = u(10); % Body axis yaw rate  
Y = u(11);
Z = u(12); % Body axis roll rate

% pa= u(13);
F_z= u(13) 
T_x= u(14);
T_y= u(15);
T_z= u(16);

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%% MASS PROPERTIES
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
J_r=0.05;
omega_r=1;
WGT=2; % Weight in kg
GD=9.81;  % Gravity
MASS=WGT/GD; % Mass
d = 0.6; % in meter

                  
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%% GET READY FOR STATE EQUATIONS
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%


STH=sin(THETA);
CTH=cos(THETA);
SPH=sin(PH);
CPH=cos(PH);
SPSI=sin(PSSI);
CPSI=cos(PSSI);
TTH = tan(THETA);

% %power dynamics eq
% pa1_dot= (pc1-pa1)*1.5;
% pa2_dot= (pc2-pa2)*1.5;
% pa3_dot= (pc3-pa3)*1.5;
% pa4_dot= (pc4-pa4)*1.5;
% 
% Fz= (pa1+pa2+pa3+pa4);
c = 0.016; %yawing moment coeefecient
Ixx = 1.5;
Ixy = 0.05;
Ixz = 0.02;
Iyx = Ixy;
Iyy = 1.5;
Iyz = 0.03;
Izx = 0.02;
Izy = 0.03;
Izz = 2;

Ix= Ixx;
Iy= Iyy;
Iz = Izz;
% 
% Mx = (pa3-pa1)*d;
% My=  (pa4- pa2)*d;
% Mz = ((pa1+pa3)-( pa2 +pa4))*c;


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%% FORCE EQUATIONS (Dynamics of Translation)
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
UDOT=  R*V-Q*W-GD*STH;
VDOT= -R*U+P*W+GD*SPH*CTH
WDOT= Q*U-P*V+GD*CPH*CTH-(F_z)./MASS % added thrust angle 

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%% KINEMATICS (Kinematics rotational motion)
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
PHDOT=P+TTH*(Q*SPH+ R*CPH);
THETADOT=Q*CPH -R* SPH;
PSIDOT=(Q* SPH +R*CPH)./CTH;

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%% MOMENT EQUATIONS (Dynamics of rotational motion)
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
PDOT=(d/Ixx)*T_x- (J_r/Ixx)*Q*omega_r+ (Iyy/Ixx)*R*Q - (Izz/Ixx)*Q*R;
QDOT= (d/Iyy)*T_y- (J_r/Iyy)*P*omega_r + (Izz/Iyy)*P*R - (Ixx/Iyy)*R*P;
RDOT=(1/Izz)* T_z + (Ixx/Izz)*Q*P - (Iyy/Izz)*P*Q;
 
    %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
    %%%%%%%%%% NAVIGATION EQUATIONS (Kinematics of Translation)
    %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

    X_DOT=U*CPSI*CTH + V*(-CPH*SPSI + CPSI*...
       SPH* STH) + W * (SPH * SPSI + ...
       CPH*STH*CPSI);
   
    Y_DOT = U*CTH*SPSI+V*(CPH*CPSI+SPH*SPSI*STH)+W*(-SPH*CPSI+ ...
        CPH*STH*SPSI);
    
    Z_DOT = U * STH - V * ( CTH * SPH) - ...
        W* ( CPH * CTH )
    
%     Xd=[ UDOT VDOT WDOT PHDOT THETADOT PSIDOT PDOT QDOT RDOT...
%         X_DOT Y_DOT Z_DOT pa1_dot pa2_dot pa3_dot pa4_dot ]'; % x_dot ( states )
   
   Xd=[UDOT VDOT WDOT PDOT QDOT RDOT PHDOT THETADOT PSIDOT X_DOT Y_DOT ...
      Z_DOT]'; % x_dot ( states )
   


