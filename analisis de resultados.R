#Se carga la libreria readxl para exportar los datos del archivo excel
#Se carga la libreria ggplot2 para visualizar la informaci?n
#se carga la libreria fdth que nos ayudara a calcular la distribuci?n de frecuencias
#Se carga la libreriaa dbplyr para manipular los dataframes
#Se carga la libreria plotly para volver interactivos los gr?ficos
#Se carga la libreria ggpol para realizar los boxplot con point
#Se carga la libreriaa tidyverse que tiene los paquetes ggplot2, dplyr, tidyr
#Se carga la libreria ggpubr y caret para a?adir R y p-vaule a los gr?ficos
#Se carga la libreria ggpmisc para a?adir R^2 en los gr?ficos 

library(readxl)
library(ggplot2)
library(tidyverse)
library(cowplot)
library(ggpol)
library(dbplyr)
library(plotly)
library(fdth)
library(ggpmisc)
library(ggpubr)
library(caret)
library(devtools)


#Cargamos la base de datos de cetano
db_cetano_inicial<-read_excel("C:\\Users\\Cristopher\\Documents\\AVANCES-TESIS\\Avance_3\\analisis de resultados.xlsm")

#Vemos que tine la base de datos
str(db_cetano_inicial)
#db_cetano_inicial$CN_Predicted <- db_cetano_inicial$CN_Predicted_2

#Correlaci?n valor predicho y valor real
cn_R= round(cor(x = db_cetano_inicial$CN_literature, y = db_cetano_inicial$CN_Predicted),2)

#1.Correlaci?n del n?mero de cetano
ggplot(db_cetano_inicial, aes(x = CN_literature, y = CN_Predicted)) + 
  geom_point(aes(color = Class), size = 2, alpha = 0.7) +
  geom_smooth(color = 'red', method = "lm") + 
  xlab('N?mero de cetano literatura') + 
  ylab('N?mero de cetano calculado') +
  annotate("text", x = 10, y = 95, label = paste('R=',cn_R)) +
  theme_minimal() +
  ggtitle('Correlaci?n del n?mero de cetano') 

#1.1 Correlaci?n del n?mero de cerano por ser  
ggplot(db_cetano_inicial, aes(x = CN_literature, y = CN_Predicted)) + 
  geom_point(aes(color = Set), size = 2, alpha = 0.7) +
  geom_smooth(color = 'red', method = "lm") + 
  xlab('N?mero de cetano literatura') + 
  ylab('N?mero de cetano calculado') +
  annotate("text", x = 10, y = 95, label = paste('R=',cn_R)) +
  theme_minimal() +
  ggtitle('Correlaci?n del n?mero de cetano') 

#2.Correlaci?n por grupos funcionales
ggplot(db_cetano_inicial, aes(x = CN_literature, y = CN_Predicted)) + 
  geom_point(aes(color = Class), alpha = 0.7) +
  geom_smooth(aes(color = Class), method = "lm") +
  facet_wrap(~ Class, scales = "free", ncol = 4) +
  stat_poly_eq(label.x.npc = 0.05, label.y.npc = 95,
               formula = formula, parse = TRUE, size = 3) +
  xlab('N?mero de cetano literatura') + 
  ylab('N?mero de cetano calculado') +
  ggtitle('Correlaci?n por grupos funcionales') 

###3.Correlaci?n por grupos funcionales con R y p-value
hplot_cn <- ggscatter(db_cetano_inicial, x="CN_literature", y="CN_Predicted", color = "Class", fill = "Class", add="reg.line", show.legend.text=FALSE) +
  facet_wrap(vars(Class), ncol=4) +
  stat_cor()
ggpar(hplot_cn, xlab = "CN literatura", ylab = "CN calculado", legend="none") +
  ggtitle('Correlaci?n por grupos funcionales')

###4.Distribuci?n del n?mero de cetano por grupos funcionales
ggplot(db_cetano_inicial, aes(x= CN_literature)) +
  geom_histogram(aes(color = Class, fill = Class), bins = 10, alpha = 0.4) +
  #scale_color_manual(values = brewer.pal(n = 14, name= "Paired")) +
  #scale_fill_manual(values = brewer.pal(n = 14, name= "Paired")) +
  facet_wrap(vars(Class), nrow=5, scales="free") + 
  theme(legend.position="none", 
                     panel.grid.major=element_blank(), 
                     panel.grid.minor =element_blank(), 
                     panel.background = element_blank()) +
  ggtitle('Distribuci?n del n?mero de cetano por grupos funcionales')


