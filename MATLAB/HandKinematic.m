%% Hand Kinematic Function
% This Function provides the kinematic model of the hand. It considers each
% finger as a manipulator and throuhgt DH parameters generates the model.
% Its neccessary to get the finger measurements, thumb measurements and
% palm measurements to derivate all the requierements dimensions and
% generate the hand model.

% Last review version 12/12/2018 11:10pm

function [] = HandKinematic(FingerMeasurements,ThumbMeasurements,PalmMeasurements)

% [FingerMeasurements,ThumbMeasurements,PalmMeasurements] = pointstoparameters(centroids);

% close all
% clear
% clc

%% KINEMATICS OF THE THUMB
th1 = ThumbMeasurements(1);
th2 = ThumbMeasurements(2);
th3 = ThumbMeasurements(3);
th4 = ThumbMeasurements(4);
th5 = ThumbMeasurements(5);
theta_t = [-25,0,-90,0,0]';
alpha_t = [-90,-90,225,0,0]';
a_t = [th1,th2,th3,th4,th5]';
d_t = [0,69.8,0,0,0]';

linkno = [1, 2, 3, 4, 5]';
disp('DhParameters of the Thumb')
disp('     Link  |  theta  |  aplha  |    d    |    a   |')
DHParameters_Thumb = [linkno, theta_t, alpha_t, d_t, a_t];
disp(DHParameters_Thumb)
for n=1:5
    T(:,:,n) = dh2transMatrix(theta_t(n),d_t(n),alpha_t(n),a_t(n),2);
end
Tt01 = T(:,:,1);
Tt12 = T(:,:,2);
Tt23 = T(:,:,3);
Tt34 = T(:,:,4);
Tt45 = T(:,:,5);
T_thumb1 = Tt01*Tt12;
T_thumb2 = Tt01*Tt12*Tt23;
T_thumb3 = Tt01*Tt12*Tt23*Tt34;
T_thumbtip = Tt01*Tt12*Tt23*Tt34*Tt45;
figure(1)
scatter3(Tt01(13),Tt01(14),Tt01(15),'o')
hold on
scatter3(T_thumb1(13),T_thumb1(14),T_thumb1(15),'o');
scatter3(T_thumb2(13),T_thumb2(14),T_thumb2(15),'o');
scatter3(T_thumb3(13),T_thumb3(14),T_thumb3(15),'o');
scatter3(T_thumbtip(13),T_thumbtip(14),T_thumbtip(15),'o')
axis equal
xlabel('X [mm]')
ylabel('Y [mm]')
zlabel('Z [mm]')
title('HAND MODEL')

%% KINEMATICS OF THE FINGERS

M_palm = PalmMeasurements(1);
R_palm = PalmMeasurements(2);
P_palm = PalmMeasurements(3);
I_palm = PalmMeasurements(1);

%% PINKY FINGER
P_dip = FingerMeasurements(1);
P_pip = FingerMeasurements(2);
P_mcp = FingerMeasurements(3);
theta_p = [90,0,0,0,0]';
alpha_p = [0,90,0,0,0]';
a_p = [P_palm,0,P_mcp,P_pip,P_dip]';
d_p = [0,0,0,0,0]';
linkno = [1, 2, 3, 4, 5]';
disp('DhParameters of the Pinky Finger')
disp('     Link  |  theta  |  aplha  |    d    |    a   |')
DHParameters_Pinky = [linkno, theta_p, alpha_p, d_p, a_p];
disp(DHParameters_Pinky)
for n=1:5
    T(:,:,n) = dh2transMatrix(theta_p(n),d_p(n),alpha_p(n),a_p(n),2);
end
Tfp01 = T(:,:,1);
Tfp12 = T(:,:,2);
Tfp23 = T(:,:,3);
Tfp34 = T(:,:,4);
Tfp45 = T(:,:,5);
T_pinky2 = Tfp01*Tfp12;
T_pinky3 = Tfp01*Tfp12*Tfp23;
T_pinky4 = Tfp01*Tfp12*Tfp23*Tfp34;
T_pinky5 = Tfp01*Tfp12*Tfp23*Tfp34*Tfp45;

%% RING FINGER
R_dip = FingerMeasurements(4);
R_pip = FingerMeasurements(5);
R_mcp = FingerMeasurements(6);
theta_r = [90,0,90,90,90]';
alpha_r = [0,90,0,0,0]';
a_r = [R_palm,0,R_mcp,R_pip,R_dip]';
d_r = [0,0,0,0,0]';
linkno = [1, 2, 3, 4, 5]';
disp('DhParameters of the Ring Finger')
disp('     Link  |  theta  |  aplha  |    d    |    a   |')
DHParameters_Ring = [linkno, theta_r, alpha_r, d_r, a_r];
disp(DHParameters_Ring)
for n=1:5
    T(:,:,n) = dh2transMatrix(theta_r(n),d_r(n),alpha_r(n),a_r(n),2);
