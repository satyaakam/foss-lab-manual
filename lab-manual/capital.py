import sys
import random

def open_capitals():
    try:
        # Throws IOError, if open fails.
        return open("capitals.txt")
    except IOError as e:
        print "error opening capitals.txt: %s" % e.strerror
        sys.exit(1)

def parse_capitals(cfile):
    capitals = {}
    for i, line in enumerate(cfile):
        try:
            # Throws ValueError, if no. of elements in LHS and RHS
            # does not match.
            country, capital = line.split(":")
            country = country.strip()
            capital = capital.strip()
            capitals[country] = capital
        except ValueError:
            print "error parsing line %d" % (i+1)
            sys.exit(1)

    return capitals

def quiz():
    cfile = open_capitals()
    capitals = parse_capitals(cfile)
    country_list = capitals.keys()

    while len(country_list) > 0:
        country = random.choice(country_list)
        capital = capitals[country]
        country_list.remove(country)
        
        user_input = raw_input("%s ? " % country)
        if user_input.upper() != capital.upper():
            print "Wrong, the answer is '%s'." % capital

if __name__ == "__main__":
    quiz()
