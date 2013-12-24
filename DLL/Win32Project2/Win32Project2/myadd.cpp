#include <windows.h>


extern "C" {
	int __declspec(dllexport) f(int, int);
	int __declspec(dllexport) g(int, int);
	int __declspec(dllexport) z(int, int);
	int __declspec(dllexport) h(int, int);
	int __declspec(dllexport) x(int, int);

	int __declspec(dllexport) tomb(int[], int);
}

int __declspec(dllexport) f(int a, int b) {
	return a * b;
}

int __declspec(dllexport) g(int a, int b) {
	return (a*2) + (b*2);
}


int __declspec(dllexport) z(int a, int b) {
	return (a*2)+100;
}

int __declspec(dllexport) h(int a, int b) {
	return (a*2)+100;
}

int __declspec(dllexport) x(int a[], int b) {
	int ossz =0;
	for (int i = 0; i < sizeof(a)/sizeof(int); i++)
	{
		ossz+=a[i];
	}

	ossz+=b;

	return ossz;
}

