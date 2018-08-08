import sys

tiny_w = [84, 48, 68, 10, 18, 98, 12, 23, 54, 57, 48, 33, 16, 77, 11, 29]
sorted_tiny_w = sorted(tiny_w)

def binary_search(number, sorted_arr, start, end):
    """ Performs binary search given: a number to find, the array to find it in,
        the start index, and the end index. 
        Takes an argument at the command line - the number to find.
        Usage: $ python3 binary_search.py 12
    """
    length = 1 + end - start

    #-- Get beginning and end
    low = sorted_arr[start]
    high = sorted_arr[end]

    #-- Try the middle
    #   For even numbers, it will be 1 above the middle
    #   For odd numbers, it will be exactly the middle number
    #   In either case, the algorithm will go down to between 2 numbers, and
    #   it will do the right thing. The midpoint between 2 numbers becomes the
    #   2nd (higher) number, and the next iteration dwindles down to the last
    #   lower number.
    midpoint = start + int(length/2) #-- this basically floors the number
    middle = sorted_arr[midpoint]

    #-- Termination conditions
    if number == middle:
        return midpoint
    if number < low or number > high or start == end:
        return -1
    
    if number > sorted_arr[midpoint]:
        return binary_search(number, sorted_arr, midpoint+1, end)
    if number < sorted_arr[midpoint]:
        return binary_search(number, sorted_arr, start, midpoint-1)

print(sys.argv)
print(sorted_tiny_w)
print("Starting binary search...")
number = int(sys.argv[1])
result = binary_search(number, sorted_tiny_w, 0, len(sorted_tiny_w) - 1)
if result == -1:
    print(f"{number} was not found in the array.")
else:
    print(f"Found {number}!")

