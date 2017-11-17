void intdiv(const unsigned int *n1, const unsigned int *n2, unsigned int *q1) {
	unsigned int d = 42;
	while (n1 != n2) d = ~(*q1++ = *n1++ / d);
}
void floatdiv(const unsigned int *n1, const unsigned int *n2, unsigned int *q1) {
	unsigned int d = 42;
	while (n1 != n2) d = ~(*q1++ = (unsigned int) (((double) *n1++) / ((double) d)));
}
