%ALLFG-Mod %25
Model = 'ALLFG-Mod';
selected_input = ["dnAB","dnCCDB","dnQC",...
    "g_CH3", "g_CH2_linear","g_OH",...
    "g_O_linear", "g_O_ring",...	
    "Ketone_linear", "Ketone_ring", "Aldehyde", "Ester_linear",...	
    "g_CH_linear", "g_CHdb_linear","g_CHdb_ring", "g_CH2db_linear",...	
    "g_CH_ring", "g_CH2_ring","dnOHprim", "dnOHter",...
    "Carboxylic_acid","Mod_Leiden"];

%cargar los datos en Workspace
%glycerol_derivs_dataset = readtable('Copy of Falta Modularidad  Test CN.xlsx');
%glycerol_derivs_dataset = readtable('modularidad creaton keasler.xlsx');
glycerol_derivs_dataset = readtable('Test_Papers.xlsx');

Input = table2array(glycerol_derivs_dataset(:,selected_input));
%%
calculo_cetano = funcionHidden_10_8(Input')';
cn = table(cn_literature, calculo_cetano, cn_literature-calculo_cetano)
%%
%Codigo gráficas

allnn= readtable("Resultados_all_nn.xlsx");
 
%%
 for i = 5:13
    valPerformance = allfgmod.rmsePerformance(allfgmod.h == i);
    minrmsePerfo(i-4) = min(valPerformance);
    
    valTrain = allfgmod.rmsetrainPerformance(allfgmod.h == i);
    minrmseTrain(i-4) = min(valTrain);
    
    valTest = allfgmod.rmsetestPerformance(allfgmod.h == i);
    minrmseTest(i-4) = min(valTest);
 end
 
 minrmseall = table(minrmsePerfo',minrmseTrain',minrmseTest')
 
 %%
 hnn =[[5:13];[5:13];[5:13]]';
 rmseall = table2array(minrmseall);
 
 figure(1)
 tiledlayout(2,2)
 %Plot 1
 nexttile
 hold on
 scatter(hnn(:,1), rmseall(:,1),"filled")
 scatter(hnn(:,2), rmseall(:,2),"filled")
 scatter(hnn(:,3), rmseall(:,3),"filled")
 
 xlabel("No. Hidden layer neurons")
 ylabel("RMSE")
 legend("all","train","test")
 title("ALLFG")
 grid()
 hold off
 
 %Plot 2
 nexttile
 hold on
 scatter(hnn(:,1), rmseall(:,1),"filled")
 scatter(hnn(:,2), rmseall(:,2),"filled")
 scatter(hnn(:,3), rmseall(:,3),"filled")
 xlabel("No. Hidden layer neurons")
 ylabel("RMSE")
 legend("all","train","test")
 title("ALLFG + Modularity")
 grid()
 
 %Plot 3
 nexttile
 hold on
 scatter(hnn(:,1), rmseall(:,1),"filled")
 scatter(hnn(:,2), rmseall(:,2),"filled")
 scatter(hnn(:,3), rmseall(:,3),"filled")
 
 xlabel("No. Hidden layer neurons")
 ylabel("RMSE")
 legend("all","train","test")
 title("Red 1")
 grid()
 hold off
 
 %Plot 4
 nexttile
 hold on
 scatter(hnn(:,1), rmseall(:,1),"filled")
 scatter(hnn(:,2), rmseall(:,2),"filled")
 scatter(hnn(:,3), rmseall(:,3),"filled")
 xlabel("No. Hidden layer neurons")
 ylabel("RMSE")
 legend("all","train","test")
 title("Red 2")
 grid()
 hold off