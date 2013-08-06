/* vim:cindent:ts=2:sw=2:expandtab */

#include <stdio.h>
#include <stdlib.h>
#include <stdint.h>
#include <readhex.h>
#include <gdsl-x86.h>

int main(int argc, char** argv) {
	void fatal(char *msg) {
		fprintf(stderr, "%s", msg);
		exit(1);
	}

	char *buffer;
	size_t size = readhex_hex_read(stdin, &buffer);

	state_t state = gdsl_init();
	gdsl_set_code(state, buffer, size, 0);

	if(setjmp(*gdsl_err_tgt(state)))
		fatal("decode failed");
	obj_t insn = x86_decode(state);

	string_t fmt = x86_pretty(state, insn);
	puts(fmt);

	printf("---------------------------\n");

	if(setjmp(*gdsl_err_tgt(state)))
		fatal("translate failed");

	obj_t rreil = x86_translate(state, insn);

	fmt = x86_rreil_pretty(state, rreil);
	puts(fmt);

	gdsl_destroy(state);
	free(buffer);

	return 1;
}

