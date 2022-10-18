
.equ PROT_READ,	 1
.equ PROT_WRITE, 2

.equ MAP_SHARED, 1

.equ FBIOGET_VSCREENINFO,	0x04600
.equ FBIOPUT_VSCREENINFO,	0x04601
.equ FBIOGETCMAP,		0x04604
.equ FBIOPUTCMAP,		0x04605

.equ FB_SCREENINFO_SAVED,001
.equ FB_COLORMAP_SAVED,	 002

.data
			.align	4
fb_flags:		.long	0
fb_handle:		.long	0
fb_address:		.long	0

mmap_data:
start:		.long	0
length:		.long	0
protection:	.long	PROT_READ|PROT_WRITE
flags:		.long	MAP_SHARED
file_handle:	.long	0
offset:		.long	0

screeninfo_saved:
saved_tscreen_x_resolution:		.long	1
saved_tscreen_y_resolution:		.long	1
saved_tscreen_virtual_x_resolution:	.long	1
saved_tscreen_virtual_y_resolution:	.long	1
saved_tscreen_x_offset:			.long	1
saved_tscreen_y_offset:			.long	1
saved_tscreen_bits_per_pixel:		.long	1
saved_tscreen_grayscale:		.long	1
saved_tscreen_red_offset:		.long	1
saved_tscreen_red_length:		.long	1
saved_tscreen_red_msb_right:		.long	1
saved_tscreen_green_offset:		.long	1
saved_tscreen_green_length:		.long	1
saved_tscreen_green_msb_right:		.long	1
saved_tscreen_blue_offset:		.long	1
saved_tscreen_blue_length:		.long	1
saved_tscreen_blue_msb_right:		.long	1
saved_tscreen_transparent_offset:	.long	1
saved_tscreen_transparent_length:	.long	1
saved_tscreen_transparent_msb_right:	.long	1
saved_tscreen_non_standard_format:	.long	1
saved_tscreen_activate:			.long	1
saved_tscreen_height:			.long	1
saved_tscreen_width:			.long	1
saved_tscreen_acceleration_flags:	.long	1
saved_tscreen_pixel_clock:		.long	1
saved_tscreen_left_margin:		.long	1
saved_tscreen_right_margin:		.long	1
saved_tscreen_upper_margin:		.long	1
saved_tscreen_lower_margin:		.long	1
saved_tscreen_hsync_length:		.long	1
saved_tscreen_vsync_length:		.long	1
saved_tscreen_sync:			.long	1
saved_tscreen_vmode:			.long	1
saved_tscreen_reserved:			.long	0,0,0,0,0,0

screeninfo_data:
tscreen_x_resolution:		.long	1
tscreen_y_resolution:		.long	1
tscreen_virtual_x_resolution:	.long	1
tscreen_virtual_y_resolution:	.long	1
tscreen_x_offset:		.long	1
tscreen_y_offset:		.long	1
tscreen_bits_per_pixel:		.long	1
tscreen_grayscale:		.long	1
tscreen_red_offset:		.long	1
tscreen_red_length:		.long	1
tscreen_red_msb_right:		.long	1
tscreen_green_offset:		.long	1
tscreen_green_length:		.long	1
tscreen_green_msb_right:	.long	1
tscreen_blue_offset:		.long	1
tscreen_blue_length:		.long	1
tscreen_blue_msb_right:		.long	1
tscreen_transparent_offset:	.long	1
tscreen_transparent_length:	.long	1
tscreen_transparent_msb_right:	.long	1
tscreen_non_standard_format:	.long	1
tscreen_activate:		.long	1
tscreen_height:			.long	1
tscreen_width:			.long	1
tscreen_acceleration_flags:	.long	1
tscreen_pixel_clock:		.long	1
tscreen_left_margin:		.long	1
tscreen_right_margin:		.long	1
tscreen_upper_margin:		.long	1
tscreen_lower_margin:		.long	1
tscreen_hsync_length:		.long	1
tscreen_vsync_length:		.long	1
tscreen_sync:			.long	1
tscreen_vmode:			.long	1
tscreen_reserved:		.long	0,0,0,0,0,0

colormap_saved:
saved_tcmap_offset:		.long	0
saved_tcmap_length:		.long	0x10
saved_tcmap_red:		.long	red_saved
saved_tcmap_green:		.long	green_saved
saved_tcmap_blue:		.long	blue_saved
saved_tcmap_transparent:	.long	transparent_saved

colormap_data:
tcmap_offset:			.long	0
tcmap_length:			.long	0x10
tcmap_red:			.long	grey_scale
tcmap_green:			.long	grey_scale
tcmap_blue:			.long	grey_scale
tcmap_transparent:		.long	transparent_saved

# remember: 16 bit components

grey_scale:		.word	0x0000, 0x1000, 0x2000, 0x3000
			.word	0x4000, 0x5000, 0x6000, 0x7000
			.word	0x8000, 0x9000, 0xa000, 0xb000
			.word	0xc000, 0xd000, 0xe000, 0xf000

.bss
			.align	4
red_saved:		.fill	0x10,2
green_saved:		.fill	0x10,2
blue_saved:		.fill	0x10,2
transparent_saved:	.fill	0x10,2

# initialization  **********************************************************

.text
