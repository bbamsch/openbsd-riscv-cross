int
main() {
	__asm __volatile("		\
		li	t0, 47;		\
		ecall;");
	return 0;
}
