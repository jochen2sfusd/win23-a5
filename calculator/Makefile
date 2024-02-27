
objects=main.o addition.o subtraction.o multiplication.o division.o

%.o: %.c operations.h
	gcc -c -o $@ $< -I.

calculator: $(objects)
	gcc -o $@ $^

clean:
	rm -f calculator $(objects)
