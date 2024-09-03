a.out:
	gcc main.c

clean:
	rm a.out
	rm main

test: a.out
	bash test.sh
