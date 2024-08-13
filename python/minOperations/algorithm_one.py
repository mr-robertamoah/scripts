"""algorithm one"""

def minOperations(n):
    if n < 2:
        return 0
    
    operations = 0
    factor = 2

    while factor < n:
        ops = n
        if n % factor == 0:
            otherFactor = n // factor
            ops = factor + otherFactor

        if operations == 0 or ops < operations:
            operations = ops

        factor += 1

    return operations