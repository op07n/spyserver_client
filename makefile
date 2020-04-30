CXX=g++
CXXFLAGS=-I. -O3 -Wall
#CXXFLAGS=-I. -g -Wall
DEPS = tcp_client.h spyserver_protocol.h ss_client_if.h
OBJ = ss_client.o tcp_client.o ss_client_if.o

%.o: %.c $(DEPS)
	$(CXX) -c -o $@ $< $(CXXFLAGS)

ss_client: $(OBJ)
	$(CXX) -o $@ $^ $(CXXFLAGS) -l:libpthread.a -l:libsamplerate.a -l:libws2_32.a -l:libgcc_s_dw2-1.lib
	
clean:
	rm -f *.o
	rm -f ss_client
   
