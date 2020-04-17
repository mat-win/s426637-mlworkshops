#!/usr/bin/env python
import matplotlib.pyplot as plt
import sys

def read_f(filename):
    values = []
	with open(filename) as f_name:
	    for line in f_name:
		values.append(float(line.rstrip('\n')))
	return values

def main():
    in_f = sys.argv[1]
    out_f = sys.argv[2]

    values = read_f(in_f)
    plt.plot(values)
	
    plt.xlabel('run')

    y_name = in_f.split('.')[0]
    plt.ylabel(y_name)
	
    plt.savefig(out_f, dpi=300)
    plt.close()

if __name__ == "__main__":
    main()
	




