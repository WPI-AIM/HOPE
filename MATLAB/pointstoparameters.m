function [parameters, FingerMeasurements, PalmMeasurements, ThumbMeasurements] = pointstoparameters(points)

point1 = points(1:3);
point2 = points(4:6);
point3 = points(7:9);
point4 = points(10:12);
point5 = points(13:15);
point6 = points(16:18);
point7 = points(19:21);
point8 = points(22:24);
point9 = points(25:27);
point10 = points(28:30);

%% Five parameters for CAD parts

HandLength = norm(point4 - point1);
HandBreadth =  norm(point5 - point6);
TFL = norm(point4 - point3);
DorsumLength = norm(point3 - point1); % this could be point3 - point2
ThumbLength = norm(point9- point8);
ThumbLengthi = ThumbLength * 0.03937 
HandBreadthi = HandBreadth * 0.03937 
HandLengthi = HandLength * 0.03937 

parameters = [HandLength, HandBreadth, TFL, DorsumLength, ThumbLength];

fileID = fopen('GlobalVariables.txt','w');
A1 = ["HandLength", HandLength];
A2 = ["HandBreadth", HandBreadth];
A3 = ["TFL", TFL];
A4 = ["DorsumLength", DorsumLength];
A5 = ["ThumbLength", ThumbLength];
A6 = ["ThumbLengthi", ThumbLengthi];
A7 = ["HandBreadthi", HandBreadthi];
A8 = ["HandLengthi", HandLengthi];
formatSpec = ' "%s" = %11.10f \n';
fprintf(fileID,formatSpec,A1,A2,A3,A4,A5,A6,A7,A8)
fclose(fileID)

%% Measurement for Kinematic Model

M_palm =  norm(point3 - point2);
R_palm =  norm(point3 - point2)* 0.8819936958;
P_palm =  norm(point3 - point2)* 0.762608353;

knuckleI_M = 0.291005291 * HandBreadth; %Male Ratios
knuckleM_R = 0.2271825397 * HandBreadth; %Male Ratios
knuckleR_P = 0.2179232804 *HandBreadth; %Male Ratios

dist_point_across = norm(point2-point1); % This is the distance between the bottom most thumb 
% point and the line where all the fingers start 

PalmMeasurements = [M_palm, R_palm, P_palm, knuckleI_M, knuckleM_R, knuckleR_P, dist_point_across]; 

T1 = ThumbLength* 0.4512195122; %Male Ratio
T2 = ThumbLength* 0.3902439024; %Male Ratio
T3 = norm(point7)-norm(point8); %Male Ratio 
T2 = HandLength* 0.180952381; %Male Ratio
T5 = HandLength* 0.1770833334; %Male Ratio

ThumbMeasurements = [T1, T2, T3, T4, T5];

% assuming the tip and middle segment are the same length
P_dip = HandLength* (0.2547619048/2);%Male Ratio
P_pip = HandLength* (0.2547619048/2);%Male Ratio
P_mcp = HandLength* 0.1982142857; %Male Ratio

R_dip = HandLength*(0.2886904762/2); %Male Ratio
R_pip = HandLength*(0.2886904762/2); %Male Ratio
R_mcp = HandLength* 0.2761904762; %Male Ratio

M_dip = HandLength*(0.30625/2); %Male Ratio
M_pip = HandLength*(0.30625/2); %Male Ratio
M_mcp = HandLength* 0.2633928572; %Male Ratio

I_dip = HandLength*(0.2761904762/2); %Male Ratio
I_pip = HandLength*(0.2761904762/2); %Male Ratio
I_mcp = HandLength* 0.2419642857; %Male Ratio

FingerMeasurements = [P_dip, P_pip, P_mcp, R_dip, R_pip, R_mcp, M_dip, M_pip, M_mcp, I_dip, I_pip, I_mcp];

%% Alex copy this and put it in your Kinematic function 

% function  = kinematics (FingerMeasurements, ThumbMeasurements, PalmMeasurements)
% 
% M_palm = PalmMeasurements(1);
% R_palm = PalmMeasurements(2);
% P_palm = PalmMeasurements(3);
% knuckleI_M = PalmMeasurements(4);
% knuckleM_R = PalmMeasurements(5);
% knuckleR_P = PalmMeasurements(6);
% dist_point_across = PalmMeasurements(7);
%  
% T1 = ThumbMeasurements(1);
% T2 = ThumbMeasurements(2);
% T3 = ThumbMeasurements(3);
% T4 = ThumbMeasurements(4);
% T5 = ThumbMeasurements(5);
% 
% P_dip = FingerMeasurements(1);
% P_pip = FingerMeasurements(2);
% P_mcp = FingerMeasurements(3);
% R_dip = FingerMeasurements(4);
% R_pip = FingerMeasurements(5);
% R_mcp = FingerMeasurements(6);
% M_dip = FingerMeasurements(7);
% M_pip = FingerMeasurements(8);
% M_mcp = FingerMeasurements(9);
% I_dip = FingerMeasurements(10);
% I_pip = FingerMeasurements(11);
% I_mcp = FingerMeasurements(12);
% 

 








