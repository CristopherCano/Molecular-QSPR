function [y1] = myNeuralNetworkFunction(x1)
%MYNEURALNETWORKFUNCTION neural network simulation function.
%
% Auto-generated by MATLAB, 26-Jan-2021 20:52:21.
% 
% [y1] = myNeuralNetworkFunction(x1) takes these arguments:
%   x = 23xQ matrix, input #1
% and returns:
%   y = 1xQ matrix, output #1
% where Q is the number of samples.

%#ok<*RPMT0>

% ===== NEURAL NETWORK CONSTANTS =====

% Input 1
x1_step1.xoffset = [0;0;0;0;0;0;0;0;0;0;0;0;0;0;0;0;0;0;0;0;0;0;0];
x1_step1.gain = [0.166666666666667;0.333333333333333;0.666666666666667;0.222222222222222;0.0952380952380952;2;0.5;2;2;2;2;0.666666666666667;0.333333333333333;0.166666666666667;0.2;1;0.4;0.2;2;2;2;2;3.06849315203002];
x1_step1.ymin = -1;

% Layer 1
b1 = [-0.20075625893670523414;0.30318035846978080849;-0.080190722598824482059;0.040175286326120461522;-0.043235108856605926342;0.21748338591933358277;-0.24411188649610271462;-0.063427456253915340256;-0.17822435681095930016;0.51645324080629639862];
IW1_1 = [-0.3517495854217388418 0.12769025485608803683 -0.57594758220287900485 -0.24613184684183928019 -0.10907392862267611955 0.26267358341459862148 -0.99279982010969103357 -0.070501237132951324882 0.35719949561027386498 0.10400066873700092307 -0.12512280087815927376 -0.24048454983065759016 0.93203893134667492593 0.11832605894322105466 -0.54468165680235114401 -0.062070321925677088282 0.60706354144941587769 -0.72506142227285130808 0.70409207985350030778 -0.023171996527131553945 0.17314985514771091824 0.54673876294227252703 -0.27633739030447057594;-0.43126706546710752432 0.64693125169713738831 -0.72350736343344135282 0.65769428886898284592 -0.10263606382364717784 0.25384060314780226841 0.51376629036631626946 -0.60021148284857361865 -0.11376306175627189099 -0.38627534958184139846 -0.042104104995288008095 0.99007638429690603132 1.4643399568329442673 0.35843065546798863474 -0.40017921042741960713 -0.27131145718382793097 -0.16635612736898439112 0.82777407320844409444 -0.050168814038980463765 -0.4465570047322992564 -0.39335103101590757069 -0.56745180705674658217 0.59155685718977579768;0.057288472894405473301 0.43447131348637940684 0.79751834057047421567 -0.11584202312494401577 -1.0757065611331790844 -0.035229902183190747733 -0.38026673615364836589 0.024875243857254300539 -0.42788662563834817254 0.0074759066706271467412 -0.025868076571620851611 0.97211747632769474059 -0.22780050500172263628 0.0081509590415737021019 0.19678536630771384375 -1.0312734021621401403 -0.36486841956599069814 0.054092938364036967369 0.079678857774168401762 0.060583605187785265211 -0.13118757884478188247 0.37379919174508291491 0.14443364708670528018;0.23445115882566436305 0.46595102324917658798 0.69790964844261749178 -1.0546108680776535849 0.088580051200607537454 0.10380091022522307254 -1.0657651569389072765 0.41532628370781865534 -0.076135463153548660342 -0.12768388723636328597 -0.25396792247842947532 -0.11583132175126588381 -0.14848581377955005767 0.54301641692660074234 -0.17435792548750922437 0.50313860643269181505 -0.056034817959684249389 0.31092468806194384356 0.019271448000662470129 -0.1084156145058270404 -0.088610953498195921263 -0.064035720083063005226 -0.30279216742794928807;-0.37997597043469544253 0.27539374976363628633 -0.30074620933616630358 0.29539452290989931527 -0.81087815820291431201 0.028374505851167460685 0.2236980651275189691 -0.24821452129464027792 0.21168533148919860265 0.010675225738120765889 0.14700672701636269268 0.028445319472773587799 -0.11386345577080893288 0.60168443932382775774 -0.87624969896079452081 -0.1418171962659568186 -0.65824239389650185394 0.17097569666460277205 -0.26568407818125555631 0.12802011065793114653 0.012352151296268550074 0.0015749998800545991773 -1.0309267031480378041;0.018640281741224715151 0.3061336638607230487 -0.51164181786868689894 0.38570515881841577199 1.4326823796504366548 0.10697845796726976331 0.14768490866297503961 -0.46572412947717373166 -0.2165347345853095018 -0.049018285067687600298 0.26470999212755808028 -0.87579624181313264764 0.90138448858294328847 0.18055483051551582396 -0.30101706395673938355 -0.40597867801961562417 0.3540786423494068913 0.52652200575924357207 -0.10911550887632098794 -0.24198110007550796552 -0.25122900779890183776 -0.1835642303147470844 1.1030401230796038625;-0.2643133763126133684 -0.34372805417910540227 -0.016667516224284285864 0.057322633670236225467 -1.3039205153947113214 0.0073506844464855773669 -0.069927256703213203082 0.017299584077535238441 0.26841083929977022082 0.27138673777456617797 0.14434986076686320833 0.3352999840218691685 -0.7464465473739934076 -0.26890661249492631146 0.048571424138902682954 0.55517536666177325078 -0.5825227931147520799 0.076103126891779560026 -0.047342286983803792688 -0.039849532545817911711 0.2097777933908611947 0.25842277666544849479 -1.8850278211996933653;0.13466413240552302377 0.30364994372443332438 -0.32336596722091964784 0.53902782386324266106 0.78044597706508544999 -0.25379749754602520806 -0.050281690848179044773 -0.0030586145251392717753 0.14746016318226184971 0.053537609396162297304 0.087392019971508944076 0.37640989009085495942 -0.3181589987571424305 -0.13290717918547195753 0.4537949905644373394 -0.059317000487309111401 0.50336887381273431874 -0.002285228148432314442 -0.25967466156929347454 0.11219184308398189032 0.035396564572545502481 0.36863832049373962407 0.53603192937314159128;0.20724377216627989928 -0.27834702994586479896 -1.0223551768626113478 0.86860801589945624279 0.75089893643996374895 -0.14362136546849693652 -0.061647612044739452664 0.41465258730012838351 -0.044790921032032762761 0.032148569408030958083 0.052775813915357516759 -0.72148629149508269887 0.42305558744462962162 -0.69973617781401853399 0.045226756393693716418 0.13678069162597245034 -0.33118148071963632306 0.27624659234243714723 -0.56093941169753236409 0.10746364065405826504 0.065300342068976321985 -0.091198468084053532778 -0.022294826346348821378;-0.49858000219689985189 0.70390379020603233151 -0.60598728993152584099 0.42178031430241380573 -0.77500220155770549457 0.20872540543693293702 -0.4929328815323652524 0.30920844318956158814 -0.15467927063727243686 -0.42174137324115018588 -0.36744910416192061442 1.5315292566187901357 0.93572920657566638347 0.73152392485182882176 -0.25232710523648177459 -0.48329029346268165268 -0.60963312952859760596 0.5296356108752409142 -0.19005605325654437165 -0.10930575670789288711 -0.27572527933932833299 0.40270351590715652845 -0.36948177719669605956];

% Layer 2
b2 = -0.15895582695708260212;
LW2_1 = [-1.3994144714278622388 -1.8077061991654359563 -1.7163317940471725098 -1.158548105306884457 -1.4601873326984426971 1.8683179022409968084 0.95720728552209177753 -1.4031536909698458793 -1.7932080530060681145 2.0210814943770216701];

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
