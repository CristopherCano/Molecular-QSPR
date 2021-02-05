function [y1] = myNeuralNetworkFunction(x1)
%MYNEURALNETWORKFUNCTION neural network simulation function.
%
% Auto-generated by MATLAB, 26-Jan-2021 20:53:24.
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
b1 = [0.12297694592777712319;-0.076575148153502053949;-0.072297092013813638034;-0.0048727625588394930106;-0.030188201781855789757;-0.13888446328468898039;0.39954542119489694363;0.034691792271827490146;0.068099884879519789749;-0.44038792299018919563];
IW1_1 = [0.26302213863168633079 0.59154283307734434327 0.30413997018461791377 -0.3108401477092288534 0.92078727683918260016 0.14754946362145110461 0.019410590882135560914 0.11288054957278717549 -0.043299568055104493969 -0.030288335600227814931 0.064613823105371892552 -0.25995256191615234709 -1.3661635813562131858 0.64159525521568938622 0.11949906971035577363 -0.71399560141904783173 -0.042856295216270656745 0.19019586542935176809 -0.013359921280357274151 0.021967536345555559174 0.013356744210121274802 -0.048948126512744473404 0.092792220667303096371;-0.15153203831103392862 0.38465609445095777508 0.088875367101396790526 0.10872043310409353067 0.63716170658729354148 0.16285844828204645851 -1.0830804184469877693 -0.0063709820509969166194 0.00080893808628004998471 -0.008459283902098671537 0.11823490007558526416 0.15053176069937615478 0.30541178460177542675 0.12834948836444021181 -0.26664325317893816658 0.045409626452156001686 0.087212127698963470834 -0.059134080725435009263 -0.031427077854794399636 -0.12419838963651312624 -0.097783484152848570981 0.11068915682667793132 -0.79384475327527193045;0.02721297854722508 -0.80191296526765898367 -0.29351783131088882151 0.71922277354839836416 0.066572020352393221354 -0.11475269963721292099 -0.58013219012416505915 0.29678748637657981213 0.15575469817218207114 0.15442465038029165592 0.1162869720692266684 -0.57858447997096829063 1.1802294509462833982 -0.14396775362997071834 -0.056510948249463240078 -0.54247662014761599547 0.0035400671918077021398 -0.35804184432377417213 -0.11555250380141986188 0.076127922979731144082 0.15912547934546195094 0.39762646757529312991 -0.72783290865442318296;-0.18192138641850805203 0.14224864185901833769 -0.2996724791596219184 0.71421789324791762343 -0.35028038368157332627 -0.08794123266192635513 -0.14018954774681877118 -0.1975253748954291233 0.025304625178258585705 -0.13367721435402374341 -0.017072396237428160565 0.65167633969752281065 0.94758820492424489235 -0.19418525347854542762 -0.16016268959788598769 -0.76212318774453158277 -0.19232977964735190057 0.50173044844773351247 0.015058902645491306985 -0.16258046038574694436 -0.13066926759821775872 0.077769620487647170282 0.42795092579129001553;0.14057611067253172887 -0.82720704199051420247 -0.58470513072592800174 0.13412840789808139208 0.55907224237525010579 -0.11972313441693450964 0.28502644419330475101 0.32242852333783572627 -0.037034355808030501589 0.2036597685235762567 0.12878043093611632464 0.70740625636307474799 -0.067819388560129409416 -0.16332257147110162965 -0.063731091410655249518 0.31779175115493318859 0.25403535240394514716 0.25027411180150954673 -0.16622744027831753977 0.066239046397897669016 0.11446769561624582645 -0.4452514089169958833 0.3753181012968485053;-0.14236773870964072874 -0.58217042776224892098 -0.57428604256673554396 0.10483366081774769807 1.4241521098077847274 -0.2843671503334165851 -0.19136727650434734449 -0.066893151461276875724 0.014446426293579395228 0.010242050127379867877 0.092520776454813755119 -0.74063459834917944047 0.40789819308159319666 -0.43539038574861421704 0.3371537814444491854 0.36556231838492725394 -0.16035727140806546598 -0.17888524652661735859 -0.61721998430072833042 0.12121382316599900453 0.0046757426604346731883 0.23697712219185482208 -0.34176029497472509844;-0.50817108095939778067 -0.021104972853599711369 -0.23266377310147567936 0.19462656050019605525 1.1469037745136660966 -0.039678803606046496311 0.46532487181472387272 -0.15083988390526245627 0.028401981099903546996 -0.22013297127470776715 0.21927189270587954528 -0.63143950367463141937 0.3514480438811491414 -0.26089293165888688408 0.18961037381035822369 0.24548618577186512302 0.50995161482540296571 0.27239949613338543255 -0.24622728192471587949 -0.045836543802412352266 -0.22689850117770718474 -0.054408614055644857754 0.33050419465899022464;0.67576913433411434085 -0.061771468865388645675 0.13172328222169110701 0.032454901341349685906 -0.48172396596068028929 0.24049267893586825928 -0.21279657487634995316 -0.23056700700262475201 -0.0048237843945594790704 0.043027707742258190782 0.023182822426508466196 -0.40844741352168900672 -0.99542001029130866563 -0.35929324725524264261 0.3727322736552283744 0.32683809842432115511 -0.29326834240411786547 -0.0025220268891309872809 0.29414099372510826846 -0.16495771465648367826 0.0017580312580454142066 -0.03176475707813063154 -1.7768530574387519927;0.1170013678273356672 0.082132152717635784067 -0.42667612749353861501 0.30267496825189899035 -0.75928352171256818792 0.25282378348074618923 0.92232375914587894083 0.60956317130155801554 -0.14454881049639581314 -0.16696677265689036096 -0.10928830372446092511 0.011710382506831111885 -0.6387808681431622615 -0.10396417076984686145 0.2513833748987986394 -0.079735180571860395093 1.187605875518795262 -0.078373653763676831563 0.1912236574919637111 -0.084591017170236912359 -0.16265824313371426979 -0.11362896001379052535 0.14732553511350318654;0.3929849101053465299 -0.31328720691429035039 0.46134907142785003265 -0.60004847167721508949 0.89093518622275169605 -0.0068991680025676394711 0.13779129036991197288 0.0080732020366304033804 0.15274952940038666327 0.27494269982003249897 0.32365371420407235137 -1.2652855370757647435 -1.169582154030674559 -0.39752700560637488358 0.083558969000830818352 0.19800644916685009034 -0.053098895220694324049 -0.0091498663915298081295 0.078537586614354643055 0.29472150248204476153 0.26533801132449236215 -0.30120010124781221306 0.20843135552351252371];

% Layer 2
b2 = 0.010693345557583977187;
LW2_1 = [1.2282110737314098081 -1.3733051630261079445 1.0323317603950352694 -1.4787088478796135416 1.4312636777158380674 -1.2607018373781448961 1.8760278821505942393 1.0383733091479947497 -1.335530894620546416 -1.4894473993760486419];

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