#include <stdio.h>
#include <stdlib.h>    /* exit, malloc, calloc, etc. */
#include <string.h>
#include <getopt.h>    /* getopt */
#include <time.h>
#include <likwid.h>
#include <likwid-marker.h>
#include "matriz.h"

#define DEBUG 1

/**
 * Exibe mensagem de erro indicando forma de uso do programa e termina
 * o programa.
 */

static void usage(char *progname)
{
  fprintf(stderr, "Forma de uso: %s [ <ordem> ] \n", progname);
  exit(1);
}



/**
 * Programa principal
 * Forma de uso: matmult [ -n <ordem> ]
 * -n <ordem>: ordem da matriz quadrada e dos vetores
 *
 */

int main (int argc, char *argv[]) 
{
  int n=DEF_SIZE;
  
  MatRow mRow_1, mRow_2, resMat;
  Vetor vet, res;
  
  /* =============== TRATAMENTO DE LINHA DE COMANDO =============== */

  if (argc < 2)
    usage(argv[0]);

  n = atoi(argv[1]);
  
  /* ================ FIM DO TRATAMENTO DE LINHA DE COMANDO ========= */
  // LIKWID_MARKER_INIT
  likwid_markerInit();
  srandom(20232);
      
  res = geraVetor(n, 1);
  resMat = geraMatRow(n, n, 1);
    
  mRow_1 = geraMatRow (n, n, 0);
  mRow_2 = geraMatRow (n, n, 0);

  vet = geraVetor (n, 0);

#ifdef _DEBUG_  
    prnMat (mRow_1, n, n);
    prnMat (mRow_2, n, n);
    prnVetor (vet, n);
    printf ("=================================\n\n");
#endif /* _DEBUG_ */
  
  // LIKWID_MARKER_START("multMatVet");
  likwid_markerStartRegion("multMatVet");
  multMatVet (mRow_1, vet, n, n, res);
  likwid_markerStopRegion("multMatVet");
  // LIKWID_MARKER_STOP("multMatVet");

  // LIKWID_MARKER_START("multMatMat");
  likwid_markerStartRegion("multMatMat");
  multMatMat (mRow_1, mRow_2, n, resMat);
  likwid_markerStopRegion("multMatMat");
  // LIKWID_MARKER_STOP("multMatMat");

#ifdef DEBUG
    prnVetor (res, n);
    prnMat (resMat, n, n);
#endif /* DEBUG */

  liberaVetor ((void*) mRow_1);
  liberaVetor ((void*) mRow_2);
  liberaVetor ((void*) resMat);
  liberaVetor ((void*) vet);
  liberaVetor ((void*) res);

  likwid_markerClose();
  // LIKWID_MARKER_CLOSE
  return 0;
}

