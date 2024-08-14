from typing import List

def getPrimeNumbers(n: int) -> List[int]:
    """
    get a list of integers which are prime numbers
    between 1 and n
    """
    prime_nums = [] # for collecting the prime numbers

    # loop through the numbers from 2 to the 1 less n
    for i in range(2, n):
        # check if the number is a prime number
        if is_prime(i):
            # append to the list if it is a prime number
            prime_nums.append(i)

    # return the final list of prime numbers
    return prime_nums


def is_prime(i: int) -> bool:
    """
    check if there is a valid divisor for i apart from
    1 and i
    """

    # cater for 1 and 2 because they are special
    if i == 1:
        return False
    
    if i == 2:
        return True
    
    # loop from 2 to 1 less i
    for x in range(2, i):
        if i % x == 0:
            return False

    return True


def writeToFile(filename: str, content: list) -> None:
    """
    convert the list into a string joined with ', ' and
    write to a file indentified by the filename
    """
    # open the file for writing
    with open(filename, 'w') as file:
        # convert list to string and write to file
        file.write(", ".join(map(str, content)))

# get number from user
number = int(input("What number am I working with? "))

# get the prime numbers based on the provided number
prime_numbers = getPrimeNumbers(number)

# get name of file into which to write the prime numbers
filename = str(input("In which file should a store the prime numbers? "))

# write prime numbers into file
writeToFile(filename, prime_numbers)