#include <windows.h>


extern "C" {
	int __declspec(dllexport) Szumma(int, int);
}

int __declspec(dllexport) Szumma(int a, int b) {
	return a + b;
}
