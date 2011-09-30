# GNU Make project makefile autogenerated by Premake
ifndef config
  config=debug
endif

ifndef verbose
  SILENT = @
endif

ifndef CC
  CC = gcc
endif

ifndef CXX
  CXX = g++
endif

ifndef AR
  AR = ar
endif

ifeq ($(config),debug)
  OBJDIR     = ../../obj/Debug/Platformer
  TARGETDIR  = ../../debug
  TARGET     = $(TARGETDIR)/Platformer.exe
  DEFINES   += -DSFML_STATIC -D_DEBUG
  INCLUDES  += -I../../include -I../../src/Platformer -I../../src -I../../src/FlatWorld
  CPPFLAGS  += -MMD -MP $(DEFINES) $(INCLUDES)
  CFLAGS    += $(CPPFLAGS) $(ARCH) -g -Wall
  CXXFLAGS  += $(CFLAGS) 
  LDFLAGS   += -L../../lib -L../../debug
  LIBS      += ../../debug/libFlatWorld.a -lgwen_static -lGWEN-Renderer-SFML -lfreetype -lftgl -lGLU -lsfml-audio -lsfml-graphics -lsfml-network -lsfml-system -lsfml-window
  RESFLAGS  += $(DEFINES) $(INCLUDES) 
  LDDEPS    += ../../debug/libFlatWorld.a
  LINKCMD    = $(CXX) -o $(TARGET) $(OBJECTS) $(LDFLAGS) $(RESOURCES) $(ARCH) $(LIBS)
  define PREBUILDCMDS
  endef
  define PRELINKCMDS
  endef
  define POSTBUILDCMDS
  endef
endif

ifeq ($(config),release)
  OBJDIR     = ../../obj/Release/Platformer
  TARGETDIR  = ../../bin
  TARGET     = $(TARGETDIR)/Platformer.exe
  DEFINES   += -DSFML_STATIC -DNDEBUG
  INCLUDES  += -I../../include -I../../src/Platformer -I../../src -I../../src/FlatWorld
  CPPFLAGS  += -MMD -MP $(DEFINES) $(INCLUDES)
  CFLAGS    += $(CPPFLAGS) $(ARCH) -g -Wall -O2
  CXXFLAGS  += $(CFLAGS) 
  LDFLAGS   += -L../../lib -L../../bin
  LIBS      += ../../bin/libFlatWorld.a -lgwen_static -lGWEN-Renderer-SFML -lfreetype -lftgl -lGLU -lsfml-audio -lsfml-graphics -lsfml-network -lsfml-system -lsfml-window
  RESFLAGS  += $(DEFINES) $(INCLUDES) 
  LDDEPS    += ../../bin/libFlatWorld.a
  LINKCMD    = $(CXX) -o $(TARGET) $(OBJECTS) $(LDFLAGS) $(RESOURCES) $(ARCH) $(LIBS)
  define PREBUILDCMDS
  endef
  define PRELINKCMDS
  endef
  define POSTBUILDCMDS
  endef
endif

OBJECTS := \
	$(OBJDIR)/main.o \
	$(OBJDIR)/gctHealth.o \
	$(OBJDIR)/gctTriggerRadius.o \
	$(OBJDIR)/gocHealth.o \
	$(OBJDIR)/gocInputPlayer.o \
	$(OBJDIR)/gocPhysicsSimple.o \
	$(OBJDIR)/gocTriggerRadius.o \
	$(OBJDIR)/gocVisualRectangle.o \
	$(OBJDIR)/screenGoL.o \
	$(OBJDIR)/screenMenu.o \
	$(OBJDIR)/screenTest.o \

RESOURCES := \

SHELLTYPE := msdos
ifeq (,$(ComSpec)$(COMSPEC))
  SHELLTYPE := posix
endif
ifeq (/bin,$(findstring /bin,$(SHELL)))
  SHELLTYPE := posix
endif

.PHONY: clean prebuild prelink

all: $(TARGETDIR) $(OBJDIR) prebuild prelink $(TARGET)
	@:

$(TARGET): $(GCH) $(OBJECTS) $(LDDEPS) $(RESOURCES)
	@echo Linking Platformer
	$(SILENT) $(LINKCMD)
	$(POSTBUILDCMDS)

