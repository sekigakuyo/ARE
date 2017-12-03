source("bootstrip.R")
library(ggplot2)

data12 = t(data.frame(prb_data[[12]]))
data11 = t(data.frame(prb_data[[11]]))
data10 = t(data.frame(prb_data[[10]]))
data09 = t(data.frame(prb_data[[9]]))

name = c("lwr","mdl","upr")
colnames(data09) = name
colnames(data10) = name
colnames(data11) = name
colnames(data12) = name

writing = function(data,lim = c(0,max(data)),tit=""){
  data = transform(data,X=1:N_sec)
  gp = ggplot(data=data,aes(x=X,y=mdl,ymin=lwr,ymax=upr))
  gp = gp + geom_line()
  gp = gp + geom_ribbon(alpha=1/6)
  gp = gp + theme_bw()
  gp = gp + coord_cartesian(xlim=c(1,N_sec),ylim=lim)
  gp = gp + labs(x="セクション数",y="種数",title=tit)
  gp = gp + theme(plot.title = element_text(hjust=0.5))  
  return(gp)
}


test10 = writing(data10,c(0,40),"No.10")
test11 = writing(data11,c(0,40),"No.11")

test09 = writing(data09,c(0,40),"No.09")
test12 = writing(data12,c(0,40),"No.12")

ggsave("curve09.png",plot=test09)
ggsave("curve10.png",plot=test10)
ggsave("curve11.png",plot=test11)
ggsave("curve12.png",plot=test12)
