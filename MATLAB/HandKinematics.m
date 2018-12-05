%% Hand Kinematic
% Team 2 RBE580
%%
close all
clear
clc

%% KINEMATICS OF THE THUMB
theta_t = [-25,0,-90,0,0]';
alpha_t = [-90,-90,225,0,0]';
a_t = [100,50,77.2,70.7,47]';
d_t = [0,69.8,0,0,0]';

linkno = [1, 2, 3, 4, 5]';
disp('DhParameters of the Thumb')
disp('     Link  |  theta  |  aplha  |    d    |    a   |')
DHParameters = [linkno, theta_t, alpha_t, d_t, a_t];
disp(DHParameters)
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
theta_f = [90,0,90,90,90]';
alpha_f = [0,90,0,0,0]';
a_f = [135.1,0,71.3,40,35]';
d_f = [0,0,0,0,0]';
linkno = [1, 2, 3, 4, 5]';
disp('DhParameters of the Fingers')
disp('     Link  |  theta  |  aplha  |    d    |    a   |')
DHParameters = [linkno, theta_f, alpha_f, d_f, a_f];
disp(DHParameters)
for n=1:5
    T(:,:,n) = dh2transMatrix(theta_f(n),d_f(n),alpha_f(n),a_f(n),2);
end
Tf01 = T(:,:,1);
Tf12 = T(:,:,2);
Tf23 = T(:,:,3);
Tf34 = T(:,:,4);
Tf45 = T(:,:,5);

T_fingers2 = Tf01*Tf12;
T_fingers3 = Tf01*Tf12*Tf23;
T_fingers4 = Tf01*Tf12*Tf23*Tf34;

T_fingers5 = Tf01*Tf12*Tf23*Tf34*Tf45;
   
%% KINEMATICS OF THE FROM THE HAND ORIGIN TO THE LOCAL ORIGIN
theta_o = [0,0,0,0]';
alpha_o = [0,0,0,0]';
a_o = [18.5,59.5,100.5,141.5]';
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

% pinky finger

pinky1 = To01*Tf01;
%scatter3(ring1(13),ring1(14),ring1(15),'s')

pinky2 = To01*T_fingers2;
scatter3(pinky2(13),pinky2(14),pinky2(15),'*')

pinky3 = To01*T_fingers3;
scatter3(pinky3(13),pinky3(14),pinky3(15),'s')

pinky4 = To01*T_fingers4;
scatter3(pinky4(13),pinky4(14),pinky4(15),'s')

Tip_pinky=To01*T_fingers5;
scatter3(Tip_pinky(13),Tip_pinky(14),Tip_pinky(15),'s')

% ring finger

ring1 = To12*Tf01;
%scatter3(pinky1(13),pinky1(14),pinky1(15),'s')

ring2 = To12*T_fingers2;
scatter3(ring2(13),ring2(14),ring2(15),'*')

ring3 = To12*T_fingers3;
scatter3(ring3(13),ring3(14),ring3(15),'s')

ring4 = To12*T_fingers4;
scatter3(ring4(13),ring4(14),ring4(15),'s')

Tip_ring = To12*T_fingers5;
scatter3(Tip_ring(13),Tip_ring(14),Tip_ring(15),'s')

% middle finger
 
middle1 = To23*Tf01;
%scatter3(middle1(13),middle1(14),middle1(15),'s')

middle2=To23*T_fingers2;
scatter3(middle2(13),middle2(14),middle2(15),'*')

middle3=To23*T_fingers3;
scatter3(middle3(13),middle3(14),middle3(15),'s')

middle4=To23*T_fingers4;
scatter3(middle4(13),middle4(14),middle4(15),'s')

Tip_middle=To23*T_fingers5;
scatter3(Tip_middle(13),Tip_middle(14),Tip_middle(15),'s')

% index finger

index1 = To34*Tf01;
% scatter3(index1(13),index1(14),index1(15),'*')

index2=To34*T_fingers2;
scatter3(index2(13),index2(14),index2(15),'*')

index3=To34*T_fingers3;
scatter3(index3(13),index3(14),index3(15),'s')

index4=To34*T_fingers4;
scatter3(index4(13),index4(14),index4(15),'s')

Tip_index=To34*T_fingers5;
scatter3(Tip_index(13),Tip_index(14),Tip_index(15),'s')