$(TARGETDIR):
	@echo Creating $(TARGETDIR)
ifeq (posix,$(SHELLTYPE))
	$(SILENT) mkdir -p $(TARGETDIR)
else
	$(SILENT) mkdir $(subst /,\\,$(TARGETDIR))
endif

$(OBJDIR):
	@echo Creating $(OBJDIR)
ifeq (posix,$(SHELLTYPE))
	$(SILENT) mkdir -p $(OBJDIR)
else
	$(SILENT) mkdir $(subst /,\\,$(OBJDIR))
endif

clean:
	@echo Cleaning Platformer
ifeq (posix,$(SHELLTYPE))
	$(SILENT) rm -f  $(TARGET)
	$(SILENT) rm -rf $(OBJDIR)
else
	$(SILENT) if exist $(subst /,\\,$(TARGET)) del $(subst /,\\,$(TARGET))
	$(SILENT) if exist $(subst /,\\,$(OBJDIR)) rmdir /s /q $(subst /,\\,$(OBJDIR))
endif

prebuild:
	$(PREBUILDCMDS)

prelink:
	$(PRELINKCMDS)

ifneq (,$(PCH))
$(GCH): $(PCH)
	@echo $(notdir $<)
	-$(SILENT) cp $< $(OBJDIR)
	$(SILENT) $(CXX) $(CXXFLAGS) -o "$@" -c "$<"
endif

$(OBJDIR)/main.o: ../../src/Platformer/main.cpp
	@echo $(notdir $<)
	$(SILENT) $(CXX) $(CXXFLAGS) -o "$@" -c "$<"
$(OBJDIR)/gctHealth.o: ../../src/Platformer/Components/gctHealth.cpp
	@echo $(notdir $<)
	$(SILENT) $(CXX) $(CXXFLAGS) -o "$@" -c "$<"
$(OBJDIR)/gctTriggerRadius.o: ../../src/Platformer/Components/gctTriggerRadius.cpp
	@echo $(notdir $<)
	$(SILENT) $(CXX) $(CXXFLAGS) -o "$@" -c "$<"
$(OBJDIR)/gocHealth.o: ../../src/Platformer/Components/gocHealth.cpp
	@echo $(notdir $<)
	$(SILENT) $(CXX) $(CXXFLAGS) -o "$@" -c "$<"
$(OBJDIR)/gocInputPlayer.o: ../../src/Platformer/Components/gocInputPlayer.cpp
	@echo $(notdir $<)
	$(SILENT) $(CXX) $(CXXFLAGS) -o "$@" -c "$<"
$(OBJDIR)/gocPhysicsSimple.o: ../../src/Platformer/Components/gocPhysicsSimple.cpp
	@echo $(notdir $<)
	$(SILENT) $(CXX) $(CXXFLAGS) -o "$@" -c "$<"
$(OBJDIR)/gocTriggerRadius.o: ../../src/Platformer/Components/gocTriggerRadius.cpp
	@echo $(notdir $<)
	$(SILENT) $(CXX) $(CXXFLAGS) -o "$@" -c "$<"
$(OBJDIR)/gocVisualRectangle.o: ../../src/Platformer/Components/gocVisualRectangle.cpp
	@echo $(notdir $<)
	$(SILENT) $(CXX) $(CXXFLAGS) -o "$@" -c "$<"
$(OBJDIR)/screenGoL.o: ../../src/Platformer/Screens/screenGoL.cpp
	@echo $(notdir $<)
	$(SILENT) $(CXX) $(CXXFLAGS) -o "$@" -c "$<"
$(OBJDIR)/screenMenu.o: ../../src/Platformer/Screens/screenMenu.cpp
	@echo $(notdir $<)
	$(SILENT) $(CXX) $(CXXFLAGS) -o "$@" -c "$<"
$(OBJDIR)/screenTest.o: ../../src/Platformer/Screens/screenTest.cpp
	@echo $(notdir $<)
	$(SILENT) $(CXX) $(CXXFLAGS) -o "$@" -c "$<"

-include $(OBJECTS:%.o=%.d)