###MODULARIDADES

###1.Modularidad louvain correlaci?n
r_louvain_cn <- ggscatter(db_cetano_inicial, x="Mod Louvain", y="CN_literature", color = "Class", fill = "Class", add="reg.line", show.legend.text=FALSE) +
  facet_wrap(vars(Class), ncol=4) +
  stat_cor()
ggpar(r_louvain_cn, xlab = "Modularidad Louvain", ylab = "CN literatura", legend="none") + theme(axis.text=element_text(size=10))+ggtitle("Modularidad Louvain correlaci?n")


###2.Distribuci?n Modularidad Louvain
db_cetano_inicial$`Mod Louvain`
ggplot(db_cetano_inicial, aes(x= `Mod Louvain`)) +
  geom_histogram(aes(color = Class, fill = Class), bins = 10, alpha = 0.4) +
  #scale_color_manual(values = brewer.pal(n = 14, name= "Paired")) +
  #scale_fill_manual(values = brewer.pal(n = 14, name= "Paired")) +
  facet_wrap(vars(Class), nrow=5, scales="free")+ 
  theme(legend.position="none", 
              panel.grid.major=element_blank(), 
              panel.grid.minor =element_blank(), 
              panel.background = element_blank())+
  ggtitle("Distribuci?n Modularidad Louvain")


###3.Modularidad Mod Leiden correlaci?n
r_leiden_cn <- ggscatter(db_cetano_inicial, x="Mod Leiden", y="CN_literature", color = "Class", fill = "Class", add="reg.line", show.legend.text=FALSE) +
  facet_wrap(vars(Class), ncol=4) +
  stat_cor()
ggpar(r_leiden_cn, xlab = "Modularidad Leiden", ylab = "CN literatura", legend="none") + theme(axis.text=element_text(size=10))+ggtitle("Modularidad Leiden correlaci?n")


###4.Distribuci?n Modularidad Leiden
ggplot(db_cetano_inicial, aes(x= `Mod Leiden`)) +
  geom_histogram(aes(color = Class, fill = Class), bins = 10, alpha = 0.4) +
  #scale_color_manual(values = brewer.pal(n = 14, name= "Paired")) +
  #scale_fill_manual(values = brewer.pal(n = 14, name= "Paired")) +
  facet_wrap(vars(Class), nrow=5, scales="free") +
  theme(legend.position="none", 
                     panel.grid.major=element_blank(), 
                     panel.grid.minor =element_blank(), 
                     panel.background = element_blank())+
  ggtitle("Distribuci?n Modularidad Leiden")


###ERROR MODELO

#Error absoluto (Falta terminar)
Error_absoluto = (db_cetano_inicial$CN_literature-db_cetano_inicial$CN_Predicted)
db_cetano_inicial$Error_absoluto = Error_absoluto

#Gr?fica de error absoluto por grupos funcionales (Falta terminar)
ggplot(db_cetano_inicial, aes(Error_absoluto), fill = key) +
  geom_histogram(color="white",fill="gray") +
  geom_boxplot(color = NA,fill="blue", width=350, alpha = 0.2, outlier.shape = NA, )+
  xlim(0,60) +
  ylim(0,100)
  
  
#Boxplot errores set
ggplot(db_cetano_inicial) +
  geom_boxjitter(aes(x= Set, y = Error_absoluto, fill = Set),
  jitter.shape = 21, jitter.color = NA, 
  jitter.params = list(height = 0.05, width = 0.065),
  outlier.color = NA, errorbar.draw = TRUE, alpha = 0.65, size = 0.2) +
  guides(color = guide_legend(nrow = 3)) +
  theme(legend.position="none") +
  coord_flip() +
  theme_bw() +
  ylab("Error") +
  stat_summary(geom="text", fun.y=quantile,
               aes(x= Set, y = Error_absoluto, label=sprintf("%1.0f", ..y..)),
               position=position_nudge(x=-0.44), size=3) +
  scale_fill_manual(values = c("#ecb21e", "#0072B2","#009E73")) +
  guides(fill=FALSE) + ggtitle('Boxplot errores set')
  
  
