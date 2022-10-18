
class KoalaImage:

    # load address  (   2 bytes)
    # BMP           (8000 bytes)
    # SCREEN        (1000 bytes)
    # COLOR         (1000 bytes)
    # bgcolor       (   1 byte )

    def __init__( self, address, bmp, screen, color, bgcolor ):

        self.address  = address
        self.bmp      = bmp
        self.screen   = screen
        self.color    = color

        self.bgcolor  = bgcolor

    def get_img_data( self ):
        return [ self.address, self.bmp, self.screen, self.color, self.bgcolor ]

    def copy( self, img_from, src_x, src_y, width, height, dst_x, dst_y ):

        address, bmp_from, screen_from, color_from, bgcolor = img_from.get_img_data()

        # x in range(0,39) - in bytes
        # y in range(0,24) - in bytes

        for y in range( height ):

            src_idx = src_x + ( src_y + y ) * 40
            dst_idx = dst_x + ( dst_y + y ) * 40

            for x in range( width ):

                p_src = src_idx + x
                p_dst = dst_idx + x

                # copy screen
                self.screen[p_dst] = screen_from[p_src]

                # copy color
                self.color[p_dst]  = color_from[p_src]

                p_src *= 8
                p_dst *= 8

                # copy_bitmap( source, destination, sx, sy, dx, dy )
                len = 8                     # 8 bytes - tile size
                for z in range( len ):
                    self.bmp[p_dst+z] = bmp_from[p_src+z]

