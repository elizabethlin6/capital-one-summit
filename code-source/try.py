import matplotlib.pyplot as plt
from mpl_toolkits.basemap import Basemap
import pandas as pd
import io

u = u"""latitude,longitude
    34.0455399,-118.25667
    34.0566101,-118.23721
    34.0460701,-118.23309
    34.0468216,-118.24835
    34.0484009,-118.26095
    34.0484009,-118.26095
    34.0484009,-118.26095
    34.0420609,-118.26338
    34.0468216,-118.24835
    34.0605583,-118.23833
    34.0455399,-118.25667
    34.0498886,-118.25588
    34.0499802,-118.24716
    34.0441704,-118.26117
    34.0499802,-118.24716
    34.0441704,-118.26117
    34.048851,-118.24642
    34.0460701,-118.23309"""



# read in data to use for plotted points
buildingdf = pd.read_csv(io.StringIO(u), delimiter=",")
lat = buildingdf['latitude'].values
lon = buildingdf['longitude'].values

# determine range to print based on min, max lat and lon of the data
margin = 2 # buffer to add to the range
lat_min = min(lat) - margin
lat_max = max(lat) + margin
lon_min = min(lon) - margin
lon_max = max(lon) + margin

# create map using BASEMAP
m = Basemap(llcrnrlon=lon_min,
            llcrnrlat=lat_min,
            urcrnrlon=lon_max,
            urcrnrlat=lat_max,
            lat_0=(lat_max - lat_min)/2,
            lon_0=(lon_max-lon_min)/2,
            projection='merc',
            resolution = 'h',
            area_thresh=10000.,
            )
m.drawcoastlines()
m.drawcountries()
m.drawstates()
m.drawmapboundary(fill_color='black')
m.fillcontinents(color = 'white',lake_color='#46bcec')
# convert lat and lon to map projection coordinates
lons, lats = m(lon, lat)
# plot points as red dots
m.scatter(lons, lats, marker = 'o', color='r', zorder=5)
plt.show()
