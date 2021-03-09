assignment.out:
	gcc assignment.c -o assignment.out -Wall -std=c99 -pedantic

clean:
	rm assignment.out

valgrind: assignment.out
	valgrind --error-exitcode=1 --leak-check=full ./assignment.out cars.txt