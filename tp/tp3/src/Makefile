##############################
#     Makefile TP3			 #
##############################


LIB_DIR  = lib
CXX 	 =  g++

LIBS     = -lnavajo -L/usr/$(LIB_DIR) -L/usr/local/$(LIB_DIR) -lz -lssl -lcrypto -pthread
DEFS     =  -DLINUX -g -Wall -Wno-unused -fexceptions -fPIC -D_REENTRANT
CXXFLAGS =  -O4  -Wdeprecated-declarations


CPPFLAGS	= -I. \
		      -Iusr/local/include/libnavajo \
              -Iusr/local/include/MPFDParser

LD		 =  g++

LDFLAGS  = -g -Wall -Wno-unused -O3   

PROG     = server
OBJS =  main.o


#######################
# DEPENDENCE'S RULES  #
#######################

all: $(PROG)

$(PROG): $(OBJS)
	rm -f $@
	$(LD) $(LDFLAGS) -o $@ $(OBJS) $(LIBS) 


main.o: main.cpp OnlineRepo.h server.h 
	$(CXX) -c $< -o $@ $(CXXFLAGS) $(CPPFLAGS) $(DEFS) 

clean:
	@rm -f $(PROG) 
	@for i in $(OBJS); do  rm -f $$i ; done







