
CC = g++

CFLAGS = -Wall -g

INCLUDES =  ./include

LIBS =  -lsfml-graphics -lsfml-window -lsfml-system

SRCDIR = src

BUILDDIR = build

SRCS = $(shell find $(SRCDIR) -type f -name '*.cpp') main.cpp

OBJS = $(patsubst %.cpp,$(BUILDDIR)/%.o,$(subst $(SRCDIR)/,,$(filter-out main.cpp, $(SRCS)))) $(BUILDDIR)/main.o


MAIN = tirgs

all: $(MAIN)

setup:
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
