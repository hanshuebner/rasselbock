(in-package :rasselbock)

;;; rab$l_fab has been typed :POINTER by hand!
(provide 'rmsusr)

; ********************************************************************************************************************************
;  Created 25-FEB-1987 12:19:46 by VAX-11 SDL V3.0-2      Source: 25-FEB-1987 12:19:30 LISPW$:[MILLER.TEMP]RMSUSR.TXT;1 
; ********************************************************************************************************************************
 
;;;*** MODULE $FABDEF ***
      
;;;+++++*****
;;;   the fields thru ctx must not be modified due to
;;;   commonality between fab/rab/xab
 (defconstant FAB$C_BID 3)   ;  code for fab 
 (defconstant FAB$M_PPF_RAT #b00000000000000000011111111000000)
 (defconstant FAB$M_PPF_IND #b00000000000000000100000000000000)
 (defconstant FAB$M_ASY #b00000000000000000000000000000001)
 (defconstant FAB$M_MXV #b00000000000000000000000000000010)
 (defconstant FAB$M_SUP #b00000000000000000000000000000100)
 (defconstant FAB$M_TMP #b00000000000000000000000000001000)
 (defconstant FAB$M_TMD #b00000000000000000000000000010000)
 (defconstant FAB$M_DFW #b00000000000000000000000000100000)
 (defconstant FAB$M_SQO #b00000000000000000000000001000000)
 (defconstant FAB$M_RWO #b00000000000000000000000010000000)
 (defconstant FAB$M_POS #b00000000000000000000000100000000)
 (defconstant FAB$M_WCK #b00000000000000000000001000000000)
 (defconstant FAB$M_NEF #b00000000000000000000010000000000)
 (defconstant FAB$M_RWC #b00000000000000000000100000000000)
 (defconstant FAB$M_DMO #b00000000000000000001000000000000)
 (defconstant FAB$M_SPL #b00000000000000000010000000000000)
 (defconstant FAB$M_SCF #b00000000000000000100000000000000)
 (defconstant FAB$M_DLT #b00000000000000001000000000000000)
 (defconstant FAB$M_NFS #b00000000000000010000000000000000)
 (defconstant FAB$M_UFO #b00000000000000100000000000000000)
 (defconstant FAB$M_PPF #b00000000000001000000000000000000)
 (defconstant FAB$M_INP #b00000000000010000000000000000000)
 (defconstant FAB$M_CTG #b00000000000100000000000000000000)
 (defconstant FAB$M_CBT #b00000000001000000000000000000000)
 (defconstant FAB$M_RCK #b00000000100000000000000000000000)
 (defconstant FAB$M_NAM #b00000001000000000000000000000000)
 (defconstant FAB$M_CIF #b00000010000000000000000000000000)
 (defconstant FAB$M_ESC #b00001000000000000000000000000000)
 (defconstant FAB$M_TEF #b00010000000000000000000000000000)
 (defconstant FAB$M_OFP #b00100000000000000000000000000000)
 (defconstant FAB$M_KFO #b01000000000000000000000000000000)
 (defconstant FAB$M_PUT #b00000000000000000000000000000001)
 (defconstant FAB$M_GET #b00000000000000000000000000000010)
 (defconstant FAB$M_DEL #b00000000000000000000000000000100)
 (defconstant FAB$M_UPD #b00000000000000000000000000001000)
 (defconstant FAB$M_TRN #b00000000000000000000000000010000)
 (defconstant FAB$M_BIO #b00000000000000000000000000100000)
 (defconstant FAB$M_BRO #b00000000000000000000000001000000)
 (defconstant FAB$M_EXE #b00000000000000000000000010000000)
 (defconstant FAB$M_SHRPUT #b00000000000000000000000000000001)
 (defconstant FAB$M_SHRGET #b00000000000000000000000000000010)
 (defconstant FAB$M_SHRDEL #b00000000000000000000000000000100)
 (defconstant FAB$M_SHRUPD #b00000000000000000000000000001000)
 (defconstant FAB$M_MSE #b00000000000000000000000000010000)
 (defconstant FAB$M_NIL #b00000000000000000000000000100000)
 (defconstant FAB$M_UPI #b00000000000000000000000001000000)
 (defconstant FAB$C_SEQ 0)   ;  sequential 
 (defconstant FAB$C_REL 16)   ;  relative 
 (defconstant FAB$C_IDX 32)   ;  indexed 
 (defconstant FAB$C_HSH 48)   ;  hashed 
 (defconstant FAB$M_FTN #b00000000000000000000000000000001)
 (defconstant FAB$M_CR #b00000000000000000000000000000010)
 (defconstant FAB$M_PRN #b00000000000000000000000000000100)
 (defconstant FAB$M_BLK #b00000000000000000000000000001000)
 (defconstant FAB$C_RFM_DFLT 2)   ;  var len is default 
 (defconstant FAB$C_UDF 0)   ;  undefined (also stream binary) 
 (defconstant FAB$C_FIX 1)   ;  fixed length records 
 (defconstant FAB$C_VAR 2)   ;  variable length records 
 (defconstant FAB$C_VFC 3)   ;  variable fixed control 
 (defconstant FAB$C_STM 4)   ;  RMS-11 stream (valid only for sequential org) 
 (defconstant FAB$C_STMLF 5)   ;  LF stream (valid only for sequential org) 
 (defconstant FAB$C_STMCR 6)   ;  CR stream (valid only for sequential org) 
 (defconstant FAB$C_MAXRFM 6)   ;  maximum rfm supported 
 (defconstant FAB$M_ONLY_RU #b00000000000000000000000000000001)
 (defconstant FAB$M_RU #b00000000000000000000000000000010)
 (defconstant FAB$M_BI #b00000000000000000000000000000100)
 (defconstant FAB$M_AI #b00000000000000000000000000001000)
 (defconstant FAB$M_AT #b00000000000000000000000000010000)
 (defconstant FAB$M_NEVER_RU #b00000000000000000000000000100000)
 (defconstant FAB$M_JOURNAL_FILE #b00000000000000000000000001000000)
 (defconstant FAB$M_RCF_RU #b00000000000000000000000000000001)
 (defconstant FAB$M_RCF_AI #b00000000000000000000000000000010)
 (defconstant FAB$M_RCF_BI #b00000000000000000000000000000100)
 (defconstant FAB$K_BLN 80)   ;  length of fab 
 (defconstant FAB$C_BLN 80)   ;  length of fab 
            
(define-alien-structure (FAB    ( :conc-name nil))
    ; block id 
  (FAB$B_BID :unsigned-integer 0 1 :default FAB$C_BID)
    ; block len 
  (FAB$B_BLN :unsigned-integer 1 2 :default FAB$C_BLN)
    ; internal file index 
    (FAB$W_IFI :unsigned-integer 2 4)
    ; move to bit 6 
      (FABDEF$$_FILL_1 :unsigned-integer #.(+ 2 0/8) #.(+ 2 6/8)) 
    ; rat value for process-permanent files 
      (FAB$V_PPF_RAT :unsigned-integer #.(+ 2 6/8) #.(+ 2 14/8)) 
    ; indirect access to process-permanent file 
      (FAB$V_PPF_IND :unsigned-integer #.(+ 2 14/8) #.(+ 2 15/8)) 
    ; (i.e., restricted operations)
      (FAB$V_fill_0 :unsigned-integer #.(+ 2 15/8) #.(+ 2 16/8)) 
    ; file options 
    (FAB$L_FOP :unsigned-integer 4 8)
    ; asynchronous operations (not implemented)
      (FAB$V_ASY :unsigned-integer #.(+ 4 0/8) #.(+ 4 1/8)) 
    ; maximize version number 
      (FAB$V_MXV :unsigned-integer #.(+ 4 1/8) #.(+ 4 2/8)) 
    ; supersede existing file 
      (FAB$V_SUP :unsigned-integer #.(+ 4 2/8) #.(+ 4 3/8)) 
    ; create temporary file 
      (FAB$V_TMP :unsigned-integer #.(+ 4 3/8) #.(+ 4 4/8)) 
    ; create temp file marked for delete 
      (FAB$V_TMD :unsigned-integer #.(+ 4 4/8) #.(+ 4 5/8)) 
    ; deferred write (rel and idx) 
      (FAB$V_DFW :unsigned-integer #.(+ 4 5/8) #.(+ 4 6/8)) 
    ; sequential access only 
      (FAB$V_SQO :unsigned-integer #.(+ 4 6/8) #.(+ 4 7/8)) 
    ; rewind mt on open 
      (FAB$V_RWO :unsigned-integer #.(+ 4 7/8) #.(+ 4 8/8)) 
    ; use next magtape position 
      (FAB$V_POS :unsigned-integer #.(+ 4 8/8) #.(+ 4 9/8)) 
    ; write checking 
      (FAB$V_WCK :unsigned-integer #.(+ 4 9/8) #.(+ 4 10/8)) 
    ; inhibit end of file positioning 
      (FAB$V_NEF :unsigned-integer #.(+ 4 10/8) #.(+ 4 11/8)) 
    ; rewind mt on close 
      (FAB$V_RWC :unsigned-integer #.(+ 4 11/8) #.(+ 4 12/8)) 
    ; dismount mt on close (not implemented) 
      (FAB$V_DMO :unsigned-integer #.(+ 4 12/8) #.(+ 4 13/8)) 
    ; spool file on close 
      (FAB$V_SPL :unsigned-integer #.(+ 4 13/8) #.(+ 4 14/8)) 
    ; submit command file on close 
      (FAB$V_SCF :unsigned-integer #.(+ 4 14/8) #.(+ 4 15/8)) 
    ; delete sub-option 
      (FAB$V_DLT :unsigned-integer #.(+ 4 15/8) #.(+ 4 16/8)) 
    ; non-file structured operation 
      (FAB$V_NFS :unsigned-integer #.(+ 4 16/8) #.(+ 4 17/8)) 
    ; user file open - no rms operations 
      (FAB$V_UFO :unsigned-integer #.(+ 4 17/8) #.(+ 4 18/8)) 
    ; process permanent file (pio segment) 
      (FAB$V_PPF :unsigned-integer #.(+ 4 18/8) #.(+ 4 19/8)) 
    ; process-permanent file is 'input' 
      (FAB$V_INP :unsigned-integer #.(+ 4 19/8) #.(+ 4 20/8)) 
    ; contiguous extension 
      (FAB$V_CTG :unsigned-integer #.(+ 4 20/8) #.(+ 4 21/8)) 
    ; contiguous best try 
      (FAB$V_CBT :unsigned-integer #.(+ 4 21/8) #.(+ 4 22/8)) 
    ; reserved (not implemented)
      (FABDEF$$_FILL_2 :unsigned-integer #.(+ 4 22/8) #.(+ 4 23/8)) 
    ; read checking 
      (FAB$V_RCK :unsigned-integer #.(+ 4 23/8) #.(+ 4 24/8)) 
    ; use name block dvi, did, and/or fid fields for open 
      (FAB$V_NAM :unsigned-integer #.(+ 4 24/8) #.(+ 4 25/8)) 
    ; create if non-existent 
      (FAB$V_CIF :unsigned-integer #.(+ 4 25/8) #.(+ 4 26/8)) 
    ; reserved (was UFM bitfield)
      (FABDEF$$_FILL_3 :unsigned-integer #.(+ 4 26/8) #.(+ 4 27/8)) 
    ; 'escape' to non-standard function ($modify) 
      (FAB$V_ESC :unsigned-integer #.(+ 4 27/8) #.(+ 4 28/8)) 
    ; truncate at eof on close (write-accessed seq. disk file only) 
      (FAB$V_TEF :unsigned-integer #.(+ 4 28/8) #.(+ 4 29/8)) 
    ; output file parse (only name type sticky) 
      (FAB$V_OFP :unsigned-integer #.(+ 4 29/8) #.(+ 4 30/8)) 
    ; known file open (image activator only release 1) 
      (FAB$V_KFO :unsigned-integer #.(+ 4 30/8) #.(+ 4 31/8)) 
    ; reserved (not implemented) 
      (FABDEF$$_FILL_4 :unsigned-integer #.(+ 4 31/8) #.(+ 4 32/8)) 
    ; status 
  (FAB$L_STS :unsigned-integer 8 12)
    ; status value 
  (FAB$L_STV :unsigned-integer 12 16)
    ; allocation quantity 
  (FAB$L_ALQ :unsigned-integer 16 20)
    ; default allocation quantity 
  (FAB$W_DEQ :unsigned-integer 20 22)
    ; file access 
    (FAB$B_FAC :unsigned-integer 22 23)
    ; put access 
      (FAB$V_PUT :unsigned-integer #.(+ 22 0/8) #.(+ 22 1/8)) 
    ; get access 
      (FAB$V_GET :unsigned-integer #.(+ 22 1/8) #.(+ 22 2/8)) 
    ; delete access 
      (FAB$V_DEL :unsigned-integer #.(+ 22 2/8) #.(+ 22 3/8)) 
    ; update access 
      (FAB$V_UPD :unsigned-integer #.(+ 22 3/8) #.(+ 22 4/8)) 
    ; truncate access 
      (FAB$V_TRN :unsigned-integer #.(+ 22 4/8) #.(+ 22 5/8)) 
    ; block i/o access 
      (FAB$V_BIO :unsigned-integer #.(+ 22 5/8) #.(+ 22 6/8)) 
    ; block and record i/o access 
      (FAB$V_BRO :unsigned-integer #.(+ 22 6/8) #.(+ 22 7/8)) 
    ; execute access (caller must be exec or kernel mode, 
      (FAB$V_EXE :unsigned-integer #.(+ 22 7/8) #.(+ 22 8/8)) 
    ;  ufo must also be set)
    ; file sharing 
    (FAB$B_SHR :unsigned-integer 23 24)
    ; put access 
      (FAB$V_SHRPUT :unsigned-integer #.(+ 23 0/8) #.(+ 23 1/8)) 
    ; get access 
      (FAB$V_SHRGET :unsigned-integer #.(+ 23 1/8) #.(+ 23 2/8)) 
    ; delete access 
      (FAB$V_SHRDEL :unsigned-integer #.(+ 23 2/8) #.(+ 23 3/8)) 
    ; update access 
      (FAB$V_SHRUPD :unsigned-integer #.(+ 23 3/8) #.(+ 23 4/8)) 
    ; multi-stream connects enabled 
      (FAB$V_MSE :unsigned-integer #.(+ 23 4/8) #.(+ 23 5/8)) 
    ; no sharing 
      (FAB$V_NIL :unsigned-integer #.(+ 23 5/8) #.(+ 23 6/8)) 
    ; user provided interlocking (allows multiple 
      (FAB$V_UPI :unsigned-integer #.(+ 23 6/8) #.(+ 23 7/8)) 
    ;  writers to seq. files)
      (FAB$V_fill_1 :unsigned-integer #.(+ 23 7/8) #.(+ 23 8/8)) 
    ; user context 
  (FAB$L_CTX :unsigned-integer 24 28)
    ;-----*****
    ; retrieval window size 
  (FAB$B_RTV :signed-integer 28 29)
    ; file organization 
    (FAB$B_ORG :unsigned-integer 29 30)
      (FABDEF$$_FILL_5 :unsigned-integer #.(+ 29 0/8) #.(+ 29 4/8)) 
      (FAB$V_ORG :unsigned-integer #.(+ 29 4/8) #.(+ 29 8/8)) 
    ; record format 
    (FAB$B_RAT :unsigned-integer 30 31)
    ; fortran carriage-ctl 
      (FAB$V_FTN :unsigned-integer #.(+ 30 0/8) #.(+ 30 1/8)) 
    ; lf-record-cr carriage ctl 
      (FAB$V_CR :unsigned-integer #.(+ 30 1/8) #.(+ 30 2/8)) 
    ; print-file carriage ctl 
      (FAB$V_PRN :unsigned-integer #.(+ 30 2/8) #.(+ 30 3/8)) 
    ; records don't cross block boundaries 
      (FAB$V_BLK :unsigned-integer #.(+ 30 3/8) #.(+ 30 4/8)) 
      (FAB$V_fill_2 :unsigned-integer #.(+ 30 4/8) #.(+ 30 8/8)) 
    ; record format 
  (FAB$B_RFM :unsigned-integer 31 32)
    ; journaling options (from FH2$B_JOURNAL)
    (FAB$B_JOURNAL :unsigned-integer 32 33)
    ; note: only one of RU, ONLY_RU, NEVER_RU
    ; may be set at a time
    ; file is accessible only in recovery unit 
      (FAB$V_ONLY_RU :unsigned-integer #.(+ 32 0/8) #.(+ 32 1/8)) 
    ; enable recovery unit journal 
      (FAB$V_RU :unsigned-integer #.(+ 32 1/8) #.(+ 32 2/8)) 
    ; enable before image journal 
      (FAB$V_BI :unsigned-integer #.(+ 32 2/8) #.(+ 32 3/8)) 
    ; enable after image journal 
      (FAB$V_AI :unsigned-integer #.(+ 32 3/8) #.(+ 32 4/8)) 
    ; enable audit trail journal 
      (FAB$V_AT :unsigned-integer #.(+ 32 4/8) #.(+ 32 5/8)) 
    ; file is never accessible in recovery unit
      (FAB$V_NEVER_RU :unsigned-integer #.(+ 32 5/8) #.(+ 32 6/8)) 
    ; this is a journal file
      (FAB$V_JOURNAL_FILE :unsigned-integer #.(+ 32 6/8) #.(+ 32 7/8)) 
      (FAB$V_fill_3 :unsigned-integer #.(+ 32 7/8) #.(+ 32 8/8)) 
    ; recoverable facility id number
  (FAB$B_RU_FACILITY :unsigned-integer 33 34)
    ; (spare)
  (FABDEF$$_FILL_7 :signed-integer 34 36)
    ; xab address 
  (FAB$L_XAB :pointer 36 40)
    ; nam block address 
  (FAB$L_NAM :pointer 40 44)
    ; file name string address 
  (FAB$L_FNA :pointer 44 48)
    ; default file name string addr 
  (FAB$L_DNA :pointer 48 52)
    ; file name string size 
  (FAB$B_FNS :unsigned-integer 52 53)
    ; default name string size 
  (FAB$B_DNS :unsigned-integer 53 54)
    ; maximum record size 
  (FAB$W_MRS :unsigned-integer 54 56)
    ; maximum record number 
  (FAB$L_MRN :unsigned-integer 56 60)
    ; blocksize for tape 
  (FAB$W_BLS :unsigned-integer 60 62)
    ; bucket size 
  (FAB$B_BKS :unsigned-integer 62 63)
    ; fixed header size 
  (FAB$B_FSZ :unsigned-integer 63 64)
    ; device characteristics 
  (FAB$L_DEV :unsigned-integer 64 68)
    ; spooling device characteristics 
  (FAB$L_SDC :unsigned-integer 68 72)
    ; Global buffer count 
  (FAB$W_GBC :unsigned-integer 72 74)
    ; agent access modes
    (FAB$B_ACMODES :unsigned-integer 74 75)
    ; ACMODE for log nams
      (FAB$V_LNM_MODE :unsigned-integer #.(+ 74 0/8) #.(+ 74 2/8)) 
    ; ACMODE for channel
      (FAB$V_CHAN_MODE :unsigned-integer #.(+ 74 2/8) #.(+ 74 4/8)) 
    ; ACMODE to use for determining file accessibility
      (FAB$V_FILE_MODE :unsigned-integer #.(+ 74 4/8) #.(+ 74 6/8)) 
    ; ACMODE for user structure probing;
      (FAB$V_CALLERS_MODE :unsigned-integer #.(+ 74 6/8) #.(+ 74 8/8)) 
    ; maximized with actual mode of caller
    ; recovery control flags
    ; (only for use by RMS Recovery)
    (FAB$B_RCF :unsigned-integer 75 76)
    ; recovery unit recovery
      (FAB$V_RCF_RU :unsigned-integer #.(+ 75 0/8) #.(+ 75 1/8)) 
    ; after image recovery
      (FAB$V_RCF_AI :unsigned-integer #.(+ 75 1/8) #.(+ 75 2/8)) 
    ; before image recovery
      (FAB$V_RCF_BI :unsigned-integer #.(+ 75 2/8) #.(+ 75 3/8)) 
      (FAB$V_fill_4 :unsigned-integer #.(+ 75 3/8) #.(+ 75 8/8)) 
    ; (spare) 
  (FABDEF$$_FILL_9 :signed-integer 76 80))    ; (spare) 
      
;;;-----*****
 
;;;*** MODULE $RABDEF ***
      
;;;
;;;         record access block (rab) definitions
;;;
;;;  there is one rab per connected stream
;;;  it is used for all communications between the user
;;;  and rms concerning operations on the stream
;;;
;;;+++++*****
;;;  the fields thru ctx cannot be changed due to commonality
;;;  with the fab
;;;
 (defconstant RAB$C_BID 1)   ;  code for rab 
 (defconstant RAB$M_PPF_RAT #b00000000000000000011111111000000)
 (defconstant RAB$M_PPF_IND #b00000000000000000100000000000000)
 (defconstant RAB$M_ASY #b00000000000000000000000000000001)
 (defconstant RAB$M_TPT #b00000000000000000000000000000010)
 (defconstant RAB$M_REA #b00000000000000000000000000000100)
 (defconstant RAB$M_RRL #b00000000000000000000000000001000)
 (defconstant RAB$M_UIF #b00000000000000000000000000010000)
 (defconstant RAB$M_MAS #b00000000000000000000000000100000)
 (defconstant RAB$M_FDL #b00000000000000000000000001000000)
 (defconstant RAB$M_HSH #b00000000000000000000000010000000)
 (defconstant RAB$M_EOF #b00000000000000000000000100000000)
 (defconstant RAB$M_RAH #b00000000000000000000001000000000)
 (defconstant RAB$M_WBH #b00000000000000000000010000000000)
 (defconstant RAB$M_BIO #b00000000000000000000100000000000)
 (defconstant RAB$M_LV2 #b00000000000000000001000000000000)
 (defconstant RAB$M_LOA #b00000000000000000010000000000000)
 (defconstant RAB$M_LIM #b00000000000000000100000000000000)
 (defconstant RAB$M_LOC #b00000000000000010000000000000000)
 (defconstant RAB$M_WAT #b00000000000000100000000000000000)
 (defconstant RAB$M_ULK #b00000000000001000000000000000000)
 (defconstant RAB$M_RLK #b00000000000010000000000000000000)
 (defconstant RAB$M_NLK #b00000000000100000000000000000000)
 (defconstant RAB$M_KGE #b00000000001000000000000000000000)
 (defconstant RAB$M_KGT #b00000000010000000000000000000000)
 (defconstant RAB$M_NXR #b00000000100000000000000000000000)
 (defconstant RAB$M_RNE #b00000001000000000000000000000000)
 (defconstant RAB$M_TMO #b00000010000000000000000000000000)
 (defconstant RAB$M_CVT #b00000100000000000000000000000000)
 (defconstant RAB$M_RNF #b00001000000000000000000000000000)
 (defconstant RAB$M_ETO #b00010000000000000000000000000000)
 (defconstant RAB$M_PTA #b00100000000000000000000000000000)
 (defconstant RAB$M_PMT #b01000000000000000000000000000000)
 (defconstant RAB$M_CCO #b10000000000000000000000000000000)
 (defconstant RAB$M_EQNXT #b00000000001000000000000000000000)
 (defconstant RAB$M_NXT #b00000000010000000000000000000000)
 (defconstant RAB$C_SEQ 0)   ;  sequential access 
 (defconstant RAB$C_KEY 1)   ;  keyed access 
 (defconstant RAB$C_RFA 2)   ;  rfa access 
 (defconstant RAB$C_STM 3)   ;  stream access (valid only for sequential org) 
 (defconstant RAB$K_BLN 68)   ;  length of rab 
 (defconstant RAB$C_BLN 68)   ;  length of rab 
            
(define-alien-structure (RAB    ( :conc-name nil))
    ; block id 
  (RAB$B_BID :unsigned-integer 0 1 :default RAB$C_BID)
    ; block length 
  (RAB$B_BLN :unsigned-integer 1 2 :default RAB$C_BLN)
    ; internal stream index 
    (RAB$W_ISI :unsigned-integer 2 4)
    ; (ifi in fab)
    ; move to bit 6 
      (RABDEF$$_FILL_1 :unsigned-integer #.(+ 2 0/8) #.(+ 2 6/8)) 
    ; rat value for process-permanent files 
      (RAB$V_PPF_RAT :unsigned-integer #.(+ 2 6/8) #.(+ 2 14/8)) 
    ; indirect access to process-permanent file 
      (RAB$V_PPF_IND :unsigned-integer #.(+ 2 14/8) #.(+ 2 15/8)) 
    ; (i.e., restricted operations)
      (RAB$V_fill_5 :unsigned-integer #.(+ 2 15/8) #.(+ 2 16/8)) 
    ; record options 
    (RAB$L_ROP :unsigned-integer 4 8)
    ; asynchronous operations 
      (RAB$V_ASY :unsigned-integer #.(+ 4 0/8) #.(+ 4 1/8)) 
    ; truncate put - allow sequential put not at 
      (RAB$V_TPT :unsigned-integer #.(+ 4 1/8) #.(+ 4 2/8)) 
    ;   eof, thus truncating file (seq. org only)
    ;
    ; these next two should be in the byte for bits
    ; input to $find or $get, but there is no room there
    ;
    ; lock record for read only, allow other readers 
      (RAB$V_REA :unsigned-integer #.(+ 4 2/8) #.(+ 4 3/8)) 
    ; read record regardless of lock 
      (RAB$V_RRL :unsigned-integer #.(+ 4 3/8) #.(+ 4 4/8)) 
    ;
    ; update if existent 
      (RAB$V_UIF :unsigned-integer #.(+ 4 4/8) #.(+ 4 5/8)) 
    ; mass-insert mode 
      (RAB$V_MAS :unsigned-integer #.(+ 4 5/8) #.(+ 4 6/8)) 
    ; fast record deletion 
      (RAB$V_FDL :unsigned-integer #.(+ 4 6/8) #.(+ 4 7/8)) 
    ; use hash code in bkt 
      (RAB$V_HSH :unsigned-integer #.(+ 4 7/8) #.(+ 4 8/8)) 
    ;
    ; connect to eof 
      (RAB$V_EOF :unsigned-integer #.(+ 4 8/8) #.(+ 4 9/8)) 
    ; read ahead 
      (RAB$V_RAH :unsigned-integer #.(+ 4 9/8) #.(+ 4 10/8)) 
    ; write behind 
      (RAB$V_WBH :unsigned-integer #.(+ 4 10/8) #.(+ 4 11/8)) 
    ; connect for bio only 
      (RAB$V_BIO :unsigned-integer #.(+ 4 11/8) #.(+ 4 12/8)) 
    ; level 2 RU lock consistancy
      (RAB$V_LV2 :unsigned-integer #.(+ 4 12/8) #.(+ 4 13/8)) 
    ; use bucket fill percentage 
      (RAB$V_LOA :unsigned-integer #.(+ 4 13/8) #.(+ 4 14/8)) 
    ; compare for key limit reached on $get/$find seq. (idx only) 
      (RAB$V_LIM :unsigned-integer #.(+ 4 14/8) #.(+ 4 15/8)) 
    ; (1 spare) 
      (RABDEF$$_FILL_2 :unsigned-integer #.(+ 4 15/8) #.(+ 4 16/8)) 
    ;
    ; the following bits are input to
    ; $find or $get, (see above also REA and RRL)
    ; (separate byte)
    ;
    ; use locate mode 
      (RAB$V_LOC :unsigned-integer #.(+ 4 16/8) #.(+ 4 17/8)) 
    ; wait if record not available 
      (RAB$V_WAT :unsigned-integer #.(+ 4 17/8) #.(+ 4 18/8)) 
    ; manual unlocking 
      (RAB$V_ULK :unsigned-integer #.(+ 4 18/8) #.(+ 4 19/8)) 
    ; allow readers for this locked record 
      (RAB$V_RLK :unsigned-integer #.(+ 4 19/8) #.(+ 4 20/8)) 
    ; do not lock record 
      (RAB$V_NLK :unsigned-integer #.(+ 4 20/8) #.(+ 4 21/8)) 
    ; key > or = 
      (RAB$V_KGE :unsigned-integer #.(+ 4 21/8) #.(+ 4 22/8)) 
    ; key greater than 
      (RAB$V_KGT :unsigned-integer #.(+ 4 22/8) #.(+ 4 23/8)) 
    ; get non-existent record 
      (RAB$V_NXR :unsigned-integer #.(+ 4 23/8) #.(+ 4 24/8)) 
    ;
    ;  the following bits are terminal qualifiers only
    ;  (separate byte)
    ;
    ; read no echo 
      (RAB$V_RNE :unsigned-integer #.(+ 4 24/8) #.(+ 4 25/8)) 
    ; use time-out period 
      (RAB$V_TMO :unsigned-integer #.(+ 4 25/8) #.(+ 4 26/8)) 
    ; convert to upper case 
      (RAB$V_CVT :unsigned-integer #.(+ 4 26/8) #.(+ 4 27/8)) 
    ; read no filter 
      (RAB$V_RNF :unsigned-integer #.(+ 4 27/8) #.(+ 4 28/8)) 
    ; extended terminal operation
      (RAB$V_ETO :unsigned-integer #.(+ 4 28/8) #.(+ 4 29/8)) 
    ; purge type ahead 
      (RAB$V_PTA :unsigned-integer #.(+ 4 29/8) #.(+ 4 30/8)) 
    ; use prompt buffer 
      (RAB$V_PMT :unsigned-integer #.(+ 4 30/8) #.(+ 4 31/8)) 
    ; cancel control o on output 
      (RAB$V_CCO :unsigned-integer #.(+ 4 31/8) #.(+ 4 32/8)) 
      (RABDEF$$_FILL_6 :unsigned-integer #.(+ 4 0/8) #.(+ 4 21/8)) 
    ; Synonyms for KGE and
      (RAB$V_EQNXT :unsigned-integer #.(+ 4 21/8) #.(+ 4 22/8)) 
    ;   KGT
      (RAB$V_NXT :unsigned-integer #.(+ 4 22/8) #.(+ 4 23/8)) 
      (RAB$V_fill_6 :unsigned-integer #.(+ 4 23/8) #.(+ 4 24/8)) 
    ; the following bits may be
    ; input to various rab-related
    ; operations
    ;
      (RABDEF$$_FILL_3 :signed-integer 4 5)
    ; various options 
      (RAB$B_ROP1 :unsigned-integer 5 6)
    ; get/find options (use of this field discouraged 
      (RAB$B_ROP2 :unsigned-integer 6 7)
    ; due to REA and RRL being in a different byte)
    ; terminal read options 
      (RAB$B_ROP3 :unsigned-integer 7 8)
    ;
    ; status 
  (RAB$L_STS :unsigned-integer 8 12)
    ; status value 
    (RAB$L_STV :unsigned-integer 12 16)
    ; low word of stv 
      (RAB$W_STV0 :unsigned-integer 12 14)
    ; high word of stv 
      (RAB$W_STV2 :unsigned-integer 14 16)
    ; record's file address 
    (RAB$W_RFA :unsigned-integer 16 18 :occurs 3)
      (RAB$L_RFA0 :unsigned-integer 16 20)
      (RAB$W_RFA4 :unsigned-integer 20 22)
    ; (reserved - rms release 1 optimizes stores 
  (RABDEF$$_FILL_4 :signed-integer 22 24)
    ;  to the rfa field to be a move quad, overwriting
    ;  this reserved word)
    ; user context 
  (RAB$L_CTX :unsigned-integer 24 28)
    ;-----*****
    ; (spare) 
  (RABDEF$$_FILL_5 :signed-integer 28 30)
    ; record access 
  (RAB$B_RAC :unsigned-integer 30 31)
    ; time-out period 
  (RAB$B_TMO :unsigned-integer 31 32)
    ; user buffer size 
  (RAB$W_USZ :unsigned-integer 32 34)
    ; record buffer size 
  (RAB$W_RSZ :unsigned-integer 34 36)
    ; user buffer address 
  (RAB$L_UBF :pointer 36 40)
    ; record buffer address 
  (RAB$L_RBF :pointer 40 44)
    ; record header buffer addr 
  (RAB$L_RHB :pointer 44 48)
    ; key buffer address 
    (RAB$L_KBF :pointer 48 52)
    ; prompt buffer addr 
    (RAB$L_PBF :pointer 48 52)
    ; key buffer size 
    (RAB$B_KSZ :unsigned-integer 52 53)
    ; prompt buffer size 
    (RAB$B_PSZ :unsigned-integer 52 53)
    ; key of reference 
  (RAB$B_KRF :unsigned-integer 53 54)
    ; multi-buffer count 
  (RAB$B_MBF :signed-integer 54 55)
    ; multi-block count 
  (RAB$B_MBC :unsigned-integer 55 56)
    ; bucket hash code, vbn, or rrn 
    (RAB$L_BKT :unsigned-integer 56 60)
    ; duplicates count on key accessed on alternate key 
    (RAB$L_DCT :unsigned-integer 56 60)
    ; related fab for connect 		!!!!!!! :POINTER edited in by hand !!!!!!!
  (RAB$L_FAB :pointer 60 64)
    ; XAB address 
  (RAB$L_XAB :pointer 64 68))    ; XAB address 
      
;;; (ifi in fab)
;;;   eof, thus truncating file (seq. org only)
;;;
;;; these next two should be in the byte for bits
;;; input to $find or $get, but there is no room there
;;;
;;;
;;;
;;;
;;; the following bits are input to
;;; $find or $get, (see above also REA and RRL)
;;; (separate byte)
;;;
;;;
;;;  the following bits are terminal qualifiers only
;;;  (separate byte)
;;;
;;; the following bits may be
;;; input to various rab-related
;;; operations
;;;
;;;  to the rfa field to be a move quad, overwriting
;;;  this reserved word)
;;;-----*****


;;;*** MODULE $XABDEF ***
      
;;;
;;;         definitions for all xabs
;;;                $xabdef
;;;
;;;
;;;
;;;  the first four fields are shared in common between all xabs
;;;  and hence are defined only once
;;;  (the only exception is that the spare word may be used by some xabs)
;;;
            
(define-alien-structure (XAB    ( :conc-name nil))
    ; xab id code 
  (XAB$B_COD :unsigned-integer 0 1)
    ; block length 
  (XAB$B_BLN :unsigned-integer 1 2)
    ; (spare) 
  (XABDEF$$_FILL_1 :signed-integer 2 4)
    ; xab chain link 
  (XAB$L_NXT :unsigned-integer 4 8)
    ;WITH POSSIBLE EXCEPTION OF SPARE FIELD
  (XAB$W_RVN :unsigned-integer 8 10)
  (XABDEF$$_FILL_2 :signed-integer 10 12)
    (XAB$Q_RDT :signed-integer 12 20)
      (XAB$L_RDT0 :unsigned-integer 12 16)
      (XAB$L_RDT4 :signed-integer 16 20))
    ;COMMON AMONG DAT AND RDT XABS
      
;;;WITH POSSIBLE EXCEPTION OF SPARE FIELD

;;;*** MODULE $XABKEYDEF ***
      
;;;--
;;;++
;;;
;;;        key definition xab field definitions
;;;                $xabkeydef
;;;
;;;
 (defconstant XAB$C_KEY 21)   ;  xabkey id code 
 (defconstant XAB$M_DUP #b00000000000000000000000000000001)
 (defconstant XAB$M_CHG #b00000000000000000000000000000010)
 (defconstant XAB$M_NUL #b00000000000000000000000000000100)
 (defconstant XAB$M_IDX_NCMPR #b00000000000000000000000000001000)
 (defconstant XAB$M_KEY_NCMPR #b00000000000000000000000001000000)
 (defconstant XAB$M_DAT_NCMPR #b00000000000000000000000010000000)
 (defconstant XAB$C_STG 0)   ;  string 
 (defconstant XAB$C_IN2 1)   ;  signed 15 bit integer (2 bytes) 
 (defconstant XAB$C_BN2 2)   ;  2 byte binary 
 (defconstant XAB$C_IN4 3)   ;  signed 31 bit integer (4 bytes) 
 (defconstant XAB$C_BN4 4)   ;  4 byte binary 
 (defconstant XAB$C_PAC 5)   ;  packed decimal (1-16 bytes) 
 (defconstant XAB$C_IN8 6)   ;  signed 63 bit integer (4 bytes) 
 (defconstant XAB$C_BN8 7)   ;  8 byte binary 
 (defconstant XAB$C_DSTG 32)   ;  descending string
 (defconstant XAB$C_DIN2 33)   ;      "      signed word
 (defconstant XAB$C_DBN2 34)   ;      "      unsigned word
 (defconstant XAB$C_DIN4 35)   ;      "      signed longword
 (defconstant XAB$C_DBN4 36)   ;      "      unsigned longword
 (defconstant XAB$C_DPAC 37)   ;      "      packed decimal
 (defconstant XAB$C_DIN8 38)   ;      "      signed quadword
 (defconstant XAB$C_DBN8 39)   ;      "      unsigned quadword
 (defconstant XAB$C_MAXDTP 39)   ;  max. legal data type 
 (defconstant XAB$K_KEYLEN_V2 64)   ;  old xabkey length 
 (defconstant XAB$C_KEYLEN_V2 64)   ;  old xabkey length 
;;;
 (defconstant XAB$C_PRG3 3)   ;  Prologue version three 
 (defconstant XAB$C_PRG2 2)   ;  Prologue version two 
 (defconstant XAB$C_PRG1 1)   ;  Prologue versoin one 
 (defconstant XAB$K_KEYLEN 76)   ;  xabkey length 
 (defconstant XAB$C_KEYLEN 76)   ;  xabkey length 
;;;--
            
(define-alien-structure (XABKEY    ( :conc-name nil))
  (XABKEYDEF$$_FILL_1 :signed-integer 0 1)
  (XABKEYDEF$$_FILL_2 :signed-integer 1 2)
  (XABKEYDEF$$_FILL_3 :signed-integer 2 4)
    ;HAS SAME COD, BLN, SPARE AND NXT FIELD 
  (XABKEYDEF$$_FILL_4 :signed-integer 4 8)
    ;THESE 4 FIELDS ARE COMMON TO ALL XABS AND
    ;HAVE BEEN DEFINED BY $XABDEF
    ;
    ; the field layout of the key xab is such that it matchs as
    ; closely as possible the layout of a key decriptor in the
    ; index file prologue. this is so the contents may be moved
    ; between the two structures as efficiently as possible.
    ;
    ; index level area number 
  (XAB$B_IAN :unsigned-integer 8 9)
    ; lowest index level area number 
  (XAB$B_LAN :unsigned-integer 9 10)
    ; data level area number 
  (XAB$B_DAN :unsigned-integer 10 11)
    ; level of root bucket 
  (XAB$B_LVL :unsigned-integer 11 12)
    ; size of index buckets in virtual blocks 
  (XAB$B_IBS :unsigned-integer 12 13)
    ; size of data buckets in virtual blocks 
  (XAB$B_DBS :unsigned-integer 13 14)
    ; root bucket start vbn 
  (XAB$L_RVB :unsigned-integer 14 18)
    ; key option flags 
    (XAB$B_FLG :unsigned-integer 18 19)
    ; duplicate key values allowed 
      (XAB$V_DUP :unsigned-integer #.(+ 18 0/8) #.(+ 18 1/8)) 
    ; alt key only --key field may change on update 
      (XAB$V_CHG :unsigned-integer #.(+ 18 1/8) #.(+ 18 2/8)) 
    ; alt key only --null key value enable 
      (XAB$V_NUL :unsigned-integer #.(+ 18 2/8) #.(+ 18 3/8)) 
    ; indicate index records for given key are not compressed 
      (XAB$V_IDX_NCMPR :unsigned-integer #.(+ 18 3/8) #.(+ 18 4/8)) 
    ; spare
      (XABKEYDEF$$_FILL_5 :unsigned-integer #.(+ 18 4/8) #.(+ 18 6/8)) 
    ; indicates key is not compressed in data record 
      (XAB$V_KEY_NCMPR :unsigned-integer #.(+ 18 6/8) #.(+ 18 7/8)) 
      (XAB$V_fill_11 :unsigned-integer #.(+ 18 7/8) #.(+ 18 8/8)) 
    ; space over dup 
      (XABKEYDEF$$_FILL_6 :unsigned-integer #.(+ 18 0/8) #.(+ 18 1/8)) 
    ; spare
      (XABKEYDEF$$_FILL_7 :unsigned-integer #.(+ 18 1/8) #.(+ 18 3/8)) 
    ; space over idx_ncmpr
      (XABKEYDEF$$_FILL_8 :unsigned-integer #.(+ 18 3/8) #.(+ 18 4/8)) 
    ; spare
      (XABKEYDEF$$_FILL_9 :unsigned-integer #.(+ 18 4/8) #.(+ 18 6/8)) 
    ; space over key_ncmpr
      (XABKEYDEF$$_FILL_10 :unsigned-integer #.(+ 18 6/8) #.(+ 18 7/8)) 
    ; data record is not compressed 
      (XAB$V_DAT_NCMPR :unsigned-integer #.(+ 18 7/8) #.(+ 18 8/8)) 
    ; key field data type 
  (XAB$B_DTP :unsigned-integer 19 20)
    ; number of key segments 
  (XAB$B_NSG :unsigned-integer 20 21)
    ; nul key character 
  (XAB$B_NUL :unsigned-integer 21 22)
    ; total key field size (bytes) 
  (XAB$B_TKS :unsigned-integer 22 23)
    ; key of reference (0=prim key, 
  (XAB$B_REF :unsigned-integer 23 24)
    ; 1-254 = alternate keys)
    ; minimun record length to contain key field 
  (XAB$W_MRL :unsigned-integer 24 26)
    ; index bucket fill size (bytes) 
  (XAB$W_IFL :unsigned-integer 26 28)
    ; data bucket fil size (bytes) 
  (XAB$W_DFL :unsigned-integer 28 30)
    ; key field record offset positions 
    (XAB$W_POS :unsigned-integer 30 32 :occurs 8)
    ; segment 0 
      (XAB$W_POS0 :unsigned-integer 30 32)
    ; segment 1 
      (XAB$W_POS1 :unsigned-integer 32 34)
    ; segment 2 
      (XAB$W_POS2 :unsigned-integer 34 36)
    ; segment 3 
      (XAB$W_POS3 :unsigned-integer 36 38)
    ; segment 4 
      (XAB$W_POS4 :unsigned-integer 38 40)
    ; segment 5 
      (XAB$W_POS5 :unsigned-integer 40 42)
    ; segment 6 
      (XAB$W_POS6 :unsigned-integer 42 44)
    ; segment 7 
      (XAB$W_POS7 :unsigned-integer 44 46)
    ; key field segment sizes 
    (XAB$B_SIZ :unsigned-integer 46 47 :occurs 8)
    ; segment 0 
      (XAB$B_SIZ0 :unsigned-integer 46 47)
    ; segment 1 
      (XAB$B_SIZ1 :unsigned-integer 47 48)
    ; segment 2 
      (XAB$B_SIZ2 :unsigned-integer 48 49)
    ; segment 3 
      (XAB$B_SIZ3 :unsigned-integer 49 50)
    ; segment 4 
      (XAB$B_SIZ4 :unsigned-integer 50 51)
    ; segment 5 
      (XAB$B_SIZ5 :unsigned-integer 51 52)
    ; segment 6 
      (XAB$B_SIZ6 :unsigned-integer 52 53)
    ; segment 7 
      (XAB$B_SIZ7 :unsigned-integer 53 54)
    ; spare 
  (XABKEYDEF$$_FILL_11 :signed-integer 54 56)
    ;
    ; the positions of the above fields are dictated by the key descriptor
    ; record layout in the index file prologue.
    ;
    ; pointer to 32 character key name buffer 
  (XAB$L_KNM :pointer 56 60)
    ; first data bucket start vbn 
  (XAB$L_DVB :unsigned-integer 60 64)
    ; Additions for prologue 3 files
    ;
    ; key field segment types 
    (XAB$B_TYP :unsigned-integer 64 65 :occurs 8)
    ; segment 0 
      (XAB$B_TYP0 :unsigned-integer 64 65)
    ; segment 1 
      (XAB$B_TYP1 :unsigned-integer 65 66)
    ; segment 2 
      (XAB$B_TYP2 :unsigned-integer 66 67)
    ; segment 3 
      (XAB$B_TYP3 :unsigned-integer 67 68)
    ; segment 4 
      (XAB$B_TYP4 :unsigned-integer 68 69)
    ; segment 5 
      (XAB$B_TYP5 :unsigned-integer 69 70)
    ; segment 6 
      (XAB$B_TYP6 :unsigned-integer 70 71)
    ; segment 7 
      (XAB$B_TYP7 :unsigned-integer 71 72)
    ; indicate prologue version desired (primary key only) 
  (XAB$B_PROLOG :unsigned-integer 72 73)
    ; spare 
  (XABKEYDEF$$_FILL_12 :signed-integer 73 74)
  (XABKEYDEF$$_FILL_13 :signed-integer 74 76))    ; spare 
    ;++
