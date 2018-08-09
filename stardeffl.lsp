; ********************************************************************************************************************************
;  Created  1-NOV-1989 13:58:52 by VAX SDL V3.1-7      Source:  1-NOV-1989 13:40:31 LISPW$1:[FOSTER.SDL.FILES]STARDEFFL.SDI;2 
; ********************************************************************************************************************************
;;;(proclaim '(optimize (speed 3) (safety 0)))
 
;;;*** MODULE $FDLDEF ***
      
;;;+
;;; FDL CALL INTERFACE CONTROL FLAGS
;;;-
 (defconstant FDL$M_SIGNAL #b00000000000000000000000000000001)
 (defconstant FDL$M_FDL_STRING #b00000000000000000000000000000010)
 (defconstant FDL$M_DEFAULT_STRING #b00000000000000000000000000000100)
 (defconstant FDL$M_FULL_OUTPUT #b00000000000000000000000000001000)
 (defconstant FDL$M_$CALLBACK #b00000000000000000000000000010000)
            
(define-alien-structure (FDL    ( :conc-name nil))
    ; SIGNAL ERRORS, DON'T RETURN
    (FDL$V_SIGNAL :unsigned-integer #.(+ 0 0/8) #.(+ 0 1/8)) 
    ; MAIN FDL SPEC IS A CHAR STRING
    (FDL$V_FDL_STRING :unsigned-integer #.(+ 0 1/8) #.(+ 0 2/8)) 
    ; DEFAULT FDL SPEC IS A CHAR STRING
    (FDL$V_DEFAULT_STRING :unsigned-integer #.(+ 0 2/8) #.(+ 0 3/8)) 
    ; PRODUCE A 'COMPLETE' FDL SPEC
    (FDL$V_FULL_OUTPUT :unsigned-integer #.(+ 0 3/8) #.(+ 0 4/8)) 
    ; USED BY EDF ON INPUT (DEC ONLY)
    (FDL$V_$CALLBACK :unsigned-integer #.(+ 0 4/8) #.(+ 0 5/8)) 
    (FDL$V_fill_0 :unsigned-integer #.(+ 0 5/8) #.(+ 0 8/8)) )
      
 
;;;*** MODULE $FIBDEF ***
      
;;;----
;;;
;;; LAYOUT OF THE FILE IDENTIFICATION BLOCK (FIB)
;;;
;;;****
;;;
;;;        NOTE:        If the size of the FIB is changed the following must be changed
;;;                to reflect the change:
;;;
;;;                In Module:        [RMS.SRC]RMSFWADEF.SDL
;;;
;;;                Field:                FWA$T_FIBBUF
;;;
;;;                Constant:        FWA$C_FIBLEN
;;;
;;;                Both the field and constant must be GEQ to the size of
;;;                the FIB, i.e. FIB$C_LENGTH. FIB length is currently 64.
;;;
;;;****
;;;
 (defconstant FIB$M_NOWRITE #b00000000000000000000000000000001)
 (defconstant FIB$M_DLOCK #b00000000000000000000000000000010)
 (defconstant FIB$M_BLK_LOCK #b00000000000000000000000000000100)
 (defconstant FIB$M_SPOOL #b00000000000000000000000000010000)
 (defconstant FIB$M_WRITECK #b00000000000000000000000000100000)
 (defconstant FIB$M_SEQONLY #b00000000000000000000000001000000)
 (defconstant FIB$M_WRITE #b00000000000000000000000100000000)
 (defconstant FIB$M_READCK #b00000000000000000000001000000000)
 (defconstant FIB$M_NOREAD #b00000000000000000000010000000000)
 (defconstant FIB$M_NOTRUNC #b00000000000000000000100000000000)
 (defconstant FIB$M_CONTROL #b00000000000000000001000000000000)
 (defconstant FIB$M_EXECUTE #b00000000000000010000000000000000)
 (defconstant FIB$M_PRSRV_ATR #b00000000000000100000000000000000)
 (defconstant FIB$M_RMSLOCK #b00000000000001000000000000000000)
 (defconstant FIB$M_WRITETHRU #b00000000000010000000000000000000)
 (defconstant FIB$M_NOLOCK #b00000000000100000000000000000000)
 (defconstant FIB$M_NORECORD #b00000000001000000000000000000000)
 (defconstant FIB$M_REWIND #b00000000000000000000000000001000)
 (defconstant FIB$M_CURPOS #b00000000000000000000000000010000)
 (defconstant FIB$M_UPDATE #b00000000000000000000000001000000)
 (defconstant FIB$K_ACCDATA 10)   ;  ABOVE DATA NECESSARY FOR ACCESS 
 (defconstant FIB$C_ACCDATA 10)   ;  ABOVE DATA NECESSARY FOR ACCESS 
 (defconstant FIB$K_DIRDATA 22)   ;  ABOVE DATA NECESSARY FOR DIRECTORY OPS 
 (defconstant FIB$C_DIRDATA 22)   ;  ABOVE DATA NECESSARY FOR DIRECTORY OPS 
 (defconstant FIB$M_ALLVER #b00000000000000000000000000001000)
 (defconstant FIB$M_ALLTYP #b00000000000000000000000000010000)
 (defconstant FIB$M_ALLNAM #b00000000000000000000000000100000)
 (defconstant FIB$M_WILD #b00000000000000000000000100000000)
 (defconstant FIB$M_NEWVER #b00000000000000000000001000000000)
 (defconstant FIB$M_SUPERSEDE #b00000000000000000000010000000000)
 (defconstant FIB$M_FINDFID #b00000000000000000000100000000000)
 (defconstant FIB$M_LOWVER #b00000000000000000100000000000000)
 (defconstant FIB$M_HIGHVER #b00000000000000001000000000000000)
 (defconstant FIB$M_ALCON #b00000000000000000000000000000001)
 (defconstant FIB$M_ALCONB #b00000000000000000000000000000010)
 (defconstant FIB$M_FILCON #b00000000000000000000000000000100)
 (defconstant FIB$M_ALDEF #b00000000000000000000000000001000)
 (defconstant FIB$M_ALLOCATR #b00000000000000000000000000010000)
 (defconstant FIB$M_EXTEND #b00000000000000000000000010000000)
 (defconstant FIB$M_TRUNC #b00000000000000000000000100000000)
 (defconstant FIB$M_NOHDREXT #b00000000000000000000001000000000)
 (defconstant FIB$M_MARKBAD #b00000000000000000000010000000000)
 (defconstant FIB$M_NOCHARGE #b00000000000000001000000000000000)
 (defconstant FIB$K_EXTDATA 32)   ;  ABOVE NECESSARY FOR BASIC FILE EXTENSION 
 (defconstant FIB$C_EXTDATA 32)   ;  ABOVE NECESSARY FOR BASIC FILE EXTENSION 
 (defconstant FIB$M_EXACT #b00000000000000000000000000000001)
 (defconstant FIB$M_ONCYL #b00000000000000000000000000000010)
 (defconstant FIB$C_CYL 1)   ;  CYLINDER ADDRESS SPECIFIED 
 (defconstant FIB$C_LBN 2)   ;  LBN SPECIFIED 
 (defconstant FIB$C_VBN 3)   ;  PROXIMATE VBN SPECIFIED 
 (defconstant FIB$C_RFI 4)   ;  RELATED FILE ID SPECIFIED 
 (defconstant FIB$K_ALCDATA 44)   ;  ABOVE DATA NECESSARY FOR PLACEMENT 
 (defconstant FIB$C_ALCDATA 44)   ;  ABOVE DATA NECESSARY FOR PLACEMENT 
 (defconstant FIB$M_ALT_REQ #b00000000000000000000000000000001)
 (defconstant FIB$M_ALT_GRANTED #b00000000000000000000000000000010)
 (defconstant FIB$M_DIRACL #b00000000000000000000000000000100)
 (defconstant FIB$M_PROPAGATE #b00000000000000000000000000001000)
 (defconstant FIB$K_LENGTH 64)
 (defconstant FIB$C_LENGTH 64)
            
(define-alien-structure (FIB    ( :conc-name nil))
    ; ACCESS CONTROL BITS 
    (FIB$L_ACCTL :unsigned-integer 0 4)
    ; NO OTHER WRITERS 
      (FIB$V_NOWRITE :unsigned-integer #.(+ 0 0/8) #.(+ 0 1/8)) 
    ; ENABLE DEACCESS LOCK 
      (FIB$V_DLOCK :unsigned-integer #.(+ 0 1/8) #.(+ 0 2/8)) 
    ; ENABLE RMS-11 BLOCK LOCKING 
      (FIB$V_BLK_LOCK :unsigned-integer #.(+ 0 2/8) #.(+ 0 3/8)) 
    ; UNUSED 
      (FIBDEF$$_FILL_1 :unsigned-integer #.(+ 0 3/8) #.(+ 0 4/8)) 
    ; SPOOL FILE ON CLOSE 
      (FIB$V_SPOOL :unsigned-integer #.(+ 0 4/8) #.(+ 0 5/8)) 
    ; ENABLE WRITE CHECK 
      (FIB$V_WRITECK :unsigned-integer #.(+ 0 5/8) #.(+ 0 6/8)) 
    ; SEQUENTIAL ONLY ACCESS 
      (FIB$V_SEQONLY :unsigned-integer #.(+ 0 6/8) #.(+ 0 7/8)) 
    ; SPARE 
      (FIBDEF$$_FILL_2 :unsigned-integer #.(+ 0 7/8) #.(+ 0 8/8)) 
    ; WRITE ACCESS 
      (FIB$V_WRITE :unsigned-integer #.(+ 0 8/8) #.(+ 0 9/8)) 
    ; ENABLE READ CHECK 
      (FIB$V_READCK :unsigned-integer #.(+ 0 9/8) #.(+ 0 10/8)) 
    ; NO OTHER READERS 
      (FIB$V_NOREAD :unsigned-integer #.(+ 0 10/8) #.(+ 0 11/8)) 
    ; FILE MAY NOT BE TRUNCATED 
      (FIB$V_NOTRUNC :unsigned-integer #.(+ 0 11/8) #.(+ 0 12/8)) 
    ; CONTROL ACCESS TO FILE
      (FIB$V_CONTROL :unsigned-integer #.(+ 0 12/8) #.(+ 0 13/8)) 
    ; SPARE 
      (FIBDEF$$_FILL_3 :unsigned-integer #.(+ 0 13/8) #.(+ 0 16/8)) 
    ; THE HIGH 8 BITS CANNOT BE COPIED
    ; INTO THE ACCESS MODE WORD IN THE WINDOW
    ; ACCESS FOR EXECUTE (USE EXECUTE PROTECTION) 
      (FIB$V_EXECUTE :unsigned-integer #.(+ 0 16/8) #.(+ 0 17/8)) 
    ; PRESERVE ORIGINAL ATTRIBUTES OF FILE 
      (FIB$V_PRSRV_ATR :unsigned-integer #.(+ 0 17/8) #.(+ 0 18/8)) 
    ; OPEN WITH RMS RECORD LOCKING 
      (FIB$V_RMSLOCK :unsigned-integer #.(+ 0 18/8) #.(+ 0 19/8)) 
    ; FORCE CACHE WRITE-THROUGH ON OPERATION 
      (FIB$V_WRITETHRU :unsigned-integer #.(+ 0 19/8) #.(+ 0 20/8)) 
    ; OVERRIDE ACCESS INTERLOCKS 
      (FIB$V_NOLOCK :unsigned-integer #.(+ 0 20/8) #.(+ 0 21/8)) 
    ; DO NOT RECORD FILE ACCESS 
      (FIB$V_NORECORD :unsigned-integer #.(+ 0 21/8) #.(+ 0 22/8)) 
    ; SPARE 
      (FIBDEF$$_FILL_4 :unsigned-integer #.(+ 0 22/8) #.(+ 0 24/8)) 
      (FIBDEF$$_FILL_5 :unsigned-integer #.(+ 0 0/8) #.(+ 0 3/8)) 
    ; REWIND TAPE 
      (FIB$V_REWIND :unsigned-integer #.(+ 0 3/8) #.(+ 0 4/8)) 
    ; CREATE AT CURRENT TAPE POSITION 
      (FIB$V_CURPOS :unsigned-integer #.(+ 0 4/8) #.(+ 0 5/8)) 
      (FIBDEF$$_FILL_6 :unsigned-integer #.(+ 0 5/8) #.(+ 0 6/8)) 
    ; UPDATE MODE (POSITION TO START OF FILE) 
      (FIB$V_UPDATE :unsigned-integer #.(+ 0 6/8) #.(+ 0 7/8)) 
      (FIB$V_fill_1 :unsigned-integer #.(+ 0 7/8) #.(+ 0 8/8)) 
      (FIBDEF$$_FILL_13 :signed-integer 0 1 :occurs 3)
    ; WINDOW SIZE 
      (FIB$B_WSIZE :signed-integer 3 4)
    ; FILE ID 
    (FIB$W_FID :unsigned-integer 4 6 :occurs 3)
    ; FILE NUMBER 
      (FIB$W_FID_NUM :unsigned-integer 4 6)
    ; FILE SEQUENCE NUMBER 
      (FIB$W_FID_SEQ :unsigned-integer 6 8)
    ; RELATIVE VOLUME NUMBER 
        (FIB$W_FID_RVN :unsigned-integer 8 10)
    ; SHORT FORM RVN 
          (FIB$B_FID_RVN :unsigned-integer 8 9)
    ; EXTENDED FILE NUMBER 
          (FIB$B_FID_NMX :unsigned-integer 9 10)
    ; DIRECTORY ID 
    (FIB$W_DID :unsigned-integer 10 12 :occurs 3)
    ; FILE NUMBER 
      (FIB$W_DID_NUM :unsigned-integer 10 12)
    ; FILE SEQUENCE NUMBER 
      (FIB$W_DID_SEQ :unsigned-integer 12 14)
    ; RELATIVE VOLUME NUMBER 
        (FIB$W_DID_RVN :unsigned-integer 14 16)
    ; SHORT FORM RVN 
          (FIB$B_DID_RVN :unsigned-integer 14 15)
    ; EXTENDED FILE NUMBER 
          (FIB$B_DID_NMX :unsigned-integer 15 16)
    ; WILD CARD CONTEXT 
  (FIB$L_WCC :unsigned-integer 16 20)
    ; NAME CONTROL BITS 
    (FIB$W_NMCTL :unsigned-integer 20 22)
      (FIBDEF$$_FILL_7 :unsigned-integer #.(+ 20 0/8) #.(+ 20 3/8)) 
    ; MATCH ALL VERSIONS 
      (FIB$V_ALLVER :unsigned-integer #.(+ 20 3/8) #.(+ 20 4/8)) 
    ; MATCH ALL TYPES 
      (FIB$V_ALLTYP :unsigned-integer #.(+ 20 4/8) #.(+ 20 5/8)) 
    ; MATCH ALL NAMES 
      (FIB$V_ALLNAM :unsigned-integer #.(+ 20 5/8) #.(+ 20 6/8)) 
      (FIBDEF$$_FILL_8 :unsigned-integer #.(+ 20 6/8) #.(+ 20 8/8)) 
    ; WILD CARDS IN FILE NAME 
      (FIB$V_WILD :unsigned-integer #.(+ 20 8/8) #.(+ 20 9/8)) 
    ; MAXIMIZE VERSION NUMBER 
      (FIB$V_NEWVER :unsigned-integer #.(+ 20 9/8) #.(+ 20 10/8)) 
    ; SUPERSEDE EXISTING FILE 
      (FIB$V_SUPERSEDE :unsigned-integer #.(+ 20 10/8) #.(+ 20 11/8)) 
    ; SEARCH FOR FILE ID 
      (FIB$V_FINDFID :unsigned-integer #.(+ 20 11/8) #.(+ 20 12/8)) 
      (FIBDEF$$_FILL_9 :unsigned-integer #.(+ 20 12/8) #.(+ 20 14/8)) 
    ; LOWER VERSION OF FILE EXISTS 
      (FIB$V_LOWVER :unsigned-integer #.(+ 20 14/8) #.(+ 20 15/8)) 
    ; HIGHER VERSION OF FILE EXISTS 
      (FIB$V_HIGHVER :unsigned-integer #.(+ 20 15/8) #.(+ 20 16/8)) 
    ; EXTEND CONTROL 
    (FIB$W_EXCTL :unsigned-integer 22 24)
    ; ALLOCATE CONTIGUOUS 
      (FIB$V_ALCON :unsigned-integer #.(+ 22 0/8) #.(+ 22 1/8)) 
    ; CONTIGUOUS BEST EFFORT 
      (FIB$V_ALCONB :unsigned-integer #.(+ 22 1/8) #.(+ 22 2/8)) 
    ; MARK FILE CONTIGUOUS 
      (FIB$V_FILCON :unsigned-integer #.(+ 22 2/8) #.(+ 22 3/8)) 
    ; ALLOCATE DEFAULT AMOUNT 
      (FIB$V_ALDEF :unsigned-integer #.(+ 22 3/8) #.(+ 22 4/8)) 
    ; PLACEMENT DATA PRESENT IN ATTRIBUTE LIST 
      (FIB$V_ALLOCATR :unsigned-integer #.(+ 22 4/8) #.(+ 22 5/8)) 
      (FIBDEF$$_FILL_10 :unsigned-integer #.(+ 22 5/8) #.(+ 22 7/8)) 
    ; ENABLE EXTENSION 
      (FIB$V_EXTEND :unsigned-integer #.(+ 22 7/8) #.(+ 22 8/8)) 
    ; ENABLE TRUNCATION 
      (FIB$V_TRUNC :unsigned-integer #.(+ 22 8/8) #.(+ 22 9/8)) 
    ; INHIBIT EXTENSION HEADERS 
      (FIB$V_NOHDREXT :unsigned-integer #.(+ 22 9/8) #.(+ 22 10/8)) 
    ; MARK BLOCKS BAD 
      (FIB$V_MARKBAD :unsigned-integer #.(+ 22 10/8) #.(+ 22 11/8)) 
      (FIBDEF$$_FILL_11 :unsigned-integer #.(+ 22 11/8) #.(+ 22 15/8)) 
    ; DON'T CHARGE DISKQUOTA 
      (FIB$V_NOCHARGE :unsigned-integer #.(+ 22 15/8) #.(+ 22 16/8)) 
    ; EXTEND SIZE 
  (FIB$L_EXSZ :unsigned-integer 24 28)
    ; EXTENSION VBN 
  (FIB$L_EXVBN :unsigned-integer 28 32)
    ; ALLOCATION OPTIONS 
    (FIB$B_ALOPTS :unsigned-integer 32 33)
    ; EXACT PLACEMENT REQUIRED 
      (FIB$V_EXACT :unsigned-integer #.(+ 32 0/8) #.(+ 32 1/8)) 
    ; PUT ALLOCATION ON ONE CYLINDER 
      (FIB$V_ONCYL :unsigned-integer #.(+ 32 1/8) #.(+ 32 2/8)) 
      (FIB$V_fill_2 :unsigned-integer #.(+ 32 2/8) #.(+ 32 8/8)) 
    ; ALLOCATION ALIGNMENT 
  (FIB$B_ALALIGN :unsigned-integer 33 34)
    ; ALLOCATION LOCATION 
    (FIB$W_ALLOC :unsigned-integer 34 36 :occurs 5)
    ; RELATED FILE ID 
        (FIB$W_LOC_FID :unsigned-integer 34 36 :occurs 3)
    ; RELATED FILE NUMBER 
          (FIB$W_LOC_NUM :unsigned-integer 34 36)
    ; FILE SEQUENCE NUMBER 
          (FIB$W_LOC_SEQ :unsigned-integer 36 38)
    ; RELATED RVN 
            (FIB$W_LOC_RVN :unsigned-integer 38 40)
    ; SHORT FORM RVN 
              (FIB$B_LOC_RVN :unsigned-integer 38 39)
    ; EXTENDED FILE NUMBER 
              (FIB$B_LOC_NMX :unsigned-integer 39 40)
    ; LOCATION ADDRESS (VBN, LBN, CYL) 
      (FIB$L_LOC_ADDR :pointer 40 44)
    ; DIRECTORY ENTRY VERSION LIMIT 
  (FIB$W_VERLIMIT :unsigned-integer 44 46)
    ; AGENTS ACCESS MODE
  (FIB$B_AGENT_MODE :unsigned-integer 46 47)
    ; RECOVERABLE-FACILITY CODE
  (FIB$B_RU_FACILITY :unsigned-integer 47 48)
    ; ACL CONTEXT FOR READ 
  (FIB$L_ACLCTX :unsigned-integer 48 52)
    ; RETURN STATUS FROM ACL OPERATION
  (FIB$L_ACL_STATUS :unsigned-integer 52 56)
    ; GENERAL STATUS LONGWORD
    (FIB$L_STATUS :unsigned-integer 56 60)
    ; ALTERNATE ACCESS REQUIRED
      (FIB$V_ALT_REQ :unsigned-integer #.(+ 56 0/8) #.(+ 56 1/8)) 
    ; ALTERNATE ACCESS GRANTED
      (FIB$V_ALT_GRANTED :unsigned-integer #.(+ 56 1/8) #.(+ 56 2/8)) 
    ; DO DIRECTORY ACL PROPAGATION
      (FIB$V_DIRACL :unsigned-integer #.(+ 56 2/8) #.(+ 56 3/8)) 
    ; DO PROPAGATION ON ENTER
      (FIB$V_PROPAGATE :unsigned-integer #.(+ 56 3/8) #.(+ 56 4/8)) 
      (FIB$V_fill_3 :unsigned-integer #.(+ 56 4/8) #.(+ 56 8/8)) 
    ; ALTERNATE ACCESS MASK
  (FIB$L_ALT_ACCESS :unsigned-integer 60 64))    ; ALTERNATE ACCESS MASK
      
;;; THE HIGH 8 BITS CANNOT BE COPIED
;;; INTO THE ACCESS MODE WORD IN THE WINDOW
 (defconstant FIB$C_REWINDVOL 1)   ;  REWIND VOLUME SET 
 (defconstant FIB$C_POSEND 2)   ;  POSITION TO END OF VOLUME SET 
 (defconstant FIB$C_NEXTVOL 3)   ;  FORCE NEXT VOLUME 
 (defconstant FIB$C_SPACE 4)   ;  SPACE MAGNETIC TAPE 
 (defconstant FIB$C_ILLEGAL 5)   ;  
 (defconstant FIB$C_REWINDFIL 6)   ;  REWIND FILE 
 (defconstant FIB$C_LOCK_VOL 7)   ;  LOCK VOLUME AGAINST ALLOCATION 
 (defconstant FIB$C_UNLK_VOL 8)   ;  UNLOCK VOLUME 
;;; QUOTA FILE OPERATIONS
 (defconstant FIB$C_ENA_QUOTA 9)   ;  ENABLE QUOTA FILE 
 (defconstant FIB$C_DSA_QUOTA 10)   ;  DISABLE QUOTA FILE 
 (defconstant FIB$C_ADD_QUOTA 11)   ;  ADD QUOTA FILE ENTRY 
 (defconstant FIB$C_EXA_QUOTA 12)   ;  EXAMINE QUOTA FILE ENTRY 
 (defconstant FIB$C_MOD_QUOTA 13)   ;  MODIFY QUOTA FILE ENTRY 
 (defconstant FIB$C_REM_QUOTA 14)   ;  REMOVE QUOTA FILE ENTRY 
 (defconstant FIB$C_USEREOT 15)   ;  ENABLE USER END OF TAPE HANDLING 
 (defconstant FIB$C_REMAP 16)   ;  REMAP FILE WINDOW 
 (defconstant FIB$C_CLSEREXCP 17)   ;  ALLOW THE USER TO CLEAR A SERIOUS EXCP FROM A TAPE DRIVE
 (defconstant FIB$C_FLUSH_CACHE 18)   ;  FLUSH SELECTED CACHE
 (defconstant FIB$C_FORCE_MV 19)   ;  FORCE MOUNT VERIFICATION TO OCCUR
 (defconstant FIB$K_MTALEN 28)   ;  LENGTH OF MTAACP DATA 
 (defconstant FIB$C_MTALEN 28)   ;  LENGTH OF MTAACP DATA 
;;;
 (defconstant FIB$C_FID_CACHE 1)
 (defconstant FIB$C_EXTENT_CACHE 2)
 (defconstant FIB$C_QUOTA_CACHE 3)
;;;
 (defconstant FIB$M_ALL_MEM #b00000000000000000000000000000001)
 (defconstant FIB$M_ALL_GRP #b00000000000000000000000000000010)
 (defconstant FIB$M_MOD_USE #b00000000000000000000000000000100)
 (defconstant FIB$M_MOD_PERM #b00000000000000000000000000001000)
 (defconstant FIB$M_MOD_OVER #b00000000000000000000000000010000)
            
(define-alien-structure (FIB1    ( :conc-name nil))
  (FIBDEF$$_FILL_14 :signed-integer 0 1 :occurs 22)
    ; ACP CONTROL FUNCTION 
  (FIB$W_CNTRLFUNC :unsigned-integer 22 24)
    ; DEFINE ACP CONTROL FUNCTION CODES
    ;
    ; ACP CONTROL FUNCTION VALUE PARAMETER 
    (FIB$L_CNTRLVAL :unsigned-integer 24 28)
    ; CACHE IDENTIFIER CODES FOR FLUSH_CACHE
    ;
    ; CONTROL BITS FOR QUOTA FILE OPERATIONS
    ;
    ; MATCH ALL MEMBER NUMBERS 
      (FIB$V_ALL_MEM :unsigned-integer #.(+ 24 0/8) #.(+ 24 1/8)) 
    ; MATCH ALL GROUP NUMBERS 
      (FIB$V_ALL_GRP :unsigned-integer #.(+ 24 1/8) #.(+ 24 2/8)) 
    ; MODIFY USAGE DATA 
      (FIB$V_MOD_USE :unsigned-integer #.(+ 24 2/8) #.(+ 24 3/8)) 
    ; MODIFY PERMANENT QUOTA 
      (FIB$V_MOD_PERM :unsigned-integer #.(+ 24 3/8) #.(+ 24 4/8)) 
    ; MODIFY OVERDRAFT LIMIT 
      (FIB$V_MOD_OVER :unsigned-integer #.(+ 24 4/8) #.(+ 24 5/8)) 
      (FIB$V_fill_4 :unsigned-integer #.(+ 24 5/8) #.(+ 24 8/8)) )
      
;;; DEFINE ACP CONTROL FUNCTION CODES
;;;
 
;;;*** MODULE $FIDDEF ***
      
;;;
;;; STRUCTURE OF A FILE ID (FID)
;;;
 (defconstant FID$K_LENGTH 6)
 (defconstant FID$C_LENGTH 6)
 (defconstant FID$C_INDEXF 1)   ;  INDEX FILE 
 (defconstant FID$C_BITMAP 2)   ;  STORAGE MAP FILE 
 (defconstant FID$C_BADBLK 3)   ;  BAD BLOCK FILE 
 (defconstant FID$C_MFD 4)   ;  MASTER FILE DIRECTORY 
 (defconstant FID$C_CORIMG 5)   ;  CORE IMAGE FILE 
 (defconstant FID$C_VOLSET 6)   ;  VOLUME SET LIST FILE 
 (defconstant FID$C_CONTIN 7)   ;  STANRARD CONTINUATION FILE 
 (defconstant FID$C_BACKUP 8)   ;  BACKUP LOG FILE 
 (defconstant FID$C_BADLOG 9)   ;  BAD BLOCK LOG FILE 
 (defconstant FID$C_FREFIL 10)   ;  FREE SPACE FILE 
            
(define-alien-structure (FID    ( :conc-name nil))
    ; FILE NUMBER 
  (FID$W_NUM :unsigned-integer 0 2)
    ; FILE SEQUENCE NUMBER 
  (FID$W_SEQ :unsigned-integer 2 4)
    ; RELATIVE VOLUME NUMBER 
    (FID$W_RVN :unsigned-integer 4 6)
    ; BYTE FORM OF RVN 
      (FID$B_RVN :unsigned-integer 4 5)
      (FID$B_NMX :unsigned-integer 5 6))    ; FILE NUMBER EXTENSION 
    ; FILE ID'S OF THE RESERVED FILES
      
 
;;;*** MODULE $IACDEF ***
      
;;;+
;;; IMAGE ACTIVATION CONTROL FLAGS
;;;-
 (defconstant IAC$M_NOACT #b00000000000000000000000000000001)
 (defconstant IAC$M_WRITABLE #b00000000000000000000000000000010)
 (defconstant IAC$M_SHAREABLE #b00000000000000000000000000000100)
 (defconstant IAC$M_PRIVILEGE #b00000000000000000000000000001000)
 (defconstant IAC$M_MERGE #b00000000000000000000000000010000)
 (defconstant IAC$M_EXPREG #b00000000000000000000000000100000)
 (defconstant IAC$M_P1MERGE #b00000000000000000000000001000000)
 (defconstant IAC$M_LASTCLU #b00000000000000000000000100000000)
 (defconstant IAC$M_LIM #b00000000000000000000001000000000)
 (defconstant IAC$M_RETRY #b00000000000000000000010000000000)
 (defconstant IAC$M_NOCMKRNL #b00000000000000000000100000000000)
 (defconstant IAC$M_SEQDEVLOD #b00000000000000000001000000000000)
 (defconstant IAC$M_XLINKER #b00000000000000000010000000000000)
 (defconstant IAC$M_KP_RESHDR #b00000000000000000100000000000000)
 (defconstant IAC$M_IS_RESHDR #b00000000000000001000000000000000)
 (defconstant IAC$M_NOTSHARED #b00000000000000010000000000000000)
 (defconstant IAC$M_GBLCLUSTR #b00000000000000100000000000000000)
 (defconstant IAC$M_SHMIDENT #b00000000000001000000000000000000)
 (defconstant IAC$M_NOCOPY #b00000000000010000000000000000000)
 (defconstant IAC$M_P1MERG_P0 #b00000000000100000000000000000000)
 (defconstant IAC$M_SETVECTOR #b00000000001000000000000000000000)
 (defconstant IAC$C_LARGEST 6)   ; LARGEST FLAG CALLER MAY SPECIFY 
            
(define-alien-structure (IAC    ( :conc-name nil))
    ;DO NOT ACTIVATE THE IMAGE (FOR INSTALL) 
    (IAC$V_NOACT :unsigned-integer #.(+ 0 0/8) #.(+ 0 1/8)) 
    ;MAKE IMAGE FILE WRITABLE 
    (IAC$V_WRITABLE :unsigned-integer #.(+ 0 1/8) #.(+ 0 2/8)) 
    ;ACT. SHAREABLE IMAGE FOR EXECUTABLE IMG 
    (IAC$V_SHAREABLE :unsigned-integer #.(+ 0 2/8) #.(+ 0 3/8)) 
    ;ACT. SHARE. IMG FOR PRIV EXECUTABLE IMG 
    (IAC$V_PRIVILEGE :unsigned-integer #.(+ 0 3/8) #.(+ 0 4/8)) 
    ;ACT 2ND EXECUTABLE IMG INTO ADR SPACE 
    (IAC$V_MERGE :unsigned-integer #.(+ 0 4/8) #.(+ 0 5/8)) 
    ;MAP IMAGE INTO NEXT FREE VA SPACE 
    (IAC$V_EXPREG :unsigned-integer #.(+ 0 5/8) #.(+ 0 6/8)) 
    ;P1 MERGED ACTIVATION (LEGAL INPUT FLAG) 
    (IAC$V_P1MERGE :unsigned-integer #.(+ 0 6/8) #.(+ 0 7/8)) 
    ;SPARE 
    (IACDEF$$_FILL_1 :unsigned-integer #.(+ 0 7/8) #.(+ 0 8/8)) 
    ;LAST CLUSTER FLAG 
    (IAC$V_LASTCLU :unsigned-integer #.(+ 0 8/8) #.(+ 0 9/8)) 
    ;LINKABLE IMAGE 
    (IAC$V_LIM :unsigned-integer #.(+ 0 9/8) #.(+ 0 10/8)) 
    ;RETRY IMAGE ACTIVATION 
    (IAC$V_RETRY :unsigned-integer #.(+ 0 10/8) #.(+ 0 11/8)) 
    ;SHUT OFF CMKRNL,CMEXEC-SYSVER DIFF 
    (IAC$V_NOCMKRNL :unsigned-integer #.(+ 0 11/8) #.(+ 0 12/8)) 
    ;LOADING FROM SEQUENTIAL DEVICE (NET) 
    (IAC$V_SEQDEVLOD :unsigned-integer #.(+ 0 12/8) #.(+ 0 13/8)) 
    ;CROSS LINKER FORMAT 
    (IAC$V_XLINKER :unsigned-integer #.(+ 0 13/8) #.(+ 0 14/8)) 
    ;MAKE IMAGE HEADER RESIDENT 
    (IAC$V_KP_RESHDR :unsigned-integer #.(+ 0 14/8) #.(+ 0 15/8)) 
    ;IMAGE HEADER IS RESIDENT 
    (IAC$V_IS_RESHDR :unsigned-integer #.(+ 0 15/8) #.(+ 0 16/8)) 
    ;DO NOT SET IS_SHARED IN KFI ENTRY 
    (IAC$V_NOTSHARED :unsigned-integer #.(+ 0 16/8) #.(+ 0 17/8)) 
    ;CURRENTLY PROCESSING GBL ISD CLUSTER 
    (IAC$V_GBLCLUSTR :unsigned-integer #.(+ 0 17/8) #.(+ 0 18/8)) 
    ;SHARED MEMORY IDENT USED FOR GBL SEC 
    (IAC$V_SHMIDENT :unsigned-integer #.(+ 0 18/8) #.(+ 0 19/8)) 
    ;NO PRIVATE COPY OF SECTION IN EXEC IMG 
    (IAC$V_NOCOPY :unsigned-integer #.(+ 0 19/8) #.(+ 0 20/8)) 
    ;P1 MERGED ACTIVATION WITH P0 ADDRESS 
    (IAC$V_P1MERG_P0 :unsigned-integer #.(+ 0 20/8) #.(+ 0 21/8)) 
    ; RANGE (INTERNAL FLAG ONLY)
    ;SIGNAL ATLERNATE ENTRY TO SET VECTORS 
    (IAC$V_SETVECTOR :unsigned-integer #.(+ 0 21/8) #.(+ 0 22/8)) 
    (IAC$V_fill_5 :unsigned-integer #.(+ 0 22/8) #.(+ 0 24/8)) )
      
 
;;;*** MODULE $IODEF ***
      
;;;+
;;; I/O FUNCTION CODE DEFINITIONS
;;;-
;;;
;;; *** START PHYSICAL I/O FUNCTION CODES ***
;;;
 (defconstant IO$_NOP 0)   ; NO OPERATION 
 (defconstant IO$_UNLOAD 1)   ; UNLOAD DRIVE 
 (defconstant IO$_LOADMCODE 1)   ; LOAD MICROCODE 
 (defconstant IO$_SEEK 2)   ; SEEK CYLINDER 
 (defconstant IO$_SPACEFILE 2)   ; SPACE FILES 
 (defconstant IO$_STARTMPROC 2)   ; START MICROPROCESSOR 
 (defconstant IO$_RECAL 3)   ; RECALIBRATE DRIVE 
 (defconstant IO$_STOP 3)   ; STOP 
 (defconstant IO$_DRVCLR 4)   ; DRIVE CLEAR 
 (defconstant IO$_INITIALIZE 4)   ; INITIALIZE 
 (defconstant IO$_RELEASE 5)   ; RELEASE PORT 
 (defconstant IO$_SETCLOCKP 5)   ; SET CLOCK (PHYSICAL) 
 (defconstant IO$_OFFSET 6)   ; OFFSET READ HEADS 
 (defconstant IO$_ERASETAPE 6)   ; ERASE TAPE 
 (defconstant IO$_STARTDATAP 6)   ; START DATA TRANSFER (PHYSICAL) 
 (defconstant IO$_RETCENTER 7)   ; RETURN TO CENTERLINE 
 (defconstant IO$_QSTOP 7)   ; QUEUE STOP REQUEST 
 (defconstant IO$_PACKACK 8)   ; PACK ACKNOWLEDGE 
 (defconstant IO$_SEARCH 9)   ; SEARCH FOR SECTOR 
 (defconstant IO$_SPACERECORD 9)   ; SPACE RECORDS 
 (defconstant IO$_READRCT 9)   ; READ REPLACEMENT & CACHING TABLE
 (defconstant IO$_WRITECHECK 10)   ; WRITE CHECK DATA 
 (defconstant IO$_WRITEPBLK 11)   ; WRITE PHYSICAL BLOCK 
 (defconstant IO$_READPBLK 12)   ; READ PHYSICAL BLOCK 
 (defconstant IO$_WRITEHEAD 13)   ; WRITE HEADER AND DATA 
 (defconstant IO$_RDSTATS 13)   ; READ STATISTICS 
 (defconstant IO$_CRESHAD 13)   ; CREATE A SHADOW SET
 (defconstant IO$_READHEAD 14)   ; READ HEADER AND DATA 
 (defconstant IO$_ADDSHAD 14)   ; ADD MEMBER TO SHADOW SET
 (defconstant IO$_WRITETRACKD 15)   ; WRITE TRACK DATA 
 (defconstant IO$_COPYSHAD 15)   ; PERFORM SHADOW SET COPY OPERATIONS
 (defconstant IO$_READTRACKD 16)   ; READ TRACK DATA 
 (defconstant IO$_REMSHAD 16)   ; REMOVE MEMBER FROM SHADOW SET
 (defconstant IO$_AVAILABLE 17)   ; AVAILABLE (DISK AND TAPE CLASS) 
 (defconstant IO$_SETPRFPATH 18)   ; SET PREFERRED PATH
 (defconstant IO$_DISPLAY 19)   ; MSCP/TMSCP VOLUME LABEL DISPLAY
 (defconstant IO$_DSE 21)   ; DATA SECURITY ERASE (AND REWIND) 
 (defconstant IO$_REREADN 22)   ; REREAD NEXT 
 (defconstant IO$_REREADP 23)   ; REREAD PREVIOUS 
 (defconstant IO$_WRITERET 24)   ; WRITE RETRY 
 (defconstant IO$_WRITECHECKH 24)   ; WRITE CHECK HEADER AND DATA 
 (defconstant IO$_READPRESET 25)   ; READIN PRESET 
 (defconstant IO$_STARTSPNDL 25)   ; START SPINDLE 
 (defconstant IO$_SETCHAR 26)   ; SET CHARACTERISTICS 
 (defconstant IO$_SENSECHAR 27)   ; SENSE TAPE CHARACTERISTICS 
 (defconstant IO$_WRITEMARK 28)   ; WRITE TAPE MARK 
 (defconstant IO$_WRTTMKR 29)   ; WRITE TAPE MARK RETRY 
 (defconstant IO$_DIAGNOSE 29)   ; DIAGNOSE 
 (defconstant IO$_SHADMV 29)   ; PREFORM MOUNT VER. ON SHADOW SET
 (defconstant IO$_FORMAT 30)   ; FORMAT 
 (defconstant IO$_CLEAN 30)   ; CLEAN TAPE 
 (defconstant IO$_PHYSICAL 31)   ; HIGHEST PHYSICAL I/O FUNCTION CODE 
;;;
;;; *** START LOGICAL I/O FUNCTION CODES ***
;;;
 (defconstant IO$_WRITELBLK 32)   ; WRITE LOGICAL BLOCK 
 (defconstant IO$_READLBLK 33)   ; READ LOGICAL BLOCK 
 (defconstant IO$_REWINDOFF 34)   ; REWIND AND SET OFFLINE 
 (defconstant IO$_READRCTL 34)   ; READ RCT SECTOR ZERO
 (defconstant IO$_SETMODE 35)   ; SET MODE 
 (defconstant IO$_REWIND 36)   ; REWIND TAPE 
 (defconstant IO$_SKIPFILE 37)   ; SKIP FILES 
 (defconstant IO$_SKIPRECORD 38)   ; SKIP RECORDS 
 (defconstant IO$_SENSEMODE 39)   ; SENSE TAPE MODE 
 (defconstant IO$_WRITEOF 40)   ; WRITE END OF FILE 
 (defconstant IO$_TTY_PORT 41)   ; TERMINAL PORT FDT ROUTINE
 (defconstant IO$_FREECAP 41)   ; RETURN FREE CAPACITY
 (defconstant IO$_FLUSH 42)   ; FLUSH CONTROLLER CACHE
 (defconstant IO$_LOGICAL 47)   ; HIGHEST LOGICAL I/O FUNCTION CODE 
;;;
;;; *** START VIRTUAL I/O FUNCTION CODES
;;;
 (defconstant IO$_WRITEVBLK 48)   ; WRITE VIRTUAL BLOCK 
 (defconstant IO$_READVBLK 49)   ; READ VIRTUAL BLOCK 
 (defconstant IO$_ACCESS 50)   ; ACCESS FILE 
 (defconstant IO$_CREATE 51)   ; CREATE FILE 
 (defconstant IO$_DEACCESS 52)   ; DEACCESS FILE 
 (defconstant IO$_DELETE 53)   ; DELETE FILE 
 (defconstant IO$_MODIFY 54)   ; MODIFY FILE 
 (defconstant IO$_NETCONTROL 54)   ; X25 NETWORK CONTROL FUNCTION 
 (defconstant IO$_READPROMPT 55)   ; READ TERMINAL WITH PROMPT 
 (defconstant IO$_SETCLOCK 55)   ; SET CLOCK 
 (defconstant IO$_ACPCONTROL 56)   ; MISCELLANEOUS ACP CONTROL 
 (defconstant IO$_STARTDATA 56)   ; START DATA 
 (defconstant IO$_MOUNT 57)   ; MOUNT VOLUME 
 (defconstant IO$_TTYREADALL 58)   ;  TERMINAL READ PASSALL 
 (defconstant IO$_TTYREADPALL 59)   ;  TERM READ W/PROMPT PASSALL 
 (defconstant IO$_CONINTREAD 60)   ;  Connect to interrupt readonly 
 (defconstant IO$_CONINTWRITE 61)   ;  Connect to interrupt with write 
 (defconstant IO$_VIRTUAL 63)   ; HIGHEST VIRTUAL I/O FUNCTION 
;;;
;;; FUNCTION MODIFIER BIT DEFINITIONS
;;;
 (defconstant IO$M_FCODE #b00000000000000000000000000111111)
 (defconstant IO$M_FMODIFIERS #b00000000000000001111111111000000)
 (defconstant IO$M_INHERLOG #b00000000000000000000100000000000)
 (defconstant IO$M_ERASE #b00000000000000000000010000000000)
 (defconstant IO$M_ENCRYPT #b00000000000000000010000000000000)
 (defconstant IO$M_DATACHECK #b00000000000000000100000000000000)
 (defconstant IO$M_INHRETRY #b00000000000000001000000000000000)
 (defconstant IO$M_INHSEEK #b00000000000000000001000000000000)
 (defconstant IO$M_REVERSE #b00000000000000000000000001000000)
 (defconstant IO$M_NOWAIT #b00000000000000000000000010000000)
 (defconstant IO$M_INHEXTGAP #b00000000000000000001000000000000)
 (defconstant IO$M_MSCPMODIFS #b00000000000000000000000100000000)
 (defconstant IO$M_SHADOW #b00000000000000000000000001000000)
 (defconstant IO$M_LOCATE #b00000000000000000000000010000000)
 (defconstant IO$M_MSCP_FORMAT #b00000000000000000000000001000000)
 (defconstant IO$M_ALLHOSTS #b00000000000000000000000001000000)
 (defconstant IO$M_DISSOLVE #b00000000000000000000000010000000)
 (defconstant IO$M_NOCLEANUP #b00000000000000000000000100000000)
 (defconstant IO$M_SPINDOWN #b00000000000000000000000001000000)
 (defconstant IO$M_FORCEPATH #b00000000000000000000000001000000)
 (defconstant IO$M_COMMOD #b00000000000000000000000001000000)
 (defconstant IO$M_MOVETRACKD #b00000000000000000000000010000000)
 (defconstant IO$M_DIAGNOSTIC #b00000000000000000000000100000000)
 (defconstant IO$M_SKPSECINH #b00000000000000000000001000000000)
 (defconstant IO$M_DELDATA #b00000000000000000000000001000000)
 (defconstant IO$M_NOMRSP #b00000000000000000000000001000000)
 (defconstant IO$M_SWAP #b00000000000000000000000100000000)
 (defconstant IO$M_OPPOSITE #b00000000000000000000001000000000)
 (defconstant IO$M_CLSEREXCP #b00000000000000000000001000000000)
 (defconstant IO$M_ENAREP #b00000000000000000000000001000000)
 (defconstant IO$M_ACCESS #b00000000000000000000000001000000)
 (defconstant IO$M_CREATE #b00000000000000000000000010000000)
 (defconstant IO$M_DELETE #b00000000000000000000000100000000)
 (defconstant IO$M_MOUNT #b00000000000000000000001000000000)
 (defconstant IO$M_DMOUNT #b00000000000000000000010000000000)
 (defconstant IO$M_REMOUNT #b00000000000000000000100000000000)
 (defconstant IO$M_BINARY #b00000000000000000000000001000000)
 (defconstant IO$M_PACKED #b00000000000000000000000010000000)
 (defconstant IO$M_NOW #b00000000000000000000000001000000)
 (defconstant IO$M_READATTN #b00000000000000000000000010000000)
 (defconstant IO$M_WRTATTN #b00000000000000000000000100000000)
 (defconstant IO$M_SETPROT #b00000000000000000000001000000000)
 (defconstant IO$M_NORSWAIT #b00000000000000000000010000000000)
 (defconstant IO$M_NOECHO #b00000000000000000000000001000000)
 (defconstant IO$M_TIMED #b00000000000000000000000010000000)
 (defconstant IO$M_CVTLOW #b00000000000000000000000100000000)
 (defconstant IO$M_NOFILTR #b00000000000000000000001000000000)
 (defconstant IO$M_DSABLMBX #b00000000000000000000010000000000)
 (defconstant IO$M_PURGE #b00000000000000000000100000000000)
 (defconstant IO$M_TRMNOECHO #b00000000000000000001000000000000)
 (defconstant IO$M_REFRESH #b00000000000000000010000000000000)
 (defconstant IO$M_ESCAPE #b00000000000000000100000000000000)
 (defconstant IO$M_EXTEND #b00000000000000001000000000000000)
 (defconstant IO$M_CANCTRLO #b00000000000000000000000001000000)
 (defconstant IO$M_ENABLMBX #b00000000000000000000000010000000)
 (defconstant IO$M_NOFORMAT #b00000000000000000000000100000000)
 (defconstant IO$M_BREAKTHRU #b00000000000000000000001000000000)
 (defconstant IO$M_NEWLINE #b00000000000000000000010000000000)
 (defconstant IO$M_TYPEAHDCNT #b00000000000000000000000001000000)
 (defconstant IO$M_MAINT #b00000000000000000000000001000000)
 (defconstant IO$M_CTRLYAST #b00000000000000000000000010000000)
 (defconstant IO$M_CTRLCAST #b00000000000000000000000100000000)
 (defconstant IO$M_HANGUP #b00000000000000000000001000000000)
 (defconstant IO$M_OUTBAND #b00000000000000000000010000000000)
 (defconstant IO$M_TT_CONNECT #b00000000000000000000100000000000)
 (defconstant IO$M_TT_DISCON #b00000000000000000001000000000000)
 (defconstant IO$M_TT_PROCESS #b00000000000000000010000000000000)
 (defconstant IO$M_BRDCST #b00000000000000000100000000000000)
 (defconstant IO$M_LOOP #b00000000000000000000000010000000)
 (defconstant IO$M_UNLOOP #b00000000000000000000000100000000)
 (defconstant IO$M_LINE_OFF #b00000000000000000000001000000000)
 (defconstant IO$M_SET_MODEM #b00000000000000000000010000000000)
 (defconstant IO$M_LINE_ON #b00000000000000000000100000000000)
 (defconstant IO$M_LOOP_EXT #b00000000000000000001000000000000)
 (defconstant IO$M_AUTXOF_ENA #b00000000000000000010000000000000)
 (defconstant IO$M_AUTXOF_DIS #b00000000000000000100000000000000)
 (defconstant IO$M_INCLUDE #b00000000000000000000100000000000)
 (defconstant IO$M_TT_ABORT #b00000000000000000001000000000000)
 (defconstant IO$M_INTERRUPT #b00000000000000000000000001000000)
 (defconstant IO$M_MULTIPLE #b00000000000000000000000010000000)
 (defconstant IO$M_LOCKBUF #b00000000000000000000000100000000)
 (defconstant IO$M_NOBLOCK #b00000000000000000000001000000000)
 (defconstant IO$M_ABORT #b00000000000000000000000100000000)
 (defconstant IO$M_SYNCH #b00000000000000000000001000000000)
 (defconstant IO$M_RESPONSE #b00000000000000000000000001000000)
 (defconstant IO$M_STARTUP #b00000000000000000000000001000000)
 (defconstant IO$M_SHUTDOWN #b00000000000000000000000010000000)
 (defconstant IO$M_ATTNAST #b00000000000000000000000100000000)
 (defconstant IO$M_CTRL #b00000000000000000000001000000000)
 (defconstant IO$M_RD_MEM #b00000000000000000000000001000000)
 (defconstant IO$M_RD_MODEM #b00000000000000000000000010000000)
 (defconstant IO$M_RD_COUNT #b00000000000000000000000100000000)
 (defconstant IO$M_CLR_COUNT #b00000000000000000000010000000000)
 (defconstant IO$K_SRRUNOUT 0)   ;  Send or rcv until cnt runout 
 (defconstant IO$K_PTPBSC 8192)   ;  Point to point BSC control 
 (defconstant IO$K_LOOPTEST 57344)   ;  Loop test 
;;; X25 driver WRITEBLK function modifier bits.
 (defconstant IO$M_MORE #b00000000000000000000000001000000)
 (defconstant IO$M_QUALIFIED #b00000000000000000000000010000000)
 (defconstant IO$M_REDIRECT #b00000000000000000000000001000000)
 (defconstant IO$M_ACCEPT #b00000000000000000000000010000000)
 (defconstant IO$M_SETEVF #b00000000000000000000000001000000)
 (defconstant IO$M_WORD #b00000000000000000000000001000000)
 (defconstant IO$M_SETFNCT #b00000000000000000000001000000000)
 (defconstant IO$M_DATAPATH #b00000000000000000000010000000000)
 (defconstant IO$M_CYCLE #b00000000000000000001000000000000)
 (defconstant IO$M_RESET #b00000000000000000010000000000000)
 (defconstant IO$M_SETCUADR #b00000000000000000000000100000000)
 (defconstant IO$M_SETBSIZE #b00000000000000000000001000000000)
 (defconstant IO$M_SETPOOLSZ #b00000000000000000000010000000000)
 (defconstant IO$M_SETENQCNT #b00000000000000000000100000000000)
 (defconstant IO$M_CLEAR #b00000000000000000001000000000000)
 (defconstant IO$M_LPBEXT #b00000000000000000010000000000000)
 (defconstant IO$M_LPBINT #b00000000000000000100000000000000)
 (defconstant IO$M_READCSR #b00000000000000001000000000000000)
 (defconstant IO$M_NOCTSWAIT #b00000000000000000000000001000000)
 (defconstant IO$M_SLAVLOOP #b00000000000000000000000010000000)
 (defconstant IO$M_NODSRWAIT #b00000000000000000000000100000000)
 (defconstant IO$M_MAINTLOOP #b00000000000000000000001000000000)
 (defconstant IO$M_LASTBLOCK #b00000000000000000000010000000000)
 (defconstant IO$M_INTCLOCK #b00000000000000000001000000000000)
 (defconstant IO$M_LT_CONNECT #b00000000000000000000000001000000)
 (defconstant IO$M_LT_DISCON #b00000000000000000000000010000000)
 (defconstant IO$M_LT_READPORT #b00000000000000000000000100000000)
 (defconstant IO$M_LT_MAP_PORT #b00000000000000000000001000000000)
 (defconstant IO$M_LT_RATING #b00000000000000000000010000000000)
 (defconstant IO$M_LT_SOL_INFO #b00000000000000000000100000000000)
 (defconstant IO$M_LT_RCV_INFO #b00000000000000000001000000000000)
 (defconstant IO$M_LT_MAP_FILLER #b00000000000000000000000000000001)
 (defconstant IO$M_LT_MAP_NODNAM #b00000000000000000000000000000010)
 (defconstant IO$M_LT_MAP_PORNAM #b00000000000000000000000000000100)
 (defconstant IO$M_LT_MAP_SRVNAM #b00000000000000000000000000001000)
 (defconstant IO$M_LT_MAP_LNKNAM #b00000000000000000000000000010000)
 (defconstant IO$M_LT_MAP_NETADR #b00000000000000000000000000100000)
            
(define-alien-structure (IO    ( :conc-name nil))
    ; Function Code Field
    (IO$V_FCODE :unsigned-integer #.(+ 0 0/8) #.(+ 0 6/8)) 
    ; Function Modifiers Field
    (IO$V_FMODIFIERS :unsigned-integer #.(+ 0 6/8) #.(+ 0 16/8)) 
    ; Function modifiers common to all drivers which do error logging
    (IO$v_fcode_fill :unsigned-integer #.(+ 0 0/8) #.(+ 0 6/8)) 
    (IO$v_filler :unsigned-integer #.(+ 0 6/8) #.(+ 0 11/8)) 
    ; Inhibit error logging
    (IO$V_INHERLOG :unsigned-integer #.(+ 0 11/8) #.(+ 0 12/8)) 
    (IO$V_fill_6 :unsigned-integer #.(+ 0 12/8) #.(+ 0 16/8)) 
    ; General disk and tape function code modifiers
    (IO$v_fcode_fill :unsigned-integer #.(+ 0 0/8) #.(+ 0 6/8)) 
    (IO$v_reserved_for_device_dependent :unsigned-integer #.(+ 0 6/8) #.(+ 0 10/8)) 
    ; Erase data
    (IO$V_ERASE :unsigned-integer #.(+ 0 10/8) #.(+ 0 11/8)) 
    ; IO$M_INHERLOG
    (IO$v_filler :unsigned-integer #.(+ 0 11/8) #.(+ 0 12/8)) 
    (IO$v_reserved_for_device_dependent :unsigned-integer #.(+ 0 12/8) #.(+ 0 13/8)) 
    ; Encryption
    (IO$V_ENCRYPT :unsigned-integer #.(+ 0 13/8) #.(+ 0 14/8)) 
    ; Write check data after transfer
    (IO$V_DATACHECK :unsigned-integer #.(+ 0 14/8) #.(+ 0 15/8)) 
    ; Inhibit error retry
    (IO$V_INHRETRY :unsigned-integer #.(+ 0 15/8) #.(+ 0 16/8)) 
    ; General disk function code modifiers
    (IO$v_fcode_fill :unsigned-integer #.(+ 0 0/8) #.(+ 0 6/8)) 
    (IO$v_reserved_for_device_dependent :unsigned-integer #.(+ 0 6/8) #.(+ 0 12/8)) 
    ; Inhibit implied seek on physical functions
    (IO$V_INHSEEK :unsigned-integer #.(+ 0 12/8) #.(+ 0 13/8)) 
    (IO$V_fill_7 :unsigned-integer #.(+ 0 13/8) #.(+ 0 16/8)) 
    ; General tape function code modifiers
    (IO$v_fcode_fill :unsigned-integer #.(+ 0 0/8) #.(+ 0 6/8)) 
    ; Reverse operation
    (IO$V_REVERSE :unsigned-integer #.(+ 0 6/8) #.(+ 0 7/8)) 
    ; No wait for rewind to complete
    (IO$V_NOWAIT :unsigned-integer #.(+ 0 7/8) #.(+ 0 8/8)) 
    (IO$v_reserved_for_device_dependent :unsigned-integer #.(+ 0 8/8) #.(+ 0 12/8)) 
    ; Inhibit extended inter-record gap 
    (IO$V_INHEXTGAP :unsigned-integer #.(+ 0 12/8) #.(+ 0 13/8)) 
    (IO$V_fill_8 :unsigned-integer #.(+ 0 13/8) #.(+ 0 16/8)) 
    ; DU  & TU, disk & tape class driver transfer function modifier bits
    (IO$v_fcode_fill :unsigned-integer #.(+ 0 0/8) #.(+ 0 6/8)) 
    (IO$v_dutux_reserved :unsigned-integer #.(+ 0 6/8) #.(+ 0 8/8)) 
    ; Use MSCP modifiers in P5
    (IO$V_MSCPMODIFS :unsigned-integer #.(+ 0 8/8) #.(+ 0 9/8)) 
    (IO$V_fill_9 :unsigned-integer #.(+ 0 9/8) #.(+ 0 16/8)) 
    (IO$v_fcode_fill :unsigned-integer #.(+ 0 0/8) #.(+ 0 6/8)) 
    ; Shadowing SENSECHAR
    (IO$V_SHADOW :unsigned-integer #.(+ 0 6/8) #.(+ 0 7/8)) 
    ; Shadowing Locate function
    (IO$V_LOCATE :unsigned-integer #.(+ 0 7/8) #.(+ 0 8/8)) 
    (IO$v_fcode_fill :unsigned-integer #.(+ 0 0/8) #.(+ 0 6/8)) 
    ; PACKACK media for formatting
    (IO$V_MSCP_FORMAT :unsigned-integer #.(+ 0 6/8) #.(+ 0 7/8)) 
    (IO$V_fill_10 :unsigned-integer #.(+ 0 7/8) #.(+ 0 8/8)) 
    (IO$v_fcode_fill :unsigned-integer #.(+ 0 0/8) #.(+ 0 6/8)) 
    ; Do available as for all class drivers
    (IO$V_ALLHOSTS :unsigned-integer #.(+ 0 6/8) #.(+ 0 7/8)) 
    ; Dissolve shadow set
    (IO$V_DISSOLVE :unsigned-integer #.(+ 0 7/8) #.(+ 0 8/8)) 
    ; Normal shadow set cleanup not necessary
    (IO$V_NOCLEANUP :unsigned-integer #.(+ 0 8/8) #.(+ 0 9/8)) 
    (IO$V_fill_11 :unsigned-integer #.(+ 0 9/8) #.(+ 0 16/8)) 
    (IO$v_fcode_fill :unsigned-integer #.(+ 0 0/8) #.(+ 0 6/8)) 
    ; Spin down removed member
    (IO$V_SPINDOWN :unsigned-integer #.(+ 0 6/8) #.(+ 0 7/8)) 
    (IO$V_fill_12 :unsigned-integer #.(+ 0 7/8) #.(+ 0 8/8)) 
    (IO$v_fcode_fill :unsigned-integer #.(+ 0 0/8) #.(+ 0 6/8)) 
    ; Make path change happen
    (IO$V_FORCEPATH :unsigned-integer #.(+ 0 6/8) #.(+ 0 7/8)) 
    (IO$V_fill_13 :unsigned-integer #.(+ 0 7/8) #.(+ 0 8/8)) 
    ; DR driver function modifier bits.
    (IO$v_fcode_fill :unsigned-integer #.(+ 0 0/8) #.(+ 0 6/8)) 
    ; Diagnostic command
    (IO$V_COMMOD :unsigned-integer #.(+ 0 6/8) #.(+ 0 7/8)) 
    ; Move track descriptor
    (IO$V_MOVETRACKD :unsigned-integer #.(+ 0 7/8) #.(+ 0 8/8)) 
    ; Diagnostic function
    (IO$V_DIAGNOSTIC :unsigned-integer #.(+ 0 8/8) #.(+ 0 9/8)) 
    ; Skip sector inhibit
    (IO$V_SKPSECINH :unsigned-integer #.(+ 0 9/8) #.(+ 0 10/8)) 
    (IO$V_fill_14 :unsigned-integer #.(+ 0 10/8) #.(+ 0 16/8)) 
    ; DY driver function modifier bits.
    (IO$v_fcode_fill :unsigned-integer #.(+ 0 0/8) #.(+ 0 6/8)) 
    ; Write deleted data mark
    (IO$V_DELDATA :unsigned-integer #.(+ 0 6/8) #.(+ 0 7/8)) 
    (IO$V_fill_15 :unsigned-integer #.(+ 0 7/8) #.(+ 0 8/8)) 
    ; DD driver (TU58) function modifier bits.
    (IO$v_fcode_fill :unsigned-integer #.(+ 0 0/8) #.(+ 0 6/8)) 
    ; Do not use MRSP for this operation
    (IO$V_NOMRSP :unsigned-integer #.(+ 0 6/8) #.(+ 0 7/8)) 
    (IO$V_fill_16 :unsigned-integer #.(+ 0 7/8) #.(+ 0 8/8)) 
    ; Magnetic tape I/O function modifier bits for the TS11.
    (IO$v_fcode_fill :unsigned-integer #.(+ 0 0/8) #.(+ 0 6/8)) 
    (IO$v_reserved_for_device_dependent :unsigned-integer #.(+ 0 6/8) #.(+ 0 8/8)) 
    ; Swap byte (TS11)
    (IO$V_SWAP :unsigned-integer #.(+ 0 8/8) #.(+ 0 9/8)) 
    ; Opposite bit for rereads (TS11)
    (IO$V_OPPOSITE :unsigned-integer #.(+ 0 9/8) #.(+ 0 10/8)) 
    (IO$V_fill_17 :unsigned-integer #.(+ 0 10/8) #.(+ 0 16/8)) 
    ; TU driver function modifier bits
    (IO$v_fcode_fill :unsigned-integer #.(+ 0 0/8) #.(+ 0 6/8)) 
    (IO$v_reserved_for_device_dependent :unsigned-integer #.(+ 0 6/8) #.(+ 0 9/8)) 
    ; Clear serious exception condition
    (IO$V_CLSEREXCP :unsigned-integer #.(+ 0 9/8) #.(+ 0 10/8)) 
    (IO$V_fill_18 :unsigned-integer #.(+ 0 10/8) #.(+ 0 16/8)) 
    ; TUDRIVER SETMODE function modifier bits.
    (IO$v_fcode_fill :unsigned-integer #.(+ 0 0/8) #.(+ 0 6/8)) 
    ; Enable media quality reporting.
    (IO$V_ENAREP :unsigned-integer #.(+ 0 6/8) #.(+ 0 7/8)) 
    (IO$V_fill_19 :unsigned-integer #.(+ 0 7/8) #.(+ 0 8/8)) 
    ; ACP function modifier bits.
    (IO$v_fcode_fill :unsigned-integer #.(+ 0 0/8) #.(+ 0 6/8)) 
    ; Access file
    (IO$V_ACCESS :unsigned-integer #.(+ 0 6/8) #.(+ 0 7/8)) 
    ; Create file
    (IO$V_CREATE :unsigned-integer #.(+ 0 7/8) #.(+ 0 8/8)) 
    ; Delete file
    (IO$V_DELETE :unsigned-integer #.(+ 0 8/8) #.(+ 0 9/8)) 
    ; Mount volume
    (IO$V_MOUNT :unsigned-integer #.(+ 0 9/8) #.(+ 0 10/8)) 
    ; Dismount volume
    (IO$V_DMOUNT :unsigned-integer #.(+ 0 10/8) #.(+ 0 11/8)) 
    ; Remount volume
    (IO$V_REMOUNT :unsigned-integer #.(+ 0 11/8) #.(+ 0 12/8)) 
    (IO$V_fill_20 :unsigned-integer #.(+ 0 12/8) #.(+ 0 16/8)) 
    ; CR (card reader) driver function modifier bits.
    (IO$v_fcode_fill :unsigned-integer #.(+ 0 0/8) #.(+ 0 6/8)) 
    ; Binary read
    (IO$V_BINARY :unsigned-integer #.(+ 0 6/8) #.(+ 0 7/8)) 
    ; Packed read
    (IO$V_PACKED :unsigned-integer #.(+ 0 7/8) #.(+ 0 8/8)) 
    ; MB (mailbox) driver function modifier bits.
    (IO$v_fcode_fill :unsigned-integer #.(+ 0 0/8) #.(+ 0 6/8)) 
    ; Do not wait for operation complete
    (IO$V_NOW :unsigned-integer #.(+ 0 6/8) #.(+ 0 7/8)) 
    ; Request ast on waiting reader
    (IO$V_READATTN :unsigned-integer #.(+ 0 7/8) #.(+ 0 8/8)) 
    ; Request ast on waiting writer
    (IO$V_WRTATTN :unsigned-integer #.(+ 0 8/8) #.(+ 0 9/8)) 
    ; Set volume protection
    (IO$V_SETPROT :unsigned-integer #.(+ 0 9/8) #.(+ 0 10/8)) 
    ; Do not allow resource waits
    (IO$V_NORSWAIT :unsigned-integer #.(+ 0 10/8) #.(+ 0 11/8)) 
    (IO$V_fill_21 :unsigned-integer #.(+ 0 11/8) #.(+ 0 16/8)) 
    ; TT driver READ function modifier bits.
    (IO$v_fcode_fill :unsigned-integer #.(+ 0 0/8) #.(+ 0 6/8)) 
    ; Noecho
    (IO$V_NOECHO :unsigned-integer #.(+ 0 6/8) #.(+ 0 7/8)) 
    ; Timed
    (IO$V_TIMED :unsigned-integer #.(+ 0 7/8) #.(+ 0 8/8)) 
    ; Convert lower case
    (IO$V_CVTLOW :unsigned-integer #.(+ 0 8/8) #.(+ 0 9/8)) 
    ; No filter
    (IO$V_NOFILTR :unsigned-integer #.(+ 0 9/8) #.(+ 0 10/8)) 
    ; Disable mailbox
    (IO$V_DSABLMBX :unsigned-integer #.(+ 0 10/8) #.(+ 0 11/8)) 
    ; Purge typeahead
    (IO$V_PURGE :unsigned-integer #.(+ 0 11/8) #.(+ 0 12/8)) 
    ; Terminators are not echoed
    (IO$V_TRMNOECHO :unsigned-integer #.(+ 0 12/8) #.(+ 0 13/8)) 
    ; Control-R interrupted read
    (IO$V_REFRESH :unsigned-integer #.(+ 0 13/8) #.(+ 0 14/8)) 
    ; Terminate read on escape sequence
    (IO$V_ESCAPE :unsigned-integer #.(+ 0 14/8) #.(+ 0 15/8)) 
    ; Used by alternate class drivers
    (IO$V_EXTEND :unsigned-integer #.(+ 0 15/8) #.(+ 0 16/8)) 
    ; TT driver WRITE function modifier bits.
    (IO$v_fcode_fill :unsigned-integer #.(+ 0 0/8) #.(+ 0 6/8)) 
    ; Cancel control O
    (IO$V_CANCTRLO :unsigned-integer #.(+ 0 6/8) #.(+ 0 7/8)) 
    ; Enable mailbox
    (IO$V_ENABLMBX :unsigned-integer #.(+ 0 7/8) #.(+ 0 8/8)) 
    ; Do not format output
    (IO$V_NOFORMAT :unsigned-integer #.(+ 0 8/8) #.(+ 0 9/8)) 
    ; Broadcast I/O
    (IO$V_BREAKTHRU :unsigned-integer #.(+ 0 9/8) #.(+ 0 10/8)) 
    ; Output a newline
    (IO$V_NEWLINE :unsigned-integer #.(+ 0 10/8) #.(+ 0 11/8)) 
    (IO$V_fill_22 :unsigned-integer #.(+ 0 11/8) #.(+ 0 16/8)) 
    ; TT driver SENSEMODE function modifier bits.
    (IO$v_fcode_fill :unsigned-integer #.(+ 0 0/8) #.(+ 0 6/8)) 
    ; Sense typeahead information
    (IO$V_TYPEAHDCNT :unsigned-integer #.(+ 0 6/8) #.(+ 0 7/8)) 
    (IO$v_reserve_rd_modem :unsigned-integer #.(+ 0 7/8) #.(+ 0 8/8)) 
    ; TT driver SETMODE subfunction modifier bits.
    (IO$v_fcode_fill :unsigned-integer #.(+ 0 0/8) #.(+ 0 6/8)) 
    ; Enable maint sub modifiers
    (IO$V_MAINT :unsigned-integer #.(+ 0 6/8) #.(+ 0 7/8)) 
    ; Set control Y AST
    (IO$V_CTRLYAST :unsigned-integer #.(+ 0 7/8) #.(+ 0 8/8)) 
    ; Set Control C
    (IO$V_CTRLCAST :unsigned-integer #.(+ 0 8/8) #.(+ 0 9/8)) 
    ; Set mode and hang up line
    (IO$V_HANGUP :unsigned-integer #.(+ 0 9/8) #.(+ 0 10/8)) 
    ; Set out of band AST
    (IO$V_OUTBAND :unsigned-integer #.(+ 0 10/8) #.(+ 0 11/8)) 
    ; Connect to detached terminal
    (IO$V_TT_CONNECT :unsigned-integer #.(+ 0 11/8) #.(+ 0 12/8)) 
    ; Disconnect detached terminal
    (IO$V_TT_DISCON :unsigned-integer #.(+ 0 12/8) #.(+ 0 13/8)) 
    ; Define controlling process
    (IO$V_TT_PROCESS :unsigned-integer #.(+ 0 13/8) #.(+ 0 14/8)) 
    ; Define broadcast mask
    (IO$V_BRDCST :unsigned-integer #.(+ 0 14/8) #.(+ 0 15/8)) 
    (IO$V_fill_23 :unsigned-integer #.(+ 0 15/8) #.(+ 0 16/8)) 
    ; TT driver MAINTIANCE subfunction submodifier bits.
    (IO$v_fcode_fill :unsigned-integer #.(+ 0 0/8) #.(+ 0 6/8)) 
    (IO$v_reserve_maint_escape :unsigned-integer #.(+ 0 6/8) #.(+ 0 7/8)) 
    ; Diagnostic loopback
    (IO$V_LOOP :unsigned-integer #.(+ 0 7/8) #.(+ 0 8/8)) 
    ; Diagnostic reset loopback
    (IO$V_UNLOOP :unsigned-integer #.(+ 0 8/8) #.(+ 0 9/8)) 
    ; Disable line
    (IO$V_LINE_OFF :unsigned-integer #.(+ 0 9/8) #.(+ 0 10/8)) 
    ; Diagnostic modem control
    (IO$V_SET_MODEM :unsigned-integer #.(+ 0 10/8) #.(+ 0 11/8)) 
    ; Enable line
    (IO$V_LINE_ON :unsigned-integer #.(+ 0 11/8) #.(+ 0 12/8)) 
    ; Diagnostic external loopback
    (IO$V_LOOP_EXT :unsigned-integer #.(+ 0 12/8) #.(+ 0 13/8)) 
    ; Enable auto XOFF
    (IO$V_AUTXOF_ENA :unsigned-integer #.(+ 0 13/8) #.(+ 0 14/8)) 
    ; Disable auto XOFF
    (IO$V_AUTXOF_DIS :unsigned-integer #.(+ 0 14/8) #.(+ 0 15/8)) 
    (IO$v_reserve_int_disable :unsigned-integer #.(+ 0 15/8) #.(+ 0 16/8)) 
    ; TT driver out-of-band modifier bits.
    (IO$v_fcode_fill :unsigned-integer #.(+ 0 0/8) #.(+ 0 6/8)) 
    (IO$v_reserve_maint_escape :unsigned-integer #.(+ 0 6/8) #.(+ 0 11/8)) 
    ; Include character in stream
    (IO$V_INCLUDE :unsigned-integer #.(+ 0 11/8) #.(+ 0 12/8)) 
    ; Abort current I/O
    (IO$V_TT_ABORT :unsigned-integer #.(+ 0 12/8) #.(+ 0 13/8)) 
    (IO$V_fill_24 :unsigned-integer #.(+ 0 13/8) #.(+ 0 16/8)) 
    ; Network WRITE and READ VIRTUAL function modifier bits.
    (IO$v_fcode_fill :unsigned-integer #.(+ 0 0/8) #.(+ 0 6/8)) 
    ; Interrupt message
    (IO$V_INTERRUPT :unsigned-integer #.(+ 0 6/8) #.(+ 0 7/8)) 
    ; Multiple write/read request 
    (IO$V_MULTIPLE :unsigned-integer #.(+ 0 7/8) #.(+ 0 8/8)) 
    ; Direct I/O request
    (IO$V_LOCKBUF :unsigned-integer #.(+ 0 8/8) #.(+ 0 9/8)) 
    ; Segment message w/o blocking
    (IO$V_NOBLOCK :unsigned-integer #.(+ 0 9/8) #.(+ 0 10/8)) 
    (IO$V_fill_25 :unsigned-integer #.(+ 0 10/8) #.(+ 0 16/8)) 
    ; Network ACCESS/DEACCESS function modifier bits.
    (IO$v_fcode_fill :unsigned-integer #.(+ 0 0/8) #.(+ 0 6/8)) 
    (IO$v_reserved :unsigned-integer #.(+ 0 6/8) #.(+ 0 8/8)) 
    ; Disconnect abort/connect reject
    (IO$V_ABORT :unsigned-integer #.(+ 0 8/8) #.(+ 0 9/8)) 
    ; Synchronous disconnect
    (IO$V_SYNCH :unsigned-integer #.(+ 0 9/8) #.(+ 0 10/8)) 
    (IO$V_fill_26 :unsigned-integer #.(+ 0 10/8) #.(+ 0 16/8)) 
    ; DATALINK driver WRITE subfunction modifier bits.
    (IO$v_fcode_fill :unsigned-integer #.(+ 0 0/8) #.(+ 0 6/8)) 
    ; Transmit this packet as a response
    (IO$V_RESPONSE :unsigned-integer #.(+ 0 6/8) #.(+ 0 7/8)) 
    (IO$V_fill_27 :unsigned-integer #.(+ 0 7/8) #.(+ 0 8/8)) 
    ; DATALINK driver SETMODE subfunction modifier bits. 
    (IO$v_fcode_fill :unsigned-integer #.(+ 0 0/8) #.(+ 0 6/8)) 
    ; Start protocol
    (IO$V_STARTUP :unsigned-integer #.(+ 0 6/8) #.(+ 0 7/8)) 
    ; Stop protocol
    (IO$V_SHUTDOWN :unsigned-integer #.(+ 0 7/8) #.(+ 0 8/8)) 
    ; Attention AST
    (IO$V_ATTNAST :unsigned-integer #.(+ 0 8/8) #.(+ 0 9/8)) 
    ; Controller (ie. not station) function
    (IO$V_CTRL :unsigned-integer #.(+ 0 9/8) #.(+ 0 10/8)) 
    (IO$v_reserve_set_modem :unsigned-integer #.(+ 0 10/8) #.(+ 0 11/8)) 
    (IO$V_fill_28 :unsigned-integer #.(+ 0 11/8) #.(+ 0 16/8)) 
    ; DATALINK driver SENSEMODE subfunction modifier bits.
    (IO$v_fcode_fill :unsigned-integer #.(+ 0 0/8) #.(+ 0 6/8)) 
    ; Read device memory
    (IO$V_RD_MEM :unsigned-integer #.(+ 0 6/8) #.(+ 0 7/8)) 
    ; Read modem status
    (IO$V_RD_MODEM :unsigned-integer #.(+ 0 7/8) #.(+ 0 8/8)) 
    ; Read counters
    (IO$V_RD_COUNT :unsigned-integer #.(+ 0 8/8) #.(+ 0 9/8)) 
    (IO$v_reserve_ctrl :unsigned-integer #.(+ 0 9/8) #.(+ 0 10/8)) 
    ; Clear counters
    (IO$V_CLR_COUNT :unsigned-integer #.(+ 0 10/8) #.(+ 0 11/8)) 
    (IO$V_fill_29 :unsigned-integer #.(+ 0 11/8) #.(+ 0 16/8)) 
    (IO$v_fcode_fill :unsigned-integer #.(+ 0 0/8) #.(+ 0 6/8)) 
    ; More data follows (M-bit)
    (IO$V_MORE :unsigned-integer #.(+ 0 6/8) #.(+ 0 7/8)) 
    ; Use qualified sub-channel (Q-bit)
    (IO$V_QUALIFIED :unsigned-integer #.(+ 0 7/8) #.(+ 0 8/8)) 
    ; X25 driver ACCESS function modifier bits.
    (IO$v_fcode_fill :unsigned-integer #.(+ 0 0/8) #.(+ 0 6/8)) 
    ; Redirect virtual call
    (IO$V_REDIRECT :unsigned-integer #.(+ 0 6/8) #.(+ 0 7/8)) 
    ; Accept virtual call
    (IO$V_ACCEPT :unsigned-integer #.(+ 0 7/8) #.(+ 0 8/8)) 
    ; LPA-11 driver STARTDATA modifier bits.
    (IO$v_fcode_fill :unsigned-integer #.(+ 0 0/8) #.(+ 0 6/8)) 
    ; Set event flag
    (IO$V_SETEVF :unsigned-integer #.(+ 0 6/8) #.(+ 0 7/8)) 
    (IO$V_fill_30 :unsigned-integer #.(+ 0 7/8) #.(+ 0 8/8)) 
    ; XA (DR11-W) driver function modifier bits.
    (IO$v_fcode_fill :unsigned-integer #.(+ 0 0/8) #.(+ 0 6/8)) 
    ; Word (interrupt)/block (DMA) mode specifier
    (IO$V_WORD :unsigned-integer #.(+ 0 6/8) #.(+ 0 7/8)) 
    ; IO$M_TIMED
    (IO$v_filler :unsigned-integer #.(+ 0 7/8) #.(+ 0 8/8)) 
    ; IO$M_ATTNAST, IO$M_DIAGNOSTIC
    (IO$v_filler :unsigned-integer #.(+ 0 8/8) #.(+ 0 9/8)) 
    ; Set "FNCT" bits in device CSR
    (IO$V_SETFNCT :unsigned-integer #.(+ 0 9/8) #.(+ 0 10/8)) 
    ; Change UBA datapath (direct/buffered)
    (IO$V_DATAPATH :unsigned-integer #.(+ 0 10/8) #.(+ 0 11/8)) 
    ; IO$M_INHERLOG (former def'n for RESET)
    (IO$v_filler :unsigned-integer #.(+ 0 11/8) #.(+ 0 12/8)) 
    ; Set "cycle" bit in device CSR
    (IO$V_CYCLE :unsigned-integer #.(+ 0 12/8) #.(+ 0 13/8)) 
    ; Device reset specifier
    (IO$V_RESET :unsigned-integer #.(+ 0 13/8) #.(+ 0 14/8)) 
    (IO$V_fill_31 :unsigned-integer #.(+ 0 14/8) #.(+ 0 16/8)) 
    ; 3271 driver function modifier bits.
    (IO$v_fcode_fill :unsigned-integer #.(+ 0 0/8) #.(+ 0 6/8)) 
    (IO$v_filler :unsigned-integer #.(+ 0 6/8) #.(+ 0 8/8)) 
    ; Set a new CU address
    (IO$V_SETCUADR :unsigned-integer #.(+ 0 8/8) #.(+ 0 9/8)) 
    ; Set a new maximum buffer size
    (IO$V_SETBSIZE :unsigned-integer #.(+ 0 9/8) #.(+ 0 10/8)) 
    ; Set a new pool size
    (IO$V_SETPOOLSZ :unsigned-integer #.(+ 0 10/8) #.(+ 0 11/8)) 
    ; Set a new ENQ threshold
    (IO$V_SETENQCNT :unsigned-integer #.(+ 0 11/8) #.(+ 0 12/8)) 
    ; Zero status counters
    (IO$V_CLEAR :unsigned-integer #.(+ 0 12/8) #.(+ 0 13/8)) 
    ; Loopback is external loopback
    (IO$V_LPBEXT :unsigned-integer #.(+ 0 13/8) #.(+ 0 14/8)) 
    ; Loopback is internal loopback (DUP11)
    (IO$V_LPBINT :unsigned-integer #.(+ 0 14/8) #.(+ 0 15/8)) 
    ; Read CSRs on DUP11
    (IO$V_READCSR :unsigned-integer #.(+ 0 15/8) #.(+ 0 16/8)) 
    ; XW driver function modifier bits.
    (IO$v_fcode_fill :unsigned-integer #.(+ 0 0/8) #.(+ 0 6/8)) 
    ; Diagnostic function 
    (IO$V_NOCTSWAIT :unsigned-integer #.(+ 0 6/8) #.(+ 0 7/8)) 
    ; Diagnostic function 
    (IO$V_SLAVLOOP :unsigned-integer #.(+ 0 7/8) #.(+ 0 8/8)) 
    ; Do not wait for DSR (diag) 
    (IO$V_NODSRWAIT :unsigned-integer #.(+ 0 8/8) #.(+ 0 9/8)) 
    ; Internal maint loop 
    (IO$V_MAINTLOOP :unsigned-integer #.(+ 0 9/8) #.(+ 0 10/8)) 
    ; Last block of message 
    (IO$V_LASTBLOCK :unsigned-integer #.(+ 0 10/8) #.(+ 0 11/8)) 
    (IO$v_filler :unsigned-integer #.(+ 0 11/8) #.(+ 0 12/8)) 
    ; Internal clock 
    (IO$V_INTCLOCK :unsigned-integer #.(+ 0 12/8) #.(+ 0 13/8)) 
    (IO$V_fill_32 :unsigned-integer #.(+ 0 13/8) #.(+ 0 16/8)) 
    ; LAT driver function modifier bits.
    (IO$v_fcode_fill :unsigned-integer #.(+ 0 0/8) #.(+ 0 6/8)) 
    ; Solicit connection to remote LAT device
    (IO$V_LT_CONNECT :unsigned-integer #.(+ 0 6/8) #.(+ 0 7/8)) 
    ; Disconnect LAT session
    (IO$V_LT_DISCON :unsigned-integer #.(+ 0 7/8) #.(+ 0 8/8)) 
    ; Read LAT device info
    (IO$V_LT_READPORT :unsigned-integer #.(+ 0 8/8) #.(+ 0 9/8)) 
    ; Map application port
    (IO$V_LT_MAP_PORT :unsigned-integer #.(+ 0 9/8) #.(+ 0 10/8)) 
    ; Set service rating
    (IO$V_LT_RATING :unsigned-integer #.(+ 0 10/8) #.(+ 0 11/8)) 
    ; Request solicit info
    (IO$V_LT_SOL_INFO :unsigned-integer #.(+ 0 11/8) #.(+ 0 12/8)) 
    ; Setup to recive reply
    (IO$V_LT_RCV_INFO :unsigned-integer #.(+ 0 12/8) #.(+ 0 13/8)) 
    (IO$V_fill_33 :unsigned-integer #.(+ 0 13/8) #.(+ 0 16/8)) 
    ; LAT item list definitions for MAP_PORT
    ; Item 0 not used
    (IO$V_LT_MAP_FILLER :unsigned-integer #.(+ 0 0/8) #.(+ 0 1/8)) 
    ; Server node name
    (IO$V_LT_MAP_NODNAM :unsigned-integer #.(+ 0 1/8) #.(+ 0 2/8)) 
    ; Server port name
    (IO$V_LT_MAP_PORNAM :unsigned-integer #.(+ 0 2/8) #.(+ 0 3/8)) 
    ; Server service name
    (IO$V_LT_MAP_SRVNAM :unsigned-integer #.(+ 0 3/8) #.(+ 0 4/8)) 
    ; Link name
    (IO$V_LT_MAP_LNKNAM :unsigned-integer #.(+ 0 4/8) #.(+ 0 5/8)) 
    ; Server Ethernet Add.
    (IO$V_LT_MAP_NETADR :unsigned-integer #.(+ 0 5/8) #.(+ 0 6/8)) 
    (IO$V_fill_34 :unsigned-integer #.(+ 0 6/8) #.(+ 0 8/8)) )
      
;;; Basic I/O function code/modifiers structure
;;; Function modifiers common to all drivers which do error logging
;;; General disk and tape function code modifiers
;;; General disk function code modifiers
;;; General tape function code modifiers
;;; DU  & TU, disk & tape class driver transfer function modifier bits
;;; DR driver function modifier bits.
;;; DY driver function modifier bits.
;;; DD driver (TU58) function modifier bits.
;;; Magnetic tape I/O function modifier bits for the TS11.
;;; TU driver function modifier bits
;;; TUDRIVER SETMODE function modifier bits.
;;; ACP function modifier bits.
;;; CR (card reader) driver function modifier bits.
;;; MB (mailbox) driver function modifier bits.
;;; TT driver READ function modifier bits.
;;; TT driver WRITE function modifier bits.
;;; TT driver SENSEMODE function modifier bits.
;;; TT driver SETMODE subfunction modifier bits.
;;; TT driver MAINTIANCE subfunction submodifier bits.
;;; TT driver out-of-band modifier bits.
;;; Network WRITE and READ VIRTUAL function modifier bits.
;;; Network ACCESS/DEACCESS function modifier bits.
;;; DATALINK driver WRITE subfunction modifier bits.
;;; DATALINK driver SETMODE subfunction modifier bits. 
;;; DATALINK driver SENSEMODE subfunction modifier bits.
;;; X25 driver ACCESS function modifier bits.
;;; LPA-11 driver STARTDATA modifier bits.
;;; XA (DR11-W) driver function modifier bits.
;;; 3271 driver function modifier bits.
;;; XW driver function modifier bits.
;;; LAT driver function modifier bits.
;;; LAT item list definitions for MAP_PORT
 
;;;*** MODULE $JPIDEF ***
      
;;;+
;;;
;;; Get Job Process Information Data Identifier Definitions
;;;
;;; **** NOTE ****
;;;
;;;        New items must always be added to the END of each item list
;;;        (preceeding the ENDlistname item) so that users will not have
;;;        to relink.
;;;-
;;; DEFINE TABLE NUMBERS 
;;; STRUCTURE CODES MUST START AT 1
 (defconstant JPI$C_ADRTYPE 1)   ;  ITEM IS ADDRESS OF DATA 
 (defconstant JPI$C_CTLTYPE 2)   ;  ITEM IS IN CONTROL REGION 
 (defconstant JPI$C_PCBTYPE 3)   ;  ITEM IN PCB 
 (defconstant JPI$C_PHDTYPE 4)   ;  ITEM IN PHD 
 (defconstant JPI$C_PCBFLDTYPE 5)   ;  ITEM IS BIT FIELD
 (defconstant JPI$C_PHDFLDTYPE 6)   ;  ITEM IS BIT FIELD
 (defconstant JPI$C_JIBTYPE 7)   ;  ITEM IN JIB (SUBTYPE)
 (defconstant JPI$C_ARBTYPE 8)   ;  ITEM IN ARB (SUBTYPE)
 (defconstant JPI$C_MAXSTRUC 6)   ;  TOTAL OF 6 TABLES
 (defconstant JPI$C_LISTEND 0)   ;  DEFINE ITMLST TERMINATOR 
 (defconstant JPI$_CHAIN -1)   ;  CHAIN INDICATOR
 (defconstant JPI$_GETJPI_CONTROL_FLAGS -2)   ;  SPECIAL CONTROL ITEMS
 (defconstant JPI$M_NO_TARGET_INSWAP #b00000000000000000000000000000001)
 (defconstant JPI$M_NO_TARGET_AST #b00000000000000000000000000000010)
 (defconstant JPI$M_IGNORE_TARGET_STATUS #b00000000000000000000000000000100)
            
(define-alien-structure (JPICTL    ( :conc-name nil))
    ; Control item flags
    (JPI$L_JPICTLFLGS :unsigned-integer 0 4)
    ; Do not inswap the target process, (do deliver ASTs if it is resident)
      (JPI$V_NO_TARGET_INSWAP :unsigned-integer #.(+ 0 0/8) #.(+ 0 1/8)) 
    ; Do not send AST to target
      (JPI$V_NO_TARGET_AST :unsigned-integer #.(+ 0 1/8) #.(+ 0 2/8)) 
    ; Don't check target state
      (JPI$V_IGNORE_TARGET_STATUS :unsigned-integer #.(+ 0 2/8) #.(+ 0 3/8)) 
      (JPI$V_fill_37 :unsigned-integer #.(+ 0 3/8) #.(+ 0 8/8)) )
      
;;;
;;; NOTE!! The following constants match values in $JIBDEF.
;;;
 (defconstant JPI$K_OTHER 0)   ;  JPI$_Mode values
 (defconstant JPI$K_NETWORK 1)   ;  JPI$_Mode values
 (defconstant JPI$K_BATCH 2)   ;  JPI$_Mode values
 (defconstant JPI$K_INTERACTIVE 3)   ;  JPI$_Mode values
 (defconstant JPI$K_DETACHED 0)   ;  JPI$_JOBTYPE values
 (defconstant JPI$K_LOCAL 3)   ;  JPI$_JOBTYPE values
 (defconstant JPI$K_DIALUP 4)   ;  JPI$_JOBTYPE values
 (defconstant JPI$K_REMOTE 5)   ;  JPI$_JOBTYPE values
;;; (also BATCH & INTERACTIVE)
;;; ITEM IDENTIFIERS FOR PCB 
 (defconstant JPI$_ASTACT 768)   ;  ACCESS MODES WITH ACTIVE ASTS 
 (defconstant JPI$_ASTEN 769)   ;  ACCESS MODES WITH ASTS ENABLED 
 (defconstant JPI$_PRI 770)   ;  CURRENT PROCESS PRIORITY 
 (defconstant JPI$_OWNER 771)   ;  PID OF CREATOR PROCESS 
 (defconstant JPI$_UIC 772)   ;  UIC OF PROCESS 
 (defconstant JPI$_STS 773)   ;  PROCESS STATUS 
 (defconstant JPI$_STATE 774)   ;  PROCESS STATE 
 (defconstant JPI$_MEM 775)   ;  MEMBER FIELD OF UIC 
 (defconstant JPI$_GRP 776)   ;  GROUP FIELD OF UIC 
 (defconstant JPI$_PRIB 777)   ;  PROCESS BASE PRIORITY 
 (defconstant JPI$_APTCNT 778)   ;  ACTIVE PAGE TABLE COUNT 
 (defconstant JPI$_TMBU 779)   ;  TERMINATION MAILBOX UNIT 
 (defconstant JPI$_GPGCNT 780)   ;  GLOBAL PAGE COUNT IN WORKING SET 
 (defconstant JPI$_PPGCNT 781)   ;  PROCESS PAGE COUNT IN WORKING SET 
 (defconstant JPI$_ASTCNT 782)   ;  AST COUNT REMAINING 
 (defconstant JPI$_BIOCNT 783)   ;  BUFFERED I/O COUNT REMAINING 
 (defconstant JPI$_BIOLM 784)   ;  BUFFERED I/O LIMIT 
 (defconstant JPI$_BYTCNT 785)   ;  BYTE COUNT REMAINING FOR BUFFERED I/O 
 (defconstant JPI$_DIOCNT 786)   ;  DIRECT I/O COUNT REMAINING 
 (defconstant JPI$_DIOLM 787)   ;  DIRECT I/O COUNT LIMIT 
 (defconstant JPI$_FILCNT 788)   ;  COUNT REMAINING OF OPEN FILES 
 (defconstant JPI$_TQCNT 789)   ;  COUNT REMAINING OF TIMER QUEUE ENTRIES 
 (defconstant JPI$_EFWM 790)   ;  EVENT FLAG WAIT MASK 
 (defconstant JPI$_EFCS 791)   ;  LOCAL EVENT FLAGS 0-31 
 (defconstant JPI$_EFCU 792)   ;  LOCAL EVENT FLAGS 32-63 
 (defconstant JPI$_PID 793)   ;  PROCESS IDENTIFICATION        
 (defconstant JPI$_BYTLM 794)   ;  BUFFERED I/0 BYTE COUNT LIMIT 
 (defconstant JPI$_PRCCNT 795)   ;  SUBPROCESS COUNT 
 (defconstant JPI$_PRCNAM 796)   ;  PROCESS NAME 
 (defconstant JPI$_TERMINAL 797)   ;  LOGIN TERMINAL NAME 
 (defconstant JPI$_JOBPRCCNT 798)   ;  TOTAL COUNT OF SUBPROCESSES IN A JOB 
 (defconstant JPI$_ENQCNT 799)   ;  ENQUEUE COUNT REMAINING 
 (defconstant JPI$_ENQLM 800)   ;  ENQUEUE COUNT LIMIT 
 (defconstant JPI$_SWPFILLOC 801)   ;  SWAP FILE BACKING STORE ADDRESS 
 (defconstant JPI$_MODE 802)   ;  MODE VALUE (FROM STS) - DEFINED ABOVE
 (defconstant JPI$_JOBTYPE 803)   ;  JOB TYPE CODE
 (defconstant JPI$_PROC_INDEX 804)   ;  PROCESS INDEX
 (defconstant JPI$_MASTER_PID 805)   ;  MASTER PROCESS PID
 (defconstant JPI$_RIGHTSLIST 806)   ;  PROCESS RIGHTSLIST
 (defconstant JPI$_CPU_ID 807)   ;  CPU ID
 (defconstant JPI$_STS2 808)   ;  Second process status longword
 (defconstant JPI$_NODENAME 809)   ;  Name of node on which process is running
 (defconstant JPI$_NODE_CSID 810)   ;  CSID of node on which process is running
 (defconstant JPI$_NODE_VERSION 811)   ;  VMS version of node on which process is running
 (defconstant JPI$_TT_PHYDEVNAM 812)   ;  Physical device name of terminal
 (defconstant JPI$_TT_ACCPORNAM 813)   ;  Access port name of terminal
;;; ADD ITEM-CODES BEFORE THIS COMMENT
 (defconstant JPI$_LASTPCB 814)   ;  MAX INDEX IN PCB TABLE 
;;; ITEM IDENTIFIERS FOR PHD 
 (defconstant JPI$_CURPRIV 1024)   ;  CURRENT PROCESS PRIVILEGE MASK 
 (defconstant JPI$_WSAUTH 1025)   ;  AUTHORIZED WORKING SET SIZE 
 (defconstant JPI$_WSQUOTA 1026)   ;  QUOTA ON WORKING SET SIZE 
 (defconstant JPI$_DFWSCNT 1027)   ;  DEFAULT WORKING SET SIZE 
 (defconstant JPI$_FREP0VA 1028)   ;  FIRST FREE VIRTUAL ADDR. AT END OF P0 SPACE 
 (defconstant JPI$_FREP1VA 1029)   ;  FIRST FREE ADDR. AT END OF P1 SPACE 
 (defconstant JPI$_DFPFC 1030)   ;  DEFAULT PAGE FAULT CLUSTER 
 (defconstant JPI$_CPUTIM 1031)   ;  ACCUMULATED CPU TIME 
 (defconstant JPI$_PRCLM 1032)   ;  SUBPROCESS QUOTA 
 (defconstant JPI$_ASTLM 1033)   ;  AST LIMIT 
 (defconstant JPI$_PAGEFLTS 1034)   ;  COUNT OF PAGE FAULTS 
 (defconstant JPI$_DIRIO 1035)   ;  PROCESS DIRECT I/O OPERATIONS 
 (defconstant JPI$_BUFIO 1036)   ;  PROCESS BUFFERED I/O OPERATIONS 
 (defconstant JPI$_CPULIM 1037)   ;  LIMIT ON CPUTIM FOR PROCESS 
 (defconstant JPI$_PGFLQUOTA 1038)   ;  MAX. VIRTUAL PAGE COUNT 
 (defconstant JPI$_FILLM 1039)   ;  OPEN FILE LIMIT 
 (defconstant JPI$_TQLM 1040)   ;  TIMER QUEUE LIMIT 
 (defconstant JPI$_WSSIZE 1041)   ;  CURRENT WORKING SET SIZE 
 (defconstant JPI$_AUTHPRIV 1042)   ;  AUTHORIZED PRIVILEGE MASK 
 (defconstant JPI$_IMAGPRIV 1043)   ;  INSTALLED IMAGE PRIVILEGE MASK 
 (defconstant JPI$_PAGFILCNT 1044)   ;  PAGES CHARGED TO PAGE FILE QUOTA 
 (defconstant JPI$_FREPTECNT 1045)   ;  ROOM FOR EXPANSION OF P0 OR P1 SPACE 
 (defconstant JPI$_WSEXTENT 1046)   ;  EXTENT OF WORKING SET SIZE 
 (defconstant JPI$_WSAUTHEXT 1047)   ;  MAX EXTENT OF WORKING SET SIZE 
 (defconstant JPI$_AUTHPRI 1048)   ;  AUTHORIZED PRIORITY FOR $SETPRI 
 (defconstant JPI$_PAGFILLOC 1049)   ;  PAGE FILE BACKING STORE ADDRESS 
 (defconstant JPI$_IMAGECOUNT 1050)   ;  IMAGE COUNTER (CLOCKED BY RUNDOWN) 
 (defconstant JPI$_PHDFLAGS 1051)   ;  PROCESS HEADER FLAGS WORD
;;; ADD ITEM-CODES BEFORE THIS COMMENT
 (defconstant JPI$_LASTPHD 1052)   ;  MAX INDEX IN PROCESS HEADER 
;;; ITEM IDENTIFIERS FOR CONTROL REGION 
 (defconstant JPI$_VIRTPEAK 512)   ;  PEAK VIRTUAL SIZE 
 (defconstant JPI$_WSPEAK 513)   ;  PEAK WORKING SET SIZE 
 (defconstant JPI$_USERNAME 514)   ;  USERNAME STRING 
 (defconstant JPI$_ACCOUNT 515)   ;  ACCOUNT NAME STRING 
 (defconstant JPI$_PROCPRIV 516)   ;  PROCESS PRIVILEGE MASK 
 (defconstant JPI$_VOLUMES 517)   ;  VOLUMES MOUNTED 
 (defconstant JPI$_LOGINTIM 518)   ;  TIME OF LOGIN OR PROCESS CREATION 
 (defconstant JPI$_IMAGNAME 519)   ;  CURRENT IMAGE FILE NAME 
 (defconstant JPI$_SITESPEC 520)   ;  PER-PROCESS SITE-SPECIFIC CELL 
 (defconstant JPI$_MSGMASK 521)   ;  PROCESS DEFAULT MESSAGE FLAGS
 (defconstant JPI$_CLINAME 522)   ;  COMMAND LANGUAGE INTERPRETER NAME
 (defconstant JPI$_TABLENAME 523)   ;  COMMAND LANGUAGE INTERPRETER TABLE NAME
 (defconstant JPI$_CREPRC_FLAGS 524)   ;  $CREPRC FLAGS USED TO CREATE THIS PROCESS
 (defconstant JPI$_UAF_FLAGS 525)   ;  FLAGS FROM UAF RECORD
 (defconstant JPI$_MAXDETACH 526)   ;  MAXIMUM DETACHED PROCESSES FOR SINGLE USER
 (defconstant JPI$_MAXJOBS 527)   ;  MAXIMUM ACTIVE PROCESSES FOR SINGLE USER
 (defconstant JPI$_SHRFILLM 528)   ;  MAXIMUM OPEN SHARED FILES
;;; ADD ITEM-CODES BEFORE THIS COMMENT
 (defconstant JPI$_LASTCTL 529)   ;  MAX INDEX IN CONTROL REGION 
;;; ITEM IDENTIFIERS FOR ADDRESS DATA 
 (defconstant JPI$_EXCVEC 256)   ;  ADDRESS OF "EXCEPTION VECTOR" VECTOR 
 (defconstant JPI$_FINALEXC 257)   ;  ADDRESS OF LAST CHANCE EXCEPTION VECTORS 
;;; ADD ITEM-CODES BEFORE THIS COMMENT
 (defconstant JPI$_LASTADR 258)   ;  MAX INDEX IN ADDRESS TABLE 
;;; ITEM IDENTIFIERS FOR PCBFLD
;;; ADD ITEM-CODES BEFORE THIS COMMENT
 (defconstant JPI$_LASTPCBFLD 1280)   ;  MAX INDEX IN PCBFLD TABLE 
;;; ITEM IDENTIFIERS FOR PHDFLD
;;; ADD ITEM-CODES BEFORE THIS COMMENT
 (defconstant JPI$_LASTPHDFLD 1536)   ;  MAX INDEX IN PHDFLD TABLE 
 
;;;*** MODULE $KGBDEF ***
      
;;;++
;;; Key Grant Block definitions: Format of records in the rights database
;;; file. These records (1) associate identifier codes with names, and
;;; (2) list the holders of all identifiers in the system.
;;;--
 (defconstant KGB$M_RESOURCE #b00000000000000000000000000000001)
 (defconstant KGB$M_DYNAMIC #b00000000000000000000000000000010)
 (defconstant KGB$M_ACCESS #b00000000000000000000000000000100)
 (defconstant KGB$K_HOLD_RECORD 16)   ;  End of holder record
 (defconstant KGB$K_IDENT_RECORD 48)   ;  End of identifier record
 (defconstant KGB$K_LEVEL1 257)   ;  Version 1 structure level
 (defconstant KGB$K_MAINT_RECORD 64)   ;  End of maintenance record
            
(define-alien-structure (KGB    ( :conc-name nil))
    ; Binary identifier code
  (KGB$L_IDENTIFIER :unsigned-integer 0 4)
    ; Attribute bit definitions
    (KGB$L_ATTRIBUTES :unsigned-integer 4 8)
    ; Resource use allowed
      (KGB$V_RESOURCE :unsigned-integer #.(+ 4 0/8) #.(+ 4 1/8)) 
    ; Identifier may be enabled or disabled
      (KGB$V_DYNAMIC :unsigned-integer #.(+ 4 1/8) #.(+ 4 2/8)) 
    ; Identifier used in protection checks
      (KGB$V_ACCESS :unsigned-integer #.(+ 4 2/8) #.(+ 4 3/8)) 
      (KGB$V_fill_40 :unsigned-integer #.(+ 4 3/8) #.(+ 4 8/8)) 
    ; Holder identifier
  (KGB$Q_HOLDER :unsigned-integer 8 16)
    ; Identifier name (blank filled string)
  (KGB$T_NAME :string 16 48)
    ; File structure level
  (KGB$W_LEVEL :unsigned-integer 48 50)
  (KGB$$$_FILL_1 :signed-integer 50 52)
    ; System identifier
  (KGB$Q_SYS_ID :unsigned-integer 52 60)
    ; Next available identifier
  (KGB$L_NEXT_ID :unsigned-integer 60 64))    ; Next available identifier
      
;;;++
;;; Define the environmental rights ID values
;;;--
 (defconstant KGB$K_BATCH_ID -2147483647)   ;  Batch ID value
 (defconstant KGB$K_DIALUP_ID -2147483646)   ;  Dialup ID value
 (defconstant KGB$K_INTERACTIVE_ID -2147483645)   ;  Interactive ID value
 (defconstant KGB$K_LOCAL_ID -2147483644)   ;  Local ID value
 (defconstant KGB$K_NETWORK_ID -2147483643)   ;  Network ID value
 (defconstant KGB$K_REMOTE_ID -2147483642)   ;  Remote ID value
;;;
;;; Define the various access class ranges.
;;;
 (defconstant KGB$K_SEC_LEVEL_BASE -2147482648)
 (defconstant KGB$K_INT_LEVEL_BASE -2147482392)
 (defconstant KGB$K_SEC_CATEGORY_BASE -2147482136)
 (defconstant KGB$K_INT_CATEGORY_BASE -2147482072)
 
;;;*** MODULE $LADEF ***
      
;;;+
;;;
;;; LPA-11 CHARACTERISTICS DEFINITIONS
;;;
;;;-
;;;MICROCODE TYPE VALUES 
 (defconstant LA$K_MRMCODE 1)   ;  MULTIREQUEST MICROCODE 
 (defconstant LA$K_ADMCODE 2)   ;  DEDICATED A/D MICROCODE 
 (defconstant LA$K_DAMCODE 3)   ;  DEDICATED D/A MICROCODE 
 (defconstant LA$M_MCVALID #b00000000000000000000000000000001)
 (defconstant LA$M_CLOCKA #b00000000000000000000000000001000)
 (defconstant LA$M_CLOCKB #b00000000000000000000000000010000)
 (defconstant LA$M_AD1 #b00000000000000000000000000100000)
 (defconstant LA$M_AD2 #b00000000000000000000000001000000)
 (defconstant LA$M_DA #b00000000000000000000000010000000)
 (defconstant LA$M_DIO1 #b00000000000000000000000100000000)
 (defconstant LA$M_DIO2 #b00000000000000000000001000000000)
 (defconstant LA$M_DIO3 #b00000000000000000000010000000000)
 (defconstant LA$M_DIO4 #b00000000000000000000100000000000)
 (defconstant LA$M_DIO5 #b00000000000000000001000000000000)
 (defconstant LA$M_BFROVRN #b00000000100000000000000000000000)
            
(define-alien-structure (LA    ( :conc-name nil))
    ; MICROCODE VALID 
    (LA$V_MCVALID :unsigned-integer #.(+ 0 0/8) #.(+ 0 1/8)) 
    ; MICROCODE TYPE 
    (LA$V_MCTYPE :unsigned-integer #.(+ 0 1/8) #.(+ 0 3/8)) 
    ; DEVICE CONFIGURATION BITS 
    (LA$V_CONFIG :unsigned-integer #.(+ 0 3/8) #.(+ 0 13/8)) 
    ; CLOCK RATE 
    (LA$V_RATE :unsigned-integer #.(+ 0 13/8) #.(+ 0 16/8)) 
    ; CLOCK PRESET 
    (LA$V_PRESET :unsigned-integer #.(+ 0 16/8) #.(+ 0 32/8)) 
    ; SKIP OVER MICROCODE VALID AND TYPE 
    (LADEF$$_FILL_1 :unsigned-integer #.(+ 0 0/8) #.(+ 0 3/8)) 
    ; CLOCK A 
    (LA$V_CLOCKA :unsigned-integer #.(+ 0 3/8) #.(+ 0 4/8)) 
    ; CLOCK B 
    (LA$V_CLOCKB :unsigned-integer #.(+ 0 4/8) #.(+ 0 5/8)) 
    ; A/D ! 1 
    (LA$V_AD1 :unsigned-integer #.(+ 0 5/8) #.(+ 0 6/8)) 
    ; A/D ! 2 
    (LA$V_AD2 :unsigned-integer #.(+ 0 6/8) #.(+ 0 7/8)) 
    ; D/A 
    (LA$V_DA :unsigned-integer #.(+ 0 7/8) #.(+ 0 8/8)) 
    ; DIGITAL I/O ! 1 
    (LA$V_DIO1 :unsigned-integer #.(+ 0 8/8) #.(+ 0 9/8)) 
    ; DIGITAL I/O ! 2 
    (LA$V_DIO2 :unsigned-integer #.(+ 0 9/8) #.(+ 0 10/8)) 
    ; DIGITAL I/O ! 3 
    (LA$V_DIO3 :unsigned-integer #.(+ 0 10/8) #.(+ 0 11/8)) 
    ; DIGITAL I/O ! 4 
    (LA$V_DIO4 :unsigned-integer #.(+ 0 11/8) #.(+ 0 12/8)) 
    ; DIGITAL I/O ! 5 
    (LA$V_DIO5 :unsigned-integer #.(+ 0 12/8) #.(+ 0 13/8)) 
    (LA$V_fill_41 :unsigned-integer #.(+ 0 13/8) #.(+ 0 16/8)) 
    ;(IN USER'S COMMAND TABLE) 
    (LADEF$$_FILL_2 :unsigned-integer #.(+ 0 0/8) #.(+ 0 23/8)) 
    ; BUFFER OVERRUN NON-FATAL BIT 
    (LA$V_BFROVRN :unsigned-integer #.(+ 0 23/8) #.(+ 0 24/8)) )    ; BUFFER OVERRUN NON-FATAL BIT 
      
 
;;;*** MODULE $LCKDEF ***
      
;;;+
;;; LOCK MANAGER DEFINITIONS
;;;-
 (defconstant LCK$M_VALBLK #b00000000000000000000000000000001)
 (defconstant LCK$M_CONVERT #b00000000000000000000000000000010)
 (defconstant LCK$M_NOQUEUE #b00000000000000000000000000000100)
 (defconstant LCK$M_SYNCSTS #b00000000000000000000000000001000)
 (defconstant LCK$M_SYSTEM #b00000000000000000000000000010000)
 (defconstant LCK$M_NOQUOTA #b00000000000000000000000000100000)
 (defconstant LCK$M_CVTSYS #b00000000000000000000000001000000)
 (defconstant LCK$M_RECOVER #b00000000000000000000000010000000)
 (defconstant LCK$M_PROTECT #b00000000000000000000000100000000)
 (defconstant LCK$M_NODLCKWT #b00000000000000000000001000000000)
 (defconstant LCK$M_NODLCKBLK #b00000000000000000000010000000000)
 (defconstant LCK$M_DEQALL #b00000000000000000000000000000001)
 (defconstant LCK$M_CANCEL #b00000000000000000000000000000010)
 (defconstant LCK$M_INVVALBLK #b00000000000000000000000000000100)
 (defconstant LCK$K_NLMODE 0)   ;  NULL 
 (defconstant LCK$K_CRMODE 1)   ;  CONCURRENT READ 
 (defconstant LCK$K_CWMODE 2)   ;  CONCURRENT WRITE 
 (defconstant LCK$K_PRMODE 3)   ;  PROTECTED READ 
 (defconstant LCK$K_PWMODE 4)   ;  PROTECTED WRITE 
 (defconstant LCK$K_EXMODE 5)   ;  EXCLUSIVE 
            
(define-alien-structure (LCK    ( :conc-name nil))
    ; VALUE BLOCK INCLUDED 
    (LCK$V_VALBLK :unsigned-integer #.(+ 0 0/8) #.(+ 0 1/8)) 
    ; CONVERSION REQUEST 
    (LCK$V_CONVERT :unsigned-integer #.(+ 0 1/8) #.(+ 0 2/8)) 
    ; DO NOT QUEUE REQUEST 
    (LCK$V_NOQUEUE :unsigned-integer #.(+ 0 2/8) #.(+ 0 3/8)) 
    ; SYNCHRONOUS STATUS REQUESTED 
    (LCK$V_SYNCSTS :unsigned-integer #.(+ 0 3/8) #.(+ 0 4/8)) 
    ; SYSTEM LOCK 
    (LCK$V_SYSTEM :unsigned-integer #.(+ 0 4/8) #.(+ 0 5/8)) 
    ; DON'T CHARGE QUOTA
    (LCK$V_NOQUOTA :unsigned-integer #.(+ 0 5/8) #.(+ 0 6/8)) 
    ; CONVERT TO SYSTEM
    (LCK$V_CVTSYS :unsigned-integer #.(+ 0 6/8) #.(+ 0 7/8)) 
    ; RECOVER LOCK DURING FAILOVER
    (LCK$V_RECOVER :unsigned-integer #.(+ 0 7/8) #.(+ 0 8/8)) 
    ; PROTECT LOCK DURING FAILOVER
    (LCK$V_PROTECT :unsigned-integer #.(+ 0 8/8) #.(+ 0 9/8)) 
    ; NO DEADLOCK WAITING
    (LCK$V_NODLCKWT :unsigned-integer #.(+ 0 9/8) #.(+ 0 10/8)) 
    ; NO DEADLOCK BLOCKING
    (LCK$V_NODLCKBLK :unsigned-integer #.(+ 0 10/8) #.(+ 0 11/8)) 
    (LCK$V_fill_42 :unsigned-integer #.(+ 0 11/8) #.(+ 0 16/8)) 
    ; DEQUEUE ALL LOCKS 
    (LCK$V_DEQALL :unsigned-integer #.(+ 0 0/8) #.(+ 0 1/8)) 
    ; CANCEL REQUEST
    (LCK$V_CANCEL :unsigned-integer #.(+ 0 1/8) #.(+ 0 2/8)) 
    ; INVALIDATE VALUE BLOCK
    (LCK$V_INVVALBLK :unsigned-integer #.(+ 0 2/8) #.(+ 0 3/8)) 
    (LCK$V_fill_43 :unsigned-integer #.(+ 0 3/8) #.(+ 0 8/8)) )
    ;LOCK MODES 
      
 
;;;*** MODULE $LKIDEF ***
      
;;;+
;;;
;;; Get Lock Information Data Identifier Definitions
;;;
;;; **** NOTE ****
;;;
;;;        New items must always be added to the END of each item list
;;;        (preceeding the ENDlistname item) so that users will not have
;;;        to relink.
;;;-
;;; ITEM LIST BLOCKS
 (defconstant LKI$K_LENGTH 24)   ; LENGTH OF LIST BLOCK
 (defconstant LKI$C_LENGTH 24)   ; LENGTH OF LIST BLOCK
            
(define-alien-structure (LKI    ( :conc-name nil))
    ;LOCK ID ON MASTER
    (LKI$L_MSTLKID :unsigned-integer 0 4)
    ;OLD SYMBOL
    (LKI$L_LOCKID :unsigned-integer 0 4)
    ;PROCESS ID
  (LKI$L_PID :unsigned-integer 4 8)
    ;CSID OF MASTER
    (LKI$L_MSTCSID :unsigned-integer 8 12)
    ;OLD SYMBOL
    (LKI$L_SYSID :unsigned-integer 8 12)
    ;REQUEST MODE
  (LKI$B_RQMODE :unsigned-integer 12 13)
    ;GRANTED MODE
  (LKI$B_GRMODE :unsigned-integer 13 14)
    ;LOCK QUEUE
  (LKI$B_QUEUE :signed-integer 14 15)
    ;SPARE BYTE
  (LKI$$$_SPARE :signed-integer 15 16)
    ;LOCK ID ON PROCESS NODE 
    (LKI$L_LKID :unsigned-integer 16 20)
    ;OLD SYMBOL
    (LKI$L_REMLKID :unsigned-integer 16 20)
    ;CSID OF PROCESS NODE 
    (LKI$L_CSID :unsigned-integer 20 24)
    ;OLD SYMBOL
    (LKI$L_REMSYSID :unsigned-integer 20 24))    ;OLD SYMBOL
      
;;; DEFINE NAMSPACE FIELDS
 (defconstant LKI$M_SYSNAM #b10000000000000000000000000000000)
            
(define-alien-structure (NAMSPACE ( :conc-name nil))
    ;GROUP OF OWNER UIC
      (LKI$W_GROUP :unsigned-integer 0 2)
    ;ACCESS MODE OF REQUEST
      (LKI$B_RMOD :unsigned-integer 2 3)
    ;STATUS OF RESOURCE
      (LKI$B_STATUS :unsigned-integer 3 4)
    ; SPARE
      (LKI$$_FILL :unsigned-integer #.(+ 0 0/8) #.(+ 0 31/8)) 
    ; SYSTEM WIDE RSB
      (LKI$V_SYSNAM :unsigned-integer #.(+ 0 31/8) #.(+ 0 32/8)) )    ; SYSTEM WIDE RSB
      
;;; DEFINE STATE FIELDS
            
(define-alien-structure (STATEF ( :conc-name nil))
    ;REQUEST MODE
  (LKI$B_STATE_RQMODE :unsigned-integer 0 1)
    ;GRANTED MODE
  (LKI$B_STATE_GRMODE :unsigned-integer 1 2)
    ;LOCK STATE CODE
  (LKI$B_STATE_QUEUE :signed-integer 2 3))    ;LOCK STATE CODE
      
;;;LOCK STATE CODE VALUES
 (defconstant LKI$C_GRANTED 1)   ;  GRANTED
 (defconstant LKI$C_CONVERT 0)   ;  CONVERSION
 (defconstant LKI$C_WAITING -1)   ;  WAITING
 (defconstant LKI$C_RETRY -2)   ;  RETRY REQUEST
 (defconstant LKI$C_SCSWAIT -3)   ;  SCS WAIT
 (defconstant LKI$C_RSPNOTQED -4)   ;  RESPONSE NOT QUEUED
 (defconstant LKI$C_RSPQUEUED -5)   ;  RESPONSE QUEUED
 (defconstant LKI$C_RSPGRANTD -6)   ;  RESPONSE GRANTED
 (defconstant LKI$C_RSPDOLOCL -7)   ;  RESPONSE DO LOCALLY
 (defconstant LKI$C_RSPRESEND -8)   ;  RESPONSE RESEND
;;; DEFINE TABLE NUMBERS 
;;; STRUCTURE CODES MUST START AT 1
 (defconstant LKI$C_LKBTYPE 1)   ;  ITEM IN LKB 
 (defconstant LKI$C_RSBTYPE 2)   ;  ITEM IN RSB
 (defconstant LKI$C_LISTEND 0)   ;  DEFINE ITMLST TERMINATOR 
;;; ITEM IDENTIFIERS FOR LKB
 (defconstant LKI$_PID 256)   ;  PROCESS ID
 (defconstant LKI$_STATE 257)   ;  CURRENT LOCK STATE
 (defconstant LKI$_PARENT 258)   ;  ID OF PARENT LOCK
 (defconstant LKI$_LCKREFCNT 259)   ;  SUB-LOCK REFERENCE COUNT
 (defconstant LKI$_LOCKID 260)   ;  LOCK ID
 (defconstant LKI$_REMLKID 261)   ;  REMOTE LOCK ID
 (defconstant LKI$_MSTLKID 262)   ;  LOCK ID ON RESOURCE MASTER
 (defconstant LKI$_LKID 263)   ;  LOCK ID ON PROCESS NODE
 (defconstant LKI$_CSID 264)   ;  CSID OF PROCESS NODE
 (defconstant LKI$_LASTLKB 265)   ;  MAX INDEX IN LKB TABLE 
;;; ITEM IDENTIFIERS FOR RSB
 (defconstant LKI$_NAMSPACE 512)   ;  RESOURCE NAME SPACE
 (defconstant LKI$_RESNAM 513)   ;  RESOURCE NAME
 (defconstant LKI$_RSBREFCNT 514)   ;  SUB-RESOURCE REFERENCE COUNT
 (defconstant LKI$_VALBLK 515)   ;  VALUE BLOCK
 (defconstant LKI$_SYSTEM 516)   ;  SYSTEM ID OF SYSTEM WITH RESOURCE
 (defconstant LKI$_LCKCOUNT 517)   ;  COUNT OF LOCKS ON RESOURCE
 (defconstant LKI$_BLOCKEDBY 518)   ;  LIST OF LOCKS BLOCKED BY CURRENT LOCK
 (defconstant LKI$_BLOCKING 519)   ;  LIST OF LOCKS BLOCKING CURRENT LOCK
 (defconstant LKI$_LOCKS 520)   ;  LIST OF ALL LOCKS ON RESOURCE
 (defconstant LKI$_CVTCOUNT 521)   ;  COUNT OF LOCKS ON CONVERSION QUEUE
 (defconstant LKI$_WAITCOUNT 522)   ;  COUNT OF LOCKS ON WAIT QUEUE 
 (defconstant LKI$_GRANTCOUNT 523)   ;  COUNT OF LOCKS ON GRANT QUEUE 
 (defconstant LKI$_MSTCSID 524)   ;  CSID OF RESOURCE MASTER
 (defconstant LKI$_LASTRSB 525)   ;  MAX INDEX IN RSB
 
;;;*** MODULE $LMFDEF ***
      
 (defconstant LMF$_PROD_TOKEN 1)
 (defconstant LMF$_HW_ID 2)
 (defconstant LMF$_PROD_VERSION 3)
 (defconstant LMF$_PROD_DATE 4)
 (defconstant LMF$_CHARGE_TYPE 5)
 (defconstant LMF$_UNITS_IN_USE 6)
 (defconstant LMF$C_PRDNAMLEN 24)
 (defconstant LMF$K_PRDNAMLEN 24)
 (defconstant LMF$C_PRDUCERLEN 24)
 (defconstant LMF$K_PRDUCERLEN 24)
 (defconstant LMF$C_CONTEXTLEN 16)
 (defconstant LMF$K_CONTEXTLEN 16)
 (defconstant LMF$C_TOKENLEN 31)
 (defconstant LMF$K_TOKENLEN 31)
 (defconstant LMF$C_HW_IDLEN 31)
 (defconstant LMF$K_HW_IDLEN 31)
 (defconstant LMF$C_VERSIONLEN 4)
 (defconstant LMF$K_VERSIONLEN 4)
 (defconstant LMF$K_DATELEN 8)
 (defconstant LMF$C_DATELEN 8)
 (defconstant LMF$M_RETURN_FAILURES #b00000000000000000000000000000001)
 (defconstant LMF$M_BROADCAST_FAILURES #b00000000000000000000000000000010)
 (defconstant LMF$M_OUTPUT_FAILURES #b00000000000000000000000000000100)
 (defconstant LMF$M_LOOKUP_LICENSE_SPARE #b11111111111111111111111111111000)
            
(define-alien-structure (dvspm_masks ( :conc-name nil))
    ; return status .vs. signal
  (LMF$V_RETURN_FAILURES :unsigned-integer #.(+ 0 0/8) #.(+ 0 1/8)) 
    ; do an OPCOM
  (LMF$V_BROADCAST_FAILURES :unsigned-integer #.(+ 0 1/8) #.(+ 0 2/8)) 
    ; do a PUTMSG
  (LMF$V_OUTPUT_FAILURES :unsigned-integer #.(+ 0 2/8) #.(+ 0 3/8)) 
    ; spare area
  (LMF$V_LOOKUP_LICENSE_SPARE :unsigned-integer #.(+ 0 3/8) #.(+ 0 32/8)) )    ; spare area
      
 
;;;*** MODULE $LNMDEF ***
      
 (defconstant LNM$M_NO_ALIAS #b00000000000000000000000000000001)
 (defconstant LNM$M_CONFINE #b00000000000000000000000000000010)
 (defconstant LNM$M_CRELOG #b00000000000000000000000000000100)
 (defconstant LNM$M_TABLE #b00000000000000000000000000001000)
 (defconstant LNM$M_CONCEALED #b00000000000000000000000100000000)
 (defconstant LNM$M_TERMINAL #b00000000000000000000001000000000)
 (defconstant LNM$M_EXISTS #b00000000000000000000010000000000)
 (defconstant LNM$M_SHAREABLE #b00000000000000010000000000000000)
 (defconstant LNM$M_CREATE_IF #b00000001000000000000000000000000)
 (defconstant LNM$M_CASE_BLIND #b00000010000000000000000000000000)
            
(define-alien-structure (LNM    ( :conc-name nil))
    ; Do not allow outer mode alias
  (LNM$V_NO_ALIAS :unsigned-integer #.(+ 0 0/8) #.(+ 0 1/8)) 
    ; Do not copy into subprocess
  (LNM$V_CONFINE :unsigned-integer #.(+ 0 1/8) #.(+ 0 2/8)) 
    ; Created with old $CRELOG service
  (LNM$V_CRELOG :unsigned-integer #.(+ 0 2/8) #.(+ 0 3/8)) 
    ; This is a table name
  (LNM$V_TABLE :unsigned-integer #.(+ 0 3/8) #.(+ 0 4/8)) 
    ; Fill out logical name byte
  (LNM$V_FILL_0 :unsigned-integer #.(+ 0 4/8) #.(+ 0 8/8)) 
    ; Logical name translation attributes -- bits 8-15
    ; Do not display result of translation
  (LNM$V_CONCEALED :unsigned-integer #.(+ 0 8/8) #.(+ 0 9/8)) 
    ; Do not retranslate result of translation
  (LNM$V_TERMINAL :unsigned-integer #.(+ 0 9/8) #.(+ 0 10/8)) 
    ; Translation does exist at this index
  (LNM$V_EXISTS :unsigned-integer #.(+ 0 10/8) #.(+ 0 11/8)) 
    ; Fill out translation byte
  (LNM$V_FILL_1 :unsigned-integer #.(+ 0 11/8) #.(+ 0 16/8)) 
    ; Logical name table characteristics -- bits 16-23
    ; Logical name table is shareable (S0 space)
  (LNM$V_SHAREABLE :unsigned-integer #.(+ 0 16/8) #.(+ 0 17/8)) 
    ; Reserved bit numbers 17-19
  (LNM$V_FILL_2 :unsigned-integer #.(+ 0 17/8) #.(+ 0 20/8)) 
    ; Fill out table byte
  (LNM$V_FILL_3 :unsigned-integer #.(+ 0 20/8) #.(+ 0 24/8)) 
    ; System service options -- bits 24-31
    ; May map to existing logical name table
  (LNM$V_CREATE_IF :unsigned-integer #.(+ 0 24/8) #.(+ 0 25/8)) 
    ; Perform case-insensitive translation
  (LNM$V_CASE_BLIND :unsigned-integer #.(+ 0 25/8) #.(+ 0 26/8)) 
    ; Fill out options byte
  (LNM$V_FILL_4 :unsigned-integer #.(+ 0 26/8) #.(+ 0 32/8)) )    ; Fill out options byte
      
;;; Logical name attributes -- bits 0-7
;;; Logical name translation attributes -- bits 8-15
;;; Logical name table characteristics -- bits 16-23
;;; System service options -- bits 24-31
 (defconstant LNM$C_TABNAMLEN 31)   ;  Maximum length of a name contained within a directory table
 (defconstant LNM$C_NAMLENGTH 255)   ;  Maximum logical name / translation length
 (defconstant LNM$C_MAXDEPTH 10)   ;  Maximum logical name recursion depth
 (defconstant LNM$_INDEX 1)   ;  Translation index
 (defconstant LNM$_STRING 2)   ;  Translation string
 (defconstant LNM$_ATTRIBUTES 3)   ;  Attribute bits
 (defconstant LNM$_TABLE 4)   ;  Logical name table name
 (defconstant LNM$_LENGTH 5)   ;  Length of translation string
 (defconstant LNM$_ACMODE 6)   ;  Access mode of name
 (defconstant LNM$_MAX_INDEX 7)   ;  Maximum translation index
 (defconstant LNM$_PARENT 8)   ;  Parent logical name table name
 (defconstant LNM$_LNMB_ADDR 9)   ;  Return LNM block address
;;;  internal use by MTL 
;;;  and mailbox UCB
;;; Define item list codes
 (defconstant LNM$_CHAIN -1)   ;  Chain to next list
 
;;;*** MODULE $LPDEF ***
      
;;;+
;;; LINE PRINTER CHARACTERISTICS DEFINITIONS
;;;-
 (defconstant LP$M_CR #b00000000000000000000000000000001)
 (defconstant LP$M_MECHFORM #b00000000000000000000000000000010)
 (defconstant LP$M_PRINTALL #b00000000000000000000000000000100)
 (defconstant LP$M_DAVFU #b00000000000000000000000000001000)
 (defconstant LP$M_WRAP #b00000000000000000000000000010000)
 (defconstant LP$M_TRUNCATE #b00000000000000000000000000100000)
 (defconstant LP$M_TAB #b00000000000000000000000001000000)
 (defconstant LP$M_LOWER #b00000000000000000000000010000000)
 (defconstant LP$M_PASSALL #b00000000000000000000000100000000)
 (defconstant LP$M_FALLBACK #b00000000000000000000001000000000)
 (defconstant LP$M_SIXELS #b00000000000000000000010000000000)
 (defconstant LP$M_BITMAPPED #b00000000000000000000100000000000)
 (defconstant LP$M_PAGE_L #b11111111000000000000000000000000)
 (defconstant LP$_LP11 1)
 (defconstant LP$_LA11 2)
 (defconstant LP$_LA180 3)
            
(define-alien-structure (LP    ( :conc-name nil))
    ; CARRIAGE RETURN NEEDED 
    (LP$V_CR :unsigned-integer #.(+ 0 0/8) #.(+ 0 1/8)) 
    ; MECHANICAL FORM FEED 
    (LP$V_MECHFORM :unsigned-integer #.(+ 0 1/8) #.(+ 0 2/8)) 
    ; NON PRINTABLE CHAR. ACCEPT(DMF-32) 
    (LP$V_PRINTALL :unsigned-integer #.(+ 0 2/8) #.(+ 0 3/8)) 
    ; DAVFU AVAIL. 
    (LP$V_DAVFU :unsigned-integer #.(+ 0 3/8) #.(+ 0 4/8)) 
    ; CHAR. WRAP MODE 
    (LP$V_WRAP :unsigned-integer #.(+ 0 4/8) #.(+ 0 5/8)) 
    ; TRUNCATE output at carriage width
    (LP$V_TRUNCATE :unsigned-integer #.(+ 0 5/8) #.(+ 0 6/8)) 
    ; TAB needed
    (LP$V_TAB :unsigned-integer #.(+ 0 6/8) #.(+ 0 7/8)) 
    ; PRINTER HAS LOWER CASE 
    (LP$V_LOWER :unsigned-integer #.(+ 0 7/8) #.(+ 0 8/8)) 
    ; PASSALL MODE 
    (LP$V_PASSALL :unsigned-integer #.(+ 0 8/8) #.(+ 0 9/8)) 
    ; FALLBACK MODE
    (LP$V_FALLBACK :unsigned-integer #.(+ 0 9/8) #.(+ 0 10/8)) 
    ; HANDLES SIXELS
    (LP$V_SIXELS :unsigned-integer #.(+ 0 10/8) #.(+ 0 11/8)) 
    ; HANDLES BIT MAPS
    (LP$V_BITMAPPED :unsigned-integer #.(+ 0 11/8) #.(+ 0 12/8)) 
    ; SPARE UNUSED BITS 
    (LPDEF$$_FILL_2 :unsigned-integer #.(+ 0 12/8) #.(+ 0 24/8)) 
    ; PAGE LENGTH 
    (LP$V_PAGE_L :unsigned-integer #.(+ 0 24/8) #.(+ 0 32/8)) )    ; PAGE LENGTH 
      
