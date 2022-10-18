#!/usr/bin/python3

class HappyNumber:

    def __init__(s):
        s.used_numbers = []

    def add(s, number):
        if number in s.used_numbers:
            print( f'{number}  already used' )
        else:
            if number in range(1,101):
                s.used_numbers.append(number)
                print( f'{number}   added' )
            else:
                print("only numbers in range(1, 100)")

    def clear(s):
        s.used_numbers.clear()
        print( 'notes empty' )

    def remove(s, number):
        if number in s.used_numbers:
            s.used_numbers.remove(number)
            print( f'{number}   removed' )

    def exclude(s, numbers_list):
        if len( numbers_list ) > 0:
            for number in numbers_list:
                s.remove( int( number ) )

    def extend(s, numbers_list):
        if len( numbers_list ) > 0:
            for number in numbers_list:
                s.add( int( number ) )

    # 1 - 100
    def show(s):
        print()
        for y in range(0,10):
            line = []
            for x in range(1,11):
                num = y * 10 + x
                if num in s.used_numbers:
                    line.append( "%02s" % num )
                else:
                    line.append("  ")
            print( " ".join(line) )
        print()

    def load(s):
        try:
            with open( 'happy number backup.txt' ) as f:
                s.used_numbers = list( map( int, f.read().split() ) )
            print( 'loading...' )
        except IOError: 
            print( "Error: File not found." )

    def save(s):
        s.used_numbers.sort()
        fh = open( 'happy number backup.txt', 'w' )
        for number in s.used_numbers:
            fh.write( '%s ' % number )
        fh.close()
        print( 'saving...' )

    def help(s):

        print()
        print("add   remove   load   save   print   clear   help")
        print("a     r        l      s      p       c       h")
        print()

def main():

    happy_number = HappyNumber()
    happy_number.help()

    while True:
        res = input("> happy number | h help > ").split()
        cmd = res[0]

        if len( res ) > 1:
            if cmd.startswith('a'):
                happy_number.extend( res[1:] )
            elif cmd.startswith('r'):
                happy_number.exclude( res[1:] )
        else:
            if cmd.startswith('l'):
                happy_number.load()
            elif cmd.startswith('s'):
                happy_number.save()
            elif cmd.startswith('p'):
                happy_number.show()
            elif cmd.startswith('c'):
                happy_number.clear()
            elif cmd.startswith('h'):
                happy_number.help()

if __name__ == "__main__":
    main()

