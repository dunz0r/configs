/*
 * File Name : outputcommand.c
 * Purpose : testing popen
 * Creation Date : 12-12-2012
 * Last Modified : Wed 12 Dec 2012 21:07:02 CET
 * Created By : Gabriel Fornaeus, <gf@hax0r.se>
 *
 */

#include <stdio.h>
#include <stdlib.h>
#include <unistd.h>

int main(void) {
	FILE *fp;
	char song[128];

	fp = popen("audtool current-song", "r");
	if(fp == NULL) {
		fprintf(stderr, "Failed to run command\n");
		return -1;
	}
	while(fgets(song, sizeof(song) -1, fp) != NULL) {
		fprintf(stdout, "%s", song);
	}
	pclose(fp);

	return 0;
}

