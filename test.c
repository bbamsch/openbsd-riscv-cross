
int
main() {
	__asm __volatile(
		"li	t0, 47; /* getgid */	"\
		"ecall;");
	return 0;
}
