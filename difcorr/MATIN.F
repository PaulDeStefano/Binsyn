      SUBROUTINE MATIN(A,N,B,M,DETERM)
      IMPLICIT DOUBLE PRECISION (A-H,O-Z)
      DIMENSION IPIVOT(50),A(50,50),B(50,1),INDEX(50,2),PIVOT(50)

      EQUIVALENCE (IROW,JROW),(ICOLUM,JCOLUM),(AMAX,T,SWAP)
C     INITIALIZATION
      DETERM=1.0D0
      DO 20 J=1,N
   20 IPIVOT(J)=0
      DO 550 I=1,N
C     SEARCH FOR PIVOT ELEMENT
      AMAX=0.0D0
      DO 105 J=1,N
      IF (IPIVOT(J).EQ.1) GO TO 105
      DO 100 K=1,N
      IF (IPIVOT(K)-1) 80, 100, 740
   80 IF (DABS(AMAX)-DABS(A(J,K))) 85, 100, 100
   85 IROW=J
      ICOLUM=K
      AMAX=A(J,K)
  100 CONTINUE
  105 CONTINUE
      IPIVOT(ICOLUM)=IPIVOT(ICOLUM)+1
C     INTERCHANGE ROWS TO PUT PIVOT ELEMENT ON DIAGONAL
      IF (IROW-ICOLUM) 140, 260, 140
  140 DETERM=-DETERM
      DO 200 L=1,N
      SWAP=A(IROW,L)
      A(IROW,L)=A(ICOLUM,L)
  200 A(ICOLUM,L)=SWAP
      IF (M) 260, 260, 210
  210 DO 250 L=1,M
      SWAP=B(IROW,L)
      B(IROW,L)=B(ICOLUM,L)
  250 B(ICOLUM,L)=SWAP
  260 INDEX(I,1)=IROW
      INDEX(I,2)=ICOLUM
      PIVOT(I)=A(ICOLUM,ICOLUM)
      DETERM=DETERM*PIVOT(I)
C     DIVIDE PIVOT ROW BY PIVOT ELEMENT
      A(ICOLUM,ICOLUM)=1.0D0
      DO 350 L=1,N
  350 A(ICOLUM,L)=A(ICOLUM,L)/PIVOT(I)
      DO 370 L=1,M
  370 B(ICOLUM,L)=B(ICOLUM,L)/PIVOT(I)
C     REDUCE NON-PIVOT ROWS
      DO 550 L1=1,N
      IF (L1-ICOLUM) 400, 550, 400
  400 T=A(L1,ICOLUM)
      A(L1,ICOLUM)=0.0D0
      DO 450 L=1,N
  450 A(L1,L)=A(L1,L)-A(ICOLUM,L)*T
      DO 500 L=1,M
  500 B(L1,L)=B(L1,L)-B(ICOLUM,L)*T
  550 CONTINUE
C     INTERCHANGE COLUMNS
      DO 710 I=1,N
      L=N+1-I
      IF (INDEX(L,1)-INDEX(L,2)) 630, 710, 630
  630 JROW=INDEX(L,1)
      JCOLUM=INDEX(L,2)
      DO 705 K=1,N
      SWAP=A(K,JROW)
      A(K,JROW)=A(K,JCOLUM)
  705 A(K,JCOLUM)=SWAP
  710 CONTINUE
  740 RETURN
      END
