cmake_minimum_required(VERSION 3.15)

project(pixman VERSION 0.35.1 )#LANGUAGES C ASM)

set(PIXMAN_VERSION_MAJOR ${pixman_VERSION_MAJOR})
set(PIXMAN_VERSION_MINOR ${pixman_VERSION_MINOR})
set(PIXMAN_VERSION_MICRO ${pixman_VERSION_PATCH})

configure_file(${CMAKE_CURRENT_SOURCE_DIR}/pixman/pixman-version.h.in ${CMAKE_CURRENT_SOURCE_DIR}/cmake_generated/pixman-version.h)

add_library(pixman STATIC)

target_compile_definitions(pixman PRIVATE "PIXMAN_NO_TLS")
target_compile_definitions(pixman PRIVATE "PACKAGE=\"android-cairo\"")
target_include_directories(pixman SYSTEM PRIVATE ${CMAKE_CURRENT_SOURCE_DIR}/cmake_generated)

target_sources(pixman PRIVATE
	pixman/pixman.c
	pixman/pixman-access.c
	pixman/pixman-access-accessors.c
	pixman/pixman-arm.c
	pixman/pixman-arm-neon.c
	pixman/pixman-arm-simd.c
	pixman/pixman-bits-image.c
	pixman/pixman-combine32.c
	pixman/pixman-combine-float.c
	pixman/pixman-conical-gradient.c
	pixman/pixman-edge.c
	pixman/pixman-edge-accessors.c
	pixman/pixman-fast-path.c
	pixman/pixman-filter.c
	pixman/pixman-general.c
	pixman/pixman-glyph.c
	pixman/pixman-gradient-walker.c
	pixman/pixman-image.c
	pixman/pixman-implementation.c
	pixman/pixman-linear-gradient.c
	pixman/pixman-matrix.c
	pixman/pixman-mips.c
	pixman/pixman-mips-dspr2.c
	pixman/pixman-mmx.c
	pixman/pixman-noop.c
	pixman/pixman-ppc.c
	pixman/pixman-radial-gradient.c
#	pixman/pixman-region.c
	pixman/pixman-region16.c
	pixman/pixman-region32.c
	pixman/pixman-solid-fill.c
	pixman/pixman-timer.c
	pixman/pixman-trap.c
	pixman/pixman-utils.c
#	pixman-extra/pixman-combine32.c
#	pixman-extra/pixman-combine64.c
)

if(ANDROID_ABI)
	target_sources(pixman PRIVATE
		pixman/pixman-arm-neon-asm.S
		pixman/pixman-arm-neon-asm-bilinear.S
		pixman/pixman-arm-simd-asm.S
		pixman/pixman-arm-simd-asm-scaled.S
	)
endif()

if(X86)
	target_sources(pixman PRIVATE
		pixman/pixman-sse2.c
		pixman/pixman-ssse3.c
		pixman/pixman-vmx.c
		pixman/pixman-x86.c
	)
endif()
