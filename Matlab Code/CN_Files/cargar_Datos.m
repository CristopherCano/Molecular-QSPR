%ALLFG-Mod
Model = 'ALLFG-Mod';
selected_input = ["dnAB","dnCCDB","dnQC",...
    "g_CH3", "g_CH2_linear","g_OH",...
    "g_O_linear", "g_O_ring",...	
    "Ketone_linear", "Ketone_ring", "Aldehyde", "Ester_linear",...	
    "g_CH_linear", "g_CHdb_linear","g_CHdb_ring", "g_CH2db_linear",...	
    "g_CH_ring", "g_CH2_ring","dnOHprim","dnOHter",...
    "Carboxylic_acid","Mod_Leiden"];


%cargar los datos en Workspace
glycerol_derivs_dataset = readtable('Dataset Cetano Avance 4.xlsx');
selected_target = ["CN_literature"];
Target = table2array(glycerol_derivs_dataset(:,selected_target));
Input = table2array(glycerol_derivs_dataset(:,selected_input));
df_cetano = readtable('Dataset Cetano Avance 4.xlsx');
df_cetano.Set = categorical(df_cetano.Set);
cn_literature = table2array(df_cetano(:,"CN_literature"));
%
TrainingSelect = {'Training'};
ValidationSelect = {'Validation'};
TestSelect = {'Test'};
TrainingSelect = categorical(TrainingSelect);
ValidationSelect = categorical(ValidationSelect);
TestSelect = categorical(TestSelect);
%
LogicalRowSelectTraining = df_cetano.Set == TrainingSelect;
LogicalRowSelectValidation = df_cetano.Set == ValidationSelect;
LogicalRowSelectTest = df_cetano.Set == TestSelect;
%
SumTraining = sum(LogicalRowSelectTraining);
SumValidation= sum(LogicalRowSelectValidation);
SumTest = sum(LogicalRowSelectTest);
%
ind_iniTest = 01;
ind_finTest = SumTest;
ind_iniTrain = ind_finTest+1;
ind_finTrain = SumTest+SumTraining;
ind_iniVal = ind_finTrain+1;
ind_finVal = ind_iniVal+SumValidation-1;
%%
%%Feature selection
mdl = fsrnca(Input,Target);
figure()
plot(mdl.FeatureWeights,'go')
xlabel('Feature Index')
ylabel('Feature Weight')
set(gca, 'xticklabel', selected_input);
[nrow_i,ncol_i]=size(selected_input);
xticks(1:ncol_i);
xtickangle(45);

for col = 1:ncol_i
    line([col col],[0 mdl.FeatureWeights(col)]);
end
grid on

figure()
plot(mdl.FitInfo.Iteration,mdl.FitInfo.Objective,'ro-')
grid on
xlabel('Iteration Number')
ylabel('Objective')
%% Exportar datos de cell en matriz a excel
exportar_mse = [];
for m = 5:20
    mse = resultados_performance{1,m}.mse(:,:);
    exportar_mse = [exportar_mse; (mse)];
end

writetable(exportar_mse,'Resultados_all_nn.xlsx')