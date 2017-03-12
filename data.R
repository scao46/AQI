library(readr)

AQIdata = list()
for(i in 1:(length(list.files())-1)){
  name = list.files()[i]
  rawDat = read_csv(name, col_names = F)
  rawDat = t(rawDat[1:2,])
  rawDat = rawDat[-(1:3), ]
  rawDat = data.frame(city = rawDat[,1], AQI = rawDat[,2])
  rownames(rawDat) = NULL
  newName = paste0("./new/new_", name)
  write.csv(rawDat, file= newName , row.names = F, fileEncoding='utf-8')
}


Beijing = c()
Shanghai = c()
Guangzhou = c()
Chengdu = c()
Harbin = c()
Xian = c()
Urumqi = c()
date = c()
count = 1
for(i in 1:length(list.files(pattern = ".*.csv"))){
  name = list.files(pattern = ".*.csv")[i]
  rawDat = read_csv(name, col_names = T, locale = locale(encoding = 'utf-8'))
  dateI = gsub("\\D*(\\d{4})(\\d{2})(\\d{2}).csv", replacement = "\\1-\\2-\\3", x = name)
  date[count] = dateI
  Beijing[count] = rawDat$北京[1]
  Shanghai[count] = rawDat$上海[1]
  Guangzhou[count] = rawDat$广州[1]
  Chengdu[count] = rawDat$成都[1]
  Harbin[count] = rawDat$哈尔滨[1]
  Xian[count] = rawDat$西安[1]
  Urumqi[count] = rawDat$乌鲁木齐[1]
  count = count + 1
}
BeijingData = data.frame(date = date, AQI = Beijing)
ShanghaiData = data.frame(date = date, AQI = Shanghai)
GuangzhouData = data.frame(date = date, AQI = Guangzhou)
ChengduData = data.frame(date = date, AQI = Chengdu)
HarbinData = data.frame(date = date, AQI = Harbin)
XianData = data.frame(date = date, AQI = Xian)
UrumqiData = data.frame(date = date, AQI = Urumqi)
write.csv(BeijingData, file = "./new/city/Beijing.csv", row.names = F)
write.csv(ShanghaiData, file = "./new/city/Shanghai.csv", row.names = F)
write.csv(GuangzhouData, file = "./new/city/Guangzhou.csv", row.names = F)
write.csv(ChengduData, file = "./new/city/Chengdu.csv", row.names = F)
write.csv(HarbinData, file = "./new/city/Harbin.csv", row.names = F)
write.csv(XianData, file = "./new/city/Xian.csv", row.names = F)
write.csv(UrumqiData, file = "./new/city/Urumqi.csv", row.names = F)





