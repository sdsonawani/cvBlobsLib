#
# Makefile for blobs library for OpenCV Version 4 and its examples
#

CFLAGS= `pkg-config --cflags opencv` -I.
LDFLAGS= `pkg-config --libs opencv` -L. -lblob
CXX=g++

CPPFILES= \
	blob.cpp\
	BlobContour.cpp\
	BlobOperators.cpp\
	BlobProperties.cpp\
	BlobResult.cpp\
	ComponentLabeling.cpp

.SUFFIXES: .cpp.o
.cpp.o:	; echo 'Compiling $*.cpp' ; $(CXX) $(CFLAGS) -c $*.cpp

.SILENT:

libblob.a: $(CPPFILES:.cpp=.o)
	ar ru libblob.a $(CPPFILES:.cpp=.o) 2> /dev/null
	ranlib libblob.a
#
#	@echo Build tests, examples and tools...
#	$(CXX) -g blobdemo.cpp $(LDFLAGS) $(CFLAGS) -o blobdemo
#	$(CXX) -g blobdemo2.cpp $(LDFLAGS) $(CFLAGS) -o blobdemo2
#
#	@echo Copy include files...
#
	@echo Cleaning objects...
	rm -f $(CPPFILES:.cpp=.o)

all: clean

clean:
	@echo Cleaning...
	rm -f $(CFILES:.cpp=.o)
	rm -f libblob.a

