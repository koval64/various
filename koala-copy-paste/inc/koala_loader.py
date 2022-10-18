
from inc.raw_file import RawFile
from inc.koala_image import KoalaImage

class KoalaLoader:

    def __init__(self):
        self.raw_file = RawFile()

    def load_file( self, path ):
        if self.raw_file.load_file( path ):
            return True
        return False

    def close( self ):
        self.raw_file.close()

    def get_data( self ):
        address = self.raw_file.get_unsigned_word( 0 )
        bmp     = self.raw_file.get_bytes(    2, 8000 )
        screen  = self.raw_file.get_bytes( 8002, 1000 )
        color   = self.raw_file.get_bytes( 9002, 1000 )
        bgcolor = self.raw_file.get_unsigned_byte( 10002 )
        return KoalaImage( address, bmp, screen, color, bgcolor )

