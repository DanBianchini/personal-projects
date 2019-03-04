#include<iostream>
#include<time.h>
using namespace std;

int main() {
	time_t current;
	int h;
	int m;
	int s;
	current = time(NULL) - 14400;
	while (1) {
		if (current != time(NULL) - 14400) {
			current = time(NULL) - 14400;
			h = (current % 86400) / 3600;
			m = ((current % 86400) % 3600) / 60;
			s = (((current % 86400) % 3600) % 60);
			cout << h << ':' << m << ':' << s << endl;
		}

	}
	return 0;
}