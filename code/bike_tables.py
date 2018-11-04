import csv

def extract_data(filename):
    filecsv = open(filename)               # Reads in CSV file
    input_file = csv.DictReader(filecsv)   # creates a dictionary for each row
    bike_list = []
    for line in input_file:
        bike_list.append(line)
    return bike_list

def filter(list_of_odict):
    filtered = []
    for one_odict in list_of_odict:
        route = ((one_odict['start'], one_odict['end']), one_odict['Freq'])
        filtered.append(route)
    return sorted(filtered, key=lambda route: int(route[1]))[-25:-1]

def final_product(output):
    file.write('route, counts')
    for thing in output:
        file.write(str(thing))
        file.write("\n")
    return None

if __name__ == "__main__":
    my_data = extract_data("bike_table.csv")
#    print(my_data)
    out_routes = filter(my_data)
    
    file = open('pop_route.csv', 'w')
    final_product(out_routes)
    file.close()
