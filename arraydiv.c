void intdiv(const unsigned int *n1, const unsigned int *n2, const unsigned int *d1, unsigned int *q1) {
	while (n1 != n2) *q1++ = *n1++ / *d1++;
}
void floatdiv(const unsigned int *n1, const unsigned int *n2, const unsigned int *d1, unsigned int *q1) {
	while (n1 != n2) *q1++ = (unsigned int) (((double) *n1++) / ((double) *d1++));
}
