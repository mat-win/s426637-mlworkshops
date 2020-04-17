#!/usr/bin/env python
import matplotlib.pyplot as plt
import sys


def read_file(filename):
    values = []
    with open(filename) as f:
        for line in f:
            values.append(float(line.rstrip('\n')))
    return values


def main():
    input_file = sys.argv[1]
    output_file = sys.argv[2]

    values = read_file(input_file)

    plt.plot(values)

    plt.xlabel('run')

    ylabel_name = input_file.split('.')[0]
    plt.ylabel(ylabel_name)


    plt.savefig(output_file, dpi=800)
    plt.close()


if __name__ == "__main__":
    main()
