#	NAME specifies name of the executable
NAME = OpenGLExec

#	SRC specifies which files to compile into OBJ
SRC = src/*.cpp


#	OBJ specifiy which files to compile from SRC
OBJ = src/*.o

#	P_INCLUDE paths specifies additional paths we would require
P_INCLUDE = -I ~/.brew/Cellar/glfw/3.2.1/include -I ~/.brew/Cellar/glew/2.0.0/include \
			 -I includes/

#	LIB_PATH specifies additional libraries we require
LIB_PATH = -L ~/.brew/Cellar/glfw/3.2.1./lib -L ~/.brew/Cellar/glew/2.0.0/lib

#	LINKER_FL specifies libraries we're linking to use some libraries
#	Cocoa, IOKit, and CoreVideo are needed for static GLFW3.
LINKER_FL = -framework Cocoa -framework -OpenGL -framework IOKit -framwork CoreFoundation \
			-framework CoreVideo -framework Carbon -lglfw -lGLEW

#	CC - compiler to use
CC = g++

#	CC_FL flags to be used with the compiler.
CC_FL = -Wall -Werror -Wextra

all: $(NAME)

$(NAME):
	@echo "Compiling SRC files into $(NAME)"
	@$(CC) -c $(SRC) $(CC_FL)
	@$(CC)  $(LINKER_FL) $(P_INCLUDE) $(LIB_PATH) $(OBJ) -o $(NAME)
	@echo "Compiled into $(NAME)"

clean:
	@echo "Performing clean on OBJ FILES"
