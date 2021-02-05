function [y1] = myNeuralNetworkFunction(x1)
%MYNEURALNETWORKFUNCTION neural network simulation function.
%
% Auto-generated by MATLAB, 30-Dec-2020 14:57:28.
% 
% [y1] = myNeuralNetworkFunction(x1) takes these arguments:
%   x = 19xQ matrix, input #1
% and returns:
%   y = 1xQ matrix, output #1
% where Q is the number of samples.

%#ok<*RPMT0>

% ===== NEURAL NETWORK CONSTANTS =====

% Input 1
x1_step1.xoffset = [0;0;0;0;0;0;0;0;0;0;0;0;0;0;0;0;0;0;0];
x1_step1.gain = [0.166666666666667;0.222222222222222;0.666666666666667;0.222222222222222;0.04;0.5;2;2;2;0.666666666666667;0.333333333333333;0.2;0.4;0.2;2;2;2;2.63758793838527;2.5781544245973];
x1_step1.ymin = -1;

% Layer 1
b1 = [-0.26468662784812030386;-0.083817659330207211488;0.19861625868593207889;0.087061311537367208624;0.18435302015120189068;0.023282268185876735939;-0.56159705529868686469;-0.090637828031913128535;-0.23233756070353270284;-0.042251446221287305982];
IW1_1 = [0.38388842742417006448 -0.34118305445477681292 -0.12280215793256560319 -0.35059235449935788331 1.4867616954160436382 0.3206761437130171144 -0.17773824405156282702 0.18201195578044904178 0.24822835954605887432 -1.3771101072824016853 -0.95875058538964941235 -0.29001769347834188695 -0.044616273398034471398 -0.064216245099492683113 0.30552700311735869754 0.0079935663630018617687 0.17811920745423454049 0.22690490612295036166 -0.50163361963191011039;-0.7531099515451659121 -0.33474535902704954937 -0.7284492906265453982 0.92323867142945459374 -0.37530839058483067561 0.53315413611393525084 0.16015120165673712993 -0.16440499704322500407 0.022527115885998472838 0.45458597430186697963 0.6432157808604979099 0.48648126151287601759 0.18242919379314531669 0.35884927830643842395 -0.30228308424826350054 -0.14101189214246687142 -0.025406380548238322037 1.2666726619259789377 1.3276702440482013312;0.22510228471311882759 0.69803046098996823776 -0.48405179692033761807 0.34026702546459930421 0.76925830992965826827 1.7207033763974404206 -0.061707488214276629002 -0.1985462700127348934 -0.014501462524898926093 0.54945283477540796113 -0.3874135438350541083 0.47335518200161491587 0.17701341684694771317 -0.39198932214599785384 -0.94773961033291242995 0.010000264760981486187 -0.23901731710790455332 0.49849968487101964376 -0.2726240629217092093;-0.038040601434533242997 -0.15357321022745148986 0.060473257107979197511 -0.44833225367563012131 -0.062686668268409670435 -1.4486392916282895271 0.0098304104700108543846 -0.15844556104187881851 -0.16021869839767219346 1.1055320571395446105 0.64871209684860686728 1.0060522935651654564 0.52838275158290992639 -0.88819141359698816629 -0.35890222078908706749 0.12766453759290932735 0.068279384698358133732 -0.1342167701336306751 0.32392782662402042071;-0.062561875544358339085 -0.2592774835740778161 0.18320657535945028549 0.011928197612132242222 1.5960067103095667562 1.1209492278047077374 -0.30509847719480898132 -0.26270500270712277002 0.28730476832035767298 0.029220616453472854357 -0.75805681537074331988 0.48224498286638861622 0.56831774109908039794 -0.54199657226997233206 -0.62373727203240325601 -0.22011499574140597213 -0.15656007004512609293 1.1292960687522348717 -0.73597697865134636963;0.059317884876327137134 0.073038798525438999865 0.17175906658123016313 -0.40670437769375561432 1.0643136731485152158 -0.55338505440657270729 -0.1648117003878269704 0.13706412108156876273 0.11779148794636756792 -0.079078387573445693692 -0.74923536210235686106 0.63965173903860128579 0.074878820082276684178 -0.58424210782093410899 0.069843465448209879343 0.34579479988880251762 0.17282380010394274295 -0.84605816872958017338 -0.47050044826459846981;-0.42042707214392055493 1.1853270893720113666 0.038440468746751207951 0.15689265109314373681 -0.35518580362339552403 -0.024612262585157588385 0.527601553979198723 -0.070945449495752044289 0.62026000269397385534 -0.59889218251226705725 -1.2510757727055898947 -0.34366261847062012924 0.095837192175512467274 -0.19949230811126789087 0.12930832530127617241 0.18883485625360535431 0.36435624851027231808 0.28507041981202135839 0.91622835067092822658;0.092323238218732603388 -0.38750369819949354033 1.0655119186639545603 -0.41141945563530540886 -1.0905357518421918694 -0.3402239694540382664 -0.19234613423716404035 0.15204932724484740425 -0.2312381881294388597 -0.32789861107327145096 0.33002415444862903682 0.39126405142489628641 0.18480999328382979874 0.0039222489112620308183 0.21185248030070749636 0.024076669501694101388 -0.0071401128027899782649 0.19841347702350556337 -1.1092436983594644584;0.8718369451724707897 0.03602510844737147333 0.30117396980816157903 -0.19383756597957768619 -1.2651175289585896433 0.099332018060451596209 -0.18637357752164507296 0.13904850485602276988 -0.14305155827123966494 1.2237036404904249043 -0.68359364439201708574 -0.20236708440620698735 -0.36013609253862233217 -0.22281971656825405592 0.028738686481356631036 0.20525423333591985564 -0.0072716489003968190832 -0.5136816494067839578 -0.9462520087401566915;0.43085966160645233769 0.70089914147922627308 0.22853147833815265488 -0.22971302709833357758 -1.5027631311518487855 0.11802055658538947169 0.30843767669187527325 0.14124650097302246521 -0.057928872757441539354 0.55401554642416939167 -0.10361551750798962679 -0.18435552241146294095 0.062764037628690635962 -0.13915554709906374775 0.10887162527985590199 0.095374947569200382858 0.30332096895583549045 0.69213168559148063874 0.037149232110390444095];

