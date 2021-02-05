function [y1] = myNeuralNetworkFunction(x1)
%MYNEURALNETWORKFUNCTION neural network simulation function.
%
% Auto-generated by MATLAB, 26-Jan-2021 20:50:58.
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
b1 = [-0.090274922346737118684;-0.14924458465302908872;-0.007860616175923105034;0.016951631349857707032;0.17290952099916934159;0.0093072993528328963608;-0.20110216219397958337;0.12916934897656892622;0.050946642496187341531;0.34131241480252438869];
IW1_1 = [0.30294304411315364778 -0.018392331386545959782 0.62079750173545178438 -0.48568504688765579136 -0.027463087076502426531 -0.0031001007836242767436 0.13120821565737195158 -0.47372747087280092648 0.067641448959059713442 0.055071295159306352107 0.037823294450625141727 -0.8259520897467436118 -0.96268672694378665255 -0.13853165457209148936 0.54829197007272878484 -0.40058527295488655096 0.057672703468875916033 -0.59045104599040998394 -0.15213377587968521243 0.2553843732291961599 0.095912021991423332401 0.04917713801937002166 -0.63469972657054696263;0.45494816802899779029 0.44734907588143685286 -0.33251227349483952755 0.43651245312253039721 -1.3242068028271698488 -0.065991412877985961005 -0.050270083130008705319 -0.25963203999029926816 -0.020206313338165957094 0.21486869894116561452 0.16184093084578715649 -0.25791061841519419273 -0.039195187656429361645 0.442650939807991195 0.08382337095088314427 -0.04317434367267317108 -0.25918854525013923507 0.32203878604325048007 0.18238748730548645649 0.28424022435630169614 -0.037140126420167507426 0.14990115497085382268 -0.62984030855586081721;-0.043878254752541472061 -0.033506980982953918358 0.0049422232426122236423 0.019601154464382639087 0.047276345132870413457 -0.040937739673528469875 -0.037174517912757665261 -0.0047455376831754738504 0.0084628964003499833335 0.018998353529825318109 0.0058124731658814286772 -0.01267986763397925716 -0.043596080488211626236 -0.0098676497769379055425 -0.01693028318335445398 -0.040656353133745631867 0.01247814912093704251 -0.055349766078522551205 -0.0093626729026073784307 0.0092901995071660303793 -0.0051387671126629256776 0.010534944225144336413 0.00040412628457942885571;-0.21684976983838125109 0.59153657195866304885 0.97072137811828174137 -0.48187351789144861058 -1.4733965902926009495 0.2559885683630326314 -0.08047008781109345199 -0.053045980609822511453 0.04291142528488509772 0.13540397268050047286 0.11006445834340063128 0.42308409049428169491 -0.39324529558151111175 0.76244435891859152488 -0.21891063544592606616 -0.46503697222094098063 0.31551633209962054449 -0.1170928004149163898 0.10064609489694474609 -0.064413942569514381908 0.048448053056769670166 0.010425999345537066004 -0.24334008433027928819;0.49661832711096087767 0.55508814321069399611 -0.49569577913926848867 -0.38878287795822941142 0.48815050414013988478 -0.061422593821128308733 -0.29713480697976557554 0.1931638392197618237 -0.19806812497164943965 -0.20666967861414778374 -0.049051271678409343047 0.22670615655319997783 1.3591879703795788359 0.10160965557484782917 0.41168689242513345494 -0.84298736021578402067 0.56781619472038435958 -0.23917958211627490805 -0.3286182962497012916 -0.11503614091380495732 -0.16896665004440153401 -0.042944768166824881517 1.2052977984919346355;-0.27311614400524103496 0.39191391629189697987 0.082232088137825065655 0.30172779718633124801 0.95229878294091130364 0.094132258208077565498 -0.02848714241021999688 0.01181895280265974485 0.18608243495062257167 0.016217526275028374544 0.052946694554151553513 -0.09264211847254351373 -0.53559734754454169092 -0.12607605259613302584 0.20017362018689291436 0.25248849822205210458 0.37596273817157926933 0.31125855704580446259 -0.055352309273603017559 0.03490253465851827358 0.027973912476229975677 -0.024955631004793168287 0.44110579287391354919;-0.23052432527112357019 0.083629819169783917165 0.46573289466352479904 -0.23534441845625489464 -0.18720564203265629977 0.036029152512054886393 0.31520976842592018929 -0.078118981008128252075 0.16641744241238703994 0.11322593795270126382 -0.037936506430131196332 0.56934083262614876286 -1.2650902263350016774 0.27660575659608055421 -0.25917936343468866989 -0.62054115061178660717 -0.00068968411017941147131 -0.045161811114468417006 0.032857540790064372616 -0.15980849495190069254 0.21398186782618250357 0.22356876606002845653 -0.75886895467552362149;0.50319162500212077926 0.42393990108489526536 -0.90329362468988427803 0.53190963662239298948 0.95960634630181407267 -0.41882818221984036144 1.0413918437124758398 -0.18669938755852882872 -0.086447611993537787356 0.012330216090980693211 -0.18098535277828092793 -0.31628266085775069705 -0.62839738542996070869 0.29165156403995212697 0.32424649338591698955 -0.81698985116257349937 0.25032109398065155448 0.0001300426170272924863 -0.12671257103199801142 0.03504443299978704518 -0.02319479987168695384 -0.13384182166576802375 -0.037449843321537230889;-0.47280828599156460301 -0.0091894950387068213837 0.12488277957226547044 0.01665822505954677249 0.037797153980374843807 0.00048664890887662056417 0.24694737422705945185 0.21936037048925635662 -0.089005667219523770806 0.043577838707485924696 -0.2215090520514408079 -0.059089388431162209736 0.207075974998678497 0.078457093555297396925 -0.27907126556614203494 0.21312578006031410172 0.76910582738551624971 -0.64024340478138952459 0.072108489145555024202 0.0064071672791129888683 -0.030412652198815160604 0.048884261602382683698 0.88346429515311675207;-0.33369219497084456894 0.88241164884807676838 -0.52471182648426972772 0.60388117201473079376 -1.1720769160947959175 0.0083823046819438817162 -0.07403873996868089169 0.059912654114211781609 -0.031642859822497627909 -0.14804264772953748541 -0.19866898241950239901 -0.094172042445810441591 1.7087219589956110788 -0.48206312441857168682 0.0473007161848357921 0.091631141170035138033 -0.86166712844572013186 0.75892667699253069102 -0.047015269681080468223 -0.31826954631776138704 -0.30861565203898666532 -0.33619873924536541887 -0.38355860005270520086];

% Layer 2
b2 = -0.010677928153103623254;
LW2_1 = [-1.2926649574020976363 -1.2475146686169831245 -0.13972721903806925581 1.2134984292031270048 -1.2798651197161545756 -1.3393300201293214524 -1.5922127633888201181 1.3018370336069351456 -1.115848797069459053 -1.405254219725584397];

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
