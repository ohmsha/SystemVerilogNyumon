#include <poyoio.h>

volatile int a = 5;

int main() {

    while(1){

        serial_write('H');
        serial_write('E');
        for (int i=0; i < 2; i++) {
            serial_write('L');
        }
        serial_write('O');
        serial_write(' ');

        int b = a;

        serial_write('R');
        serial_write('I');
        serial_write('S');
        serial_write('C');		
        serial_write('-');	        
        serial_write('V');

        delay(3000);

    }

    return 0;

}
