/* made by dunz0r
 *
 *  Compile with:
 *  clang -Wall -pedantic -std=c99 -lX11 dwmstatus.c
 */
#include <stdio.h>
#include <stdlib.h>
#include <unistd.h>
#include <time.h>
#include <string.h>
#include <X11/Xlib.h>
#include <locale.h>

static Display *dpy;

void setstatus(char *str) {
	XStoreName(dpy, DefaultRootWindow(dpy), str);
	XSync(dpy, False);
}

char* get_battery_status() {
	char *buf;
	FILE *fd = fopen("/sys/class/power_supply/BAT0/status", "r");
	char bat_status;

	if((buf = malloc(sizeof(char)*3)) == NULL) {
		fprintf(stderr, "Cannot allocate memory for buf.\n");
		exit(1);
	}
	if(fd == NULL) {
		fprintf(stderr, "Error opening status.\n");
		exit(1);
	}
	fscanf(fd, "%c", &bat_status);
	if(bat_status == 'D')
		snprintf(buf, 2, "-");
	if(bat_status == 'C')
		snprintf(buf, 2, "+");
	if(bat_status == 'F')
		snprintf(buf, 2, "=");
	if(bat_status == 'U')
		snprintf(buf, 2, "?");

	fclose(fd);
	return buf;
}

char* get_datetime() {
	char *buf;
	time_t result;
	struct tm *resulttm;

	if((buf = malloc(sizeof(char)*65)) == NULL) {
		fprintf(stderr, "Cannot allocate memory for buf.\n");
		exit(1);
	}

	result = time(NULL);
	resulttm = localtime(&result);

	if(resulttm == NULL) {
		fprintf(stderr, "Error getting localtime.\n");
		exit(1);
	}
	if(!strftime(buf, sizeof(char)*65-1, "%R, Wk %V, %a %e %B", resulttm)) {
		fprintf(stderr, "strftime is 0.\n");
		exit(1);
	}

	return buf;
}
int get_battery() {
	FILE *fd;
	int energy_now, energy_full, voltage_now;

	fd = fopen("/sys/class/power_supply/BAT0/energy_now", "r");
	if(fd == NULL) {
		fprintf(stderr, "Error opening energy_now.\n");
		return -1;
	}
	fscanf(fd, "%d", &energy_now);
	fclose(fd);


	fd = fopen("/sys/class/power_supply/BAT0/energy_full", "r");
	if(fd == NULL) {
		fprintf(stderr, "Error opening energy_full.\n");
		return -1;
	}
	fscanf(fd, "%d", &energy_full);
	fclose(fd);


	fd = fopen("/sys/class/power_supply/BAT0/voltage_now", "r");
	if(fd == NULL) {
		fprintf(stderr, "Error opening voltage_now.\n");
		return -1;
	}
	fscanf(fd, "%d", &voltage_now);
	fclose(fd);

	return ((float)energy_now * 1000 / (float)voltage_now) * 100 / ((float)energy_full * 1000 / (float)voltage_now);
}

int main(void) {
	char *status;
	char *datetime;
	char *battery_status;
	int bat0;

	char hostname[16];
	//hostname[15] = '\0';
	gethostname(hostname, 15);
	int is_laptop;
	is_laptop = strcmp(hostname, "miku");


	if (!(dpy = XOpenDisplay(NULL))) {
		fprintf(stderr, "Cannot open display.\n");
		return 1;
	}

	if((status = malloc(200)) == NULL)
		exit(1);
	for(;;sleep(10)) {
		datetime = get_datetime();
		if(!is_laptop) {
			battery_status = get_battery_status();
			bat0 = get_battery();
			snprintf(status, 200, "%s%d%% | %s",
				battery_status, bat0, datetime);
		} else {
			snprintf(status, 200, "%s", datetime);
		}

		setstatus(status);
	}
	free(datetime);
	free(status);
	XCloseDisplay(dpy);
	return 0;
}