end
Tfr01 = T(:,:,1);
Tfr12 = T(:,:,2);
Tfr23 = T(:,:,3);
Tfr34 = T(:,:,4);
Tfr45 = T(:,:,5);
T_ring2 = Tfr01*Tfr12;
T_ring3 = Tfr01*Tfr12*Tfr23;
T_ring4 = Tfr01*Tfr12*Tfr23*Tfr34;
T_ring5 = Tfr01*Tfr12*Tfr23*Tfr34*Tfr45;

%% MIDDLE FINGER
M_dip = FingerMeasurements(7);
M_pip = FingerMeasurements(8);
M_mcp = FingerMeasurements(9);

theta_m = [90,0,90,0,0]';
alpha_m = [0,90,0,0,0]';
a_m = [M_palm,0,M_mcp,M_pip,M_dip]';
d_m = [0,0,0,0,0]';
linkno = [1, 2, 3, 4, 5]';
disp('DhParameters of the Middle Finger')
disp('     Link  |  theta  |  aplha  |    d    |    a   |')
DHParameters_Middle = [linkno, theta_m, alpha_m, d_m, a_m];
disp(DHParameters_Middle)
for n=1:5
    T(:,:,n) = dh2transMatrix(theta_m(n),d_m(n),alpha_m(n),a_m(n),2);
end
Tfm01 = T(:,:,1);
Tfm12 = T(:,:,2);
Tfm23 = T(:,:,3);
Tfm34 = T(:,:,4);
Tfm45 = T(:,:,5);
T_middle2 = Tfm01*Tfm12;
T_middle3 = Tfm01*Tfm12*Tfm23;
T_middle4 = Tfm01*Tfm12*Tfm23*Tfm34;
T_middle5 = Tfm01*Tfm12*Tfm23*Tfm34*Tfm45;

%% INDEX FINGER
I_dip = FingerMeasurements(10);
I_pip = FingerMeasurements(11);
I_mcp = FingerMeasurements(12);
theta_i = [90,0,90,90,90]';
alpha_i = [0,90,0,0,0]';
a_i = [I_palm,0,I_mcp,I_pip,I_dip]';
d_i = [0,0,0,0,0]';
linkno = [1, 2, 3, 4, 5]';
disp('DhParameters of the Fingers')
disp('     Link  |  theta  |  aplha  |    d    |    a   |')
DHParameters_Index = [linkno, theta_i, alpha_i, d_i, a_i];
disp(DHParameters_Index)
for n=1:5
    T(:,:,n) = dh2transMatrix(theta_i(n),d_i(n),alpha_i(n),a_i(n),2);
end
Tfi01 = T(:,:,1);
Tfi12 = T(:,:,2);
Tfi23 = T(:,:,3);
Tfi34 = T(:,:,4);
Tfi45 = T(:,:,5);
T_index2 = Tfi01*Tfi12;
T_index3 = Tfi01*Tfi12*Tfi23;
T_index4 = Tfi01*Tfi12*Tfi23*Tfi34;
T_index5 = Tfi01*Tfi12*Tfi23*Tfi34*Tfi45;

%% KINEMATICS FROM THE HAND ORIGIN TO THE LOCAL ORIGIN

knuckleI_M = PalmMeasurements(4);
knuckleM_R = PalmMeasurements(5);
knuckleR_P = PalmMeasurements(6);
%dist_point_across = PalmMeasurements(7);

theta_o = [0,0,0,0]';
alpha_o = [0,0,0,0]';
a_o = [knuckleR_P/2,knuckleR_P/2+knuckleR_P,knuckleR_P/2+knuckleR_P+knuckleM_R,knuckleR_P/2+knuckleR_P+knuckleM_R+knuckleI_M]';
d_o = [0,0,0,0]';
linkno = [1, 2, 3, 4]';
disp('DhParameters of the Hand origin to local origin')
disp('     Link  |  theta  |  aplha  |    d    |    a   |')
DHParameters = [linkno, theta_o, alpha_o, d_o, a_o];
disp(DHParameters)
for n=1:4
    T(:,:,n) = dh2transMatrix(theta_o(n),d_o(n),alpha_o(n),a_o(n),2);
end
To01 = T(:,:,1);
To12 = T(:,:,2);
To23 = T(:,:,3);
To34 = T(:,:,4);
figure(1)
scatter3(To01(13),To01(14),To01(15),'*')
scatter3(To12(13),To12(14),To12(15),'*')
scatter3(To23(13),To23(14),To23(15),'*')
scatter3(To34(13),To34(14),To34(15),'*')
origin = scatter3(0,0,0,'s');

%% Sketch of the Hand
%% Markers positions
% Pinky Finger
pinky1 = To01*Tfp01;
pinky2 = To01*T_pinky2;
scatter3(pinky2(13),pinky2(14),pinky2(15),'*')
pinky3 = To01*T_pinky3;
scatter3(pinky3(13),pinky3(14),pinky3(15),'s')
pinky4 = To01*T_pinky4;
scatter3(pinky4(13),pinky4(14),pinky4(15),'s')
Tip_pinky=To01*T_pinky5;
scatter3(Tip_pinky(13),Tip_pinky(14),Tip_pinky(15),'s')

