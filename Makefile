
CC = g++

CFLAGS = -Wall -g

INCLUDES =  -I./include

LIBS = -lGL -lglfw3 -lX11 -lpthread -lXrandr -lXi -ldl

SRCDIR = src

BUILDDIR = build

SRCS = $(shell find $(SRCDIR) -type f -name '*.cpp') main.cpp

OBJS = $(patsubst %.cpp,$(BUILDDIR)/%.o,$(subst $(SRCDIR)/,,$(filter-out main.cpp, $(SRCS)))) $(BUILDDIR)/main.o


MAIN = myOpenGLApp 

all: $(MAIN)

$(MAIN): $(OBJS)
	$(CC) $(CFLAGS) $(INCLUDES) -o $(MAIN) $(OBJS) $(LIBS)

$(BUILDDIR)/%.o: $(SRCDIR)/%.cpp | $(BUILDDIR)
	@mkdir -p $(dir $@)
	$(CC) $(CFLAGS) $(INCLUDES) -c $< -o $@

$(BUILDDIR)/main.o: main.cpp | $(BUILDDIR)
	$(CC) $(CFLAGS) $(INCLUDES) -c $< -o $@

$(BUILDDIR):
	mkdir -p $(BUILDDIR)

clean:
	$(RM) -r $(BUILDDIR) $(MAIN)
