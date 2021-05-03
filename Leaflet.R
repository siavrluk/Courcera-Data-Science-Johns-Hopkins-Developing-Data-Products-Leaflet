library(tidyr)
library(leaflet)

atp_data <- read.csv("ATP Tournaments.csv")
colnames(atp_data) <- c('Event', 'Venue', 'Latitude', 'Longitude', 'Surface', 'Champion', 
                      'Prize', 'Category')
head(atp_data)

icon_list <- iconList(AO = makeIcon('Logos/Australian_Open_Logo_2017.svg', iconWidth = 18, iconHeight = 18),
                      RG = makeIcon('Logos/Logo_Roland-Garros.svg', iconWidth = 25, iconHeight = 25),
                      W = makeIcon('Logos/Wimbledon.svg', iconWidth = 20, iconHeight = 20),
                      US = makeIcon('Logos/Usopen-header-logo.svg', iconWidth = 48, iconHeight = 48),
                      Finals = makeIcon('Logos/Nitto_ATP_Finals_logo.jpg', iconWidth = 20, iconHeight = 20),
                      Masters = makeIcon('Logos/atp-masters-1000.jpg', iconWidth = 18, iconHeight = 18),
                      '500' = makeIcon('Logos/atp-masters-500.jpg', iconWidth = 18, iconHeight = 18)
                      )


my_map <- atp_data %>% 
            leaflet() %>%
            addTiles() %>%
            addMarkers(~Longitude, ~Latitude, icon = ~icon_list[Category],
                       popup = paste("<b> Venue: </b>", atp_data$Venue, "<br>",
                                     "<b> Surface: </b>", atp_data$Surface, "<br>",
                                     "<b> Current champion: </b>", atp_data$Champion, "<br>",
                                     "<b> Prize money: </b>", atp_data$Prize),
                       clusterOptions = markerClusterOptions())
            
my_map

