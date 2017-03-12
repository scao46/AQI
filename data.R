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


# The following data is from http://data.stats.gov.cn/
city = c("Beijing", "Shanghai", "Guangzhou", "Chengdu", "Harbin", "Xian", "Urumqi")
population = c(21.7050, 24.1527, 13.5011, 14.4280, 10.6515, 8.7056, 3.5500)
salary = c(113073, 109279, 81171, 69123, 58405, 63193, 67617)
GDP = c(2301.459, 2512.345, 1810.041, 1080.116, 575.121, 580.120, 263.164)
Hospital = c(701, 644, 259, 768, 462, 395, 175)
RealEstate = c(22300, 21501, 14083, 6584, 6124, 6221, 6142)
moreData = data.frame(city = city, population = population, salary = salary, 
                      GDP = GDP, Hospital = Hospital, RealEstate = RealEstate)
write.csv(moreData, file = "./new/city/moreData.csv", row.names = F)