% Layer 2
b2 = 0.38557485228381843667;
LW2_1 = [-1.643710290170769861 -1.2679992665593231571 -1.7790181650017462545 -1.6375614613299034339 1.6994622894646560507 1.6379908751158573921 -1.5041708771727075877 -1.5926300024231951902 -1.5918722311681092751 1.9543907834598821527];

% Output 1
y1_step1.ymin = -1;
y1_step1.gain = 0.0196656833824975;
y1_step1.xoffset = 0;

% ===== SIMULATION ========

% Dimensions
Q = size(x1,2); % samples

% Input 1
xp1 = mapminmax_apply(x1,x1_step1);

% Layer 1
a1 = tansig_apply(repmat(b1,1,Q) + IW1_1*xp1);

% Layer 2
a2 = repmat(b2,1,Q) + LW2_1*a1;

% Output 1
y1 = mapminmax_reverse(a2,y1_step1);
end

% ===== MODULE FUNCTIONS ========

% Map Minimum and Maximum Input Processing Function
function y = mapminmax_apply(x,settings)
  y = bsxfun(@minus,x,settings.xoffset);
  y = bsxfun(@times,y,settings.gain);
  y = bsxfun(@plus,y,settings.ymin);
end

% Sigmoid Symmetric Transfer Function
function a = tansig_apply(n,~)
  a = 2 ./ (1 + exp(-2*n)) - 1;
end

% Map Minimum and Maximum Output Reverse-Processing Function
function x = mapminmax_reverse(y,settings)
  x = bsxfun(@minus,y,settings.ymin);
  x = bsxfun(@rdivide,x,settings.gain);
  x = bsxfun(@plus,x,settings.xoffset);
end