#1976
library(leaflet)

data	<- read.csv("1976.csv", header = TRUE)
View(data)

#A=RED B=BLUE C=GREEN  D = Black
map_pal = colorFactor(c("Red","Blue","Green","Black"),domain = data$rank)

map	<- leaflet(data)	%>%	
  addTiles	()	%>%	
  setView(126.97840315634821, 37.567112476046894,	zoom = 11)	%>%
  addCircleMarkers(data =data, lng	 =	data$lon,	 lat	 =	data$lat,	color = ~map_pal(data$rank)
                   , weight	 =	 1,	radius	 =	 ~sqrt(data$seats) * 0.5, popup = data$cinema)

map