% thumb line
plot3([0,Tt01(13)],[0,Tt01(14)],[0,Tt01(15)],'b-','LineWidth',1) 
plot3([Tt01(13),T_thumb1(13)],[Tt01(14),T_thumb1(14)],[Tt01(15),T_thumb1(15)],'b-','LineWidth',1) 
plot3([T_thumb1(13),T_thumb2(13)],[T_thumb1(14),T_thumb2(14)],[T_thumb1(15),T_thumb2(15)],'b-','LineWidth',1)
plot3([T_thumb2(13),T_thumb3(13)],[T_thumb2(14),T_thumb3(14)],[T_thumb2(15),T_thumb3(15)],'b-','LineWidth',1)
plot3([T_thumb3(13),T_thumbtip(13)],[T_thumb3(14),T_thumbtip(14)],[T_thumb3(15),T_thumbtip(15)],'b-','LineWidth',1)

plot3([0,To01(13)],[0,To01(14)],[0,To01(15)],'b-','LineWidth',1) 
plot3([0,To12(13)],[0,To12(14)],[0,To12(15)],'b-','LineWidth',1) 
plot3([0,To23(13)],[0,To23(14)],[0,To23(15)],'b-','LineWidth',1) 
plot3([0,To34(13)],[0,To34(14)],[0,To34(15)],'b-','LineWidth',1) 

% lines pinky
plot3([To01(13),pinky1(13)],[To01(14),pinky1(14)],[To01(15),pinky1(15)],'b-','LineWidth',1)
plot3([pinky2(13),pinky3(13)],[pinky2(14),pinky3(14)],[pinky2(15),pinky3(15)],'b-','LineWidth',1)
plot3([pinky3(13),pinky4(13)],[pinky3(14),pinky4(14)],[pinky3(15),pinky4(15)],'b-','LineWidth',1)
plot3([pinky4(13),Tip_pinky(13)],[pinky4(14),Tip_pinky(14)],[pinky4(15),Tip_pinky(15)],'b-','LineWidth',1)

% lines ring
plot3([To12(13),ring1(13)],[To12(14),ring1(14)],[To12(15),ring1(15)],'b-','LineWidth',1)
plot3([ring2(13),ring3(13)],[ring2(14),ring3(14)],[ring2(15),ring3(15)],'b-','LineWidth',1)
plot3([ring3(13),ring4(13)],[ring3(14),ring4(14)],[ring3(15),ring4(15)],'b-','LineWidth',1)
plot3([ring4(13),Tip_ring(13)],[ring4(14),Tip_ring(14)],[ring4(15),Tip_ring(15)],'b-','LineWidth',1)

% lines middle
plot3([To23(13),middle1(13)],[To23(14),middle1(14)],[To23(15),middle1(15)],'b-','LineWidth',1)
plot3([middle2(13),middle3(13)],[middle2(14),middle3(14)],[middle2(15),middle3(15)],'b-','LineWidth',1)
plot3([middle3(13),middle4(13)],[middle3(14),middle4(14)],[middle3(15),middle4(15)],'b-','LineWidth',1)
plot3([middle4(13),Tip_middle(13)],[middle4(14),Tip_middle(14)],[middle4(15),Tip_middle(15)],'b-','LineWidth',1)

% lines index
plot3([To34(13),index1(13)],[To34(14),index1(14)],[To34(15),index1(15)],'b-','LineWidth',1)
plot3([index2(13),index3(13)],[index2(14),index3(14)],[index2(15),index3(15)],'b-','LineWidth',1)
plot3([index3(13),index4(13)],[index3(14),index4(14)],[index3(15),index4(15)],'b-','LineWidth',1)
plot3([index4(13),Tip_index(13)],[index4(14),Tip_index(14)],[index4(15),Tip_index(15)],'b-','LineWidth',1)

% https://ieeexplore.ieee.org/stamp/stamp.jsp?tp=&arnumber=6386435
% http://pubs.sciepub.com/ajme/1/7/58/
% https://www.bing.com/images/search?view=detailV2&ccid=cKs82XSY&id=A28FD30E029BA5A1835486F4A2442D9627B69563&thid=OIP.cKs82XSYCWZBGoaivnamoAHaJG&mediaurl=http%3a%2f%2fpubs.sciepub.com%2fajme%2f1%2f7%2f58%2fimage%2ffig4.png&exph=715&expw=582&q=example+of+the+kinematic+model+of+the+hand+in+matlab&simid=608006542499645619&selectedIndex=12&ajaxhist=0
% anthropomorfic data:
% https://www.bwc.ohio.gov/downloads/blankpdf/ErgoAnthropometricData.pdf