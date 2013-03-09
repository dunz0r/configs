/*
 * File Name : outputcommand.c
 * Purpose : testing popen
 * Creation Date : 12-12-2012
 * Last Modified : ons  6 mar 2013 12:27:56
 * Created By : Gabriel Fornaeus, <gf@hax0r.se>
 *
 */

#include <stdio.h>
#include <stdlib.h>
#include <unistd.h>

int main(void) {
	FILE *fp;
	char song[128];

	fp = popen(" mocp -Q '%a; %t'", "r");
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

