library(readxl)

#Cargamos la base de datos a R
cetane.db <- read_xlsx("Dataset Cetano Avance 3.xlsx")

#Observamos algunas filas y la dimensión del data frame
head(cetane.db); tail(cetane.db); dim(cetane.db);

#Habilitamos attach para acceder a las columnas de la bd
attach(cetane.db)

#Llevamos a cabo el ajuste de un modelo Y = beta0 + beta1Food + beta2Decor + beta3Service + beta4East + ... +e

m1 <- lm(CN_literature ~ dnAB + dnCCDB + dnQC + g_CH3 + g_CH2_linear + g_OH + g_O_linear + g_O_ring +
           Ketone_linear + Ketone_ring + Aldehyde + Ester_linear + g_CH_linear + g_CHdb_linear + g_CHdb_ring + 
           g_CH2db_linear + g_CH_ring + g_CH2_ring + dnOHprim + dnOHsec + dnOHter + phenol + Carboxylic_acid +
           Mod_Leiden)

#Obtenemos un resumen

summary(m1)

Coefficients:
  Estimate Std. Error t value Pr(>|t|)    
(Intercept)      22.8547     3.7080   6.164 1.19e-09 ***
  dnAB             -0.2129     0.9192  -0.232 0.816873    
dnCCDB           -3.6547     3.1357  -1.166 0.244199    
dnQC             -0.6391     3.1184  -0.205 0.837665    
g_CH3            -5.4171     1.5520  -3.490 0.000512 ***
  g_CH2_linear      1.8446     0.1416  13.022  < 2e-16 ***
  g_OH            -11.3608     7.8716  -1.443 0.149384    
g_O_linear        9.7697     1.2549   7.785 2.46e-14 ***
  g_O_ring         -1.2337     2.8693  -0.430 0.667342    
Ketone_linear   -16.9092     3.2020  -5.281 1.71e-07 ***
  Ketone_ring     -14.8834     6.6686  -2.232 0.025934 *  
  Aldehyde          2.9438     4.0527   0.726 0.467847    
Ester_linear    -11.8834     1.0915 -10.888  < 2e-16 ***
  g_CH_linear      -0.5725     1.6447  -0.348 0.727878    
g_CHdb_linear    -2.8698     1.6200  -1.771 0.076905 .  
g_CHdb_ring      -2.5213     2.0123  -1.253 0.210636    
g_CH2db_linear   -2.4580     3.4570  -0.711 0.477301    
g_CH_ring        -1.0600     1.2119  -0.875 0.382064    
g_CH2_ring       -1.2266     0.6481  -1.893 0.058818 .  
dnOHprim         -6.6768     8.0030  -0.834 0.404397    
dnOHsec          -6.3365     8.0952  -0.783 0.434035    
dnOHter           4.0025     8.4687   0.473 0.636630    
phenol            3.6754     9.4337   0.390 0.696951    
Carboxylic_acid -26.7253     4.6160  -5.790 1.06e-08 ***
  Mod_Leiden       66.7939     7.0426   9.484  < 2e-16 ***
  
  Residual standard error: 12.66 on 712 degrees of freedom
Multiple R-squared:  0.7282,	Adjusted R-squared:  0.7191

# Ajustamos nuevamente un modelo pero ahora sin considerar las variables aceptadas ya que en el resultado 
# anterior se observó que su coeficiente de regresión no fue estadísticamente significativo 
# Y = beta0 + beta1Food + beta2Decor + beta4*East + ... + e (Reducido)

m2 <- lm(CN_literature ~ g_CH3 + g_CH2_linear + g_O_linear + Ketone_linear + Ketone_ring + Ester_linear + Carboxylic_acid + Mod_Leiden)

#Obtenemos el resumen del modelo ajustado (Reducido)
summary(m2)

Coefficients:
  Estimate Std. Error t value Pr(>|t|)    
(Intercept)      15.8804     2.6537   5.984 3.41e-09 ***
  g_CH3            -1.9215     0.4743  -4.051 5.65e-05 ***
  g_CH2_linear      2.5113     0.1614  15.564  < 2e-16 ***
  g_O_linear        9.4751     1.5305   6.191 1.00e-09 ***
  Ketone_linear    -5.0336     3.9548  -1.273 0.203500    