#Errores por grupo funcional
ggplot(db_cetano_inicial, aes(x=Class, y = Error_absoluto)) +
  geom_point(aes(color = Class), size = 2, alpha = 0.7) +
  theme(axis.title.x=element_blank(),
        axis.text.x=element_blank(),
        axis.ticks.x=element_blank()) +
  theme(axis.text.x=element_text(angle=90, hjust=1),
        panel.background = element_blank()) +
  theme(axis.line = element_line(color = 'black'),panel.border = element_rect(colour = "black", fill=NA)) +
  geom_hline(yintercept=0, linetype="dashed")+
  ylab('Predicted CN - Experimental CN') +
  xlab('Descriptores') +
  ggtitle('Errores por grupo funcional')

##
#Contar los elemtos que se repiten en una columna
class_molecules  <- select(db_cetano_inicial, Class, CN_literature)
conteo_de_moleculas  <- class_molecules  %>% group_by(Class) %>% count(Class)

#Ciclo for para dividir los datos por clases de grupo funcional
all_freq_class <- NULL
class_limits <- NULL
k <- 12
for (i in 1:nrow(conteo_de_moleculas[1])){
  type_clase <- toString(conteo_de_moleculas[i,1])
  
  print(type_clase)
  
  lim_inf=0
  lim_sup=110
  
  class_cn <- class_molecules %>% filter(Class == type_clase) %>% select(CN_literature)
  
  freq_data <- fdt(class_cn, k, start=lim_inf, end=lim_sup, class="FD",right=F)
  class_limits_1 <- freq_data[["CN_literature"]][["table"]][["Class limits"]]
  freq_data_all <- freq_data[["CN_literature"]][["table"]][["f"]]
  
  if (type_clase == "iso-alkane" ){
    class_limits <- class_limits_1
  }

  all_freq_class <- append(all_freq_class ,freq_data_all)
  
}

#Dataframe que condensa todo los resultados de las clases por n?mero de cetano
grupos_funcionales <- conteo_de_moleculas$Class
div = k
df_freq_class<-data.frame(supp=rep(grupos_funcionales,each=div),rep(class_limits,20))
df_freq_class$frecuencia_class <- all_freq_class
##

#Representaci?n de compuestos dentrodel rango CN
mi_gr?fico<-ggplot(df_freq_class, aes(x=rep.class_limits..20. ,y= frecuencia_class, fill = supp)) +
  geom_bar(stat="identity",color="white", alpha=0.8, position=position_stack()) +
  theme_bw() +
  theme(axis.text.x=element_text(angle=90, hjust=0)) +
  labs(y = 'N?mero de compuestos', x = 'CN rangos', title = 'Representaci?n de compuestos dentro del rango CN', fill = 'Clases')

mi_gr?fico 

ggplotly(mi_gr?fico)  


#### Gr?ficas de mol?culas n-alkanes vs Modularidad Leiden
cn_predicted_alkanos <- db_cetano_inicial %>% filter(Class=="n-Alkane") %>% select(CN_Predicted) 
cn_literature_alkanos <- db_cetano_inicial %>% filter(Class=="n-Alkane") %>% select(CN_literature) 
names(cn_predicted_alkanos) <- names(cn_literature_alkanos)
cn_alkanos <- rbind(cn_predicted_alkanos, cn_literature_alkanos)
cn_type<-data.frame(supp=rep(c("CN_literature","CN_Predited"),each=nrow(cn_predicted_alkanos)))
cn_alkanos_mod <- cbind(cn_alkanos,cn_type)
mod_leiden<-db_cetano_inicial %>% filter(Class == "n-Alkane") %>% select(`Mod Leiden`)
cn_alkanos_mod <- cbind(cn_alkanos_mod, rep(mod_leiden))

ggplot(cn_alkanos_mod, aes(x = `Mod Leiden`, y = CN_literature))+
  geom_point(aes(color = supp), size = 2, alpha = 0.7) + theme_minimal()

#### Gr?ficas de mol?culas n-alkanes vs nC
ch2_linear <- db_cetano_inicial %>% filter(Class=="n-Alkane") %>% select(`g-CH2-(linear)`)
cn_alkanos_nC <- cbind(cn_alkanos, ch2_linear)
cn_alkanos_nc<-cbind(cn_alkanos_nC, cn_type)

ggplot(cn_alkanos_nc, aes(x = `g-CH2-(linear)`, y = CN_literature))+
  geom_point(aes(color = supp), size = 2, alpha = 0.7) + theme_minimal()

ggplot(cn_alkanos_nc, aes(x = `g-CH2-(linear)`, y = CN_literature))+
  geom_point(aes(color = supp), size = 2, alpha = 0.7)
