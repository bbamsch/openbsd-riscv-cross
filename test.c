__asm("	.section \".note.openbsd.ident\", \"a\"\n"
"	.p2align 2\n"
"	.long	8\n"
"	.long	4\n"
"	.long	1\n"
"	.ascii \"OpenBSD\\0\"\n"
"	.long	0\n"
"	.previous\n");

int
main() {
	__asm __volatile(
		"li	t0, 47; /* getgid */	"\
		"ecall;");
	return 0;
}
