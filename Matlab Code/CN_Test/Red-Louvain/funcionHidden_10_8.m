function [y1] = myNeuralNetworkFunction(x1)
%MYNEURALNETWORKFUNCTION neural network simulation function.
%
% Auto-generated by MATLAB, 26-Jan-2021 20:53:00.
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
b1 = [0.1170651257157542674;0.017590254459599986153;0.20878181553562369377;0.32295688504546993247;-0.16230549780892503109;-0.078996199741424535934;-0.099351911197739520287;-0.13481107141848575059;-0.072991408997591086805;0.41201253744441956872];
IW1_1 = [-0.34846936402114586651 0.21639226023794452813 0.62275862824761396563 -0.40890309300744415166 -1.0395847318019932892 0.023892907587990532686 -0.17917899375101398185 0.034002366385717790187 0.037730095317653075671 0.052690507670220987357 0.15699138129356488003 0.43918267814806566385 -0.25338785742952152358 0.5714247469534089463 0.04508289409557180577 -0.3563104440298595077 0.1552699473177677203 -0.036670858240106976589 0.40101504130866333364 -0.069032203135057215726 -0.050103685291533528456 0.35567339458850977252 0.11723110360223173987;-0.32931168139469685352 -0.43956757122680051308 -0.72823155489174717925 0.2196134619480197836 0.5693958437345295609 -0.1620300838257346665 0.070595656169382473011 0.15216307525834610326 -0.025108319802384246322 -0.023531674762384123534 0.21796375394759262556 -0.75028714838806132015 0.61498652240393381074 0.18816071963894431818 -0.22185373388951093454 1.0825438793845778562 0.24127978888815074243 0.20099974637392831189 -0.21785429073880185902 0.11453672363140894597 0.10376669666561959271 -0.1268612510003041538 0.04341017398858575127;0.14242767274516698883 0.18432702446789586692 -0.33180284935033499405 0.81524801963502657731 0.61559967534015291868 0.10601283163921763897 1.0258013415913105337 -0.14078400010178676593 0.16846857345543453377 0.062816350958566136153 0.008026207110859481797 -0.62880237975158137509 -0.88613335844638707606 -0.17089198397400556795 0.32153607636620290533 -0.67556104895746849071 -0.061259941395287897947 -0.44942523830745406688 0.30782929617410970113 -0.012180658116452728126 -0.068961932584278753944 0.070177581451172157956 -0.22290225632502094766;0.14028614418071469472 0.23940192848410532522 -0.18813314337635447804 0.50815356584241588855 -0.85483412584661155886 0.084587411863854683469 -0.13230059092431190049 0.34126057782825636178 -0.030970397195421023318 -0.19928138691320715359 -0.27286415755020770879 1.1146255699664235905 0.8283404009822565861 -0.12334726570313141181 -0.20454397915474992198 0.2073369585834554385 -0.23907328325227553134 0.2842760608220976648 -0.1426336810252931131 -0.091978877236909020731 -0.11367687389711250701 -0.094052664623925141818 0.60150244064205027339;-0.16457583653367860443 -0.096771084477625432529 0.14093285320551010575 0.28971802628225284959 0.2915600969401020981 0.2163407355198556925 -0.47999393881946189611 -0.021051131481507216747 0.0091382006830164966282 -0.0069513591794842233273 0.19405842600280331922 -0.3311269646692143187 0.62353808303930668977 -0.3967698191391814122 0.34948831671721314329 0.31042384088872165826 0.070426107052735040237 -0.70996289331544804035 0.12329581454176079258 0.010697254230638948702 0.0085324751002756951679 0.24785545000052466857 -0.4465645351092956683;-0.027713196299668722833 0.192403302131103765 -0.3266864422272071633 0.67627820614078093531 -0.31875699968533138806 -0.34674827293547738627 -0.42360031152016974776 0.095993954850908239096 0.065643503776116815529 -0.22053293022058112482 0.08744170277834453775 0.05828965463894372756 0.40160459470439552332 0.29227922560914276762 -0.36318979224623104685 -0.34455068090220181132 -0.28197014808118470164 0.33647405469437263736 0.0094359099214189438853 -0.14885406850295357373 -0.074532978857145035234 0.17737573279559062933 0.8201252522333247752;-0.22943152447849207709 0.33859146486837632395 0.34473331728331341184 0.15600532526204527461 -0.79125625113553377243 0.048966592961031715769 -0.21944933241200195728 -0.085794246125952655646 0.083733324534637540437 0.086019423047545173766 -0.12262520298680677777 -0.58037607594155171675 0.028627457293862644538 0.36555403682936937759 -0.24890111697907041366 0.31942799871535204614 -0.33040895576531037481 -0.31929683201313113772 -0.010454871874620932232 0.081852454927115819716 -0.0045105649814706832643 -0.16538199905102080045 -0.57867573972260000215;-0.073837604582979901591 -0.46637438946733761336 0.44382710501980754403 0.022065919732023962091 0.12755845693915329742 -0.3614019406837477022 -0.88163608246895963649 -0.26768262982236945557 0.10498560272533960513 0.14970725768257192589 0.25485647967356989119 0.37344538901943663545 0.45819763949431679961 -0.19482900251273604919 0.076475108676102049321 -0.090861673534993039891 -1.106711108468171112 0.15508006898299536713 -0.21327655010540805258 0.078367285684451212791 0.2234699238767060836 0.13880864675570322997 -0.47872925501174939944;0.52708105897220802749 -0.50185192896818009434 0.29467510123983020609 -0.68346304671200064362 -0.095854572615579364259 0.24903773469709877819 -0.20234760401677920338 -0.067514271407564996341 -0.072397904957691869288 0.10329546236902081846 0.071998493263082538607 -0.69565812346813904465 -1.1570444822746819291 -0.048984669133180877565 0.32989361861172439294 0.58591167116814468763 0.23203354409231996547 -0.44963103212327637515 0.32071960670310006858 -0.18990071045841136477 0.14575164348910626955 -0.12292961188737171196 -1.4742897036266964239;-0.67568139867143395261 0.018269414200991960368 -0.23444233538499867353 0.30541658202890609175 1.5336936227956130541 0.034612623636597908416 0.015572865341609849754 -0.10586028451854453958 -0.13578019466791912961 -0.31309657094537834965 0.15282469774925583339 -1.0517936412025075121 0.92625137035660554119 0.59431127778874737189 0.11965673509960531029 -0.17567830986856752817 0.48545097820361809982 0.31452035104500591922 -0.23886369472984109175 -0.21558784978057493609 -0.33060299721430425057 -0.049756688663332784839 0.50176422313458901581];

% Layer 2
b2 = 0.1732218488170773063;
LW2_1 = [1.1706350240473002433 1.0816343465374336219 1.4038208336295321388 1.6661447676387604044 -1.3607424877125053886 -1.2141306931988629092 -0.90353866052501974337 1.2300408747744606686 1.2167099765044440129 1.2026964817588079448];

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
