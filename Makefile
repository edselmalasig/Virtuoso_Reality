CC=gcc
CPP=g++

INCLUDES=-I $(MARSYAS_DIR) -I $(INCLUDE_DIR) -I $(SRC) -I $(GLM_DIR)\
	-I $(GLEW_DIR)include/ -I $(GLFW3_DIR)include/ -I $(IMGUI_DIR) -I $(GLFW3_IMGUI_DIR)\
	-I $(LIBAUDIODECODER)include/ -I $(PORTAUDIO)include/ -I $(IMGUI_ADDONS)

MARSYAS_DIR=./marsyas/
INCLUDE_DIR=./include/
GLM_DIR=./lib/glm/
GLEW_DIR=./lib/glew-2.0.0/
GLFW3_DIR=./lib/glfw-3.2.1/
IMGUI_DIR=./lib/imgui/
GLFW3_IMGUI_DIR=./lib/imgui/examples/opengl2_example/
IMGUI_ADDONS=./lib/imgui/examples/addons/
LIBAUDIODECODER=./lib/libaudiodecoder/
PORTAUDIO=./lib/portaudio/
SRC=./src/

CFLAGS=-D__MACOSX_CORE__ $(INCLUDES) -O3 -c

LIBS= -L $(GLEW_DIR)/lib/ -lglew -L $(GLFW3_DIR)/build/src -lglfw3 -L $(LIBAUDIODECODER)/ -laudiodecoder -L $(PORTAUDIO)/build/ -lportaudio

FRAMEWORK=-F /Library/Frameworks/ -framework CoreAudio -framework CoreMIDI -framework CoreFoundation\
	-framework OpenGL -framework GLUT -framework Foundation -framework IOKit\
	-framework AppKit -framework AudioToolBox -framework CoreVideo

OBJS=chuck_fft.o Thread.o Virtuoso_Reality.o Stk.o Windowing_System.o \
	Centroid.o DownSampler.o Flux.o LPC.o MFCC.o RMS.o Rolloff.o \
	System.o fvec.o AutoCorrelation.o Communicator.o Hamming.o \
	MagFFT.o NormRMS.o MarSignal.o fmatrix.o main.o imgui_impl_glfw.o imgui.o\
	imguifilesystem.o imgui_draw.o imgui_demo.o

Virtuoso_Reality: $(OBJS)
	$(CPP) -v -o $@ $(OBJS) $(FRAMEWORK) $(LIBS)

imguifilesystem.o:
	$(CC) $(CFLAGS) $(IMGUI_ADDONS)$*.cpp

imgui_impl_glfw.o:
	$(CC) $(CFLAGS) $(IMGUI_DIR)/examples/opengl2_example/$*.cpp

imgui_draw.o:
	$(CC) $(CFLAGS) $(IMGUI_DIR)$*.cpp

imgui_demo.o:
	$(CC) $(CFLAGS) $(IMGUI_DIR)$*.cpp
imgui.o:
	$(CC) $(CFLAGS) $(IMGUI_DIR)$*.cpp
Centroid.o:
	$(CC) $(CFLAGS) $(MARSYAS_DIR)$*.cpp

DownSampler.o:
	$(CC) $(CFLAGS) $(MARSYAS_DIR)$*.cpp

Flux.o:
	$(CC) $(CFLAGS) $(MARSYAS_DIR)$*.cpp

LPC.o:
	$(CC) $(CFLAGS) $(MARSYAS_DIR)$*.cpp

MFCC.o:
	$(CC) $(CFLAGS) $(MARSYAS_DIR)$*.cpp

RMS.o:
	$(CC) $(CFLAGS) $(MARSYAS_DIR)$*.cpp

Rolloff.o:
	$(CC) $(CFLAGS) $(MARSYAS_DIR)$*.cpp

System.o:
	$(CC) $(CFLAGS) $(MARSYAS_DIR)$*.cpp

fvec.o:
	$(CC) $(CFLAGS) $(MARSYAS_DIR)$*.cpp

AutoCorrelation.o:
	$(CC) $(CFLAGS) $(MARSYAS_DIR)$*.cpp

Communicator.o:
	$(CC) $(CFLAGS) $(MARSYAS_DIR)$*.cpp

Hamming.o:
	$(CC) $(CFLAGS) $(MARSYAS_DIR)$*.cpp

MagFFT.o:
	$(CC) $(CFLAGS) $(MARSYAS_DIR)$*.cpp

NormRMS.o:
	$(CC) $(CFLAGS) $(MARSYAS_DIR)$*.cpp

MarSignal.o:
	$(CC) $(CFLAGS) $(MARSYAS_DIR)$*.cpp

fmatrix.o:
	$(CC) $(CFLAGS) $(MARSYAS_DIR)$*.cpp

chuck_fft.o:
	$(CC) $(CFLAGS) $(SRC)*.c

Stk.o:
	$(CC) $(CFLAGS) $(SRC)*.cpp

Thread.o:
	$(CC) $(CFLAGS) $(SRC)*.cpp

Windowing_System.o:
	$(CC) $(CFLAGS) $(SRC)*.cpp

Virtuoso_Reality.o:
	$(CC) $(CFLAGS) $(SRC)*.cpp

main.o:
	$(CC) $(CFLAGS) $(SRC)*.cpp

.o: $*.h

.c.o: $*.h $*.c
	$(CC) $(CFLAGS) $*.c

.cpp.o: $*.h $*.cpp
	$(CC) $(CFLAGS) $*.cpp

clean: 
	rm -f Virtuoso_Reality *~ *.o
