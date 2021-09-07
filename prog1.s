
# -*- mode: text -*-

#
# Nicholas Perry, nperry2, 116635288, 0104
# This program produces the area of a rectangular prism. It takes in
# 3 integer variables. It then calcualtes the area and returns prints value
# followed by a new line charater. If the value is 0 or negative then the
# program returns -1 followed by a new line charater.
#

		.text
main:
		li		$t0, -1			# ans = -1
		sw		$t0, ans

		li  	$v0, 5		    # scanf("%d", length)
		syscall
		move	$t0, $v0
		sw      $t0, length

		li      $v0, 5          # scanf("%d", width)
		syscall
		move    $t1, $v0
		sw      $t1, width

		li      $v0, 5          # scanf("%d", height)
		syscall
		move    $t2, $v0
		sw      $t2, height

		lw      $t0, length     # if(length > 0) 
		blez    $t0, endif
		lw      $t0, width      # if(width > 0)
		blez    $t0, endif
		lw      $t0, height     # if(height > 0)
		blez    $t0, endif

		lw      $t0, width      # width = width * length
		lw      $t1, length
		mul     $t0, $t0, $t1
		lw      $t2, height     # length = heigth * length
		mul     $t1, $t1, $t2
		lw      $t3, width      # height = width * height
		mul     $t2, $t3, $t2
		
		add		$t0, $t0, $t1   # add all of the products
		add     $t0, $t0, $t2
		mul     $t0, $t0, 2     # multiply by 2

		sw      $t0, ans        # set ans = equation

endif:
		lw      $a0, ans        # printf("%d", ans)
		li      $v0, 1
		syscall

		la		$a0, eoln       # printf("\n")
		li      $v0, 4
		syscall

		li		$v0, 10         # quit program
		syscall

		.data

length:		.word 0
width:	    .word 0
height:	    .word 0
ans:	  	.word 0
eoln:       .asciiz "\n"