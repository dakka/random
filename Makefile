#
LIBRARY_TARGET = librandom.a
OBJECTS = mersenne.o mother.o rancombi.o ranrotb.o ranrotw.o
CPPFLAGS = -I. -O3
CPP = g++
SHELL=/bin/sh

.SUFFIXES:
.SUFFIXES: .o .cpp

$(LIBRARY_TARGET): $(OBJECTS)
	$(AR) $(ARFLAGS) $(LIBRARY_TARGET) $(OBJECTS)

.cpp.a:
	$(CPP) -o $*.o $(CPPFLAGS) $<

clean:
	-rm -f $(OBJECTS) core $(LIBRARY_TARGET)

ex-ran: $(LIBRARY_TARGET) ex-ran.cpp
	g++ -o ex-ran ex-ran.cpp -L. -lrandom

