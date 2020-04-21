__asm("	.section \".note.openbsd.ident\", \"a\"\n"
"	.p2align 2\n"
"	.long	8\n"
"	.long	4\n"
"	.long	1\n"
"	.ascii \"OpenBSD\\0\"\n"
"	.long	0\n"
"	.previous\n");

int	getfd(char *);
void	print(int, char *, int);

int
main() {
	int stdoutfd = -1;
	char stdoutfile[] = {"/dev/console"};
	while (stdoutfd == -1) {
		stdoutfd = getfd(stdoutfile);
	}

	char printbuf[] = {"Hello, World!\n"};
	int i;
	for (i = 0; printbuf[i] != 0; i++) {}

	while(1) {
		print(stdoutfd, printbuf, i);
	}

	return 0;
}

int
getfd(char *fdpath) {
	int fd;
	__asm __volatile(
	"	/* a0 = (char *) fdpath */	"\
	"	li	a1, 2; /* O_RDWR */	"\
	"	li	t0, 5; /* open */	"\
	"	ecall;				"\
	"	beqz	t0, 1f;			"\
	"	li	t0, 1; /* exit */	"\
	"	ecall;				"\
	"	/* exit should not return? */	"\
	"1:	mv	%0, a0;			"\
		: "=r" (fd)
		: "r" (fdpath));
	return fd;
}

void
print(int fd, char *printbuf, int printbuflen) {
	__asm __volatile(
	"	/* a0 = (int) fd */		"\
	"	/* a1 = (char *) pritnbuf */	"\
	"	/* a2 = (int) printbuflen */	"\
	"	li	t0, 4; /* write */	"\
	"	ecall;				"\
	"	beqz	t0, 1f;			"\
	"	li	t0, 1; /* exit */	"\
	"	ecall;				"\
	"1:					"\
		:: "r" (fd),
		   "r" (printbuf),
		   "r" (printbuflen));
}
