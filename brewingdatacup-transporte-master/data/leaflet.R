library(leaflet)

#addProviderTiles(providers$CartoDB.Positron)
#addProviderTiles(providers$Stamen.Toner)
#addProviderTiles(providers$Esri.NatGeoWorldMap)
#addTile

m <- leaflet() %>%
  addProviderTiles(providers$Esri.NatGeoWorldMap) %>%  # Add default OpenStreetMap map tiles
  addMarkers(lng=-103.376681, lat=20.663069, popup="Cerveceria Modelo Guadalajara")
m

m <- leaflet() %>% setView(lng = -71.0589, lat = 42.3601, zoom = 12)
m %>% addTiles()
m %>% addProviderTiles(providers$Stamen.Toner)


library(maps)
mapStates = map("state", fill = TRUE, plot = FALSE)
leaflet(data = mapStates) %>% addTiles() %>%
  addPolygons(fillColor = topo.colors(10, alpha = NULL), stroke = FALSE)

leaflet() %>% addTiles() %>% setView(-93.65, 42.0285, zoom = 4) %>%
  addWMSTiles(
    "http://mesonet.agron.iastate.edu/cgi-bin/wms/nexrad/n0r.cgi",
    layers = "nexrad-n0r-900913",
    options = WMSTileOptions(format = "image/png", transparent = TRUE),
    attribution = "Weather data © 2012 IEM Nexrad"
  )

m %>% addProviderTiles(providers$MtbMap) %>%
  addProviderTiles(providers$Stamen.TonerLines,
                   options = providerTileOptions(opacity = 0.35)) %>%
  addProviderTiles(providers$Stamen.TonerLabels)

cordenadas <- read.csv("TransportChallenge-Coordenadas.csv")
head(cordenadas,10)

origen.cordenadas <- cordenadas[1:7,]
head(origen.cordenadas,7)

destino.cordenadas <- cordenadas[-c(1:7),]
head(destino.cordenadas)

leaflet(data = origen.cordenadas) %>% addTiles() %>%
  addMarkers(~Longitud, ~Latitud, popup = ~as.character(Lugar), label = ~as.character(Lugar))

greenLeafIcon <- makeIcon(
  iconUrl = "http://leafletjs.com/examples/custom-icons/leaf-green.png",
  iconWidth = 38, iconHeight = 95,
  iconAnchorX = 22, iconAnchorY = 94,
  shadowUrl = "http://leafletjs.com/examples/custom-icons/leaf-shadow.png",
  shadowWidth = 50, shadowHeight = 64,
  shadowAnchorX = 4, shadowAnchorY = 62
)

leaflet(data = origen.cordenadas) %>% addTiles() %>%
  addMarkers(~Longitud, ~Latitud, popup = ~as.character(Lugar), label = ~as.character(Lugar), 
             icon = greenLeafIcon)

quakes1<-origen.cordenadas

leafIcons <- icons(
  iconUrl = ifelse(quakes1$mag < 4.6,
                   "http://leafletjs.com/examples/custom-icons/leaf-green.png",
                   "http://leafletjs.com/examples/custom-icons/leaf-red.png"
  ),
  iconWidth = 38, iconHeight = 95,
  iconAnchorX = 22, iconAnchorY = 94,
  shadowUrl = "http://leafletjs.com/examples/custom-icons/leaf-shadow.png",
  shadowWidth = 50, shadowHeight = 64,
  shadowAnchorX = 4, shadowAnchorY = 62
)

leaflet(data = origen.cordenadas) %>% addTiles() %>%
  addMarkers(~Longitud, ~Latitud, popup = ~as.character(Lugar), label = ~as.character(Lugar), 
             icon = leafIcons)





states <- geojsonio::geojson_read("json/us-states.geojson", what = "sp")

bins <- c(0, 10, 20, 50, 100, 200, 500, 1000, Inf)
pal <- colorBin("YlOrRd", domain = states$density, bins = bins)

labels <- sprintf(
  "<strong>%s</strong><br/>%g people / mi<sup>2</sup>",
  states$name, states$density
) %>% lapply(htmltools::HTML)

leaflet(states) %>%
  setView(-96, 37.8, 4) %>%
  addProviderTiles("MapBox", options = providerTileOptions(
    id = "mapbox.light",
    accessToken = Sys.getenv('MAPBOX_ACCESS_TOKEN'))) %>%
  addPolygons(
    fillColor = ~pal(density),
    weight = 2,
    opacity = 1,
    color = "white",
    dashArray = "3",
    fillOpacity = 0.7,
    highlight = highlightOptions(
      weight = 5,
      color = "#666",
      dashArray = "",
      fillOpacity = 0.7,
      bringToFront = TRUE),
    label = labels,
    labelOptions = labelOptions(
      style = list("font-weight" = "normal", padding = "3px 8px"),
      textsize = "15px",
      direction = "auto")) %>%
  addLegend(pal = pal, values = ~density, opacity = 0.7, title = NULL,
            position = "bottomright")

m <- leaflet() %>% addTiles()

m %>%
  # Central Park
  fitBounds(-73.9, 40.75, -73.95,40.8) %>%
  addMeasure()

m %>%
  # Berlin, Germany
  fitBounds(13.76134, 52.675499, 13.0884, 52.33812) %>%
  addMeasure(
    position = "bottomleft",
    primaryLengthUnit = "meters",
    primaryAreaUnit = "sqmeters",
    activeColor = "#3D535D",
    completedColor = "#7D4479")
