remotes::install_github("luukvdmeer/sfnetworks")

library(dplyr)
library(sf)
milan_car_crashes <- data.frame(
  ID = 1:5,
  X = c(1513037, 1513008, 1515473, 1514039, 1515748),
  Y = c(5034945, 5034750, 5036177, 5036820, 5037396)
) %>%
  # Transform as sf and set the CRS (Gauss-Boaga)
  st_as_sf(coords = c("X", "Y"), 
           crs = "+proj=tmerc +lat_0=0 +lon_0=9 +k=0.9996 +x_0=1500000 +y_0=0 +ellps=intl +units=m +no_defs")
milan_car_crashes


##osrmTable
library(osrm)

data("berlin")
distA <- osrmTable(loc = apotheke.sf[1:5,])
distA

##osrmRoute
library(sf)
library(maptiles)

# Route
route <- osrmRoute(src = apotheke.sf[74,], dst = apotheke.sf[55,],
                   overview = "full", returnclass = "sf")
# Display
osm <- get_tiles(x = route, crop = TRUE, zoom = 13)
png("img/route.png", width = 693, height = 263)
par(mar = c(0,0,0,0))
plot_tiles(osm)
plot(st_geometry(route), lwd = 4, add = TRUE)
plot(st_geometry(route), lwd = 1, col = "white", add = TRUE)
plot(st_geometry(apotheke.sf[c(74,55),]), pch = 20, col = "red", add = TRUE)
mtext(get_credit("OpenStreetMap"), side = 1, line = -1, cex = .9, adj = .99)
dev.off()

# Travel path between points
route1 <- osrmRoute(src = apotheke.sf[1, ], dst = apotheke.df[16, ],
                    returnclass="sf")
# Travel path between points excluding motorways
route2 <- osrmRoute(src = apotheke.sf[1, ], dst = apotheke.df[16, ],
                    returnclass="sf", exclude = "motorway")
# Display paths
plot(st_geometry(route1))
plot(st_geometry(route2), col = "red", add = TRUE)
plot(st_geometry(apotheke.sf[c(1,16),]), col = "red", pch = 20, add = TRUE)

# Return only duration and distance
route3 <- osrmRoute(src = apotheke.sf[1, ], dst = apotheke.df[16, ],
                    overview = FALSE)
route3

# Using only coordinates
route4 <- osrmRoute(src = c(13.412, 52.502),
                    dst = c(13.454, 52.592),
                    returnclass = "sf")

plot(st_geometry(route4))

# Using via points
pts <- structure(
  list(x = c(13.32500, 13.30688, 13.30519, 13.31025,
             13.4721, 13.56651, 13.55303, 13.37263, 13.50919, 13.5682),
       y = c(52.40566, 52.44491, 52.52084, 52.59318, 52.61063, 52.55317,
             52.50186, 52.49468, 52.46441, 52.39669)),
  class = "data.frame", row.names = c(NA, -10L))
route5 <- osrmRoute(loc = pts, returnclass = "sf")
plot(st_geometry(route5), col = "red", lwd = 2)
points(pts, pch = 20, cex = 2)

# Using a different routing server
u <- "https://routing.openstreetmap.de/routed-foot/"
route5 <- osrmRoute(apotheke.sf[1, ], apotheke.df[16, ], returnclass="sf",
                    osrm.server = u)

# Using an open routing service with support for multiple modes
# see https://github.com/rCarto/osrm/issues/67
u <- "https://routing.openstreetmap.de/"
options(osrm.server = u)
route6 <- osrmRoute(apotheke.sf[1, ], apotheke.df[16, ], returnclass="sf",
                    osrm.profile = "bike")
route7 <- osrmRoute(apotheke.sf[1, ], apotheke.df[16, ], returnclass="sf",
                    osrm.profile = "car")
plot(st_geometry(route5), col = "green")
plot(st_geometry(route6), add = TRUE) # note the cycle route has fewer turns
plot(st_geometry(route7), col = "red", add = TRUE) # car route, indirect = good!

#osrmTrip
# Trip 
trips <- osrmTrip(loc = apotheke.sf[10:20,], returnclass="sf")
trip <- trips[[1]]$trip
trip
# Display
osm2 <- get_tiles(x = trip, crop = TRUE, zoom = 11)
png("img/trip.png", width = 499, height = 420)
par(mar = c(0,0,0,0))
plot_tiles(osm2)
plot(st_geometry(trip), col = "black", lwd = 4, add = TRUE )
plot(st_geometry(trip), col = c("red", "white"), lwd = 1, add=TRUE)
plot(st_geometry(apotheke.sf[10:20,]), pch = 21, bg = "red", cex = 1.5, add=TRUE)
mtext(get_credit("OpenStreetMap"), side = 1, line = -1, cex = .9, adj = .99)
dev.off()

#osrmIsochrone
iso <- osrmIsochrone(loc = apotheke.sf[87,], returnclass="sf",
                     breaks = seq(from = 0, to = 14, by = 2), res = 70)
osm3 <- get_tiles(x = iso, crop = TRUE, zoom = 12)
bks <- sort(c(unique(iso$min), max(iso$max)))

library(cartography)
cols <- paste0(carto.pal("turquoise.pal", n1 = length(bks)-1), 'BF')
png("img/iso.png", width = 604, height = 595)
par(mar = c(0,0,0,0))
plot_tiles(osm3)
choroLayer(x = iso, var = "center", breaks = bks,
           border = NA, col = cols,
           legend.pos = "topleft",legend.frame = TRUE,
           legend.title.txt = "Isochrones\n(min)",
           legend.title.cex = 1, legend.values.cex = .8,
           add = TRUE)
plot(st_geometry(apotheke.sf[87,]), pch = 21, bg = "red", 
     cex = 1.5, add=TRUE)
mtext(get_credit("OpenStreetMap"), side = 1, line = -1, cex = .9, adj = .99)
dev.off()


###Pruebas 

library(dplyr)

origen <- filter(origen.cordenadas, Lugar == "1000008000")
origen
destino <- filter(destino.cordenadas, Lugar == "2270201012")
destino

a <- c(origen[,3],origen[,2])
b <- c(destino[,3],destino[,2])

r<-osrmRoute(src = a,
             dst = b,
             returnclass = "sf", overview = "full",
             osrm.profile = "car")
r

plot(st_geometry(r))
plot(st_geometry(r), col = "red", add = TRUE)


#make a string to nicely label the route
s <- r$duration
kms <- r$distance
routelabel <- paste0(s%/%60, "m ", s%%60, "s , ", kms, "kms")
path <- decode(r$geometry, multiplier=1e5)

library(leaflet)

m <- leaflet(width="100%") %>% 
  addTiles()  %>% 
  addPolylines(data=r$geometry, popup=routelabel, color = "#000000", opacity=1, weight = 3) %>%
  addMarkers(lng=origen[,3], lat=origen[,2], popup = origen[1]) %>%
  addMarkers(lng=destino[,3], lat=destino[,2], popup = destino[1])
m
