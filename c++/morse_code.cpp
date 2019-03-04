#include<iostream>
#include<string>
using namespace std;

int main() {
	string phrase;
	string reply = "yes";

	while (reply == "yes") {
		cout << "Tell me what you would like to have translated into morse code" << endl;
		getline(cin, phrase);

		for (int i = 0; i < phrase.size(); i++) {
			phrase[i] = tolower(phrase[i]);
		}

		for (int i = 0; i < phrase.size(); i++) {
			switch (phrase[i]) {
			case 'a':
				cout << ". _";
				break;
			case 'b':
				cout << "_ . . .";
				break;
			case 'c':
				cout << "_ . _ .";
				break;
			case 'd':
				cout << "_ . .";
				break;
			case 'e':
				cout << ".";
				break;
			case 'f':
				cout << ". . _ .";
				break;
			case 'g':
				cout << "_ _ .";
				break;
			case 'h':
				cout << ". . . .";
				break;
			case 'i':
				cout << ". .";
				break;
			case 'j':
				cout << ". _ _ _";
				break;
			case 'k':
				cout << "_ . _";
				break;
			case 'l':
				cout << ". _ . .";
				break;
			case 'm':
				cout << "_ _";
				break;
			case 'n':
				cout << "_ .";
				break;
			case 'o':
				cout << "_ _ _";
				break;
			case 'p':
				cout << ". _ _ .";
				break;
			case 'q':
				cout << "_ _ . _";
				break;
			case 'r':
				cout << ". _ .";
				break;
			case 's':
				cout << ". . .";
				break;
			case 't':
				cout << "_";
				break;
			case 'u':
				cout << ". . _";
				break;
			case 'v':
				cout << ". . . _";
				break;
			case 'w':
				cout << ". _ _";
				break;
			case 'x':
				cout << "_ . . _";
				break;
			case'y':
				cout << "_ . _ _";
				break;
			case 'z':
				cout << "_ _ . .";
				break;
			case '0':
				cout << "_ _ _ _ _";
				break;
			case '1':
				cout << ". _ _ _ _";
				break;
			case '2':
				cout << ". . _ _ _";
				break;
			case '3':
				cout << ". . . _ _";
				break;
			case '4':
				cout << ". . . . _";
				break;
			case '5':
				cout << ". . . . .";
				break;
			case '6':
				cout << "_ . . . .";
				break;
			case '7':
				cout << "_ _ . . .";
				break;
			case '8':
				cout << "_ _ _ . .";
				break;
			case '9':
				cout << "_ _ _ _ .";
				break;
			case ' ':
				cout << ' ';
				break;
			default:
				cout << '?';
			}
			cout << "   ";
		}
		cout << endl << endl;
		cout << "Type yes if you want to translate something else, type anything else to quit" << endl;
		getline(cin, reply);
	}
	return 0;
}