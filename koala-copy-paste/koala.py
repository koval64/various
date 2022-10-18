#!/usr/bin/python3
#-*- coding: utf-8 -*-

import sys
from inc.koala_loader import KoalaLoader

def save( img, filepath ):
    address, bmp, screen, color, bgcolor = img.get_img_data()
    with open( filepath, "wb" ) as fh:
        barr = []
        barr.append( address & 0xff )
        barr.append( ( address >> 8 ) & 0xff )
        barr.extend( bmp )
        barr.extend( screen )
        barr.extend( color )
        barr.append( bgcolor )
        fh.write( bytearray( barr ) )
        fh.close()

def print_info( img ):
    address, bmp, screen, color, bgcolor = img.get_img_data()
    print( f"address :   {address:02x}   bgcolor :   {bgcolor:02x}" )
    # print( bmp )
    # print( screen )
    # print( color )

def make_diagonal_collage_updown( src_img, dst_img ):
    #
    # Make diagonal collage
    #
    img_to.copy( img_from,  0,  0, 8, 5,  0,  0 )
    img_to.copy( img_from,  8,  5, 8, 5,  8,  5 )
    img_to.copy( img_from, 16, 10, 8, 5, 16, 10 )
    img_to.copy( img_from, 24, 15, 8, 5, 24, 15 )
    img_to.copy( img_from, 32, 20, 8, 5, 32, 20 )
    return img_to

if __name__ == "__main__":

    args = sys.argv
    if len( args ) != 9:
        print()
        print( "application takes 8 arguments" )
        print()
        print( "> " + args[0] + " src_img dst_img src_x src_y width height dst_x dst_y" )
        print()
        print( "# x in range(0,39)" )
        print( "# y in range(0,24)" )
        print()
        exit()

    src_img = args[1]
    dst_img = args[2]
    src_x, src_y, width, height, dst_x, dst_y = map( int, args[3:9] )

    loader = KoalaLoader()
    if not loader.load_file( src_img ):
        print( "error loading file...   ", src_img )
        exit()

    img_from = loader.get_data()

    if not loader.load_file( dst_img ):
        print( "error loading file...   ", dst_img )
        exit()

    img_to = loader.get_data()
    loader.close()

    # print_info( img_to )
    # print_info( img_from )

    img_to.copy( img_from, src_x, src_y, width, height, dst_x, dst_y )
    # img_to = make_diagonal_collage_updown( img_from, img_to )
    save( img_to, f"{dst_img}".replace( ".kla", "_result.kla" ) )

    print()
    print("done.")
    print()


















