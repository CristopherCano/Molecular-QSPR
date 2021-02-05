function [y1] = funcionHidden_10_10(x1)
%MYNEURALNETWORKFUNCTION neural network simulation function.
%
% Auto-generated by MATLAB, 24-Jan-2021 15:36:39.
% 
% [y1] = myNeuralNetworkFunction(x1) takes these arguments:
%   x = 22xQ matrix, input #1
% and returns:
%   y = 1xQ matrix, output #1
% where Q is the number of samples.

%#ok<*RPMT0>

% ===== NEURAL NETWORK CONSTANTS =====

% Input 1
x1_step1.xoffset = [0;0;0;0;0;0;0;0;0;0;0;0;0;0;0;0;0;0;0;0;0;0];
x1_step1.gain = [0.166666666666667;0.333333333333333;0.666666666666667;0.222222222222222;0.0952380952380952;2;0.5;2;2;2;2;0.666666666666667;0.333333333333333;0.166666666666667;0.2;1;0.4;0.2;2;2;2;2];
x1_step1.ymin = -1;

% Layer 1
b1 = [-0.086446224816595057527;0.19701504564954283594;-0.42089883496200020119;0.28997556321918577238;-0.081120279246402499096;0.062986906730332622995;0.18619051082316159795;0.29591354050254575769;0.061833810507646809473;0.026522060893823480587];
IW1_1 = [0.13455484711797774389 -0.052128483986580306797 0.37357540019963902944 0.023217495200171075348 0.074703648053909138538 0.11887291868818893048 -0.42654680285705776077 -0.099086535062733765988 0.20187004576627348706 0.1203122456887933539 -0.11022811074538245435 0.57457692377324620647 -1.0266050622806079939 -0.61827884364729657207 -0.010758762306783053661 0.16967761616906398836 -0.53639918198076796951 0.67117072452517190229 -0.50416162440576639536 -0.051803844065687137954 0.11651255279823288791 0.12894121934251076556;-0.3485091411969001296 0.50635044458101319265 0.13285668384747698068 0.38807020707915729218 0.28193580299605003336 0.52978326390275798374 0.092320517647076508205 -0.20948949132289668151 -0.11020869684871047178 -0.20402029684168968005 -0.18131103635496059745 0.86833574090858234307 0.88591146912361695698 0.35232287347866603211 -0.44099115372289271475 -0.16094915806802967406 -0.3529184885328722765 0.30062839762361448503 0.040152382906253107631 -0.11729497570742057622 -0.12883332068281364013 -0.12383831872021011655;0.12894500100921271746 -0.49995116322179361523 0.92178191085832561491 -0.5768153933543461731 0.9970077740772920194 0.061437282626939170027 -0.84412826001299157141 0.54389811534943877103 0.29526294949178527594 0.24953929005123462459 0.088319282701317031181 -0.9470465859297761968 -0.66481967870646141439 -0.60857299601157655022 -0.25008340999872480381 -0.11145359371727514564 1.1407703525786196952 -0.87365141601032036967 -0.41787244744645929417 0.38083357886375307499 0.27063720375727168266 0.17554176903960314049;-0.3133860299148641948 0.36759976817138972915 -0.15262986343584122872 0.57099903925900707957 -1.1257786251421826318 -0.21115908924699655635 -0.056110433817627279607 -0.0014023293311997706359 -0.16140481749992219296 -0.25769369408224152007 0.19089807150574714112 -0.17607970154175262012 1.291007510558072946 0.25339619937703333763 -0.31510774651993911366 -0.023437645104399117829 -0.093907463356703191337 -0.030280548492117750209 0.11231312278891041057 -0.69048414604841035214 -0.4067116711689670594 0.40618620802697463779;0.48197109612569438708 0.19971159058872642311 -0.30861150502516665473 -0.41582221394423363181 -1.5467120741122322158 0.091246297959571079361 0.70198954085082210241 0.019702176234989030035 0.0080462498431991477665 0.0081780220917015700177 -0.1822094748671146125 -0.32665808711016625088 -1.1856243658498266669 0.053582487664155201146 0.45393403292453560205 0.45708096968421635387 0.24821658313713698685 -0.72177257558811092064 0.097953967752318460427 0.088087945516574797655 0.057090565508900584235 0.033530255258402669183;-0.62485689747824380014 1.0723945405294996736 -0.34813904268446294044 0.39819567467086092183 0.0087586382812992660124 0.22908695879576321253 0.93347684583221390842 -0.37350432752159390404 -0.08448138174359061392 -0.15475140726118644108 -0.089128428208566673474 1.1784398714044839185 -1.1154939155800922546 -0.3529833654534347831 0.2340640291760688052 -0.63480218134233368232 -0.27410354383218021868 1.1372109368976157651 0.033803932775379831599 0.15462009289547881674 -0.14959885918948859218 -0.1680240727645351817;0.029906109009077166266 0.79432599264184999832 0.30701523005010716849 -0.59489315480355953181 -1.4832590050783500679 0.25296488839383834968 0.26810503807978730562 -0.12504838746750909784 0.23785569602239542419 -0.2666666854582882551 -0.41598880155319256646 0.19678885518374933383 0.29987840195268566923 -0.075796571689648414849 0.037858733700509170084 0.3226150052638134258 -0.32263102948026500805 -0.41298223499905639677 0.079368958432269515191 -0.036596664710091604544 -0.14302453840152296038 -0.33083266413540562967;-0.99495003664799974707 0.24728875780003420348 -0.14429748800514918816 0.30556824899029871867 1.7482198239917752236 -0.23228631321129239451 0.59169339936220988196 -0.29230650357149801088 0.088910404306294876786 -0.26182823095996071716 0.045003440917051357184 -0.78500952543372026771 0.31748547691161188578 0.043251262562216841179 0.28537879817610117827 -0.27748349878870609553 0.64771306193390287831 0.28768572824530852516 -0.07255603264997478874 -0.14677969713355917825 -0.29619959517504068636 -0.29840210177175269246;0.16028922244377322159 0.70111924001555536723 0.80863368156595050174 -0.25416790449220411086 -0.96250870060557924823 0.23412208696841482758 0.36056294160006813199 0.46852566503196452219 0.0617328042977819888 -0.059178657572483493732 0.11821927530896356173 0.95065100354465148502 -0.97953114416357189853 -0.56518078531199988923 -0.29817952396193436737 -0.55187607819651030017 -0.015209437712923852895 0.11782819028927385419 0.11868787858344340136 0.25258445285417052695 0.001275554876717250154 -0.04218626518456713298;-0.079276767649412063776 0.38159302363866171026 -0.051208402524498548847 0.4696302177932745181 0.85011876416952192326 0.11727050674444522427 -0.16600170480294604292 -0.24368560366867272893 0.094242600054521397102 -0.029291166934605303296 -0.11190347750474077815 0.18213079135818052712 -0.22329015530576440396 -0.1571682490362318052 0.19989034357308244072 0.32966664058579869812 0.088152355181214669955 0.080882853417518704719 -0.073300279679888502571 -0.011040089720846441024 -0.056798449864737594883 0.31946907560245579871];

% Layer 2
b2 = 0.0052779999525512273639;
LW2_1 = [1.2732235639250581993 1.1589478136172550737 -1.5733743884437949578 -1.2445180560762747479 1.424286422408395314 -1.7732773654667277619 -1.7839593318601012495 1.7308022269190863618 1.3983056110771840963 -1.1158430843957085621];

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