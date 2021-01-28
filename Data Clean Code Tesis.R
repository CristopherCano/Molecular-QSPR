#Cargamos la base de datos de cetano
db_cetano_inicial<-read.csv("C:\\Users\\Cristopher\\Documents\\AVANCES-TESIS\\Avance_3\\Base de datos Datos de Cetano Raw.csv")

#se carga la libreria fdth que nos ayudara a calcular la distribuci?n de frecuencias
library(readxl)
library(fdth)
library(ggplot2)
library(dplyr)
library(nortest)
library(stringr)
library(scales)
library(normtest)



###PRIMER LIPIEMPIEZA DATOS DUPLICADOS
#Vemos que contine la base de datos
str(db_cetano_inicial)

#Normalizamos los nombres de las moleculas
db_cetano_inicial$Name<-str_to_lower(db_cetano_inicial$Name, locale= "es")

#checamos que no haya elemetos duplicados siempre en este caso por nombre
check_duplicados_nombre = data.frame(table(db_cetano_inicial$Name))
check_duplicados_nombre=filter(check_duplicados_nombre, check_duplicados_nombre$Freq>1)

#Hacemos una limpieza de los duplicados con uso de dplyr y el comando "duplicated"
db_cetano=db_cetano_inicial[duplicated(db_cetano_inicial$Name)==F,]

#Resutados despues de la limpieza
numero_de_datos <- c(count(db_cetano_inicial), count(check_duplicados_nombre), count(db_cetano))
base_de_datos_cetano <- c('datos iniciales','datos duplicados','datos restantes')
tabla_data_clean <- data.frame(base_de_datos_cetano, numero_de_datos)



###INICIO DATA CLEAN OUTLAYERS
#eliminamos los datos con "N/A"
db_cn_outlayers<-filter(db_cetano, CN_literature != "N/A")
cn_exp_outlayers<-as.numeric(filter(db_cetano, CN_literature != "N/A")$CN_literature)

#convertirmos la columna #CN_literatura de character a numerica 
db_cn_outlayers<-transform(db_cn_outlayers,CN_literature=as.numeric(CN_literature))
str(db_cn_outlayers)

#almacenamos en una nueva variable los datos para comparar una vez limpios los datos
cn_exp<-cn_exp_outlayers

#obtenemos el histograma para ver como estan distribuidos los valores 
hist(cn_exp_outlayers, main="Histograma: datos crudos", xlab = "cn experimental con outlayers")

#Hacemos un gr?fico de caja de bigotes para ver los outliers
boxplot(cn_exp_outlayers, main="Boxplot: datos crudos",horizontal = TRUE)



###ELIMINAR OUTLAYERS
#Quitamos los outlayes y hacemos un gr?fico de caja de bigotes
i = 0
out_cns = 1
out_cns_list = c()
while (is.na(out_cns)==FALSE){
  i=i+1
  out_cns=boxplot.default(cn_exp, main="Boxplot: datos listos",horizontal = T)$out[1]
  out_cns_list[i]=out_cns
  if (is.na(out_cns) == TRUE){
    print(out_cns_list[i-1])
    db_cn_clean<-filter(db_cn_outlayers, CN_literature < out_cns_list[i-1])
    break()
  }
  
  cn_exp = cn_exp[cn_exp<out_cns]
}



### PLOT DISTRIBUTION
#seleccionamos el atributo que queremos obtener 
atributo<-"CN_literature" #"CN.Exp."

#seleccionamos la columna que utilizaremos para filtrar 
target<- "Set" #"Set..CN."

#escribimos la etiqueta que utilizaremos como criterio para filtrar en la columna seleccionada
label<-list("Training","Validation","Test")

#guardamos los datos en las variables trainind, test, validation
training_cn<-db_cn_clean[db_cn_clean[,target]==label[1],atributo]
validation_cn<-db_cn_clean[db_cn_clean[,target]==label[2],atributo]
test_cn<-db_cn_clean[db_cn_clean[,target]==label[3],atributo]

#hist(training_cn)

#c?lcula la distribuci?n de frecuecias utilizando la regla de sturgets
#Donde
#f= frecuencia absoluta
#rf= frecuencia relativa
#rf(%) frecuencia relativa porcentual
#cf= frecuencia acumulada
#cf(%)=frecuencia acumulada porcentual
lim_inf=0
lim_sup=100
freq_test<-fdt(test_cn,start=lim_inf, end=lim_sup, class="Sturges",right=T)
class_limits<-freq_test[["table"]][["Class limits"]]
freq_test<-freq_test[["table"]][["rf"]]
freq_validation <-fdt(validation_cn, start=lim_inf, class="Sturges",end=lim_sup,right=T)
freq_validation<-freq_validation[["table"]][["rf"]]
freq_training<-fdt(training_cn, start=lim_inf, end=lim_sup,class="Sturges",right=T)
freq_training<-freq_training[["table"]][["rf"]]


all_freq<-c(freq_test,freq_training,freq_validation)
#unimos en una sola variable las frecuencias relativas porcentuales
div=length(freq_test)
df_freq_test<-data.frame(supp=rep(c("Test","Training","Validation"),each=div),
                        rep(class_limits,3), all_freq)
#Gr?ficamos
ggplot(data=df_freq_test,aes(x=rep(class_limits,3), y=all_freq, fill=supp))+
  geom_bar(stat="identity",position=position_dodge(),colour="black")+
  scale_fill_hue(name=" ")+
  labs(x="N?mero de Cetano", y = "Frecuencia (%)", title="Distribuci?n: CN")+
  scale_colour_brewer(palette= 'Spectral')+theme_bw()



### PRUEBAS DE NORMALIDAD
kurtosis.norm.test(validation_cn)
kurtosis.norm.test(test_cn)
kurtosis.norm.test(training_cn)



###obtenemos el histograma para ver como estan distribuidos los valores sin outlayers
set.seed(42)
hist(cn_exp_outlayers,col='skyblue',border=F, main = "Distribuci?n del n?mero de cetano", xlab="cn experimental")
hist(cn_exp,col=scales::alpha('red',.5),border=F, add=T)
legend('topright',c('cn exp outlayers','cn exp clear'),
       fill=c('skyblue',scales::alpha('red',.5)),bty='n',border = F)



#guardamos los datos limpios
write.csv(db_cn_clean,"Datos Tesis Nuevos.csv")
