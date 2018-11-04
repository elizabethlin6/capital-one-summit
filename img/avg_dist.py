from math import sin, cos, sqrt, atan2, radians
import csv
import json
import requests

import ast

def extract_data(filename):
    filecsv = open(filename)               # Reads in CSV file
    input_file = csv.DictReader(filecsv)   # creates a dictionary for each row
    bike_list = []
    for line in input_file:
        bike_list.append(line)
    return bike_list

def get_distance(list_of_dict):
    all_ride_dist = []
    num = 0
    for ride in list_of_dict:
        
        start_data = ride['Starting Lat-Long']
        end_data = ride['Ending Lat-Long']
        
        end_data = end_data.replace("\'", "\"")
        start_data = start_data.replace("\'", "\"")
        
        start_data = ast.literal_eval(start_data)
        end_data = ast.literal_eval(end_data)
        
        lat1 = float(start_data['latitude'])
        lon1 = float(start_data['longitude'])

        lat2 = float(end_data['latitude'])
        lon2 = float(end_data['longitude'])
        
        dlon = lon2 - lon1
        dlat = lat2 - lat1

        R = 6373.0      # approximate radius of earth in km

        temp = (
        sin(dlat / 2) ** 2
        + cos(lat1)
        * cos(lat2)
        * sin(dlon / 2) ** 2
        )
        
        dist = R * (2 * atan2(sqrt(temp), sqrt(1 - temp)))

        all_ride_dist.append(dist)

    return all_ride_dist

#OrderedDict([('Trip ID', '1912818'),
#             ('Duration', '180'),
#             ('Start Time', '2016-07-07T04:17:00'),
#             ('End Time', '2016-07-07T04:20:00'),
#             ('Starting Station ID', '3014'),
#             ('Starting Station Latitude', '34.0566101'),
#             ('Starting Station Longitude', '-118.23721'),
#             ('Ending Station ID', '3014'),
#             ('Ending Station Latitude', '34.0566101'),
#             ('Ending Station Longitude', '-118.23721'),
#             ('Bike ID', '6281'),
#             ('Plan Duration', '30'),
#             ('Trip Route Category', 'Round Trip'),
#             ('Passholder Type', 'Monthly Pass'),
#             ('Starting Lat-Long', "{'longitude': '-118.23721', 'latitude': '34.0566101', 'needs_recoding': False}"),
#             ('Ending Lat-Long', "{'longitude': '-118.23721', 'latitude': '34.0566101', 'needs_recoding': False}")])

def avg_dist(list_of_dist):
    denominator = len(list_of_dist)
    dist_val = 0
    for single_dist in list_of_dist:
        dist_val += single_dist
    return dist_val / denominator

if __name__ == "__main__":
    val = extract_data('metro.csv')
    my_dict = val[0]
#    print(my_dict['Starting Lat-Long'])
    all_dist = get_distance(val)
    print(all_dist)
    print(avg_dist(all_dist)) # 72.89085777475434

# The Average Distance Traveled is 72.89085777475434
l
