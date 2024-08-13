"""algorithm one"""

def minOperations(n):

    if (n < 2):
        return 0
    
    factor = 2

    while n % factor != 0:
        factor += 1

    return factor + minOperations(n // factor)