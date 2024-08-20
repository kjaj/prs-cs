rm(list=ls())
args<-commandArgs(TRUE)
require(data.table)
trait<-args[1]

genotypes<-fread(paste0(trait,".sscore"))

genotypes_scaled<-data.frame(genotypes[,2],

(apply(genotypes[,6],2, scale))

) # ID col 2, PRS col 6

colnames(genotypes_scaled)<-c("IID","PRS_SUM_SCALED")
require(plyr)

dat<-data.frame(join(genotypes,genotypes_scaled,by="IID"))

write.table(dat, file=paste0("./final_scores/",trait,".sscore.scaled"), col.names=T, row.names=F,quote=F)
