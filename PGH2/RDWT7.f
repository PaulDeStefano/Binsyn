      SUBROUTINE RDWT7(I,IWL,VI,PSI,SP,SMC,ERC,SMD,ERD,SME,ERE,SMF,ERF,  
     $SMT,SBT,ERT,VLT,ERR,PSINT,PSEXT,SURF1,SURF2,KCTRL,KU) 
C     VERSION OF 10/15/83      
      IMPLICIT DOUBLE PRECISION (A-H,O-Z)
  106 FORMAT (10I5)     
  108 FORMAT (5D22.13)   
      READ (KU,106,END=99) I,IWL,KCTRL
      READ (KU,108) VI,PSI,SP,SMC,ERC,SMD,ERD,SME,ERE,SMF,ERF,SMT,SBT,
     $ERT,VLT,ERR,PSINT,PSEXT,SURF1,SURF2
      RETURN     
   99 CALL PMDSTOP
      END 