% Ring Finger
ring1 = To12*Tfr01;
ring2 = To12*T_ring2;
scatter3(ring2(13),ring2(14),ring2(15),'*')
ring3 = To12*T_ring3;
scatter3(ring3(13),ring3(14),ring3(15),'s')
ring4 = To12*T_ring4;
scatter3(ring4(13),ring4(14),ring4(15),'s')
Tip_ring = To12*T_ring5;
scatter3(Tip_ring(13),Tip_ring(14),Tip_ring(15),'s')

% Middle Finger
middle1 = To23*Tfm01;
middle2=To23*T_middle2;
scatter3(middle2(13),middle2(14),middle2(15),'*')
middle3=To23*T_middle3;
scatter3(middle3(13),middle3(14),middle3(15),'s')
middle4=To23*T_middle4;
scatter3(middle4(13),middle4(14),middle4(15),'s')
Tip_middle=To23*T_middle5;
scatter3(Tip_middle(13),Tip_middle(14),Tip_middle(15),'s')

% Index Finger
index1 = To34*Tfi01;
index2=To34*T_index2;
scatter3(index2(13),index2(14),index2(15),'*')
index3=To34*T_index3;
scatter3(index3(13),index3(14),index3(15),'s')
index4=To34*T_index4;
scatter3(index4(13),index4(14),index4(15),'s')
Tip_index=To34*T_index5;
scatter3(Tip_index(13),Tip_index(14),Tip_index(15),'s')

%% Links for the hand
% Thumb Line
plot3([0,Tt01(13)],[0,Tt01(14)],[0,Tt01(15)],'b-','LineWidth',1) 
plot3([Tt01(13),T_thumb1(13)],[Tt01(14),T_thumb1(14)],[Tt01(15),T_thumb1(15)],'b-','LineWidth',1) 
plot3([T_thumb1(13),T_thumb2(13)],[T_thumb1(14),T_thumb2(14)],[T_thumb1(15),T_thumb2(15)],'b-','LineWidth',1)
plot3([T_thumb2(13),T_thumb3(13)],[T_thumb2(14),T_thumb3(14)],[T_thumb2(15),T_thumb3(15)],'b-','LineWidth',1)
plot3([T_thumb3(13),T_thumbtip(13)],[T_thumb3(14),T_thumbtip(14)],[T_thumb3(15),T_thumbtip(15)],'b-','LineWidth',1)

plot3([0,To01(13)],[0,To01(14)],[0,To01(15)],'b-','LineWidth',1) 
plot3([0,To12(13)],[0,To12(14)],[0,To12(15)],'b-','LineWidth',1) 
plot3([0,To23(13)],[0,To23(14)],[0,To23(15)],'b-','LineWidth',1) 
plot3([0,To34(13)],[0,To34(14)],[0,To34(15)],'b-','LineWidth',1) 

% Pinky Lines
plot3([To01(13),pinky1(13)],[To01(14),pinky1(14)],[To01(15),pinky1(15)],'b-','LineWidth',1)
plot3([pinky2(13),pinky3(13)],[pinky2(14),pinky3(14)],[pinky2(15),pinky3(15)],'b-','LineWidth',1)
plot3([pinky3(13),pinky4(13)],[pinky3(14),pinky4(14)],[pinky3(15),pinky4(15)],'b-','LineWidth',1)
plot3([pinky4(13),Tip_pinky(13)],[pinky4(14),Tip_pinky(14)],[pinky4(15),Tip_pinky(15)],'b-','LineWidth',1)

% Ring Lines 
plot3([To12(13),ring1(13)],[To12(14),ring1(14)],[To12(15),ring1(15)],'b-','LineWidth',1)
plot3([ring2(13),ring3(13)],[ring2(14),ring3(14)],[ring2(15),ring3(15)],'b-','LineWidth',1)
plot3([ring3(13),ring4(13)],[ring3(14),ring4(14)],[ring3(15),ring4(15)],'b-','LineWidth',1)
plot3([ring4(13),Tip_ring(13)],[ring4(14),Tip_ring(14)],[ring4(15),Tip_ring(15)],'b-','LineWidth',1)

% Middle Lines
plot3([To23(13),middle1(13)],[To23(14),middle1(14)],[To23(15),middle1(15)],'b-','LineWidth',1)
plot3([middle2(13),middle3(13)],[middle2(14),middle3(14)],[middle2(15),middle3(15)],'b-','LineWidth',1)
plot3([middle3(13),middle4(13)],[middle3(14),middle4(14)],[middle3(15),middle4(15)],'b-','LineWidth',1)
plot3([middle4(13),Tip_middle(13)],[middle4(14),Tip_middle(14)],[middle4(15),Tip_middle(15)],'b-','LineWidth',1)

% Index Lines 
plot3([To34(13),index1(13)],[To34(14),index1(14)],[To34(15),index1(15)],'b-','LineWidth',1)
plot3([index2(13),index3(13)],[index2(14),index3(14)],[index2(15),index3(15)],'b-','LineWidth',1)
plot3([index3(13),index4(13)],[index3(14),index4(14)],[index3(15),index4(15)],'b-','LineWidth',1)
plot3([index4(13),Tip_index(13)],[index4(14),Tip_index(14)],[index4(15),Tip_index(15)],'b-','LineWidth',1)

end