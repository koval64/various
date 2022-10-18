dsp_sound:
	dsp_do_more_fragments:
		IOctl	audio_handle,$SNDCTL_DSP_GETOSPACE,$audio_buf_info

		movl	$audio_buf_info, %edx
		movl	(%edx), %eax		# get free nr of fragments
		cmpl	$0, %eax
		je	dsp_no_free_frags

			movl	frags, %edx	# 8(%edx)->%edx
			movl	$dsp_buf, %edi
	
			pushl	%edx
			call	music
			popl	%edx

		Write	audio_handle, $dsp_buf, %edx

	jmp	dsp_do_more_fragments
	dsp_no_free_frags:

	ret

## music
## input:	%edx - number of bytes to calculate
##		%edi - dsp_buffer

music:
	music_next_byte:

		push	%ebx
		push	%edx

		mov	count1, %edx
		mov	audio_data1(%edx), %al
		inc	%edx
		mov	size1, %ebx
		cmp	%ebx, %edx
		jne	dalej1
		mov	$0, %edx
dalej1:		mov	%edx, count1

		pop	%edx
		pop	%ebx
#		shr	$1, %al		#\
#		shr	$1, %ah		# - mix al i ah, wynik al
#		addb	%ah, %al	#/
		stosb		# store in the outputbuffer %edi

	decl	%edx
	jnz	music_next_byte

	ret
