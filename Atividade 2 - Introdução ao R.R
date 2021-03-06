#ATIVIDADE 2
#NAT�LIA DE ANDRADE GUARNIERI
#NAT�LIA MESQUITA

'''Criar estat�stica descritiva do exemplo de dados do ENEM 2017 usando 
os pacotes dplyr e data.table. Estabele�am os fatores de interesse e obtenham 
os resumos dos dados'''

#INSTALANDO OS PACOTES QUE IREMOS UTILIZAR NA AN�LISE.
install.packages("data.table")
install.packages("dplyr")

require(data.table)
require(dplyr)

#IMPORTANDO A TABELA FULL COM OS DADOS DO ENEM 2017.
library(readr)
tb.enem.full <- read_csv("C:/Users/Natalia/Desktop/DATA SCIENTIST SPECIALIST/Introdu��o ao R/Aula 3 e 4/2017.csv")

#CRIANDO UMA TABELA SEGUND�RIA COM AS VARI�VEIS QUE SER�O UTILIZADAS PARA REALIZAR O ESTUDO.
tb.enem.cn <- data.frame(cod.prova.cn = tb.enem.full$CO_PROVA_CN,
                      nota.prova.cn = tb.enem.full$NU_NOTA_CN)
                      
tb.enem.ch <- data.frame(cod.prova.ch = tb.enem.full$CO_PROVA_CH,
                         nota.prova.ch = tb.enem.full$NU_NOTA_CH)
                         
tb.enem.lc <- data.frame(cod.prova.lc = tb.enem.full$CO_PROVA_LC,
                         nota.prova.lc = tb.enem.full$NU_NOTA_LC)
                         
tb.enem.mt <- data.frame(cod.prova.mt = tb.enem.full$CO_PROVA_MT,
                         nota.prova.mt = tb.enem.full$NU_NOTA_MT)
                 
#CRIANDO OS AGRUPAMENTOS DAS PROVAS E A M�DIA DAS NOTAS
nota.cn = aggregate(tb.enem.cn$nota.prova.cn, list(tb.enem.cn$cod.prova.cn), mean)
nota.ch = aggregate(tb.enem.ch$nota.prova.ch, list(tb.enem.ch$cod.prova.ch), mean)
nota.lc = aggregate(tb.enem.lc$nota.prova.lc, list(tb.enem.lc$cod.prova.lc), mean)
nota.mt = aggregate(tb.enem.mt$nota.prova.mt, list(tb.enem.mt$cod.prova.mt), mean)

#CRIANDO UMA TABELA SEGUND�RIA COM OS VALORES GERADOS
tb.enem.f <- data.frame(cod.prova.cn = nota.cn$Group.1,
                        med.nota.cn = nota.cn$x,
                        med.total.cn = mean(nota.cn$x),
                        cod.prova.ch = nota.ch$Group.1,
                        med.nota.ch = nota.ch$x,
                        med.total.ch = mean(nota.ch$x),
                        cod.prova.lc = nota.lc$Group.1,
                        med.nota.lc = nota.lc$x,
                        med.total.lc = mean(nota.lc$x),
                        cod.prova.mt = nota.mt$Group.1,
                        med.nota.mt = nota.mt$x,
                        med.total.mt = mean(nota.mt$x))
                        
#VERIFICANDO QUAIS PROVAS TIVERAM A M�DIA DA NOTA MAIOR QUE A M�DIA TOTAL DA MAT�RIA
analise.cn <- ifelse(tb.enem.f$med.nota.cn>=tb.enem.f$med.total.cn,"Maior que a m�dia","Menor que a m�dia")
analise.ch <- ifelse(tb.enem.f$med.nota.ch>=tb.enem.f$med.total.ch,"Maior que a m�dia","Menor que a m�dia")
analise.lc <- ifelse(tb.enem.f$med.nota.lc>=tb.enem.f$med.total.lc,"Maior que a m�dia","Menor que a m�dia")
analise.mt <- ifelse(tb.enem.f$med.nota.mt>=tb.enem.f$med.total.mt,"Maior que a m�dia","Menor que a m�dia")

#TABELA FINAL COM AS AN�LISES
tb.enem.f <- data.frame(cod.prova.cn = nota.cn$Group.1,
                        med.nota.cn = nota.cn$x,
                        med.total.cn = nota.cn$med.total.cn,
                        analise.cn = analise.cn,
                        cod.prova.ch = nota.ch$Group.1,
                        med.nota.ch = nota.ch$x,
                        med.total.ch = nota.ch$med.total.ch,
                        analise.ch = analise.ch,
                        cod.prova.lc = nota.lc$Group.1,
                        med.nota.lc = nota.lc$x,
                        med.total.lc = nota.lc$med.total.lc,
                        analise.lc = analise.lc,
                        cod.prova.mt = nota.mt$Group.1,
                        med.nota.mt = nota.mt$x,
                        med.total.mt = nota.mt$med.total.mt,
                        analise.mt = analise.mt)

View(tb.enem.f)