Ketone_ring      -5.1177     8.2846  -0.618 0.536942    
Ester_linear     -7.1764     1.2426  -5.775 1.14e-08 ***
  Carboxylic_acid -21.0887     5.4018  -3.904 0.000103 ***
  Mod_Leiden       24.8922     7.7739   3.202 0.001424 ** 
  
  Residual standard error: 16.45 on 728 degrees of freedom
Multiple R-squared:  0.5305,	Adjusted R-squared:  0.5254 

# Ajustamos nuevamente un modelo pero ahora sin considerar las variables aceptadas ya que en el resultado 
# anterior se observó que su coeficiente de regresión no fue estadísticamente significativo 
# Y = beta0 + beta1Food + beta2Decor + beta4*East + ... + e (Reducido)

m3 <- lm(CN_literature ~ g_CH3 + g_CH2_linear + g_O_linear + Ester_linear + Carboxylic_acid + Mod_Leiden)

#Obtenemos el resumen del modelo ajustado (Reducido)
summary(m3)

Coefficients:
  Estimate Std. Error t value Pr(>|t|)    
(Intercept)      15.7493     2.6509   5.941 4.38e-09 ***
  g_CH3            -1.9156     0.4740  -4.042 5.87e-05 ***
  g_CH2_linear      2.5365     0.1603  15.820  < 2e-16 ***
  g_O_linear        9.6112     1.5274   6.293 5.38e-10 ***
  Ester_linear     -7.2259     1.2418  -5.819 8.86e-09 ***
  Carboxylic_acid -20.9959     5.4013  -3.887 0.000111 ***
  Mod_Leiden       24.4419     7.7670   3.147 0.001717 ** 
  
  Multiple R-squared:  0.5292,	Adjusted R-squared:  0.5254 

# Ahora tratemos de verificar si el modelo ajustado es un modelo válido.
# 
# Acontinuación mostramos una matriz de gráficos de dispersión de los tres predictores continuos. Los predictores parecen estar linealmente 
# relacionados al menos aproximadamente

pairs(~ g_CH3 + g_CH2_linear + g_O_linear + Ester_linear + Carboxylic_acid + Mod_Leiden, data = cetane.db, gap = 0.4, cex.labels = 1.5)

# Acontinuación veremos gráficas de residuales estandarizados contra cada predictor. La naturaleza aleatoria de estas gráficas es un indicativo 
# de que el modelo ajustado es un modelo válido para los datos.

StanRes1 <- rstandard(m3)
par(mfrow = c(3, 2))
plot(g_CH3, StanRes1, ylab = "Residuales Estandarizados")
plot(g_CH2_linear, StanRes1, ylab = "Residuales Estandarizados")
plot(g_O_linear, StanRes1, ylab = "Residuales Estandarizados")
plot(Ester_linear, StanRes1, ylab = "Residuales Estandarizados")
plot(Carboxylic_acid, StanRes1, ylab = "Residuales Estandarizados")
plot(Mod_Leiden, StanRes1, ylab = "Residuales Estandarizados")
dev.off()


par(mfrow = c(2, 2))
plot(m3)
dev.off()

plot(m3$fitted.values, CN_literature, xlab = "Valores ajustados", ylab = "CN number")
abline(lsfit(m1$fitted.values, CN_literature))


# Ahora compararemos el modelo completo guardado en mfull contra el modelo reducido guardado en m2. Es decir,
# llevaremos a cabo una prueba de hipótesis general de

#H0: beta3 = beta5 = beta6 = beta7 = 0

#es decir Y = beta0 + beta1Food + beta2Decor + beta4*East + e (Reducido)

#contra

#Halternativa: H0 no es verdad

#es decir, Y = beta0 + beta1Food + beta2Decor + beta3Service + beta4East + beta5FoodEast + beta6DecorEast + beta7ServiceEast + e (Completo)

#La prueba de si el efecto de los predictores depende de la variable dummy East puede lograrse usando la siguiente prueba-F parcial.
anova(m3,m1)
