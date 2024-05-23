
CC = g++

CFLAGS = -Wall -g

INCLUDES =  ./include

LIBS =  

SRCDIR = src

BUILDDIR = build

SRCS = $(shell find $(SRCDIR) -type f -name '*.cpp') main.cpp

OBJS = $(patsubst %.cpp,$(BUILDDIR)/%.o,$(subst $(SRCDIR)/,,$(filter-out main.cpp, $(SRCS)))) $(BUILDDIR)/main.o


MAIN = app

all: $(MAIN)

setup:
	rm -rf .git
	rm -rf  README.md
	touch main.cpp
	@mkdir  $(SRCDIR)
	@mkdir  $(INCLUDES)
	@mkdir  $(BUILDDIR)


$(MAIN): $(OBJS)
	$(CC) $(CFLAGS) -I$(INCLUDES) -o $(MAIN) $(OBJS) $(LIBS)

$(BUILDDIR)/%.o: $(SRCDIR)/%.cpp | $(BUILDDIR)
	@mkdir -p $(dir $@)
	$(CC) $(CFLAGS) -I$(INCLUDES) -c $< -o $@

$(BUILDDIR)/main.o: main.cpp | $(BUILDDIR)
	$(CC) $(CFLAGS) -I$(INCLUDES) -c $< -o $@

$(BUILDDIR):
	mkdir -p $(BUILDDIR)

clean:
	$(RM) -r $(BUILDDIR) $(MAIN)
