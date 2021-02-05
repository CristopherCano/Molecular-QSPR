df_cetano = readtable('Dataset Cetano Avance 3.csv');
df_cetano.Set = categorical(df_cetano.Set);
%%
TrainingSelect = {'Training'};
ValidationSelect = {'Validation'};
TestSelect = {'Test'};
TrainingSelect = categorical(TrainingSelect);
ValidationSelect = categorical(ValidationSelect);
TestSelect = categorical(TestSelect);
%%
LogicalRowSelectTraining = df_cetano.Set == TrainingSelect;
LogicalRowSelectValidation = df_cetano.Set == ValidationSelect;
LogicalRowSelectTest = df_cetano.Set == TestSelect;
%%
SumTraining = sum(LogicalRowSelectTraining);
SumValidation= sum(LogicalRowSelectValidation);
SumTest = sum(LogicalRowSelectTest);
%%
ind_iniTest = 01;
ind_finTest = SumTest;
ind_iniTrain = ind_finTest+1;
ind_finTrain = SumTest+SumTraining;
ind_iniVal = ind_finTrain+1;
ind_finVal = ind_iniVal+SumValidation-1;
%%
guardar_vector=table();
iter=0;
for j = 1:3
    for i = 1:10
        iter=iter+1;
        
        guardar_vector.(iter) = [1,2,3,4,5]';        
    end
end
%%
nuevo{1, 1}.sorted_data(1,:).sorted_labels(1) = 'Conjugated_double_bond';
nuevo{1, 1}.sorted_data(1,:).sorted_labels(1) = 'Aldehyde';
%%

for j = 1:3
    k=0;
    for i = 1:4
        a = table([1,2,3,4]');
        b = table({'a','b','c','d'}');
        i=k+1;
        guardar_vector{1,j}.Datos(:,i) = a;        
        k=i+1;
        guardar_vector{1,j}.Datos(:,k) = b;
    end
end
%% Ejemplo de como guardar todos los resultados en cell
for k=1:2
    m=1;
    for i=1:4
        j=m:m+1
        a = [1,2,3,4]';
        b = {'a','b','c','d'}';
        c=table(a,b);
        guardar_vector{1,k}.Datos(:,j)=c;
        m=m+2;    
    end
end
%% Exportar datos de cell en matriz a excel
exportar_mse = [];
for m = 4:20
    mse = resultados_performance{1,m}.mse(:,:);
    exportar_mse = [exportar_mse; (mse)];
end

writetable(exportar_mse,'funcionesRedesNeuronales_2.xlsx')