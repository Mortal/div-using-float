#include <stdio.h>
#include <stdlib.h>
#include <sys/time.h>

void intdiv(const unsigned int *n1, const unsigned int *n2, unsigned int *q1);
void floatdiv(const unsigned int *n1, const unsigned int *n2, unsigned int *q1);

int main() {
	unsigned int N = 1 << 27;
	unsigned int *n = (unsigned int *) malloc(N * sizeof(unsigned int));
	unsigned int *qi = (unsigned int *) malloc(N * sizeof(unsigned int));
	unsigned int *qf = (unsigned int *) malloc(N * sizeof(unsigned int));
	for (unsigned int i = 0; i < N; ++i) {
		n[i] = rand();
	}
	struct timeval t1;
	struct timeval t2;
	gettimeofday(&t1, 0);
	for (int i = 0; i < 11; i++) {
		intdiv(n, n+N, qi);
		gettimeofday(&t2, 0);
		printf("int %.6f\n", 1e-6 * ((t2.tv_sec - t1.tv_sec) * 1e6 + t2.tv_usec - t1.tv_usec));
		floatdiv(n, n+N, qf);
		gettimeofday(&t1, 0);
		printf("double %.6f\n", 1e-6 * ((t1.tv_sec - t2.tv_sec) * 1e6 + t1.tv_usec - t2.tv_usec));
		int errors = 0;
		for (unsigned int i = 0; i < N; ++i) {
			if (qi[i] != qf[i]) errors++;
		}
		printf("errors %d\n", errors);
		gettimeofday(&t1, 0);
	}
	return 0;
}
