CXX = g++

CXXFLAGS = -std=c++20 -g -Wall -Wextra \
           -I/usr/include/c++/11 -I/usr/include/x86_64-linux-gnu/c++/11
LDFLAGS := -L/usr/lib/x86_64-linux-gnu -lc++

TARGETS = $(SRCS:.cpp=.out)
SRCS = $(wildcard *.cpp)
OBJS = $(SRCS:.cpp=.o)

all: $(TARGETS)

$(TARGETS): %.out: %.o
	$(CXX) $(CXXFLAGS) -o $@ $<

%.o: %.cpp
	$(CXX) $(CXXFLAGS) -c $< -o $@

clean:
	rm -f $(OBJS) $(TARGETS)

