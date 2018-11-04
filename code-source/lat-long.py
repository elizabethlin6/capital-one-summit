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
        coord_one = (str(lat1) + "," + str(lon1))
        coord_two = (str(lat2) + "," + str(lon2))
        coord_tuple = (coord_one, coord_two)
        all_ride_dist.append(coord_tuple)
    return all_ride_dist


def final_product(output): # Parameters: Input = list of dictionaries // Output = Python output into file (None)
    for dict in output:
        file.write(str(dict))
        file.write("\n")
    return None

if __name__ == "__main__":
    val = extract_data('metro.csv')
    my_dict = val[0]
    #    print(my_dict['Starting Lat-Long'])
    all_dist = get_distance(val)

    file = open('all_dist.txt', 'w')
    
    final_product(all_dist)
    
    file.close()

