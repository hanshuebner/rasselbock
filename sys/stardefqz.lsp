; ********************************************************************************************************************************
;  Created  1-NOV-1989 14:00:03 by VAX SDL V3.1-7      Source:  1-NOV-1989 13:41:34 LISPW$1:[FOSTER.SDL.FILES]STARDEFQZ.SDI;2 
; ********************************************************************************************************************************
;;;(proclaim '(optimize (speed 3) (safety 0)))
 
;;;*** MODULE $QUIDEF ***
      
;;;
;;; Get Queue Information Service ($GETQUI) definitions.
;;;
;;; NOTE:  New items must always be added at the end so users will not have to relink.
;;;
;;; NOTE:  Update [VMSLIB.SRC]QUITABLE.MAR to reflect changes in $QUIDEF.
;;;
;;;
;;; Function codes
;;;
 (defconstant QUI$_CANCEL_OPERATION 1)   ;  Cancel a wildcard operation
 (defconstant QUI$_DISPLAY_CHARACTERISTIC 2)   ;  Return characteristic attributes
 (defconstant QUI$_DISPLAY_FILE 3)   ;  Return file attributes
 (defconstant QUI$_DISPLAY_FORM 4)   ;  Return form attributes
 (defconstant QUI$_DISPLAY_JOB 5)   ;  Return job attributes
 (defconstant QUI$_DISPLAY_QUEUE 6)   ;  Return queue attributes
 (defconstant QUI$_TRANSLATE_QUEUE 7)   ;  Validate and translate queue name
 (defconstant QUI$_DISPLAY_ENTRY 8)   ;  Return entry (job) attributes (without first having to establish queue context)
 (defconstant QUI$_RESERVED_FUNC_9 9)   ;  Reserved for Digital use (name may change)
 (defconstant QUI$_RESERVED_FUNC_10 10)   ;  Reserved for Digital use (name may change)
;;;
;;; Item codes
;;;
 (defconstant QUI$_ACCOUNT_NAME 1)   ;  Job: Submitter's account name
 (defconstant QUI$_AFTER_TIME 2)   ;  Job: /AFTER=time
 (defconstant QUI$_ASSIGNED_QUEUE_NAME 3)   ;  Queue: ASSIGN/QUEUE target
 (defconstant QUI$_BASE_PRIORITY 4)   ;  Queue: /BASE_PRIORITY=n
 (defconstant QUI$_CHARACTERISTIC_NAME 5)   ;  Characteristic: Name
 (defconstant QUI$_CHARACTERISTIC_NUMBER 6)   ;  Characteristic: Number
 (defconstant QUI$_CHARACTERISTICS 7)   ;  Job, queue: /CHARACTERISTICS=(c,...)
 (defconstant QUI$_CHECKPOINT_DATA 8)   ;  Job: Checkpoint data
 (defconstant QUI$_CLI 9)   ;  Job: /CLI=filename
 (defconstant QUI$_COMPLETED_BLOCKS 10)   ;  Job: Completed blocks including checkpoint
 (defconstant QUI$_CONDITION_VECTOR 11)   ;  Job: Completion status
 (defconstant QUI$_CPU_DEFAULT 12)   ;  Queue: /CPUDEFAULT=t
 (defconstant QUI$_CPU_LIMIT 13)   ;  Job, queue: /CPUMAXIMUM=t
 (defconstant QUI$_DEVICE_NAME 14)   ;  Queue: /ON=device
 (defconstant QUI$_ENTRY_NUMBER 15)   ;  Job: Entry number
 (defconstant QUI$_FILE_COPIES 16)   ;  File: /COPIES=n
 (defconstant QUI$_FILE_COPIES_CHKPT 17)   ;  File: File copies checkpoint (for internal use only)
;;; (note this item code is intentionally not documented and reserved for Digital use)
 (defconstant QUI$_FILE_COPIES_DONE 18)   ;  File: File copies completed
 (defconstant QUI$_FILE_FLAGS 19)   ;  File: Boolean information
 (defconstant QUI$_FILE_SETUP_MODULES 20)   ;  File: /SETUP=(module,...)
 (defconstant QUI$_FILE_SPECIFICATION 21)   ;  File: Full file specification
 (defconstant QUI$_FILE_STATUS 22)   ;  File: Status information
 (defconstant QUI$_FIRST_PAGE 23)   ;  File: /PAGES=(n,"")
 (defconstant QUI$_FORM_DESCRIPTION 24)   ;  Form: /DESCRIPTION=string
 (defconstant QUI$_FORM_FLAGS 25)   ;  Form: Boolean information
 (defconstant QUI$_FORM_LENGTH 26)   ;  Form: /LENGTH=n
 (defconstant QUI$_FORM_MARGIN_BOTTOM 27)   ;  Form: /MARGIN=BOTTOM=n
 (defconstant QUI$_FORM_MARGIN_LEFT 28)   ;  Form: /MARGIN=LEFT=n
 (defconstant QUI$_FORM_MARGIN_RIGHT 29)   ;  Form: /MARGIN=RIGHT=n
 (defconstant QUI$_FORM_MARGIN_TOP 30)   ;  Form: /MARGIN=TOP=n
 (defconstant QUI$_FORM_NAME 31)   ;  Form, job, queue: Form name
 (defconstant QUI$_FORM_NUMBER 32)   ;  Form: Number
 (defconstant QUI$_FORM_SETUP_MODULES 33)   ;  Form: /SETUP=(module,...)
 (defconstant QUI$_FORM_STOCK 34)   ;  Form: /STOCK=stock-name
 (defconstant QUI$_FORM_WIDTH 35)   ;  Form: /WIDTH=n
 (defconstant QUI$_GENERIC_TARGET 36)   ;  Queue: /GENERIC=(queue-name,...)
 (defconstant QUI$_INTERVENING_BLOCKS 37)   ;  Job: Intervening pending blocks
 (defconstant QUI$_INTERVENING_JOBS 38)   ;  Job: Intervening pending jobs
 (defconstant QUI$_JOB_COPIES 39)   ;  Job: /JOB_COUNT=n
 (defconstant QUI$_JOB_COPIES_CHKPT 40)   ;  Job: Job copies checkpoint (for internal use only)
;;; (note this item code is intentionally not documented and reserved for Digital use)
 (defconstant QUI$_JOB_COPIES_DONE 41)   ;  Job: Job copies completed
 (defconstant QUI$_JOB_FLAGS 42)   ;  Job: Boolean information
 (defconstant QUI$_JOB_LIMIT 43)   ;  Queue: /JOB_LIMIT=n
 (defconstant QUI$_JOB_NAME 44)   ;  Job: Name
 (defconstant QUI$_JOB_RESET_MODULES 45)   ;  Queue: /SEPARATE=RESET=(module,...)
 (defconstant QUI$_JOB_SIZE 46)   ;  Job: Total blocks in job
 (defconstant QUI$_JOB_SIZE_MAXIMUM 47)   ;  Queue: /BLOCK_LIMIT=n
 (defconstant QUI$_JOB_SIZE_MINIMUM 48)   ;  Queue: /BLOCK_LIMIT=(n,"")
 (defconstant QUI$_JOB_STATUS 49)   ;  Job: Status information
 (defconstant QUI$_LAST_PAGE 50)   ;  File: /PAGES=n
 (defconstant QUI$_LIBRARY_SPECIFICATION 51)   ;  Queue: /LIBRARY=file-specification
 (defconstant QUI$_LOG_QUEUE 52)   ;  Job: /PRINTER=queue-name
 (defconstant QUI$_LOG_SPECIFICATION 53)   ;  Job: /LOG_FILE=file-specification
 (defconstant QUI$_NOTE 54)   ;  Job: /NOTE=string
 (defconstant QUI$_OPERATOR_REQUEST 55)   ;  Job: /OPERATOR=string
 (defconstant QUI$_OWNER_UIC 56)   ;  Queue: /OWNER=uic
 (defconstant QUI$_PAGE_SETUP_MODULES 57)   ;  Form: /PAGE_SETUP=(module,...)
 (defconstant QUI$_PARAMETER_1 58)   ;  Job: /PARAMETER=string
 (defconstant QUI$_PARAMETER_2 59)
 (defconstant QUI$_PARAMETER_3 60)
 (defconstant QUI$_PARAMETER_4 61)
 (defconstant QUI$_PARAMETER_5 62)
 (defconstant QUI$_PARAMETER_6 63)
 (defconstant QUI$_PARAMETER_7 64)
 (defconstant QUI$_PARAMETER_8 65)
 (defconstant QUI$_PRIORITY 66)   ;  Job: /PRIORITY=n
 (defconstant QUI$_PROCESSOR 67)   ;  Queue: /PROCESSOR=filename
 (defconstant QUI$_PROTECTION 68)   ;  Queue: /PROTECTION=mask
 (defconstant QUI$_QUEUE_FLAGS 69)   ;  Queue: Boolean information
 (defconstant QUI$_QUEUE_NAME 70)   ;  Job, queue: Queue name
 (defconstant QUI$_QUEUE_STATUS 71)   ;  Queue: Status information
 (defconstant QUI$_REFUSAL_REASON 72)   ;  Job: Reason symbiont refused job (for internal use only)
;;; (note this item code is intentionally not documented and reserved for Digital use)
 (defconstant QUI$_REQUEUE_PRIORITY 73)   ;  Job: Priority after requeue (for internal use only)
;;; (note this item code is intentionally not documented and reserved for Digital use)
 (defconstant QUI$_REQUEUE_QUEUE_NAME 74)   ;  Job: Queue after requeue
 (defconstant QUI$_SCSNODE_NAME 75)   ;  Queue: /ON=node::
 (defconstant QUI$_SEARCH_FLAGS 76)   ;  Flags to control search
 (defconstant QUI$_SEARCH_NAME 77)   ;  Object name to search for	
 (defconstant QUI$_SEARCH_NUMBER 78)   ;  Object number to search for
 (defconstant QUI$_SUBMISSION_TIME 79)   ;  Job: Submission time
 (defconstant QUI$_UIC 80)   ;  Job: Submitter's UIC
 (defconstant QUI$_USERNAME 81)   ;  Job: Submitter's username
 (defconstant QUI$_WSDEFAULT 82)   ;  Job, queue: /WSDEFAULT=n
 (defconstant QUI$_WSEXTENT 83)   ;  Job, queue: /WSEXTENT=n
 (defconstant QUI$_WSQUOTA 84)   ;  Job, queue: /WSQUOTA=n
 (defconstant QUI$_RESERVED_BOOLEAN_85 85)   ;  Reserved for Digital use (name may change)
 (defconstant QUI$_RESERVED_BOOLEAN_86 86)   ;  Reserved for Digital use (name may change)
 (defconstant QUI$_RESERVED_INPUT_87 87)   ;  Reserved for Digital use (name may change)
 (defconstant QUI$_SEARCH_USERNAME 88)   ;  Username of owner of job to modify search
 (defconstant QUI$_DEFAULT_FORM_NAME 89)   ;  Default form name on queue
 (defconstant QUI$_DEFAULT_FORM_NUMBER 90)   ;  Default form number on queue
 (defconstant QUI$_DEFAULT_FORM_STOCK 91)   ;  Stock name for default form 
 (defconstant QUI$_JOB_PID 92)   ;  Pid of batch job
 (defconstant QUI$_FILE_IDENTIFICATION 93)   ;  File identification (From RMS NAM block)
 (defconstant QUI$_PENDING_JOB_BLOCK_COUNT 94)   ;  Total number of blocks for all pending jobs
 (defconstant QUI$_RESERVED_BOOLEAN_95 95)   ;  Reserved for Digital use (name may change)
 (defconstant QUI$_RESERVED_BOOLEAN_96 96)   ;  Reserved for Digital use (name may change)
 (defconstant QUI$_RESERVED_BOOLEAN_97 97)   ;  Reserved for Digital use (name may change)
 (defconstant QUI$_RESERVED_BOOLEAN_98 98)   ;  Reserved for Digital use (name may change)
 (defconstant QUI$_RESERVED_BOOLEAN_99 99)   ;  Reserved for Digital use (name may change)
 (defconstant QUI$_RESERVED_BOOLEAN_100 100)   ;  Reserved for Digital use (name may change)
 (defconstant QUI$_RESERVED_BOOLEAN_101 101)   ;  Reserved for Digital use (name may change)
 (defconstant QUI$_RESERVED_BOOLEAN_102 102)   ;  Reserved for Digital use (name may change)
 (defconstant QUI$_RESERVED_INPUT_103 103)   ;  Reserved for Digital use (name may change)
 (defconstant QUI$_RESERVED_INPUT_104 104)   ;  Reserved for Digital use (name may change)
 (defconstant QUI$_RESERVED_INPUT_105 105)   ;  Reserved for Digital use (name may change)
 (defconstant QUI$_RESERVED_INPUT_106 106)   ;  Reserved for Digital use (name may change)
 (defconstant QUI$_EXECUTING_JOB_COUNT 107)   ;  Number of jobs that are executing
 (defconstant QUI$_HOLDING_JOB_COUNT 108)   ;  Number of holding jobs
 (defconstant QUI$_TIMED_RELEASE_JOB_COUNT 109)   ;  Number of jobs specified with /AFTER_TIME
 (defconstant QUI$_PENDING_JOB_REASON 110)   ;  Secondary status describing why job is pending
 (defconstant QUI$_ORB_ADDRESS 111)   ;  Address of in-memory ORB data structure (for internal use only)
;;; (note this item code is intentionally not documented and reserved for Digital use)
 (defconstant QUI$_QUEUE_DESCRIPTION 112)   ;  Queue: /DESCRIPTION
 (defconstant QUI$_SYMBIONT_FLAGS 113)   ;  Symbiont options (requests) passed to job controller
;;; (note this item code is intentionally not documented and reserved for Digital use)
 (defconstant QUI$_JOB_ACCESS_CLASS 114)   ;  Job access class information (for internal use only)
;;; (note this item code is intentionally not documented and reserved for Digital use)
 (defconstant QUI$_ORB_LOCK_KEY 115)   ;  Key value for locking of in-memory ORB data structure (for internal use only)
;;; (note this item code is intentionally not documented and reserved for Digital use)
 (defconstant QUI$_RESERVED_OUTPUT_116 116)   ;  Reserved for Digital use (name may change)
 (defconstant QUI$_PENDING_JOB_COUNT 117)   ;  Number of pending jobs
 (defconstant QUI$_RETAINED_JOB_COUNT 118)   ;  Number of retained jobs
 (defconstant QUI$_RESTART_QUEUE_NAME 119)   ;  Name of queue into which a job would be restarted, if appropriate
 (defconstant QUI$_RESERVED_OUTPUT_120 120)   ;  Reserved for Digital use (name may change)
 (defconstant QUI$_RESERVED_OUTPUT_121 121)   ;  Reserved for Digital use (name may change)
 (defconstant QUI$_RESERVED_OUTPUT_122 122)   ;  Reserved for Digital use (name may change)
;;;
;;; Subfields of FILE_FLAGS item code.
;;;
 (defconstant QUI$M_FILE_BURST #b00000000000000000000000000000001)
 (defconstant QUI$M_FILE_BURST_EXP #b00000000000000000000000000000010)
 (defconstant QUI$M_FILE_DELETE #b00000000000000000000000000000100)
 (defconstant QUI$M_FILE_DOUBLE_SPACE #b00000000000000000000000000001000)
 (defconstant QUI$M_FILE_FLAG #b00000000000000000000000000010000)
 (defconstant QUI$M_FILE_FLAG_EXP #b00000000000000000000000000100000)
 (defconstant QUI$M_FILE_TRAILER #b00000000000000000000000001000000)
 (defconstant QUI$M_FILE_TRAILER_EXP #b00000000000000000000000010000000)
 (defconstant QUI$M_FILE_PAGE_HEADER #b00000000000000000000000100000000)
 (defconstant QUI$M_FILE_PAGINATE #b00000000000000000000001000000000)
 (defconstant QUI$M_FILE_PASSALL #b00000000000000000000010000000000)
 (defconstant QUI$M_FILE_PAGINATE_EXP #b00000000000000000000100000000000)
            
(define-alien-structure (FILE_FLAGS ( :conc-name nil))
    ; /BURST
  (QUI$V_FILE_BURST :unsigned-integer #.(+ 0 0/8) #.(+ 0 1/8)) 
    ; /[NO]BURST explicit (intentionally not documented)
  (QUI$V_FILE_BURST_EXP :unsigned-integer #.(+ 0 1/8) #.(+ 0 2/8)) 
    ; /DELETE
  (QUI$V_FILE_DELETE :unsigned-integer #.(+ 0 2/8) #.(+ 0 3/8)) 
    ; /SPACE
  (QUI$V_FILE_DOUBLE_SPACE :unsigned-integer #.(+ 0 3/8) #.(+ 0 4/8)) 
    ; /FLAG
  (QUI$V_FILE_FLAG :unsigned-integer #.(+ 0 4/8) #.(+ 0 5/8)) 
    ; /[NO]FLAG explicit (intentionally not documented)
  (QUI$V_FILE_FLAG_EXP :unsigned-integer #.(+ 0 5/8) #.(+ 0 6/8)) 
    ; /TRAILER
  (QUI$V_FILE_TRAILER :unsigned-integer #.(+ 0 6/8) #.(+ 0 7/8)) 
    ; /[NO]TRAILER explicit (intentionally not documented)
  (QUI$V_FILE_TRAILER_EXP :unsigned-integer #.(+ 0 7/8) #.(+ 0 8/8)) 
    ; /HEADER
  (QUI$V_FILE_PAGE_HEADER :unsigned-integer #.(+ 0 8/8) #.(+ 0 9/8)) 
    ; /FEED
  (QUI$V_FILE_PAGINATE :unsigned-integer #.(+ 0 9/8) #.(+ 0 10/8)) 
    ; /PASSALL
  (QUI$V_FILE_PASSALL :unsigned-integer #.(+ 0 10/8) #.(+ 0 11/8)) 
    ; /[NO]FEED explicit (intentionally not documented)
  (QUI$V_FILE_PAGINATE_EXP :unsigned-integer #.(+ 0 11/8) #.(+ 0 12/8)) 
  (QUI$v_filler :unsigned-integer #.(+ 0 12/8) #.(+ 0 32/8)) )
      
;;;
;;; Subfields of FILE_STATUS item code.
;;;
 (defconstant QUI$M_FILE_CHECKPOINTED #b00000000000000000000000000000001)
 (defconstant QUI$M_FILE_EXECUTING #b00000000000000000000000000000010)
            
(define-alien-structure (FILE_STATUS ( :conc-name nil))
    ; File checkpointed
  (QUI$V_FILE_CHECKPOINTED :unsigned-integer #.(+ 0 0/8) #.(+ 0 1/8)) 
    ; File currently executing
  (QUI$V_FILE_EXECUTING :unsigned-integer #.(+ 0 1/8) #.(+ 0 2/8)) 
  (QUI$v_filler :unsigned-integer #.(+ 0 2/8) #.(+ 0 32/8)) )
      
;;;
;;; Subfields of FORM_FLAGS item code.
;;;
 (defconstant QUI$M_FORM_SHEET_FEED #b00000000000000000000000000000001)
 (defconstant QUI$M_FORM_TRUNCATE #b00000000000000000000000000000010)
 (defconstant QUI$M_FORM_WRAP #b00000000000000000000000000000100)
            
(define-alien-structure (FORM_FLAGS ( :conc-name nil))
    ; /SHEET_FEED
  (QUI$V_FORM_SHEET_FEED :unsigned-integer #.(+ 0 0/8) #.(+ 0 1/8)) 
    ; /TRUNCATE
  (QUI$V_FORM_TRUNCATE :unsigned-integer #.(+ 0 1/8) #.(+ 0 2/8)) 
    ; /WRAP
  (QUI$V_FORM_WRAP :unsigned-integer #.(+ 0 2/8) #.(+ 0 3/8)) 
  (QUI$v_filler :unsigned-integer #.(+ 0 3/8) #.(+ 0 32/8)) )
      
;;;
;;; Subfields of JOB_FLAGS item code.
;;;
 (defconstant QUI$M_JOB_CPU_LIMIT #b00000000000000000000000000000001)
 (defconstant QUI$M_JOB_FILE_BURST #b00000000000000000000000000000010)
 (defconstant QUI$M_JOB_FILE_BURST_ONE #b00000000000000000000000000000100)
 (defconstant QUI$M_JOB_FILE_BURST_EXP #b00000000000000000000000000001000)
 (defconstant QUI$M_JOB_FILE_FLAG #b00000000000000000000000000010000)
 (defconstant QUI$M_JOB_FILE_FLAG_ONE #b00000000000000000000000000100000)
 (defconstant QUI$M_JOB_FILE_FLAG_EXP #b00000000000000000000000001000000)
 (defconstant QUI$M_JOB_FILE_TRAILER #b00000000000000000000000010000000)
 (defconstant QUI$M_JOB_FILE_TRAILER_ONE #b00000000000000000000000100000000)
 (defconstant QUI$M_JOB_FILE_TRAILER_EXP #b00000000000000000000001000000000)
 (defconstant QUI$M_JOB_LOG_DELETE #b00000000000000000000010000000000)
 (defconstant QUI$M_JOB_LOG_NULL #b00000000000000000000100000000000)
 (defconstant QUI$M_JOB_LOG_SPOOL #b00000000000000000001000000000000)
 (defconstant QUI$M_JOB_LOWERCASE #b00000000000000000010000000000000)
 (defconstant QUI$M_JOB_NOTIFY #b00000000000000000100000000000000)
 (defconstant QUI$M_JOB_RESTART #b00000000000000001000000000000000)
 (defconstant QUI$M_JOB_WSDEFAULT #b00000000000000010000000000000000)
 (defconstant QUI$M_JOB_WSEXTENT #b00000000000000100000000000000000)
 (defconstant QUI$M_JOB_WSQUOTA #b00000000000001000000000000000000)
 (defconstant QUI$M_JOB_FILE_PAGINATE #b00000000000010000000000000000000)
 (defconstant QUI$M_JOB_FILE_PAGINATE_EXP #b00000000000100000000000000000000)
            
(define-alien-structure (JOB_FLAGS ( :conc-name nil))
    ; /CPUTIME explicit
  (QUI$V_JOB_CPU_LIMIT :unsigned-integer #.(+ 0 0/8) #.(+ 0 1/8)) 
    ; /BURST=ALL
  (QUI$V_JOB_FILE_BURST :unsigned-integer #.(+ 0 1/8) #.(+ 0 2/8)) 
    ; /BURST=ONE
  (QUI$V_JOB_FILE_BURST_ONE :unsigned-integer #.(+ 0 2/8) #.(+ 0 3/8)) 
    ; /[NO]BURST explicit (intentionally not documented)
  (QUI$V_JOB_FILE_BURST_EXP :unsigned-integer #.(+ 0 3/8) #.(+ 0 4/8)) 
    ; /FLAG=ALL
  (QUI$V_JOB_FILE_FLAG :unsigned-integer #.(+ 0 4/8) #.(+ 0 5/8)) 
    ; /FLAG=ONE
  (QUI$V_JOB_FILE_FLAG_ONE :unsigned-integer #.(+ 0 5/8) #.(+ 0 6/8)) 
    ; /[NO]FLAG explicit (intentionally not documented)
  (QUI$V_JOB_FILE_FLAG_EXP :unsigned-integer #.(+ 0 6/8) #.(+ 0 7/8)) 
    ; /TRAILER=ALL
  (QUI$V_JOB_FILE_TRAILER :unsigned-integer #.(+ 0 7/8) #.(+ 0 8/8)) 
    ; /TRAILER=ONE
  (QUI$V_JOB_FILE_TRAILER_ONE :unsigned-integer #.(+ 0 8/8) #.(+ 0 9/8)) 
    ; /[NO]TRAILER explicit (intentionally not documented)
  (QUI$V_JOB_FILE_TRAILER_EXP :unsigned-integer #.(+ 0 9/8) #.(+ 0 10/8)) 
    ; /NOKEEP
  (QUI$V_JOB_LOG_DELETE :unsigned-integer #.(+ 0 10/8) #.(+ 0 11/8)) 
    ; /NOLOG_FILE
  (QUI$V_JOB_LOG_NULL :unsigned-integer #.(+ 0 11/8) #.(+ 0 12/8)) 
    ; /PRINTER
  (QUI$V_JOB_LOG_SPOOL :unsigned-integer #.(+ 0 12/8) #.(+ 0 13/8)) 
    ; /LOWERCASE
  (QUI$V_JOB_LOWERCASE :unsigned-integer #.(+ 0 13/8) #.(+ 0 14/8)) 
    ; /NOTIFY
  (QUI$V_JOB_NOTIFY :unsigned-integer #.(+ 0 14/8) #.(+ 0 15/8)) 
    ; /RESTART
  (QUI$V_JOB_RESTART :unsigned-integer #.(+ 0 15/8) #.(+ 0 16/8)) 
    ; /WSDEFAULT explicit
  (QUI$V_JOB_WSDEFAULT :unsigned-integer #.(+ 0 16/8) #.(+ 0 17/8)) 
    ; /WSEXTENT explicit
  (QUI$V_JOB_WSEXTENT :unsigned-integer #.(+ 0 17/8) #.(+ 0 18/8)) 
    ; /WSQUOTA explicit
  (QUI$V_JOB_WSQUOTA :unsigned-integer #.(+ 0 18/8) #.(+ 0 19/8)) 
    ; /FEED
  (QUI$V_JOB_FILE_PAGINATE :unsigned-integer #.(+ 0 19/8) #.(+ 0 20/8)) 
    ; /[NO]FEED explicit (intentionally not documented)
  (QUI$V_JOB_FILE_PAGINATE_EXP :unsigned-integer #.(+ 0 20/8) #.(+ 0 21/8)) 
  (QUI$v_filler :unsigned-integer #.(+ 0 21/8) #.(+ 0 32/8)) )
      
;;;
;;; Subfields of JOB_STATUS item code.
;;;
 (defconstant QUI$M_JOB_ABORTING #b00000000000000000000000000000001)
 (defconstant QUI$M_JOB_EXECUTING #b00000000000000000000000000000010)
 (defconstant QUI$M_JOB_HOLDING #b00000000000000000000000000000100)
 (defconstant QUI$M_JOB_INACCESSIBLE #b00000000000000000000000000001000)
 (defconstant QUI$M_JOB_REFUSED #b00000000000000000000000000010000)
 (defconstant QUI$M_JOB_REQUEUE #b00000000000000000000000000100000)
 (defconstant QUI$M_JOB_RESTARTING #b00000000000000000000000001000000)
 (defconstant QUI$M_JOB_RETAINED #b00000000000000000000000010000000)
 (defconstant QUI$M_JOB_STARTING #b00000000000000000000000100000000)
 (defconstant QUI$M_JOB_TIMED_RELEASE #b00000000000000000000001000000000)
 (defconstant QUI$M_JOB_SUSPENDED #b00000000000000000000010000000000)
 (defconstant QUI$M_JOB_PENDING #b00000000000000000000100000000000)
            
(define-alien-structure (JOB_STATUS ( :conc-name nil))
    ; Job is aborting
  (QUI$V_JOB_ABORTING :unsigned-integer #.(+ 0 0/8) #.(+ 0 1/8)) 
    ; Job is executing
  (QUI$V_JOB_EXECUTING :unsigned-integer #.(+ 0 1/8) #.(+ 0 2/8)) 
    ; Job is holding for /HOLD
  (QUI$V_JOB_HOLDING :unsigned-integer #.(+ 0 2/8) #.(+ 0 3/8)) 
    ; Job is inaccessible
  (QUI$V_JOB_INACCESSIBLE :unsigned-integer #.(+ 0 3/8) #.(+ 0 4/8)) 
    ; Job was refused by symbiont
  (QUI$V_JOB_REFUSED :unsigned-integer #.(+ 0 4/8) #.(+ 0 5/8)) 
    ; Job will requeue after abort (intentionally not documented)
  (QUI$V_JOB_REQUEUE :unsigned-integer #.(+ 0 5/8) #.(+ 0 6/8)) 
    ; Job started execution at least once (intentionally not documented)
  (QUI$V_JOB_RESTARTING :unsigned-integer #.(+ 0 6/8) #.(+ 0 7/8)) 
    ; Job was retained by /RETAIN
  (QUI$V_JOB_RETAINED :unsigned-integer #.(+ 0 7/8) #.(+ 0 8/8)) 
    ; Job is starting
  (QUI$V_JOB_STARTING :unsigned-integer #.(+ 0 8/8) #.(+ 0 9/8)) 
    ; Job is holding for /AFTER
  (QUI$V_JOB_TIMED_RELEASE :unsigned-integer #.(+ 0 9/8) #.(+ 0 10/8)) 
    ; Job is suspended by STOP/QUEUE command
  (QUI$V_JOB_SUSPENDED :unsigned-integer #.(+ 0 10/8) #.(+ 0 11/8)) 
    ; Job is pending (see QUI$_JOB_PENDING_REASON for more information)
  (QUI$V_JOB_PENDING :unsigned-integer #.(+ 0 11/8) #.(+ 0 12/8)) 
  (QUI$v_filler :unsigned-integer #.(+ 0 12/8) #.(+ 0 32/8)) )
      
 (defconstant QUI$V_JOB_TIMED 9)   ;  Synonym for QUI$V_JOB_TIMED_RELEASE for V4 compatibility
 (defconstant QUI$M_JOB_TIMED 512)   ;  Synonym for QUI$M_JOB_TIMED_RELEASE for V4 compatibility
;;;
;;; Subfields of PENDING_JOB_REASON.
;;;
;;; Note that in the descriptions below "queue" refers to the execution queue in which a job resides, or to the set of execution
;;; queues that is the target of the generic queue in which a job resides.
;;;
 (defconstant QUI$M_PEND_CHAR_MISMATCH #b00000000000000000000000000000001)
 (defconstant QUI$M_PEND_JOB_SIZE_MAX #b00000000000000000000000000000010)
 (defconstant QUI$M_PEND_JOB_SIZE_MIN #b00000000000000000000000000000100)
 (defconstant QUI$M_PEND_LOWERCASE_MISMATCH #b00000000000000000000000000001000)
 (defconstant QUI$M_PEND_NO_ACCESS #b00000000000000000000000000010000)
 (defconstant QUI$M_PEND_QUEUE_BUSY #b00000000000000000000000000100000)
 (defconstant QUI$M_PEND_QUEUE_STATE #b00000000000000000000000001000000)
 (defconstant QUI$M_PEND_STOCK_MISMATCH #b00000000000000000000000010000000)
            
(define-alien-structure (PENDING_JOB_REASON ( :conc-name nil))
    ; Queue's characteristics do not match job's requirements
  (QUI$V_PEND_CHAR_MISMATCH :unsigned-integer #.(+ 0 0/8) #.(+ 0 1/8)) 
    ; Print job's block size is too large to execute on queue (print job only)
  (QUI$V_PEND_JOB_SIZE_MAX :unsigned-integer #.(+ 0 1/8) #.(+ 0 2/8)) 
    ; Print job's block size is too small to execute on queue (print job only)
  (QUI$V_PEND_JOB_SIZE_MIN :unsigned-integer #.(+ 0 2/8) #.(+ 0 3/8)) 
    ; Queue's lowercase attribute does not match job's requirements (print job only)
  (QUI$V_PEND_LOWERCASE_MISMATCH :unsigned-integer #.(+ 0 3/8) #.(+ 0 4/8)) 
    ; User does not have access to queue
  (QUI$V_PEND_NO_ACCESS :unsigned-integer #.(+ 0 4/8) #.(+ 0 5/8)) 
    ; Job is ready to execute but must wait until other jobs ahead of it in the queue
  (QUI$V_PEND_QUEUE_BUSY :unsigned-integer #.(+ 0 5/8) #.(+ 0 6/8)) 
    ; complete execution (this is a normal state that requires no user intervention)
    ; Queue state prevents job from executing (see QUI$_QUEUE_STATUS for more info)
  (QUI$V_PEND_QUEUE_STATE :unsigned-integer #.(+ 0 6/8) #.(+ 0 7/8)) 
    ; Stock type of mounted form on output execution queue does not match
  (QUI$V_PEND_STOCK_MISMATCH :unsigned-integer #.(+ 0 7/8) #.(+ 0 8/8)) 
    ; stock stock type required by form associated with job (print job only)
  (QUI$v_filler :unsigned-integer #.(+ 0 8/8) #.(+ 0 32/8)) )
      
;;; complete execution (this is a normal state that requires no user intervention)
;;; stock stock type required by form associated with job (print job only)
;;;
;;; Subfields of QUEUE_FLAGS item code.
;;;
 (defconstant QUI$M_QUEUE_BATCH #b00000000000000000000000000000001)
 (defconstant QUI$M_QUEUE_CPU_DEFAULT #b00000000000000000000000000000010)
 (defconstant QUI$M_QUEUE_CPU_LIMIT #b00000000000000000000000000000100)
 (defconstant QUI$M_QUEUE_FILE_BURST #b00000000000000000000000000001000)
 (defconstant QUI$M_QUEUE_FILE_BURST_ONE #b00000000000000000000000000010000)
 (defconstant QUI$M_QUEUE_FILE_FLAG #b00000000000000000000000000100000)
 (defconstant QUI$M_QUEUE_FILE_FLAG_ONE #b00000000000000000000000001000000)
 (defconstant QUI$M_QUEUE_FILE_TRAILER #b00000000000000000000000010000000)
 (defconstant QUI$M_QUEUE_FILE_TRAILER_ONE #b00000000000000000000000100000000)
 (defconstant QUI$M_QUEUE_GENERIC #b00000000000000000000001000000000)
 (defconstant QUI$M_QUEUE_GENERIC_SELECTION #b00000000000000000000010000000000)
 (defconstant QUI$M_QUEUE_JOB_BURST #b00000000000000000000100000000000)
 (defconstant QUI$M_QUEUE_JOB_FLAG #b00000000000000000001000000000000)
 (defconstant QUI$M_QUEUE_JOB_SIZE_SCHED #b00000000000000000010000000000000)
 (defconstant QUI$M_QUEUE_JOB_TRAILER #b00000000000000000100000000000000)
 (defconstant QUI$M_QUEUE_RETAIN_ALL #b00000000000000001000000000000000)
 (defconstant QUI$M_QUEUE_RETAIN_ERROR #b00000000000000010000000000000000)
 (defconstant QUI$M_QUEUE_SWAP #b00000000000000100000000000000000)
 (defconstant QUI$M_QUEUE_TERMINAL #b00000000000001000000000000000000)
 (defconstant QUI$M_QUEUE_WSDEFAULT #b00000000000010000000000000000000)
 (defconstant QUI$M_QUEUE_WSEXTENT #b00000000000100000000000000000000)
 (defconstant QUI$M_QUEUE_WSQUOTA #b00000000001000000000000000000000)
 (defconstant QUI$M_QUEUE_FILE_PAGINATE #b00000000010000000000000000000000)
 (defconstant QUI$M_QUEUE_RECORD_BLOCKING #b00000000100000000000000000000000)
 (defconstant QUI$M_QUEUE_PRINTER #b00000001000000000000000000000000)
 (defconstant QUI$M_QUEUE_ACL_SPECIFIED #b00000010000000000000000000000000)
            
(define-alien-structure (QUEUE_FLAGS ( :conc-name nil))
    ; /BATCH
  (QUI$V_QUEUE_BATCH :unsigned-integer #.(+ 0 0/8) #.(+ 0 1/8)) 
    ; /CPUDEFAULT specified
  (QUI$V_QUEUE_CPU_DEFAULT :unsigned-integer #.(+ 0 1/8) #.(+ 0 2/8)) 
    ; /CPUMAXIMUM specified
  (QUI$V_QUEUE_CPU_LIMIT :unsigned-integer #.(+ 0 2/8) #.(+ 0 3/8)) 
    ; /DEFAULT=BURST=ALL
  (QUI$V_QUEUE_FILE_BURST :unsigned-integer #.(+ 0 3/8) #.(+ 0 4/8)) 
    ; /DEFAULT=BURST=ONE
  (QUI$V_QUEUE_FILE_BURST_ONE :unsigned-integer #.(+ 0 4/8) #.(+ 0 5/8)) 
    ; /DEFAULT=FLAG=ALL
  (QUI$V_QUEUE_FILE_FLAG :unsigned-integer #.(+ 0 5/8) #.(+ 0 6/8)) 
    ; /DEFAULT=FLAG=ONE
  (QUI$V_QUEUE_FILE_FLAG_ONE :unsigned-integer #.(+ 0 6/8) #.(+ 0 7/8)) 
    ; /DEFAULT=TRAILER=ALL
  (QUI$V_QUEUE_FILE_TRAILER :unsigned-integer #.(+ 0 7/8) #.(+ 0 8/8)) 
    ; /DEFAULT=TRAILER=ONE
  (QUI$V_QUEUE_FILE_TRAILER_ONE :unsigned-integer #.(+ 0 8/8) #.(+ 0 9/8)) 
    ; /GENERIC
  (QUI$V_QUEUE_GENERIC :unsigned-integer #.(+ 0 9/8) #.(+ 0 10/8)) 
    ; /ENABLE_GENERIC
  (QUI$V_QUEUE_GENERIC_SELECTION :unsigned-integer #.(+ 0 10/8) #.(+ 0 11/8)) 
    ; /SEPARATE=BURST
  (QUI$V_QUEUE_JOB_BURST :unsigned-integer #.(+ 0 11/8) #.(+ 0 12/8)) 
    ; /SEPARATE=FLAG	
  (QUI$V_QUEUE_JOB_FLAG :unsigned-integer #.(+ 0 12/8) #.(+ 0 13/8)) 
    ; /SCHEDULE=SIZE
  (QUI$V_QUEUE_JOB_SIZE_SCHED :unsigned-integer #.(+ 0 13/8) #.(+ 0 14/8)) 
    ; /SEPARATE=TRAILER
  (QUI$V_QUEUE_JOB_TRAILER :unsigned-integer #.(+ 0 14/8) #.(+ 0 15/8)) 
    ; /RETAIN=ALL
  (QUI$V_QUEUE_RETAIN_ALL :unsigned-integer #.(+ 0 15/8) #.(+ 0 16/8)) 
    ; /RETAIN=ERROR
  (QUI$V_QUEUE_RETAIN_ERROR :unsigned-integer #.(+ 0 16/8) #.(+ 0 17/8)) 
    ; /NODISABLE_SWAPPING
  (QUI$V_QUEUE_SWAP :unsigned-integer #.(+ 0 17/8) #.(+ 0 18/8)) 
    ; /DEVICE=TERMINAL or terminal device type reported by symbiont
  (QUI$V_QUEUE_TERMINAL :unsigned-integer #.(+ 0 18/8) #.(+ 0 19/8)) 
    ; /WSDEFAULT specified
  (QUI$V_QUEUE_WSDEFAULT :unsigned-integer #.(+ 0 19/8) #.(+ 0 20/8)) 
    ; /WSEXTENT specified
  (QUI$V_QUEUE_WSEXTENT :unsigned-integer #.(+ 0 20/8) #.(+ 0 21/8)) 
    ; /WSQUOTA specified
  (QUI$V_QUEUE_WSQUOTA :unsigned-integer #.(+ 0 21/8) #.(+ 0 22/8)) 
    ; /DEFAULT=FEED
  (QUI$V_QUEUE_FILE_PAGINATE :unsigned-integer #.(+ 0 22/8) #.(+ 0 23/8)) 
    ; /RECORD_BLOCKING
  (QUI$V_QUEUE_RECORD_BLOCKING :unsigned-integer #.(+ 0 23/8) #.(+ 0 24/8)) 
    ; /DEVICE=PRINTER or printer device type reported by symbiont
  (QUI$V_QUEUE_PRINTER :unsigned-integer #.(+ 0 24/8) #.(+ 0 25/8)) 
    ; ACL has been specified for queue
  (QUI$V_QUEUE_ACL_SPECIFIED :unsigned-integer #.(+ 0 25/8) #.(+ 0 26/8)) 
  (QUI$v_filler :unsigned-integer #.(+ 0 26/8) #.(+ 0 32/8)) )
      
;;;
;;; Subfields of QUEUE_STATUS item code.
;;;
 (defconstant QUI$M_QUEUE_ALIGNING #b00000000000000000000000000000001)
 (defconstant QUI$M_QUEUE_IDLE #b00000000000000000000000000000010)
 (defconstant QUI$M_QUEUE_LOWERCASE #b00000000000000000000000000000100)
 (defconstant QUI$M_QUEUE_OPERATOR_REQUEST #b00000000000000000000000000001000)
 (defconstant QUI$M_QUEUE_PAUSED #b00000000000000000000000000010000)
 (defconstant QUI$M_QUEUE_PAUSING #b00000000000000000000000000100000)
 (defconstant QUI$M_QUEUE_REMOTE #b00000000000000000000000001000000)
 (defconstant QUI$M_QUEUE_RESETTING #b00000000000000000000000010000000)
 (defconstant QUI$M_QUEUE_RESUMING #b00000000000000000000000100000000)
 (defconstant QUI$M_QUEUE_SERVER #b00000000000000000000001000000000)
 (defconstant QUI$M_QUEUE_STALLED #b00000000000000000000010000000000)
 (defconstant QUI$M_QUEUE_STARTING #b00000000000000000000100000000000)
 (defconstant QUI$M_QUEUE_STOPPED #b00000000000000000001000000000000)
 (defconstant QUI$M_QUEUE_STOPPING #b00000000000000000010000000000000)
 (defconstant QUI$M_QUEUE_UNAVAILABLE #b00000000000000000100000000000000)
 (defconstant QUI$M_QUEUE_CLOSED #b00000000000000001000000000000000)
            
(define-alien-structure (QUEUE_STATUS ( :conc-name nil))
    ; Queue is aligning
  (QUI$V_QUEUE_ALIGNING :unsigned-integer #.(+ 0 0/8) #.(+ 0 1/8)) 
    ; Queue is idle
  (QUI$V_QUEUE_IDLE :unsigned-integer #.(+ 0 1/8) #.(+ 0 2/8)) 
    ; Lowercase device
  (QUI$V_QUEUE_LOWERCASE :unsigned-integer #.(+ 0 2/8) #.(+ 0 3/8)) 
    ; Queue is doing /OPERATOR (intentionally not documented)
  (QUI$V_QUEUE_OPERATOR_REQUEST :unsigned-integer #.(+ 0 3/8) #.(+ 0 4/8)) 
    ; Queue is paused
  (QUI$V_QUEUE_PAUSED :unsigned-integer #.(+ 0 4/8) #.(+ 0 5/8)) 
    ; Queue is pausing
  (QUI$V_QUEUE_PAUSING :unsigned-integer #.(+ 0 5/8) #.(+ 0 6/8)) 
    ; Remote device
  (QUI$V_QUEUE_REMOTE :unsigned-integer #.(+ 0 6/8) #.(+ 0 7/8)) 
    ; Incomplete remote request to reset
  (QUI$V_QUEUE_RESETTING :unsigned-integer #.(+ 0 7/8) #.(+ 0 8/8)) 
    ; Queue is resuming
  (QUI$V_QUEUE_RESUMING :unsigned-integer #.(+ 0 8/8) #.(+ 0 9/8)) 
    ; /DEVICE=SERVER or reported to be a served queue by the symbiont
  (QUI$V_QUEUE_SERVER :unsigned-integer #.(+ 0 9/8) #.(+ 0 10/8)) 
    ; Device is stalled
  (QUI$V_QUEUE_STALLED :unsigned-integer #.(+ 0 10/8) #.(+ 0 11/8)) 
    ; Queue is starting
  (QUI$V_QUEUE_STARTING :unsigned-integer #.(+ 0 11/8) #.(+ 0 12/8)) 
    ; Queue is stopped
  (QUI$V_QUEUE_STOPPED :unsigned-integer #.(+ 0 12/8) #.(+ 0 13/8)) 
    ; Queue is stopping
  (QUI$V_QUEUE_STOPPING :unsigned-integer #.(+ 0 13/8) #.(+ 0 14/8)) 
    ; Device is unavailable
  (QUI$V_QUEUE_UNAVAILABLE :unsigned-integer #.(+ 0 14/8) #.(+ 0 15/8)) 
    ; Queue is closed
  (QUI$V_QUEUE_CLOSED :unsigned-integer #.(+ 0 15/8) #.(+ 0 16/8)) 
  (QUI$v_filler :unsigned-integer #.(+ 0 16/8) #.(+ 0 32/8)) )
      
;;;
;;; Subfields of SEARCH_FLAGS item code.
;;;
 (defconstant QUI$M_SEARCH_ALL_JOBS #b00000000000000000000000000000001)
 (defconstant QUI$M_SEARCH_WILDCARD #b00000000000000000000000000000010)
 (defconstant QUI$M_SEARCH_BATCH #b00000000000000000000000000000100)
 (defconstant QUI$M_SEARCH_SYMBIONT #b00000000000000000000000000001000)
 (defconstant QUI$M_SEARCH_THIS_JOB #b00000000000000000000000000010000)
 (defconstant QUI$M_SEARCH_PRINTER #b00000000000000000000000000100000)
 (defconstant QUI$M_SEARCH_SERVER #b00000000000000000000000001000000)
 (defconstant QUI$M_SEARCH_TERMINAL #b00000000000000000000000010000000)
 (defconstant QUI$M_SEARCH_GENERIC #b00000000000000000000000100000000)
 (defconstant QUI$M_SEARCH_GENERIC_TARGET #b00000000000000000000001000000000)
 (defconstant QUI$M_SEARCH_PENDING_JOBS #b00000000000000000000010000000000)
 (defconstant QUI$M_SEARCH_EXECUTING_JOBS #b00000000000000000000100000000000)
 (defconstant QUI$M_SEARCH_TIMED_RELEASE_JOBS #b00000000000000000001000000000000)
 (defconstant QUI$M_SEARCH_HOLDING_JOBS #b00000000000000000010000000000000)
 (defconstant QUI$M_SEARCH_RETAINED_JOBS #b00000000000000000100000000000000)
 (defconstant QUI$M_SEARCH_FREEZE_CONTEXT #b00000000000000001000000000000000)
            
(define-alien-structure (SEARCH_FLAGS ( :conc-name nil))
    ; Select all jobs (else only those with same username as caller)
  (QUI$V_SEARCH_ALL_JOBS :unsigned-integer #.(+ 0 0/8) #.(+ 0 1/8)) 
    ; Force a wildcard operation
  (QUI$V_SEARCH_WILDCARD :unsigned-integer #.(+ 0 1/8) #.(+ 0 2/8)) 
    ; Select batch queues
  (QUI$V_SEARCH_BATCH :unsigned-integer #.(+ 0 2/8) #.(+ 0 3/8)) 
    ; Select symbiont (output) queues (note that QUI$V_SEARCH_SYMBIONT is equivalent
  (QUI$V_SEARCH_SYMBIONT :unsigned-integer #.(+ 0 3/8) #.(+ 0 4/8)) 
    ; to setting QUI$V_SEARCH_PRINTER, QUI$V_SEARCH_SERVER, and QUI$V_SEARCH_TERMINAL)
    ; Select only caller's batch job (forcing new context)
  (QUI$V_SEARCH_THIS_JOB :unsigned-integer #.(+ 0 4/8) #.(+ 0 5/8)) 
    ; Select printer queues
  (QUI$V_SEARCH_PRINTER :unsigned-integer #.(+ 0 5/8) #.(+ 0 6/8)) 
    ; Select server queues
  (QUI$V_SEARCH_SERVER :unsigned-integer #.(+ 0 6/8) #.(+ 0 7/8)) 
    ; Select terminal queues
  (QUI$V_SEARCH_TERMINAL :unsigned-integer #.(+ 0 7/8) #.(+ 0 8/8)) 
    ; Select generic queues
  (QUI$V_SEARCH_GENERIC :unsigned-integer #.(+ 0 8/8) #.(+ 0 9/8)) 
    ; Select generic target queues after selecting generic queue (for internal use)
  (QUI$V_SEARCH_GENERIC_TARGET :unsigned-integer #.(+ 0 9/8) #.(+ 0 10/8)) 
    ; (note this option is NOT supported; it is intentionally not documented and
    ; reserved for Digital use)
    ; Select only pending jobs
  (QUI$V_SEARCH_PENDING_JOBS :unsigned-integer #.(+ 0 10/8) #.(+ 0 11/8)) 
    ; Select only executing jobs
  (QUI$V_SEARCH_EXECUTING_JOBS :unsigned-integer #.(+ 0 11/8) #.(+ 0 12/8)) 
    ; Select only timed release jobs
  (QUI$V_SEARCH_TIMED_RELEASE_JOBS :unsigned-integer #.(+ 0 12/8) #.(+ 0 13/8)) 
    ; Select only holding jobs
  (QUI$V_SEARCH_HOLDING_JOBS :unsigned-integer #.(+ 0 13/8) #.(+ 0 14/8)) 
    ; Select only retained jobs
  (QUI$V_SEARCH_RETAINED_JOBS :unsigned-integer #.(+ 0 14/8) #.(+ 0 15/8)) 
    ; Do not advance wildcard context to next object in list at end of operation
  (QUI$V_SEARCH_FREEZE_CONTEXT :unsigned-integer #.(+ 0 15/8) #.(+ 0 16/8)) 
  (QUI$v_filler :unsigned-integer #.(+ 0 16/8) #.(+ 0 32/8)) )
      
;;; to setting QUI$V_SEARCH_PRINTER, QUI$V_SEARCH_SERVER, and QUI$V_SEARCH_TERMINAL)
;;; (note this option is NOT supported; it is intentionally not documented and
;;; reserved for Digital use)
;;;
;;; Subfields of SYMBIONT_FLAGS item code.
;;;
;;; Note: this item code is intentionally not documented and reserved for Digital use.
;;;
 (defconstant QUI$M_SYM_NOTIFIES #b00000000000000000000000000000001)
 (defconstant QUI$M_SYM_REQUESTS_OPER #b00000000000000000000000000000010)
 (defconstant QUI$M_SYM_COPIES_FILE #b00000000000000000000000000000100)
 (defconstant QUI$M_SYM_COPIES_JOB #b00000000000000000000000000001000)
 (defconstant QUI$M_SYM_ACCEPTS_ALL_FORMS #b00000000000000000000000000010000)
 (defconstant QUI$M_SYM_NO_JOB_CHECKPOINT #b00000000000000000000000000100000)
            
(define-alien-structure (SYMBIONT_FLAGS ( :conc-name nil))
    ; Symbiont notifies for job completions
  (QUI$V_SYM_NOTIFIES :unsigned-integer #.(+ 0 0/8) #.(+ 0 1/8)) 
    ; Symbiont generates operator messages
  (QUI$V_SYM_REQUESTS_OPER :unsigned-integer #.(+ 0 1/8) #.(+ 0 2/8)) 
    ; Symbiont generates multiple file copies
  (QUI$V_SYM_COPIES_FILE :unsigned-integer #.(+ 0 2/8) #.(+ 0 3/8)) 
    ; Symbiont generates multiple job copies
  (QUI$V_SYM_COPIES_JOB :unsigned-integer #.(+ 0 3/8) #.(+ 0 4/8)) 
    ; Symbiont processes all form types
  (QUI$V_SYM_ACCEPTS_ALL_FORMS :unsigned-integer #.(+ 0 4/8) #.(+ 0 5/8)) 
    ; Always reprocess full job on a restart
  (QUI$V_SYM_NO_JOB_CHECKPOINT :unsigned-integer #.(+ 0 5/8) #.(+ 0 6/8)) 
  (QUI$v_filler :unsigned-integer #.(+ 0 6/8) #.(+ 0 32/8)) )
      
 
;;;*** MODULE $SBKDEF ***
      
;;;+
;;;
;;; Statistics block. This block is used to report various data regarding
;;; an open file to the requesting program.
;;;
;;;-
;;;
;;; The first two longwords are presented in inverted form for compatibility
;;; with the old RSX-11 statistics block.
;;;
 (defconstant SBK$K_LENGTH 32)
 (defconstant SBK$C_LENGTH 32)
            
(define-alien-structure (SBK    ( :conc-name nil))
    ; starting LBN if contiguous 
    (SBK$L_STLBN :unsigned-integer 0 4)
    ; high order word 
      (SBK$W_STLBNH :unsigned-integer 0 2)
    ; low order word 
      (SBK$W_STLBNL :unsigned-integer 2 4)
    ; file size 
    (SBK$L_FILESIZE :unsigned-integer 4 8)
    ; high order word 
      (SBK$W_FILESIZH :unsigned-integer 4 6)
    ; low order word 
      (SBK$W_FILESIZL :unsigned-integer 6 8)
    ;
    ; The following two fields are for RSX-11 compatibility
    ;
    ; low byte of access count 
  (SBK$B_ACNT :unsigned-integer 8 9)
    ; low byte of lock count 
  (SBK$B_LCNT :unsigned-integer 9 10)
    ; address of file control block 
  (SBK$L_FCB :pointer 10 14)
    ; spare 
  (SBKDEF$$_FILL_1 :signed-integer 14 16)
    ; access count 
  (SBK$W_ACNT :unsigned-integer 16 18)
    ; lock count (against writers) 
  (SBK$W_LCNT :unsigned-integer 18 20)
    ; writer count 
  (SBK$W_WCNT :unsigned-integer 20 22)
    ; truncate lock count 
  (SBK$W_TCNT :unsigned-integer 22 24)
    ; count of reads executed on channel 
  (SBK$L_READS :unsigned-integer 24 28)
    ; count of writes executed on channel 
  (SBK$L_WRITES :unsigned-integer 28 32))    ; count of writes executed on channel 
      
 
;;;*** MODULE $SECDEF ***
      
;;;+
;;; PROCESS OR GLOBAL SECTION DEFINITIONS
;;;-
;;;
;;; ***** L_VBN, L_WINDOW, AND B_PFC MUST BE THE SAME OFFSET VALUES AS THE
;;; ***** EQUIVALENTLY NAMED OFFSETS IN $PFLDEF
;;;
 (defconstant SEC$M_VPX #b00000000001111111111111111111111)
 (defconstant SEC$M_PFC #b11111111000000000000000000000000)
 (defconstant SEC$M_GBL #b00000000000000000000000000000001)
 (defconstant SEC$M_CRF #b00000000000000000000000000000010)
 (defconstant SEC$M_DZRO #b00000000000000000000000000000100)
 (defconstant SEC$M_WRT #b00000000000000000000000000001000)
 (defconstant SEC$M_SHMGS #b00000000000000000000000000010000)
 (defconstant SEC$M_WRTMOD #b00000000000000000000000011000000)
 (defconstant SEC$M_AMOD #b00000000000000000000001100000000)
 (defconstant SEC$M_RESIDENT #b00000000000000000010000000000000)
 (defconstant SEC$M_PERM #b00000000000000000100000000000000)
 (defconstant SEC$M_SYSGBL #b00000000000000001000000000000000)
 (defconstant SEC$M_PFNMAP #b00000000000000010000000000000000)
 (defconstant SEC$M_EXPREG #b00000000000000100000000000000000)
 (defconstant SEC$M_PROTECT #b00000000000001000000000000000000)
 (defconstant SEC$M_PAGFIL #b00000000000010000000000000000000)
 (defconstant SEC$M_EXECUTE #b00000000000100000000000000000000)
 (defconstant SEC$M_NOPROTCHK #b00000000001000000000000000000000)
 (defconstant SEC$M_NO_OVERMAP #b00000000010000000000000000000000)
 (defconstant SEC$M_INPROG #b00000000100000000000000000000000)
            
(define-alien-structure (SEC    ( :conc-name nil))
    ;GLOBAL SECTION DESCRIPTOR ADDRESS 
    (SEC$L_GSD :pointer 0 4)
    ;CHANNEL CONTROL BLOCK ADDRESS IF PROCESS SECTION 
    (SEC$L_CCB :pointer 0 4)
    ;SECTION INDEX FORWARD LINK 
  (SEC$W_SECXFL :unsigned-integer 4 6)
    ;SECTION INDEX BACKWARD LINK 
  (SEC$W_SECXBL :unsigned-integer 6 8)
    ;START VIRT PAGE INDEX & PFC 
    (SEC$L_VPXPFC :unsigned-integer 8 12)
    ; STARTING VIRTUAL PAGE INDEX 
      (SEC$V_VPX :unsigned-integer #.(+ 8 0/8) #.(+ 8 22/8)) 
    ; UNUSED 
      (SECDEF$$_FILL_1 :unsigned-integer #.(+ 8 22/8) #.(+ 8 24/8)) 
    ; PAGE FAULT CLUSTER 
      (SEC$V_PFC :unsigned-integer #.(+ 8 24/8) #.(+ 8 32/8)) 
      (SECDEF$$_FILL_5 :signed-integer 8 9 :occurs 3)
    ;PAGE FAULT CLUSTER 
      (SEC$B_PFC :unsigned-integer 11 12)
    ;WINDOW CONTROL BLOCK 
  (SEC$L_WINDOW :unsigned-integer 12 16)
    ;BASE VIRTUAL BLOCK NUMBER 
  (SEC$L_VBN :unsigned-integer 16 20)
    ;VARIOUS CONTROL FLAGS 
    (SEC$W_FLAGS :unsigned-integer 20 22)
    ; GLOBAL SECTION 
      (SEC$V_GBL :unsigned-integer #.(+ 20 0/8) #.(+ 20 1/8)) 
    ; COPY ON REFERENCE 
      (SEC$V_CRF :unsigned-integer #.(+ 20 1/8) #.(+ 20 2/8)) 
    ; DEMAND ZERO 
      (SEC$V_DZRO :unsigned-integer #.(+ 20 2/8) #.(+ 20 3/8)) 
    ; WRITABLE 
      (SEC$V_WRT :unsigned-integer #.(+ 20 3/8) #.(+ 20 4/8)) 
    ; SHARED MEMORY GLOBAL SECTION 
      (SEC$V_SHMGS :unsigned-integer #.(+ 20 4/8) #.(+ 20 5/8)) 
    ; SPARE 
      (SECDEF$$_FILL_2 :unsigned-integer #.(+ 20 5/8) #.(+ 20 6/8)) 
    ; WRITE ACCESS MODE FOR SECTION 
      (SEC$V_WRTMOD :unsigned-integer #.(+ 20 6/8) #.(+ 20 8/8)) 
    ; ACCESS MODE OF SECTION 
      (SEC$V_AMOD :unsigned-integer #.(+ 20 8/8) #.(+ 20 10/8)) 
    ; SPARE 
      (SECDEF$$_FILL_3 :unsigned-integer #.(+ 20 10/8) #.(+ 20 13/8)) 
    ; RESIDENT GLOBAL
      (SEC$V_RESIDENT :unsigned-integer #.(+ 20 13/8) #.(+ 20 14/8)) 
    ; PERMANENT SECTION 
      (SEC$V_PERM :unsigned-integer #.(+ 20 14/8) #.(+ 20 15/8)) 
    ; 1 = SYSTEM GLOBAL, 0 = GROUP GLOBAL 
      (SEC$V_SYSGBL :unsigned-integer #.(+ 20 15/8) #.(+ 20 16/8)) 
    ;
    ; *****  THE FOLLOWING FLAGS ARE INDICATORS FOR $MGBLSC AND $CRMPSC SYSTEM
    ; *****  SERVICE REQUESTS AND ARE NOT STORED IN THE FLAGS WORD FIELD.
    ;
    ; MAP TO SPECIFIC PFN'S 
      (SEC$V_PFNMAP :unsigned-integer #.(+ 20 16/8) #.(+ 20 17/8)) 
    ; MAP INTO FIRST FREE ADDRESS SPACE 
      (SEC$V_EXPREG :unsigned-integer #.(+ 20 17/8) #.(+ 20 18/8)) 
    ; CHECK WRITE ACCESS MODE (WRTMOD) 
      (SEC$V_PROTECT :unsigned-integer #.(+ 20 18/8) #.(+ 20 19/8)) 
    ; GLOBAL SECTION HAS PAGE FILE BACKING STORE 
      (SEC$V_PAGFIL :unsigned-integer #.(+ 20 19/8) #.(+ 20 20/8)) 
    ; CHECK FOR EXECUTE ACCESS
      (SEC$V_EXECUTE :unsigned-integer #.(+ 20 20/8) #.(+ 20 21/8)) 
    ; INHIBIT PROTECTION CHECK
      (SEC$V_NOPROTCHK :unsigned-integer #.(+ 20 21/8) #.(+ 20 22/8)) 
    ; DON'T OVERMAP ADDRESS SPACE 
      (SEC$V_NO_OVERMAP :unsigned-integer #.(+ 20 22/8) #.(+ 20 23/8)) 
    ; Section creation in progress
      (SEC$V_INPROG :unsigned-integer #.(+ 20 23/8) #.(+ 20 24/8)) )    ; Section creation in progress
      
 (defconstant SEC$K_LENGTH 32)   ; SIZE OF PSTE/GSTE 
 (defconstant SEC$C_LENGTH 32)   ; SIZE OF PSTE/GSTE 
;;;+
 (defconstant SEC$K_MATALL 0)   ;  MATCH ALWAYS, USE GLOBAL SECTION 
 (defconstant SEC$K_MATEQU 1)   ;  MATCH IF ISD$L_IDENT EQU GBL ID 
 (defconstant SEC$K_MATLEQ 2)   ;  MATCH IF ISD$L_IDENT LEQ GBL ID 
            
(define-alien-structure (SEC1    ( :conc-name nil))
  (SECDEF$$_FILL_6 :signed-integer 0 1 :occurs 21)
    ;ACCESS MODE OF SECTION 
  (SEC$B_AMOD :unsigned-integer 21 22)
    ;SPARE 
  (SECDEF$$_FILL_4 :signed-integer 22 24)
    ;COUNT OF PTE'S REFERENCING THIS SECTION 
  (SEC$L_REFCNT :unsigned-integer 24 28)
  (SEC$L_PAGCNT :unsigned-integer 28 32))    ;NO. OF PAGES IN THE SECTION 
    ; BASE OF ZERO , INCR 1 
      
;;;
;;; ***** NOTE THAT NUMBER OF LONG WORDS MUST BE EVEN
;;;
;;; MATCH CONTROL VIELD VALUES
;;;-
;;;
;;; Definitions for $GETSECI service
;;;
 (defconstant SECI$_CHAIN 1)   ;  Chained item block
 (defconstant SECI$_GSMODE 2)   ;  Access mode of section
 (defconstant SECI$_GSFLAGS 3)   ;  Flags
 (defconstant SECI$_GSNAME 4)   ;  Global section name
 (defconstant SECI$_GSIDENT 5)   ;  Global section ident
 (defconstant SECI$_GSRELPAG 6)   ;  Relative page number
 
;;;*** MODULE $SJCDEF ***
      
;;;
;;; Send to Job Controller Service ($SNDJBC) definitions.
;;;
;;; NOTE:  New items must always be added at the end so users will not have to relink.
;;;
;;;
;;; Function codes
;;;
 (defconstant SJC$_ABORT_JOB 1)   ;  Abort current job in a queue
 (defconstant SJC$_ADD_FILE 2)   ;  Add a file to an open job
 (defconstant SJC$_ALTER_JOB 3)   ;  Alter parameters of a job
 (defconstant SJC$_ALTER_QUEUE 4)   ;  Alter parameters of a queue
 (defconstant SJC$_ASSIGN_QUEUE 5)   ;  Assign a logical queue to an execution queue
 (defconstant SJC$_BATCH_CHECKPOINT 6)   ;  Establish a checkpoint in a batch job
 (defconstant SJC$_BATCH_SERVICE 7)   ;  LOGINOUT communication
 (defconstant SJC$_CLOSE_DELETE 8)   ;  Close and delete an open job
 (defconstant SJC$_CLOSE_JOB 9)   ;  Close and enqueue an open job
 (defconstant SJC$_CREATE_JOB 10)   ;  Create an open job
 (defconstant SJC$_CREATE_QUEUE 11)   ;  Create a queue
 (defconstant SJC$_DEASSIGN_QUEUE 12)   ;  Deassign a logical queue
 (defconstant SJC$_DEFINE_CHARACTERISTIC 13)   ;  Create a characteristic definition
 (defconstant SJC$_DEFINE_FORM 14)   ;  Create a form definition
 (defconstant SJC$_DELETE_CHARACTERISTIC 15)   ;  Delete a characteristic definition
 (defconstant SJC$_DELETE_FORM 16)   ;  Delete a form definition
 (defconstant SJC$_DELETE_JOB 17)   ;  Delete a job
 (defconstant SJC$_DELETE_QUEUE 18)   ;  Delete a queue
 (defconstant SJC$_ENTER_FILE 19)   ;  Enter a single file job in a queue
 (defconstant SJC$_MERGE_QUEUE 20)   ;  Requeue all jobs in one queue to another
 (defconstant SJC$_PAUSE_QUEUE 21)   ;  Suspend processing from a queue
 (defconstant SJC$_RESET_QUEUE 22)   ;  Reset a queue
 (defconstant SJC$_START_ACCOUNTING 23)   ;  Start accounting manager
 (defconstant SJC$_START_QUEUE 24)   ;  Start processing from a queue	
 (defconstant SJC$_START_QUEUE_MANAGER 25)   ;  Start system job queue manager
 (defconstant SJC$_STOP_ACCOUNTING 26)   ;  Stop accounting manager
 (defconstant SJC$_STOP_QUEUE 27)   ;  Stop processing from a queue
 (defconstant SJC$_STOP_QUEUE_MANAGER 28)   ;  Stop system job queue manager
 (defconstant SJC$_SYNCHRONIZE_JOB 29)   ;  Synchronize with job completion
 (defconstant SJC$_WRITE_ACCOUNTING 30)   ;  Write user accounting record
 (defconstant SJC$_CONTROL_DIAGNOSTICS 31)   ;  Control diagnostic functions (for internal use only)
;;; (note this function code is intentionally not documented and reserved for Digital use)
 (defconstant SJC$_RESERVED_FUNC_32 32)   ;  Reserved for Digital use (name may change)
;;;
;;; Item codes
;;;
 (defconstant SJC$_ACCOUNTING_MESSAGE 1)   ;  User accounting message
 (defconstant SJC$_ACCOUNTING_TYPES 2)   ;  Mask of accounting record types
 (defconstant SJC$_AFTER_TIME 3)   ;  Hold until time
 (defconstant SJC$_NO_AFTER_TIME 4)
 (defconstant SJC$_ALIGNMENT_MASK 5)   ;  Mask alignment data
 (defconstant SJC$_ALIGNMENT_PAGES 6)   ;  Number of alignment pages
 (defconstant SJC$_BASE_PRIORITY 7)   ;  Batch process base priority
 (defconstant SJC$_BATCH 8)   ;  Batch queue
 (defconstant SJC$_NO_BATCH 9)
 (defconstant SJC$_BATCH_INPUT 10)   ;  LOGINOUT communication
 (defconstant SJC$_BATCH_OUTPUT 11)   ;  For use by LOGINOUT (for internal use only)
;;; (note this item code is intentionally not documented and reserved for Digital use)
 (defconstant SJC$_CHARACTERISTIC_NAME 12)   ;  Printer characteristic
 (defconstant SJC$_CHARACTERISTIC_NUMBER 13)
 (defconstant SJC$_NO_CHARACTERISTICS 14)
 (defconstant SJC$_CHECKPOINT_DATA 15)   ;  Batch checkpoint string
 (defconstant SJC$_NO_CHECKPOINT_DATA 16)
 (defconstant SJC$_CLI 17)   ;  Batch process CLI
 (defconstant SJC$_NO_CLI 18)
 (defconstant SJC$_CPU_DEFAULT 19)   ;  Default CPU time limit
 (defconstant SJC$_NO_CPU_DEFAULT 20)
 (defconstant SJC$_CPU_LIMIT 21)   ;  Maximum CPU time limit
 (defconstant SJC$_NO_CPU_LIMIT 22)
 (defconstant SJC$_CREATE_START 23)   ;  Start queue after creation
 (defconstant SJC$_DELETE_FILE 24)   ;  Delete file after processing
 (defconstant SJC$_NO_DELETE_FILE 25)
 (defconstant SJC$_DESTINATION_QUEUE 26)   ;  Destination queue name
 (defconstant SJC$_DEVICE_NAME 27)   ;  Output device name
 (defconstant SJC$_DOUBLE_SPACE 28)   ;  Double space output
 (defconstant SJC$_NO_DOUBLE_SPACE 29)
 (defconstant SJC$_ENTRY_NUMBER 30)   ;  Job entry number
 (defconstant SJC$_ENTRY_NUMBER_OUTPUT 31)
 (defconstant SJC$_FILE_BURST 32)   ;  Print file burst page
 (defconstant SJC$_FILE_BURST_ONE 33)
 (defconstant SJC$_NO_FILE_BURST 34)
 (defconstant SJC$_FILE_COPIES 35)   ;  Print n copies of file
 (defconstant SJC$_FILE_FLAG 36)   ;  Print file flag page
 (defconstant SJC$_FILE_FLAG_ONE 37)
 (defconstant SJC$_NO_FILE_FLAG 38)
 (defconstant SJC$_FILE_IDENTIFICATION 39)   ;  DVI, FID, DID of file
 (defconstant SJC$_FILE_SETUP_MODULES 40)   ;  Device control modules for file
 (defconstant SJC$_NO_FILE_SETUP_MODULES 41)
 (defconstant SJC$_FILE_SPECIFICATION 42)   ;  File specification of file
 (defconstant SJC$_FILE_TRAILER 43)   ;  Print file trailer page
 (defconstant SJC$_FILE_TRAILER_ONE 44)
 (defconstant SJC$_NO_FILE_TRAILER 45)
 (defconstant SJC$_FIRST_PAGE 46)   ;  Starting page number
 (defconstant SJC$_NO_FIRST_PAGE 47)
 (defconstant SJC$_FORM_DESCRIPTION 48)   ;  Textual description of form
 (defconstant SJC$_FORM_LENGTH 49)   ;  Form length in lines
 (defconstant SJC$_FORM_MARGIN_BOTTOM 50)   ;  Form bottom margin in lines
 (defconstant SJC$_FORM_MARGIN_LEFT 51)   ;  Form left margin in characters
 (defconstant SJC$_FORM_MARGIN_RIGHT 52)   ;  Form right margin in characters
 (defconstant SJC$_FORM_MARGIN_TOP 53)   ;  Form top margin in lines
 (defconstant SJC$_FORM_NAME 54)   ;  Printer form
 (defconstant SJC$_FORM_NUMBER 55)
 (defconstant SJC$_FORM_SETUP_MODULES 56)   ;  Device control modules for form
 (defconstant SJC$_NO_FORM_SETUP_MODULES 57)
 (defconstant SJC$_FORM_SHEET_FEED 58)   ;  Form is sheet fed
 (defconstant SJC$_NO_FORM_SHEET_FEED 59)
 (defconstant SJC$_FORM_STOCK 60)   ;  Stock name for form
 (defconstant SJC$_FORM_TRUNCATE 61)   ;  Truncate long lines
 (defconstant SJC$_NO_FORM_TRUNCATE 62)
 (defconstant SJC$_FORM_WIDTH 63)   ;  Form width in characters
 (defconstant SJC$_FORM_WRAP 64)   ;  Wrap long lines
 (defconstant SJC$_NO_FORM_WRAP 65)
 (defconstant SJC$_GENERIC_QUEUE 66)   ;  Queue is a generic queue
 (defconstant SJC$_NO_GENERIC_QUEUE 67)
 (defconstant SJC$_GENERIC_SELECTION 68)   ;  Queue can take work from generic queue
 (defconstant SJC$_NO_GENERIC_SELECTION 69)
 (defconstant SJC$_GENERIC_TARGET 70)   ;  Possible execution queue for generic queue
 (defconstant SJC$_HOLD 71)   ;  Place job on hold
 (defconstant SJC$_NO_HOLD 72)
 (defconstant SJC$_JOB_BURST 73)   ;  Print job burst page
 (defconstant SJC$_NO_JOB_BURST 74)
 (defconstant SJC$_JOB_COPIES 75)   ;  Print n copies of entire job
 (defconstant SJC$_JOB_FLAG 76)   ;  Print job flag page
 (defconstant SJC$_NO_JOB_FLAG 77)
 (defconstant SJC$_JOB_LIMIT 78)   ;  Number of concurrent jobs
 (defconstant SJC$_JOB_NAME 79)   ;  Identifying name of job
 (defconstant SJC$_JOB_RESET_MODULES 80)   ;  Device control modules between jobs
 (defconstant SJC$_NO_JOB_RESET_MODULES 81)
 (defconstant SJC$_JOB_SIZE_MAXIMUM 82)   ;  Largest job accepted by printer
 (defconstant SJC$_NO_JOB_SIZE_MAXIMUM 83)
 (defconstant SJC$_JOB_SIZE_MINIMUM 84)   ;  Smallest job accepted by printer
 (defconstant SJC$_NO_JOB_SIZE_MINIMUM 85)
 (defconstant SJC$_JOB_SIZE_SCHEDULING 86)   ;  Schedule printer queues by size
 (defconstant SJC$_NO_JOB_SIZE_SCHEDULING 87)
 (defconstant SJC$_JOB_STATUS_OUTPUT 88)   ;  Status message for submitted job
 (defconstant SJC$_JOB_TRAILER 89)   ;  Print job trailer page
 (defconstant SJC$_NO_JOB_TRAILER 90)
 (defconstant SJC$_LAST_PAGE 91)   ;  Ending page number
 (defconstant SJC$_NO_LAST_PAGE 92)
 (defconstant SJC$_LIBRARY_SPECIFICATION 93)   ;  Filename of device control library
 (defconstant SJC$_NO_LIBRARY_SPECIFICATION 94)
 (defconstant SJC$_LOG_DELETE 95)   ;  Delete log file
 (defconstant SJC$_NO_LOG_DELETE 96)
 (defconstant SJC$_LOG_QUEUE 97)   ;  Log file's print queue
 (defconstant SJC$_LOG_SPECIFICATION 98)   ;  File specification of log file
 (defconstant SJC$_NO_LOG_SPECIFICATION 99)
 (defconstant SJC$_LOG_SPOOL 100)   ;  Print log file
 (defconstant SJC$_NO_LOG_SPOOL 101)
 (defconstant SJC$_LOWERCASE 102)   ;  Print on lowercase printer
 (defconstant SJC$_NO_LOWERCASE 103)
 (defconstant SJC$_NEW_VERSION 104)   ;  Create new version of file
 (defconstant SJC$_NEXT_JOB 105)   ;  Resume at next job
 (defconstant SJC$_NOTE 106)   ;  Flag page note text
 (defconstant SJC$_NO_NOTE 107)
 (defconstant SJC$_NOTIFY 108)   ;  Notify user on completion
 (defconstant SJC$_NO_NOTIFY 109)
 (defconstant SJC$_OPERATOR_REQUEST 110)   ;  Operator service text
 (defconstant SJC$_NO_OPERATOR_REQUEST 111)
 (defconstant SJC$_OWNER_UIC 112)   ;  Queue owner UIC
 (defconstant SJC$_PAGE_HEADER 113)   ;  Print page headers
 (defconstant SJC$_NO_PAGE_HEADER 114)
 (defconstant SJC$_PAGE_SETUP_MODULES 115)   ;  Device control modules for form page
 (defconstant SJC$_NO_PAGE_SETUP_MODULES 116)
 (defconstant SJC$_PAGINATE 117)   ;  Paginate output with free form feeds
 (defconstant SJC$_NO_PAGINATE 118)
 (defconstant SJC$_PARAMETER_1 119)   ;  Batch job parameters
 (defconstant SJC$_PARAMETER_2 120)
 (defconstant SJC$_PARAMETER_3 121)
 (defconstant SJC$_PARAMETER_4 122)
 (defconstant SJC$_PARAMETER_5 123)
 (defconstant SJC$_PARAMETER_6 124)
 (defconstant SJC$_PARAMETER_7 125)
 (defconstant SJC$_PARAMETER_8 126)
 (defconstant SJC$_NO_PARAMETERS 127)
 (defconstant SJC$_PASSALL 128)   ;  Print file passall
 (defconstant SJC$_NO_PASSALL 129)
 (defconstant SJC$_PRIORITY 130)   ;  Job scheduling priority
 (defconstant SJC$_PROCESSOR 131)   ;  Filename of symbiont image
 (defconstant SJC$_NO_PROCESSOR 132)
 (defconstant SJC$_PROTECTION 133)   ;  Queue protection mask
 (defconstant SJC$_QUEUE 134)   ;  Queue on which to operate
 (defconstant SJC$_QUEUE_FILE_SPECIFICATION 135)   ;  File specification of queue file
 (defconstant SJC$_RELATIVE_PAGE 136)   ;  Resume after forward or back space
 (defconstant SJC$_REQUEUE 137)   ;  Requeue job
 (defconstant SJC$_RESTART 138)   ;  Job can restart
 (defconstant SJC$_NO_RESTART 139)
 (defconstant SJC$_RETAIN_ALL_JOBS 140)   ;  Retain completed jobs
 (defconstant SJC$_RETAIN_ERROR_JOBS 141)
 (defconstant SJC$_NO_RETAIN_JOBS 142)
 (defconstant SJC$_SCSNODE_NAME 143)   ;  Node name of execution node
 (defconstant SJC$_SEARCH_STRING 144)   ;  Resume after finding string
 (defconstant SJC$_SWAP 145)   ;  Swap batch processes
 (defconstant SJC$_NO_SWAP 146)
 (defconstant SJC$_TERMINAL 147)   ;  Queue is a (generic) terminal queue
 (defconstant SJC$_NO_TERMINAL 148)
 (defconstant SJC$_TOP_OF_FILE 149)   ;  Resume at top of file
 (defconstant SJC$_USER_IDENTIFICATION 150)   ;  Proxy user identification (not supported and is obsolete)
;;; (note this item code is intentionally not documented and reserved for Digital use)
 (defconstant SJC$_WSDEFAULT 151)   ;  Working set default
 (defconstant SJC$_NO_WSDEFAULT 152)
 (defconstant SJC$_WSEXTENT 153)   ;  Working set extent
 (defconstant SJC$_NO_WSEXTENT 154)
 (defconstant SJC$_WSQUOTA 155)   ;  Working set quota
 (defconstant SJC$_NO_WSQUOTA 156)
 (defconstant SJC$_ACCOUNT_NAME 157)   ;  Proxy account name (requires CMKRNL privilege)
 (defconstant SJC$_UIC 158)   ;  Proxy UIC (requires CMKRNL privilege)
 (defconstant SJC$_USERNAME 159)   ;  Proxy username (requires CMKRNL privilege)
 (defconstant SJC$_BUFFER_COUNT 160)   ;  Multibuffer count for queue file
 (defconstant SJC$_EXTEND_QUANTITY 161)   ;  Allocation and extend quantity for queue file
 (defconstant SJC$_RECORD_BLOCKING 162)   ;  Symbiont record blocking of output stream
 (defconstant SJC$_NO_RECORD_BLOCKING 163)
 (defconstant SJC$_QUEMAN_RESTART 164)   ;  qualifier on SJC$_START_QUEUE_MANAGER, restart queue manager after an abort
 (defconstant SJC$_NO_QUEMAN_RESTART 165)
 (defconstant SJC$_DEFAULT_FORM_NAME 166)   ;  Default queue form name
 (defconstant SJC$_DEFAULT_FORM_NUMBER 167)   ;  Default queue form number
 (defconstant SJC$_RESERVED_INPUT_168 168)   ;  Reserved for Digital use (name may change)
 (defconstant SJC$_RESERVED_INPUT_169 169)   ;  Reserved for Digital use (name may change)
 (defconstant SJC$_RESERVED_OUTPUT_170 170)   ;  Reserved for Digital use (name may change)
 (defconstant SJC$_RESERVED_OUTPUT_171 171)   ;  Reserved for Digital use (name may change)
 (defconstant SJC$_OPEN_QUEUE 172)   ;  Open queue - allow job submission
 (defconstant SJC$_CLOSE_QUEUE 173)   ;  Close queue - do not allow job submission
 (defconstant SJC$_SERVER 174)   ;  Server queue
 (defconstant SJC$_PRINTER 175)   ;  Printer queue
 (defconstant SJC$_UPDATE_ORB 176)   ;  Update ORB information in queue file (for internal use only)
;;; (note this item code is intentionally not documented and reserved for Digital use)
 (defconstant SJC$_NO_QUEUE_DESCRIPTION 177)   ;  No queue description supplied
 (defconstant SJC$_RESERVED_BOOLEAN_178 178)   ;  Reserved for Digital use (name may change)
 (defconstant SJC$_RESERVED_BOOLEAN_179 179)   ;  Reserved for Digital use (name may change)
 (defconstant SJC$_RESERVED_BOOLEAN_180 180)   ;  Reserved for Digital use (name may change)
 (defconstant SJC$_RESERVED_BOOLEAN_181 181)   ;  Reserved for Digital use (name may change)
 (defconstant SJC$_RESERVED_BOOLEAN_182 182)   ;  Reserved for Digital use (name may change)
 (defconstant SJC$_RESERVED_BOOLEAN_183 183)   ;  Reserved for Digital use (name may change)
 (defconstant SJC$_DIAGNOSTIC_FLAGS 184)   ;  Diagnostic flags (for internal use only)
;;; (note this item code is intentionally not documented and reserved for Digital use)
 (defconstant SJC$_QUEUE_DESCRIPTION 185)   ;  Queue description
 (defconstant SJC$_RESERVED_INPUT_186 186)   ;  Reserved for Digital use (name may change)
 (defconstant SJC$_RESERVED_INPUT_187 187)   ;  Reserved for Digital use (name may change)
 (defconstant SJC$_RESERVED_INPUT_188 188)   ;  Reserved for Digital use (name may change)
 (defconstant SJC$_RESERVED_INPUT_189 189)   ;  Reserved for Digital use (name may change)
 (defconstant SJC$_RESERVED_INPUT_190 190)   ;  Reserved for Digital use (name may change)
 (defconstant SJC$_RESERVED_INPUT_191 191)   ;  Reserved for Digital use (name may change)
 (defconstant SJC$_RESERVED_INPUT_192 192)   ;  Reserved for Digital use (name may change)
 (defconstant SJC$_RESERVED_INPUT_193 193)   ;  Reserved for Digital use (name may change)
 (defconstant SJC$_RESERVED_INPUT_194 194)   ;  Reserved for Digital use (name may change)
 (defconstant SJC$_RESERVED_INPUT_195 195)   ;  Reserved for Digital use (name may change)
 (defconstant SJC$_RESERVED_OUTPUT_196 196)   ;  Reserved for Digital use (name may change)
 (defconstant SJC$_RESERVED_OUTPUT_197 197)   ;  Reserved for Digital use (name may change)
 (defconstant SJC$_RESERVED_OUTPUT_198 198)   ;  Reserved for Digital use (name may change)
 (defconstant SJC$_RESERVED_OUTPUT_199 199)   ;  Reserved for Digital use (name may change)
;;;
;;; Subfields of ACCOUNTING_TYPES item code.  These definitions must track EXE$GL_ACMFLAGS.
;;;
 (defconstant SJC$M_ACCT_PROCESS #b00000000000000000000000000000001)
 (defconstant SJC$M_ACCT_IMAGE #b00000000000000000000000000000010)
 (defconstant SJC$M_ACCT_INTERACTIVE #b00000000000000000000000000000100)
 (defconstant SJC$M_ACCT_LOGIN_FAILURE #b00000000000000000000000000001000)
 (defconstant SJC$M_ACCT_SUBPROCESS #b00000000000000000000000000010000)
 (defconstant SJC$M_ACCT_DETACHED #b00000000000000000000000000100000)
 (defconstant SJC$M_ACCT_BATCH #b00000000000000000000000001000000)
 (defconstant SJC$M_ACCT_NETWORK #b00000000000000000000000010000000)
 (defconstant SJC$M_ACCT_PRINT #b00000000000000000000000100000000)
 (defconstant SJC$M_ACCT_MESSAGE #b00000000000000000000001000000000)
            
(define-alien-structure (ACCOUNTING_TYPES ( :conc-name nil))
    ; Process termination
  (SJC$V_ACCT_PROCESS :unsigned-integer #.(+ 0 0/8) #.(+ 0 1/8)) 
    ; Image termination
  (SJC$V_ACCT_IMAGE :unsigned-integer #.(+ 0 1/8) #.(+ 0 2/8)) 
    ; Interactive processes
  (SJC$V_ACCT_INTERACTIVE :unsigned-integer #.(+ 0 2/8) #.(+ 0 3/8)) 
    ; Login failures
  (SJC$V_ACCT_LOGIN_FAILURE :unsigned-integer #.(+ 0 3/8) #.(+ 0 4/8)) 
    ; Subprocesses
  (SJC$V_ACCT_SUBPROCESS :unsigned-integer #.(+ 0 4/8) #.(+ 0 5/8)) 
    ; Detached processes
  (SJC$V_ACCT_DETACHED :unsigned-integer #.(+ 0 5/8) #.(+ 0 6/8)) 
    ; Batch processes
  (SJC$V_ACCT_BATCH :unsigned-integer #.(+ 0 6/8) #.(+ 0 7/8)) 
    ; Network processes
  (SJC$V_ACCT_NETWORK :unsigned-integer #.(+ 0 7/8) #.(+ 0 8/8)) 
    ; Print job termination
  (SJC$V_ACCT_PRINT :unsigned-integer #.(+ 0 8/8) #.(+ 0 9/8)) 
    ; User messages
  (SJC$V_ACCT_MESSAGE :unsigned-integer #.(+ 0 9/8) #.(+ 0 10/8)) 
  (SJC$V_ACCT_UNUSED :unsigned-integer #.(+ 0 10/8) #.(+ 0 32/8)) )
      
 
;;;*** MODULE $SMRDEF ***
      
;;;
;;; DEFINE SYMBIONT MANAGER REQUEST CODES
;;;
;;; SYMBIONT MANAGER REQUEST CODES 
 (defconstant SMR$K_INITIAL 0)   ;  INITIALIZE A QUEUE 
 (defconstant SMR$K_DELETE 1)   ;  DELETE THE QUEUE 
 (defconstant SMR$K_START 2)   ;  ACTIVATE OR RESUME PRINTING 
 (defconstant SMR$K_PAUSE 3)   ;  SUSPEND PRINTING FOR A WHILE 
 (defconstant SMR$K_MERGE 4)   ;  MOVE FILES FORM ONE QUEUE INTO ANOTHER 
 (defconstant SMR$K_REDIRECT 5)   ;  ASSIGNMENT OF ONE QUEUE TO ANOTHER 
 (defconstant SMR$K_JUSTIFY 6)   ;  JUSTIFY PRINT FORMS(IE: ISSUE FF) 
 (defconstant SMR$K_STOP 7)   ;  DISABLE FURTHER DE-QUEING 
 (defconstant SMR$K_ENTER 8)   ;  ADD A FILE TO A QUEUE 
 (defconstant SMR$K_CREJOB 9)   ;  CREATE A PRINT JOB 
 (defconstant SMR$K_ADDFIL 10)   ;  ADD A FILE TO EXISTING JOB 
 (defconstant SMR$K_CLSJOB 11)   ;  CLOSE OPEN JOB 
 (defconstant SMR$K_RMVJOB 12)   ;  REMOVE JOB FROM QUEUE 
 (defconstant SMR$K_ALTER 13)   ;  CHANGE A FILES CHARACTERISTICS 
 (defconstant SMR$K_ABORT 14)   ;  ABORT CURRENT JOB, START NEXT 
 (defconstant SMR$K_RELEASE 15)   ;  RELEASE JOB FROM HOLD LIST 
 (defconstant SMR$K_DETINIT 16)   ;  DETACHED JOB HAS INITIATED 
 (defconstant SMR$K_SYNCJOB 17)   ;  SYNCRONIZE WITH A BATCH JOB 
 (defconstant SMR$K_ASKQNAM 18)   ;  GET NAME OF QUEUE FOR LOG FILE 
;;;
;;; ASSIGN SYMBIONT MANAGER PRINT JOB/RECORD OPTION CODES
;;;
;;;
;;; JOB FILE OPTIONS 
 (defconstant SMO$K_DELETE 1)   ;  DELETE THE FILE AFTER PRINTING 
 (defconstant SMO$K_BRSTPAG 2)   ;  CREATE A BURST PAGE 
 (defconstant SMO$K_NOBRSTPAG 3)   ;  INHIBIT BURST PAGE 
 (defconstant SMO$K_FLAGPAG 4)   ;  PRINT A FLAG PAGE 
 (defconstant SMO$K_NOFLAGPAG 5)   ;  INHIBIT A FLAG PAGE 
 (defconstant SMO$K_PAGHDR 6)   ;  PRINT FILENAME AS PAGE HEADER 
 (defconstant SMO$K_DOUBLE 7)   ;  DOUBLE SPACE THE LISTING 
 (defconstant SMO$K_NOFEED 8)   ;  INHIBIT FORM FEED GENERATION 
 (defconstant SMO$K_PAGCNT 9)   ;  SPECIFY PAGE COUNT TO PRINT 
 (defconstant SMO$K_COPIES 10)   ;  NUMBER OF COPIES TO PRINT 
 (defconstant SMO$K_FILESIZ 11)   ;  FILE SIZE 
 (defconstant SMO$K_DESTQUE 12)   ;  DESTINATION QUEUE 
;;; OPTIONS FOR CREATE JOB 
 (defconstant SMO$K_RLSTIM 32)   ;  TIME TO HOLD UNTIL QUEUEING 
 (defconstant SMO$K_HOLD 33)   ;  HOLD THE JOB 
 (defconstant SMO$K_JOBPRI 34)   ;  SPECIFY PRINT JOB/DETACHED JOB PRIOITY 
 (defconstant SMO$K_JOBCOPY 35)   ;  NUMBER OF COPIES OF ENTIRE JOB 
 (defconstant SMO$K_FORMTYPE 36)   ;  FORM TYPE TO USED WHEN PRINTED 
 (defconstant SMO$K_LOWER 37)   ;  UPPER/LOWER CASE PRINTER ONLY 
 (defconstant SMO$K_PARAMS 38)   ;  SUPPLY JOB PARAMETERS 
 (defconstant SMO$K_JOBNAME 39)   ;  SUPPLY A NAME TO THE JOB 
 (defconstant SMO$K_NOLOWER 40)   ;  CLEAR LOWER CASE REQUIRED 
 (defconstant SMO$K_CPULIM 41)   ;  CPU TIME LIMIT 
 (defconstant SMO$K_NOCPULM 42)   ;  NO CPU TIME LIMIT 
 (defconstant SMO$K_WSQUOTA 43)   ;  WORKING SET QUOTA 
 (defconstant SMO$K_NOWSQUO 44)   ;  NO WORKING SET QUOTA 
 (defconstant SMO$K_WSDEFLT 45)   ;  WORKING SET DEFAULT 
 (defconstant SMO$K_NOWSDFT 46)   ;  NO WORKING SET DEFAULT 
 (defconstant SMO$K_DQCHAR 47)   ;  CHAR. TO BE USED WHEN PRINTED 
 (defconstant SMO$K_LOGFNAM 48)   ;  LOG FILE SPEC. 
 (defconstant SMO$K_LOGQNAM 49)   ;  QUEUE NAME FOR LOG FILE 
 (defconstant SMO$K_KEEPLOG 50)   ;  KEEP LOG FILE 
 (defconstant SMO$K_NOSPOOL 51)   ;  DON'T SPOOL LOG FILE 
 (defconstant SMO$K_NOKEEPLOG 52)   ;  DELETE LOG FILE 
 (defconstant SMO$K_NOLOG 53)   ;  CREATE LOG ON NULL DEVICE 
 (defconstant SMO$K_NOTIFY 54)   ;  NOTIFY WHEN JOB COMPLETES 
 (defconstant SMO$K_NONOTFY 55)   ;  NO NOTIFY 
 (defconstant SMO$K_WSEXTNT 56)   ;  WS EXTENT 
 (defconstant SMO$K_NOWSEXTNT 57)   ;  NO WS EXTENT 
;;; OPTIONS FOR INIT OR START A QUEUE 
 (defconstant SMO$K_CURFORM 64)   ;  CURRENT FORMS MOUNTED ON DEVICE 
 (defconstant SMO$K_GENPRT 65)   ;  ALLOW GENERIC PRINTING 
 (defconstant SMO$K_NOGENPRT 66)   ;  DISALLOW GENERIC PRINTING 
 (defconstant SMO$K_DETJOB 67)   ;  QUEUE IS FOR DETACHED JOB QUEUING 
 (defconstant SMO$K_GENDEV 68)   ;  QUEUE IS GENERIC DEVICE QUEUE 
 (defconstant SMO$K_NOGENDEV 69)   ;  NOT A GENERIC DEVICE 
 (defconstant SMO$K_DEFBRST 70)   ;  QUEUE HAS BURST PAGE BY DEFAULT 
 (defconstant SMO$K_NODEFBRST 71)   ;  NO DEFAULT BURST PAGE 
 (defconstant SMO$K_DEFFLAG 72)   ;  QUEUE HAS FLAG PAGE BY DEFAULT 
 (defconstant SMO$K_NODEFFLAG 73)   ;  NO DEFAULT FLAG 
 (defconstant SMO$K_TRMDEV 74)   ;  DEVICE IS A TERMINAL 
 (defconstant SMO$K_NOTRMDEV 75)   ;  DEVICE IS NOT A TERMINAL 
 (defconstant SMO$K_JOBLIM 76)   ;  JOB LIMIT FOR BATCH JOBS 
 (defconstant SMO$K_INIPRI 77)   ;  JOB INITIAL PRIORITY 
 (defconstant SMO$K_DISWAP 78)   ;  DISABLE SWAPING 
 (defconstant SMO$K_MCPULM 79)   ;  MAX CPU TIME LIMIT 
 (defconstant SMO$K_NOMCPULM 80)   ;  NO MAX CPU TIME LIMIT 
 (defconstant SMO$K_DCPULM 81)   ;  DEFAULT CPU TIME LIMIT 
 (defconstant SMO$K_NODCPULM 82)   ;  NO DEFAULT CPU TIME LIMIT 
 (defconstant SMO$K_WSQUTA 83)   ;  WORKING SET QUOTA 
 (defconstant SMO$K_NOWSQUTA 84)   ;  NO WORKING SET QUOTA 
 (defconstant SMO$K_WSDFLT 85)   ;  WORKING SET DEFAULT 
 (defconstant SMO$K_NOWSDFLT 86)   ;  NO WORKING SET DEFAULT 
 (defconstant SMO$K_CURDQCHAR 87)   ;  CURRENT CHAR. OF THE QUEUE 
 (defconstant SMO$K_SMBNAME 88)   ;  SYMBIONT NAME FOR QUEUE 
 (defconstant SMO$K_WSXTANT 89)   ;  WS EXTENT 
 (defconstant SMO$K_NOWSXTNT 90)   ;  NO WS EXTENT 
 (defconstant SMO$K_NODISWAP 91)   ;  ENABLE SWAPPING 
;;; OPTIONS FOR RESTART 
 (defconstant SMO$K_NEXTJOB 96)   ;  RESTART AT END BEGINNING OF NEXT JOB 
 (defconstant SMO$K_TOPOFILE 97)   ;  RESTART JOB AT TOP-OF-FILE 
 (defconstant SMO$K_SPCCNT 98)   ;  SPECIFY PAGES TO SPACE OVER 
;;; OPTIONS FOR ABORT 
 (defconstant SMO$K_REQUEUE 112)   ;  REQUEUE THE FILE 
 (defconstant SMO$K_REQDEST 113)   ;  SPECIFY NEW QUEUE DESTINATION 
 (defconstant SMO$K_REQPRIO 114)   ;  SPECIFY PRIORITY ON REQUEUE 
 
;;;*** MODULE $STSDEF ***
      
;;;
;;; MACROS TO DEFINE SYSTEM SERVICE FAILURE AND STATUS CODES.
;;;
;;;
;;;        $STRUCT        SS
;;;
;;; THIS STRUCTURE IS NOW CONTAINED IN 'SSMSG.MDL'
;;;+
;;; Define 32-bit VAX-11 error code longword fields
;;; Changed to agree with Handbook - TNH 26-OCT-77 - CHANGE M 1 to P 1
;;; Changed to agree with new status value  W. H. Brown 18-NOV-1977
;;;-
 (defconstant STS$M_SEVERITY #b00000000000000000000000000000111)
 (defconstant STS$M_COND_ID #b00001111111111111111111111111000)
 (defconstant STS$M_CONTROL #b11110000000000000000000000000000)
 (defconstant STS$M_SUCCESS #b00000000000000000000000000000001)
 (defconstant STS$M_MSG_NO #b00000000000000001111111111111000)
 (defconstant STS$M_CODE #b00000000000000000111111111111000)
 (defconstant STS$M_FAC_SP #b00000000000000001000000000000000)
 (defconstant STS$M_CUST_DEF #b00001000000000000000000000000000)
 (defconstant STS$M_INHIB_MSG #b00010000000000000000000000000000)
 (defconstant STS$M_FAC_NO #b00001111111111110000000000000000)
 (defconstant STS$K_WARNING 0)   ;  WARNING 
 (defconstant STS$K_SUCCESS 1)   ;  SUCCESSFUL COMPLETION 
 (defconstant STS$K_ERROR 2)   ;  ERROR 
 (defconstant STS$K_INFO 3)   ;  INFORMATION 
 (defconstant STS$K_SEVERE 4)   ;  SEVERE ERROR 
            
(define-alien-structure (STS    ( :conc-name nil))
    ; severity code 
    (STS$V_SEVERITY :unsigned-integer #.(+ 0 0/8) #.(+ 0 3/8)) 
    ; condition id 
    (STS$V_COND_ID :unsigned-integer #.(+ 0 3/8) #.(+ 0 28/8)) 
    ; control bits 
    (STS$V_CONTROL :unsigned-integer #.(+ 0 28/8) #.(+ 0 32/8)) 
    ; Success 
    (STS$V_SUCCESS :unsigned-integer #.(+ 0 0/8) #.(+ 0 1/8)) 
    ; skip severity field 
    (STSDEF$$_FILL_1 :unsigned-integer #.(+ 0 1/8) #.(+ 0 3/8)) 
    ; Message number 
    (STS$V_MSG_NO :unsigned-integer #.(+ 0 3/8) #.(+ 0 16/8)) 
    ; Skip severity field 
    (STSDEF$$_FILL_2 :unsigned-integer #.(+ 0 0/8) #.(+ 0 3/8)) 
    ; code 
    (STS$V_CODE :unsigned-integer #.(+ 0 3/8) #.(+ 0 15/8)) 
    ; 1 if facility specific 
    (STS$V_FAC_SP :unsigned-integer #.(+ 0 15/8) #.(+ 0 16/8)) 
    (STSDEF$$_FILL_3 :unsigned-integer #.(+ 0 16/8) #.(+ 0 27/8)) 
    ; 1 if sub-system is customer (or CSS) defined 
    (STS$V_CUST_DEF :unsigned-integer #.(+ 0 27/8) #.(+ 0 28/8)) 
    ; 1 if message should not be printed 
    (STS$V_INHIB_MSG :unsigned-integer #.(+ 0 28/8) #.(+ 0 29/8)) 
    ; reserved control bits 
    (STSDEF$$_FILL_4 :unsigned-integer #.(+ 0 29/8) #.(+ 0 32/8)) 
    ; Skip message nubmer field 
    (STSDEF$$_FILL_5 :unsigned-integer #.(+ 0 0/8) #.(+ 0 16/8)) 
    ; Facility is 12 bits 
    (STS$V_FAC_NO :unsigned-integer #.(+ 0 16/8) #.(+ 0 28/8)) 
    ; Control bits 
    (STSDEF$$_FILL_6 :unsigned-integer #.(+ 0 28/8) #.(+ 0 32/8)) )    ; Control bits 
    ;-
      
;;;+
;;; Define severity codes
 
;;;*** MODULE $SYIDEF ***
      
;;;+
;;; Get System Information Data Identifier Definitions
;;;
;;; **** NOTE ****
;;;
;;;        New items must always be added to the END of each item list
;;;        (preceeding the ENDlistname item) so that users will not have
;;;        to relink.
;;;-
;;; DEFINE TABLE TYPES 
 (defconstant SYI$C_EXETYPE 1)   ;  Executive cells
 (defconstant SYI$C_FLDTYPE 2)   ;  Sub-field data
 (defconstant SYI$C_RSDTYPE 3)   ;  Reduced system data
;;;	The following item-codes are for executive data cells.
;;;	Processor registers are a special case of this type.
;;;	Some EXE-type cells have frequently used sub-fields,
;;;	which have item-codes in the FLD section. (after this one)
 (defconstant SYI$_VERSION 4096)   ;  VMS version number
 (defconstant SYI$_SID 4097)   ;  System ID register
 (defconstant SYI$_PFCDEFAULT 4098)   ;  Default page fault cluster size
 (defconstant SYI$_PAGTBLPFC 4099)   ;  Default page table page fault cluster
 (defconstant SYI$_SYSPFC 4100)   ;  Page fault cluster for system paging
 (defconstant SYI$_KFILSTCNT 4101)   ;  Number of known file lists
 (defconstant SYI$_GBLSECTIONS 4102)   ;  Global section count
 (defconstant SYI$_GBLPAGES 4103)   ;  Global page count
 (defconstant SYI$_GBLPAGFIL 4104)   ;  Global page page file page limit
 (defconstant SYI$_MAXPROCESSCNT 4105)   ;  Maximum process count
 (defconstant SYI$_PIXSCAN 4106)   ;  Process scan count
 (defconstant SYI$_PROCSECTCNT 4107)   ;  Process section count
 (defconstant SYI$_MINWSCNT 4108)   ;  Minimum working set size
 (defconstant SYI$_PAGFILCNT 4109)   ;  Number of paging files
 (defconstant SYI$_SWPFILCNT 4110)   ;  Number of swap files
 (defconstant SYI$_SYSMWCNT 4111)   ;  System working set count
 (defconstant SYI$_INTSTKPAGES 4112)   ;  Interrupt stack size
 (defconstant SYI$_DLCKEXTRASTK 4113)   ;  Extra int stack for deadlock searches
 (defconstant SYI$_BALSETCNT 4114)   ;  Balance set count
 (defconstant SYI$_IRPCOUNT 4115)   ;  Count of I/O packets
 (defconstant SYI$_IRPCOUNTV 4116)   ;  Limit of extension of IRP list
 (defconstant SYI$_WSMAX 4117)   ;  Max size of process working set
 (defconstant SYI$_NPAGEDYN 4118)   ;  Non-paged dynamic pool
 (defconstant SYI$_NPAGEVIR 4119)   ;  Limit of extension of above
 (defconstant SYI$_PAGEDYN 4120)   ;  Paged dynamic pool
 (defconstant SYI$_VIRTUALPAGECNT 4121)   ;  Max virtual page count
 (defconstant SYI$_SPTREQ 4122)   ;  Requested SPT extension
 (defconstant SYI$_EXUSRSTK 4123)   ;  Extra user stack provided
 (defconstant SYI$_LRPCOUNT 4124)   ;  Number of large request packets
 (defconstant SYI$_LRPCOUNTV 4125)   ;  Limit of extension of LRP list
 (defconstant SYI$_LRPSIZE 4126)   ;  Size of large request packet
 (defconstant SYI$_LRPMIN 4127)   ;  Min alloc request for LRPs
 (defconstant SYI$_SRPCOUNT 4128)   ;  Number of small request packets
 (defconstant SYI$_SRPCOUNTV 4129)   ;  Limit of extension of SRP list
 (defconstant SYI$_SRPSIZE 4130)   ;  Size of small request packet
 (defconstant SYI$_SRPMIN 4131)   ;  Min alloc request for SRPs
 (defconstant SYI$_CHANNELCNT 4132)   ;  Number of permanent I/O channels
 (defconstant SYI$_PIOPAGES 4133)   ;  Process I/O pages
 (defconstant SYI$_CTLPAGES 4134)   ;  Control region impure pages
 (defconstant SYI$_CTLIMGLIM 4135)   ;  Limit on use of proc alloc region
 (defconstant SYI$_IMGIOCNT 4136)   ;  Default image I/O address space
 (defconstant SYI$_QUANTUM 4137)   ;  Process quantum
 (defconstant SYI$_MPW_WRTCLUSTER 4138)   ;  Page write cluster factor
 (defconstant SYI$_MPW_HILIMIT 4139)   ;  Modified page list high limit
 (defconstant SYI$_MPW_LOLIMIT 4140)   ;  Modified page list low limit
 (defconstant SYI$_MPW_PRIO 4141)   ;  Modified page writer I/O priority
 (defconstant SYI$_SWP_PRIO 4142)   ;  Swapper I/O priority
 (defconstant SYI$_MPW_THRESH 4143)   ;  Modified page writer lower threshold
 (defconstant SYI$_MPW_WAITLIMIT 4144)   ;  Modified page writer busy wait limit
 (defconstant SYI$_TBSKIPWSL 4145)   ;  Max number WSlist entries to skip
 (defconstant SYI$_PHYSICALPAGES 4146)   ;  Max number of physical pages to use
 (defconstant SYI$_PFRATL 4147)   ;  Page fault rate lower threshold
 (defconstant SYI$_PFRATH 4148)   ;  Page fault rate high threshold
 (defconstant SYI$_PFRATS 4149)   ;  Page fault rate system threshold
 (defconstant SYI$_WSINC 4150)   ;  Working set increment
 (defconstant SYI$_WSDEC 4151)   ;  Working set decrement
 (defconstant SYI$_AWSMIN 4152)   ;  Working set minimum
 (defconstant SYI$_AWSTIME 4153)   ;  Working set measurement interval
 (defconstant SYI$_SWPRATE 4154)   ;  Swap rate control (max)
 (defconstant SYI$_SWPOUTPGCNT 4155)   ;  Desired proc page cnt for an outswap
 (defconstant SYI$_SWPALLOCINC 4156)   ;  Swap file allocation increment value
 (defconstant SYI$_IOTA 4157)   ;  I/O time allowance
 (defconstant SYI$_LONGWAIT 4158)   ;  When HIB or LEF proc becomes longwait
 (defconstant SYI$_SWPFAIL 4159)   ;  Swap fail count
 (defconstant SYI$_VMSD1 4160)   ;  Reserved to VMS development (DYNAMIC)
 (defconstant SYI$_VMSD2 4161)   ;  "
 (defconstant SYI$_VMSD3 4162)   ;  "
 (defconstant SYI$_VMSD4 4163)   ;  "
 (defconstant SYI$_VMS5 4164)   ;  Reserved to VMS development (STATIC)
 (defconstant SYI$_VMS6 4165)   ;  "
 (defconstant SYI$_VMS7 4166)   ;  "
 (defconstant SYI$_VMS8 4167)   ;  "
 (defconstant SYI$_USERD1 4168)   ;  Reserved for users (DYNAMIC)
 (defconstant SYI$_USERD2 4169)   ;  "
 (defconstant SYI$_USER3 4170)   ;  Reserved for users (STATIC)
 (defconstant SYI$_USER4 4171)   ;  "
 (defconstant SYI$_EXTRACPU 4172)   ;  Extra CPU time allowed on expiration
 (defconstant SYI$_MAXSYSGROUP 4173)   ;  Max group code for system UIC
 (defconstant SYI$_MVTIMEOUT 4174)   ;  Timeout for mount verification
 (defconstant SYI$_MAXBUF 4175)   ;  Maximum allowable buffered I/O size
 (defconstant SYI$_DEFMBXBUFQUO 4176)   ;  Def buffer quota for mailbox creation
 (defconstant SYI$_DEFMBXMXMSG 4177)   ;  Def max msg size for mailbox creation
 (defconstant SYI$_DEFMBXNUMMSG 4178)   ;  Def number of messages for "
 (defconstant SYI$_FREELIM 4179)   ;  Desired free list length
 (defconstant SYI$_FREEGOAL 4180)   ;  Target free list length
 (defconstant SYI$_GROWLIM 4181)   ;  Free > growlim to grow proc > wsquota
 (defconstant SYI$_BORROWLIM 4182)   ;  Same as above???
 (defconstant SYI$_LOCKRETRY 4183)   ;  Multi-CPU lock retry count
 (defconstant SYI$_XFMAXRATE 4184)   ;  Max DR32 data rate
 (defconstant SYI$_LAMAPREGS 4185)   ;  Number of UBA map regs for LPA11
 (defconstant SYI$_REALTIME_SPTS 4186)   ;  SPT entries for CONINTERR processes
 (defconstant SYI$_CLISYMTBL 4187)   ;  Number of pages for CLI symbol table
 (defconstant SYI$_LOCKIDTBL 4188)   ;  Size of lock ID table
 (defconstant SYI$_RESHASHTBL 4189)   ;  Size of resource hash table
 (defconstant SYI$_DEADLOCK_WAIT 4190)   ;  Deadlock detection timeout period
 (defconstant SYI$_SCSBUFFCNT 4191)   ;  SCS buffer descriptor table entries
 (defconstant SYI$_SCSCONNCNT 4192)   ;  SCS connect descriptor table entries
 (defconstant SYI$_SCSRESPCNT 4193)   ;  SCS response descriptor table entries
 (defconstant SYI$_SCSMAXDG 4194)   ;  SCS maximum datagram size
 (defconstant SYI$_SCSMAXMSG 4195)   ;  SCS max sequenced message size
 (defconstant SYI$_SCSFLOWCUSH 4196)   ;  SCS flow control cushion
 (defconstant SYI$_SCSSYSTEMID 4197)   ;  SCS system ID (48 bits)
 (defconstant SYI$_SCSSYSTEMIDH 4198)   ;  High bits of above
 (defconstant SYI$_SCSNODE 4199)   ;  SCS system node name
;;; Used to be SCSNODEH. Unused for now.
 (defconstant SYI$_PRCPOLINTERVAL 4201)   ;  SCA process polling interval
 (defconstant SYI$_PASTIMOUT 4202)   ;  CI port START/STACK timeout
 (defconstant SYI$_PASTDGBUF 4203)   ;  CI port DG buffers for START handshake
 (defconstant SYI$_PANUMPOLL 4204)   ;  Number of CI ports to poll
 (defconstant SYI$_PAPOLLINTERVAL 4205)   ;  Time between CI port polls
 (defconstant SYI$_PAPOOLINTERVAL 4206)   ;  Time between SYSAPs pool check
 (defconstant SYI$_TIMEPROMPTWAIT 4207)   ;  Time prompt timeout (when booting)
 (defconstant SYI$_UDABURSTRATE 4208)   ;  Max number of longwords per NPR - 1
 (defconstant SYI$_LNMSHASHTBL 4209)   ;  Size of system space log name hash table
 (defconstant SYI$_LNMPHASHTBL 4210)   ;  Size of process space "
 (defconstant SYI$_TTY_SCANDELTA 4211)   ;  Delta time for dialup timer scan
 (defconstant SYI$_TTY_DIALTYPE 4212)   ;  Flags for dialup type
 (defconstant SYI$_TTY_SPEED 4213)   ;  Terminal default: speed
 (defconstant SYI$_TTY_RSPEED 4214)   ;  " " receive speed
 (defconstant SYI$_TTY_PARITY 4215)   ;  " " parity
 (defconstant SYI$_TTY_BUF 4216)   ;  " " line width
 (defconstant SYI$_TTY_DEFCHAR 4217)   ;  " " characteristics
 (defconstant SYI$_TTY_DEFCHAR2 4218)   ;  " " characteristics, 2nd longword
 (defconstant SYI$_TTY_TYPAHDSZ 4219)   ;  Size of typeahead buffer
 (defconstant SYI$_TTY_ALTYPAHD 4220)   ;  Alternate typeahead size
 (defconstant SYI$_TTY_ALTALARM 4221)   ;  Alt typeahead alarm size
 (defconstant SYI$_TTY_DMASIZE 4222)   ;  Dma size
 (defconstant SYI$_TTY_PROT 4223)   ;  Default terminal alloc protection
 (defconstant SYI$_TTY_OWNER 4224)   ;  Default terminal owner
 (defconstant SYI$_TTY_CLASSNAME 4225)   ;  Default terminal class name prefix
 (defconstant SYI$_TTY_SILOTIME 4226)   ;  Default silo timeout for DMF32
 (defconstant SYI$_TTY_DEFPORT 4227)   ;  DEFAULT PORT ACTION PARAMETER
 (defconstant SYI$_RMS_DFMBC 4228)   ;  RMS default: multi-block count
 (defconstant SYI$_RMS_DFMBFSDK 4229)   ;  " " multi-buffer count for disk (SEQ)
 (defconstant SYI$_RMS_DFMBFSMT 4230)   ;  " " multi-buffer count for tape
 (defconstant SYI$_RMS_DFMBFSUR 4231)   ;  " " multi-buffer count for unit record
 (defconstant SYI$_RMS_DFMBFREL 4232)   ;  " " multi-buffer count for REL files
 (defconstant SYI$_RMS_DFMBFIDX 4233)   ;  " " multi-buffer count for ISAM files
 (defconstant SYI$_RMS_DFMBFHSH 4234)   ;  " " multi-buffer count for HASH files
 (defconstant SYI$_RMS_PROLOGUE 4235)   ;  " " prolog
 (defconstant SYI$_RMS_EXTEND_SIZE 4236)   ;  " " file extend quantity
 (defconstant SYI$_RMS_FILEPROT 4237)   ;  " " file protection
 (defconstant SYI$_PQL_DASTLM 4238)   ;  Def AST limit
 (defconstant SYI$_PQL_MASTLM 4239)   ;  Min "
 (defconstant SYI$_PQL_DBIOLM 4240)   ;  Def buffered I/O limit
 (defconstant SYI$_PQL_MBIOLM 4241)   ;  Min "
 (defconstant SYI$_PQL_DBYTLM 4242)   ;  Def buffered I/O byte count limit
 (defconstant SYI$_PQL_MBYTLM 4243)   ;  Min "
 (defconstant SYI$_PQL_DCPULM 4244)   ;  Def CPU time limit
 (defconstant SYI$_PQL_MCPULM 4245)   ;  Min "
 (defconstant SYI$_PQL_DDIOLM 4246)   ;  Def direct I/O limit
 (defconstant SYI$_PQL_MDIOLM 4247)   ;  Min "
 (defconstant SYI$_PQL_DFILLM 4248)   ;  Def open file limit
 (defconstant SYI$_PQL_MFILLM 4249)   ;  Min "
 (defconstant SYI$_PQL_DPGFLQUOTA 4250)   ;  Def paging file quota
 (defconstant SYI$_PQL_MPGFLQUOTA 4251)   ;  Min "
 (defconstant SYI$_PQL_DPRCLM 4252)   ;  Def sub-process limit
 (defconstant SYI$_PQL_MPRCLM 4253)   ;  Min "
 (defconstant SYI$_PQL_DTQELM 4254)   ;  Def timer queue entry limit
 (defconstant SYI$_PQL_MTQELM 4255)   ;  Min "
 (defconstant SYI$_PQL_DWSDEFAULT 4256)   ;  Def working set default size
 (defconstant SYI$_PQL_MWSDEFAULT 4257)   ;  Min "
 (defconstant SYI$_PQL_DWSQUOTA 4258)   ;  Def working set quota
 (defconstant SYI$_PQL_MWSQUOTA 4259)   ;  Min "
 (defconstant SYI$_PQL_DWSEXTENT 4260)   ;  Def working set extent
 (defconstant SYI$_PQL_MWSEXTENT 4261)   ;  Min "
 (defconstant SYI$_PQL_DENQLM 4262)   ;  Def enqueue limit
 (defconstant SYI$_PQL_MENQLM 4263)   ;  Min "
 (defconstant SYI$_ACP_MAPCACHE 4264)   ;  Number of blocks in bitmap cache
 (defconstant SYI$_ACP_HDRCACHE 4265)   ;  Number of blocks in file header cache
 (defconstant SYI$_ACP_DIRCACHE 4266)   ;  Number of blocks in directory cache
 (defconstant SYI$_ACP_WORKSET 4267)   ;  ACP working set
 (defconstant SYI$_ACP_FIDCACHE 4268)   ;  Number of cached index file slots
 (defconstant SYI$_ACP_EXTCACHE 4269)   ;  Number of cached disk extents
 (defconstant SYI$_ACP_EXTLIMIT 4270)   ;  Max fraction of disk to cache
 (defconstant SYI$_ACP_QUOCACHE 4271)   ;  Number of file quota entries to cache
 (defconstant SYI$_ACP_SYSACC 4272)   ;  Default access for system volumes
 (defconstant SYI$_ACP_MAXREAD 4273)   ;  Max number of direct blks to read
 (defconstant SYI$_ACP_WINDOW 4274)   ;  Default window size for system volumes
 (defconstant SYI$_ACP_WRITEBACK 4275)   ;  Deferred cache writeback enable
 (defconstant SYI$_ACP_DATACHECK 4276)   ;  ACP datacheck enable flags
 (defconstant SYI$_ACP_BASEPRIO 4277)   ;  ACP base priority
 (defconstant SYI$_ACP_SWAPFLGS 4278)   ;  ACP swap flags
 (defconstant SYI$_DEFPRI 4279)   ;  Default priority for Job Initiations
 (defconstant SYI$_IJOBLIM 4280)   ;  Limit for interactive jobs
 (defconstant SYI$_BJOBLIM 4281)   ;  Limit for batch jobs
 (defconstant SYI$_NJOBLIM 4282)   ;  Limit for network jobs
 (defconstant SYI$_RJOBLIM 4283)   ;  Limit for remote terminal jobs
 (defconstant SYI$_QUORUM 4284)   ;  Connection manager cluster QUORUM
 (defconstant SYI$_VOTES 4285)   ;  Connection manager VOTES from this system
 (defconstant SYI$_RECNXINTERVAL 4286)   ;  Connection manager reconnect interval
 (defconstant SYI$_BOOTTIME 4287)   ;  64-bit abs. system time at system boot
 (defconstant SYI$_LOCKIDTBL_MAX 4288)   ;  Maximum size of lock ID table.
 (defconstant SYI$_TAILORED 4289)   ;  Is this system tailored?
 (defconstant SYI$_STARTUP_P1 4290)   ;  Parameters for passing information
 (defconstant SYI$_STARTUP_P2 4291)   ;  to system startup procedure.
 (defconstant SYI$_STARTUP_P3 4292)
 (defconstant SYI$_STARTUP_P4 4293)
 (defconstant SYI$_STARTUP_P5 4294)
 (defconstant SYI$_STARTUP_P6 4295)
 (defconstant SYI$_STARTUP_P7 4296)
 (defconstant SYI$_STARTUP_P8 4297)
 (defconstant SYI$_CLUSTER_NODES 4298)   ;  total number of nodes in cluster
 (defconstant SYI$_CLUSTER_VOTES 4299)   ;   "     "     "  votes "   "
 (defconstant SYI$_CLUSTER_QUORUM 4300)   ;   "     quorum in cluster
 (defconstant SYI$_CLUSTER_FSYSID 4301)   ;  founding systemid
 (defconstant SYI$_CLUSTER_FTIME 4302)   ;  founding boottime
 (defconstant SYI$_CLUSTER_MEMBER 4303)   ;  true if in a live cluster
 (defconstant SYI$_NODE_CSID 4304)   ;  cluster system id of target node
 (defconstant SYI$_NODE_VOTES 4305)   ;  votes of target node
 (defconstant SYI$_NODE_QUORUM 4306)   ;  quorum of "      "
 (defconstant SYI$_NODE_SYSTEMID 4307)   ;  systemid of "    "
 (defconstant SYI$_NODE_SWINCARN 4308)   ;  S/W incarnation of "     "
 (defconstant SYI$_NODE_SWTYPE 4309)   ;  S/W type of  "     "
 (defconstant SYI$_NODE_SWVERS 4310)   ;  S/W version of "   "
 (defconstant SYI$_NODE_HWTYPE 4311)   ;  H/W type of    "   "
 (defconstant SYI$_NODE_HWVERS 4312)   ;  H/W version of "   "
 (defconstant SYI$_NODENAME 4313)   ;  SCS nodename of "    "
 (defconstant SYI$_ARCHFLAG 4314)   ;  Flags used by uVAX code
 (defconstant SYI$_SCS_EXISTS 4315)   ;  Flag to indicate presence of SCS
 (defconstant SYI$_DISK_QUORUM 4316)   ;  Cluster quorum device name (in ASCII)
 (defconstant SYI$_XSID 4317)   ;  Extended System Identification Register
;;; Used to be DISK_QUORUM3. Unused for now.
;;; Used to be DISK_QUORUM4. Unused for now.
 (defconstant SYI$_PAMAXPORT 4320)   ;  Max PA port to poll
 (defconstant SYI$_PASANITY 4321)   ;  PA sanity timer enable/disable switch
 (defconstant SYI$_DEFQUEPRI 4322)   ;  Default Que Priority
 (defconstant SYI$_MAXQUEPRI 4323)   ;  Max Que Priority
 (defconstant SYI$_QDSKINTERVAL 4324)   ;  Disk Quorum Interval
 (defconstant SYI$_ALLOCLASS 4325)   ;  Allocation class
 (defconstant SYI$_LGI_RETRY_LIM 4326)   ;  Login retry limit
 (defconstant SYI$_LGI_RETRY_TMO 4327)   ;  Login retry timeout
 (defconstant SYI$_LGI_BRK_LIM 4328)   ;  Login failure limit
 (defconstant SYI$_LGI_BRK_TMO 4329)   ;  Login suspect timeout
 (defconstant SYI$_LGI_HID_TIM 4330)   ;  Login evasive action time
 (defconstant SYI$_LGI_PWD_TMO 4331)   ;  System password drop dead time
 (defconstant SYI$_PQL_DJTQUOTA 4332)   ;  Default Job-wide Logical Name Table Creation Quota
 (defconstant SYI$_PQL_MJTQUOTA 4333)   ;  Minimum Job-wide Logical Name Table Creation Quota
 (defconstant SYI$_VAXCLUSTER 4334)   ;  VAXcluster participation
 (defconstant SYI$_LOCKDIRWT 4335)   ;  Lock manager directory system weight
 (defconstant SYI$_QDSKVOTES 4336)   ;  Votes held by quorum disk
 (defconstant SYI$_DORMANTWAIT 4337)   ;  When low pri COM proc becomes dormant
 (defconstant SYI$_PAGEFILE_PAGE 4338)   ;  Total pagefile pages
 (defconstant SYI$_SWAPFILE_PAGE 4339)   ;  Total swapfile pages
 (defconstant SYI$_PAGEFILE_FREE 4340)   ;  Free pagefile pages
 (defconstant SYI$_SWAPFILE_FREE 4341)   ;  Free swapfile pages
 (defconstant SYI$_TTY_TIMEOUT 4342)   ;  Seconds for virtual terminal timeout
 (defconstant SYI$_TTY_AUTOCHAR 4343)   ;  autobaud recognition character
 (defconstant SYI$_PANOPOLL 4344)   ;  Disable/enable CI port polling
 (defconstant SYI$_PE1 4345)   ;  Reserved TO PEDRIVER (DYNAMIC)
 (defconstant SYI$_PE2 4346)   ;  "
 (defconstant SYI$_PE3 4347)   ;  "
 (defconstant SYI$_PE4 4348)   ;  "
 (defconstant SYI$_PE5 4349)   ;  Reserved TO PEDRIVER (STATIC)
 (defconstant SYI$_PE6 4350)   ;  "
 (defconstant SYI$_RMS_GBLBUFQUO 4351)   ;  RMS global buffer quota
 (defconstant SYI$_RMS_DFNBC 4352)   ;  " " network block count
 (defconstant SYI$_ACP_DINDXCACHE 4353)   ;  File system directory index cache blocks
 (defconstant SYI$_MAXATTACHPRI 4354)   ;  Maximum scheduling prio for ASMP attached processor
 (defconstant SYI$_SMP_CPUS 4355)   ;  Number of CPUs to boot in SMP system
 (defconstant SYI$_SMP_CPUSH 4356)   ;  Hi Number of CPUs to boot in SMP system
 (defconstant SYI$_FALLBACK_MODE 4357)   ;  Cluster fallback mode
 (defconstant SYI$_MPW_LOWAITLIMIT 4358)   ;  Modified page writer lower busy wait limit
 (defconstant SYI$_MPW_IOLIMIT 4359)   ;  Modified page writer max concurrent I/O count
 (defconstant SYI$_S0_PAGING 4360)   ;  System space paging flags
 (defconstant SYI$_HW_MODEL 4361)   ;  VAX model number (from SB$B_HWVERS)
 (defconstant SYI$_HW_NAME 4362)   ;  VAX model name from #/name trans. table
 (defconstant SYI$_SCH_CTLFLAGS 4363)   ;  CPU scheduling control flags
 (defconstant SYI$_NODE_EVOTES 4364)   ;  Votes expected by target node
 (defconstant SYI$_CLUSTER_EVOTES 4365)   ;  Number of expected votes in cluster
 (defconstant SYI$_MULTIPROCESSING 4366)   ;  Multiprocessor participation
 (defconstant SYI$_FREE_GBLPAGES 4367)   ;  Total, free global pages
 (defconstant SYI$_CONTIG_GBLPAGES 4368)   ;  Maximum, contiguous free global pages
 (defconstant SYI$_FREE_GBLSECTS 4369)   ;  Total, free global sections
 (defconstant SYI$_EXPECTED_VOTES 4370)   ;  Expected votes
 (defconstant SYI$_PU_OPTIONS 4371)   ;  Select PUDRIVER load options
 (defconstant SYI$_WPTTE_SIZE 4372)   ;  # Watchpoint Trace Table Entries
 (defconstant SYI$_WPRE_SIZE 4373)   ;  Watchpoint Restore Entry size 
 (defconstant SYI$_SMP_SANITY_CNT 4374)   ;  # SMP Sanity events bef. timeout
 (defconstant SYI$_SMP_TICK_CNT 4375)   ;  Clock ticks between SMP sanity time cycles
 (defconstant SYI$_QBUS_MULT_INTR 4376)   ;  uVAX/QBUS multi-level interrupt enable flag
 (defconstant SYI$_RIGHTSLIST 4377)   ;  System rights segment descriptor
 (defconstant SYI$_SMP_SPINWAIT 4378)   ;  SMP normal busywait timeout
 (defconstant SYI$_SMP_LNGSPINWAIT 4379)   ;  SMP LONG busywait timeout
 (defconstant SYI$_TIME_CONTROL 4380)   ;  Time-related control functions
 (defconstant SYI$_AVAILCPU_CNT 4381)   ;  Number of CPUs in this machine
 (defconstant SYI$_ACTIVECPU_CNT 4382)   ;  Number of CPUs up and running
;;; Used to be LAVC_CONV_BOOT. Unused now.
;;; Used to be LAVC_LOAD_PEA0. Unused now.
;;; Used to be LAVC_PORT_SERV. Unused now.
 (defconstant SYI$_MSCP_LOAD 4386)   ;  Load MSCP server at boot time
 (defconstant SYI$_MSCP_SERVE_ALL 4387)   ;  Serve all disks
 (defconstant SYI$_POOLCHECK 4388)   ;  Pool debugging in MEMORYALC.MAR
 (defconstant SYI$_TAPE_MVTIMEOUT 4389)   ;  Magtape mount verification
 (defconstant SYI$_PSEUDOLOA 4390)   ;  Pseudoloa image size for tape boot
 (defconstant SYI$_MINCLASSPRI 4391)   ;  Min. priority for class scheduling 
 (defconstant SYI$_MAXCLASSPRI 4392)   ;  Max. priority for class scheduling 
 (defconstant SYI$_MINPRPRI 4393)   ;  Min. priority for preemptive-resume scheduling 
 (defconstant SYI$_AUTOCONFIG_ALGO 4394)   ;  Selects which algorithmn SYSGEN uses to autoconfigure.
 (defconstant SYI$_ERRORLOGBUFFERS 4395)   ;  Number of buffers for error logging
 (defconstant SYI$_JOBCTLD 4396)   ;  Dynamic SYSGEN flag to handle job controller diagnostics and Rolling upgrade.
 (defconstant SYI$_WINDOW_SYSTEM 4397)   ;  Default windowing system for workstation
 (defconstant SYI$_MSCP_BUFFER 4398)   ;  Pages allocated to server local pool
 (defconstant SYI$_MSCP_CREDITS 4399)   ;  Number of send credits extended by server
 (defconstant SYI$_BREAKPOINTS 4400)   ;  Mask of INI$BRK callers in exec used in this boot
 (defconstant SYI$_CLOCK_INTERVAL 4401)   ;  Time  (in usec) between interval timer clock interrupts
 (defconstant SYI$_DUMPSTYLE 4402)   ;  Mask specifying desired format of dump file (full dump or subset dump)
 (defconstant SYI$_NISCS_PORT_SERV 4403)   ;  Port services flag
 (defconstant SYI$_RSRVPAGCNT 4404)   ;  No. of pagefile pages to escrow
 (defconstant SYI$_VECTOR_PROC 4405)   ;  Load vector processing
 (defconstant SYI$_VECTOR_MARGIN 4406)   ;  Vector margin
 (defconstant SYI$_AFFINITY_SKIP 4407)   ;  Affinity skip count
 (defconstant SYI$_AFFINITY_TIME 4408)   ;  Affinity queue time
;;; Reserved for future use
;;; Reserved for future use
;;; Reserved for future use
 (defconstant SYI$_USED_GBLPAGCNT 4412)   ;  Current count of global pages in use
 (defconstant SYI$_USED_GBLPAGMAX 4413)   ;  Maximum count of global pages in use
 (defconstant SYI$_USED_GBLSECTCNT 4414)   ;  Current count of global sections in use
 (defconstant SYI$_USED_GBLSECTMAX 4415)   ;  Maximum count of global sections in use
 (defconstant SYI$_ERLBUFFERPAGES 4416)   ;  Pages in each ERL Buffer
 (defconstant SYI$_TAPE_ALLOCLASS 4417)   ;  Tape Allocation class
;;;	ADD 'EXE' ITEM-CODES ONLY JUST BEFORE THIS COMMENT ***********
 (defconstant SYI$_LASTEXE 4418)   ;  LAST INDEX 
;;;  ) equals SYI$C_EXETYPE@12 increment 1  prefix SYI tag $;
;;;	The following item-codes are for 'sub-field data' items.
;;;	There usually exists another item-code to retrieve the
;;;	whole parent cell (longword) - in the EXE section above.
 (defconstant SYI$_CPU 8192)   ;  CPU type
 (defconstant SYI$_BUGREBOOT 8193)   ;  Bugcheck reboot enable
 (defconstant SYI$_CRDENABLE 8194)   ;  Memory error checking enable
 (defconstant SYI$_DUMPBUG 8195)   ;  Bugcheck dump enable
 (defconstant SYI$_BUGCHECKFATAL 8196)   ;  All bugchecks become fatal
 (defconstant SYI$_ACP_MULTIPLE 8197)   ;  New ACP for each disk class
 (defconstant SYI$_NOAUTOCONFIG 8198)   ;  Auto configuration inhibit
 (defconstant SYI$_NOCLOCK 8199)   ;  Interval timer inhibit
 (defconstant SYI$_NOCLUSTER 8200)   ;  Page read clustering inhibit
 (defconstant SYI$_POOLPAGING 8201)   ;  Enable paging of paged pool
 (defconstant SYI$_SBIERRENABLE 8202)   ;  SBI error detection enable
 (defconstant SYI$_SETTIME 8203)   ;  Force entry of time at system boot
 (defconstant SYI$_ACP_SHARE 8204)   ;  Enable sharing of F11ACP
 (defconstant SYI$_SYSPAGING 8205)   ;  Enable paging of system code
 (defconstant SYI$_UAFALTERNATE 8206)   ;  Select alternate authorization file
 (defconstant SYI$_WRITABLESYS 8207)   ;  Leave system writable for debugging
 (defconstant SYI$_RESALLOC 8208)   ;  Enable resource allocation checking
 (defconstant SYI$_SSINHIBIT 8209)   ;  Inhibit system services for processes
 (defconstant SYI$_CONCEAL_DEVICES 8210)   ;  Enable concealed devices
 (defconstant SYI$_SAVEDUMP 8211)   ;  Save dump if it's in page file
 (defconstant SYI$_MOUNTMSG 8212)   ;  Enable oper notification of vol mounts
 (defconstant SYI$_DISMOUMSG 8213)   ;  Enable oper notification of vol dism
 (defconstant SYI$_LOADERAPT 8214)   ;  Load alt erase pattern generator
 (defconstant SYI$_LOADCHKPRT 8215)   ;  Load alt protection check routine
 (defconstant SYI$_XCPU 8216)   ;  CPU subtype (Extended SID info)
 (defconstant SYI$_CJFLOAD 8217)   ;  Load common journaling code
 (defconstant SYI$_CJFSYSRUJ 8218)   ;  Load recovery unit journaling code
 (defconstant SYI$_NODE_AREA 8219)   ;  System ID node area
 (defconstant SYI$_NODE_NUMBER 8220)   ;  System ID node number
 (defconstant SYI$_CLASS_PROT 8221)   ;  Non-discretionary check flag
 (defconstant SYI$_CHARACTER_EMULATED 8222)   ;  Character string instructions emulated
 (defconstant SYI$_DECIMAL_EMULATED 8223)   ;  Decimal string instructions emulated
 (defconstant SYI$_D_FLOAT_EMULATED 8224)   ;  D floating instructions emulated
 (defconstant SYI$_F_FLOAT_EMULATED 8225)   ;  F floating instructions emulated           
 (defconstant SYI$_G_FLOAT_EMULATED 8226)   ;  G floating instructions emulated
 (defconstant SYI$_H_FLOAT_EMULATED 8227)   ;  H floating instructions emulated
 (defconstant SYI$_LOADMTACCESS 8228)   ;  Load installation specific access routine
 (defconstant SYI$_ACP_XQP_RES 8229)   ;  Resident XQP
 (defconstant SYI$_WRITESYSPARAMS 8230)   ;  Write active parameters to the system .PAR file
 (defconstant SYI$_LGI_BRK_TERM 8231)   ;  Use term name in breakin detection
 (defconstant SYI$_LGI_BRK_DISUSER 8232)   ;  Disable user account on breakin
 (defconstant SYI$_ACP_REBLDSYSD 8233)   ;  Rebuild system disk when mounting it
 (defconstant SYI$_WS_OPA0 8234)   ;  Workstation using QVSS for OPA0
 (defconstant SYI$_NOPGFLSWP 8235)   ;  Inhibit swapping into pagefiles
 (defconstant SYI$_SHADOWING 8236)   ;  Load Volume Shadowing code (DSDRIVER)
 (defconstant SYI$_LOAD_SYS_IMAGES 8237)   ;  Load System Images
 (defconstant SYI$_NISCS_CONV_BOOT 8238)   ;  Allow remote conversational boot
 (defconstant SYI$_NISCS_LOAD_PEA0 8239)   ;  Load NI-SCS driver for PEA0
 (defconstant SYI$_SA_APP 8240)   ;  Booting stand-alone application (SA-BACKUP)
;;;	ADD 'FLD' ITEM-CODES ONLY JUST BEFORE THIS COMMENT ***********
 (defconstant SYI$_LASTFLD 8241)   ;  LAST INDEX 
;;;  ) equals SYI$C_FLDTYPE@12 increment 1  prefix SYI tag $;
;;;****************************************************************************
;;;*
;;;*	THE FOLLOWING DEFINITIONS EXIST FOR COMPATIBILITY WITH THE 1ST
;;;*	IMPLEMENTATION OF SYS$GETSYI.  DO NOT CHANGE THEM!!!
;;;*	ADD NEW GETSYI ITEM-CODES ONLY TO THE PREVIOUS LISTS.
;;;*
;;;****************************************************************************
 (defconstant SYI$C_SFWTYPE 1)   ;  SYSTEM SOFTWARE ITEM 
 (defconstant SYI$C_HDWTYPE 2)   ;  HARDWARE ITEM 
 (defconstant SYI$C_LISTEND 0)   ;  ITMLST TERMINATOR 
;;; IDENTIFIER FOR SYSTEM SOFTWARE 
 (defconstant SYI$_OLDVERSION 256)   ;  VMS VERSION NUMBER 
 (defconstant SYI$_LASTSFW 257)   ;  LAST INDEX 
;;; *******************************************************************
;;; ********************* BEGIN TEMP FIX ******************************
;;; ********************* BEGIN TEMP FIX ******************************
;;; *******************************************************************
;;;  ) equals SYI$C_SFWTYPE@8 increment 1  prefix SYI tag $;
;;; *******************************************************************
;;; ********************** END TEMP FIX *******************************
;;; ********************** END TEMP FIX *******************************
;;; *******************************************************************
;;; IDENTIFIER FOR HARDWARE TYPE 
 (defconstant SYI$_OLDCPU 512)   ;  CPU TYPE 
 (defconstant SYI$_OLDSID 513)   ;  SYSTEM ID REGISTER 
 (defconstant SYI$_LASTHDW 514)   ;  LAST INDEX 
;;;    ) equals SYI$C_HDWTYPE@8 increment 1  prefix SYI tag $;
 
;;;*** MODULE $TPADEF ***
      
;;;
;;; TPARSE CONTROL BLOCK. THIS BLOCK IS ONE OF THE ARGUMENTS USED TO CALL TPARSE,
;;; AND BECOMES THE ARGUMENT LIST TO ACTION ROUTINES.
;;;
 (defconstant TPA$K_COUNT0 8)   ;  ZERO LEVEL VALUE IS 8 
 (defconstant TPA$M_BLANKS #b00000000000000000000000000000001)
 (defconstant TPA$M_ABBREV #b00000000000000000000000000000010)
 (defconstant TPA$M_ABBRFM #b00000000000000000000000000000100)
 (defconstant TPA$M_AMBIG #b00000000000000010000000000000000)
 (defconstant TPA$K_LENGTH0 36)   ;  LENGTH OF ZERO LEVEL PARAMETER BLOCK 
 (defconstant TPA$C_LENGTH0 36)   ;  LENGTH OF ZERO LEVEL PARAMETER BLOCK 
            
(define-alien-structure (TPA    ( :conc-name nil))
    ; ARGUMENT COUNT (NUMBER OF LONGWORDS) 
  (TPA$L_COUNT :unsigned-integer 0 4)
    ; OPTIONS LONGWORD 
    (TPA$L_OPTIONS :unsigned-integer 4 8)
    ; PROCESS BLANKS AND TABS EXPLICITLY 
      (TPA$V_BLANKS :unsigned-integer #.(+ 4 0/8) #.(+ 4 1/8)) 
    ; ALLOW MINIMAL ABBREVIATION 
      (TPA$V_ABBREV :unsigned-integer #.(+ 4 1/8) #.(+ 4 2/8)) 
    ; ALLOW FIRST MATCH ABBREVIATION 
      (TPA$V_ABBRFM :unsigned-integer #.(+ 4 2/8) #.(+ 4 3/8)) 
      (TPADEF$$_FILL_1 :unsigned-integer #.(+ 4 3/8) #.(+ 4 16/8)) 
    ; AMBIGUOUS KEYWORD AT THIS STATE 
      (TPA$V_AMBIG :unsigned-integer #.(+ 4 16/8) #.(+ 4 17/8)) 
      (TPA$V_fill_0 :unsigned-integer #.(+ 4 17/8) #.(+ 4 24/8)) 
      (TPADEF$$_FILL_2 :signed-integer 4 5 :occurs 3)
    ; MINIMUM ABBREVIATION ON KEYWORDS 
      (TPA$B_MCOUNT :unsigned-integer 7 8)
    ; BYTE COUNT OF STRING BEING PARSED 
  (TPA$L_STRINGCNT :unsigned-integer 8 12)
    ; ADDRESS OF STRING BEING PARSED 
  (TPA$L_STRINGPTR :pointer 12 16)
    ; BYTE COUNT OF CURRENT MATCHING TOKEN 
  (TPA$L_TOKENCNT :unsigned-integer 16 20)
    ; ADDRESS OF MATCHING TOKEN 
  (TPA$L_TOKENPTR :pointer 20 24)
    ; ASCII CODE OF SINGLE CHARACTER TOKEN 
    (TPA$L_CHAR :unsigned-integer 24 28)
    ; BYTE FORM OF SINGLE CHAR CELL 
    (TPA$B_CHAR :unsigned-integer 24 25)
    ; NUMERIC VALUE OF NUMERIC TOKEN 
  (TPA$L_NUMBER :unsigned-integer 28 32)
    ; PARAMETER LONGWORD FROM STATE TABLE 
  (TPA$L_PARAM :unsigned-integer 32 36))    ; PARAMETER LONGWORD FROM STATE TABLE 
      
 
;;;*** MODULE $TRMDEF ***
      
;;;
;;; Define symbols for the item list QIO format
;;;
;;; Item list type codes
 (defconstant TRM$_MODIFIERS 0)
 (defconstant TRM$_EDITMODE 1)
 (defconstant TRM$_TIMEOUT 2)
 (defconstant TRM$_TERM 3)
 (defconstant TRM$_PROMPT 4)
 (defconstant TRM$_INISTRNG 5)
 (defconstant TRM$_PICSTRNG 6)
 (defconstant TRM$_FILLCHR 7)
 (defconstant TRM$_INIOFFSET 8)
 (defconstant TRM$_ALTECHSTR 9)
 (defconstant TRM$_ESCTRMOVR 10)
 (defconstant TRM$_LASTITM 11)   ;  must remain the last item
;;;
;;; Editmode type codes
;;;
 (defconstant TRM$K_EM_DEFAULT 0)
 (defconstant TRM$K_EM_RDVERIFY 1)
 (defconstant TRM$M_TM_NOECHO #b00000000000000000000000001000000)
 (defconstant TRM$M_TM_TIMED #b00000000000000000000000010000000)
 (defconstant TRM$M_TM_CVTLOW #b00000000000000000000000100000000)
 (defconstant TRM$M_TM_NOFILTR #b00000000000000000000001000000000)
 (defconstant TRM$M_TM_DSABLMBX #b00000000000000000000010000000000)
 (defconstant TRM$M_TM_PURGE #b00000000000000000000100000000000)
 (defconstant TRM$M_TM_TRMNOECHO #b00000000000000000001000000000000)
 (defconstant TRM$M_TM_REFRESH #b00000000000000000010000000000000)
 (defconstant TRM$M_TM_ESCAPE #b00000000000000000100000000000000)
 (defconstant TRM$M_TM_NOEDIT #b00000000000000001000000000000000)
 (defconstant TRM$M_TM_NORECALL #b00000000000000010000000000000000)
 (defconstant TRM$M_TM_R_JUST #b00000000000000100000000000000000)
 (defconstant TRM$M_TM_AUTO_TAB #b00000000000001000000000000000000)
 (defconstant TRM$M_CV_UPPER #b00000000000000000000000000000001)
 (defconstant TRM$M_CV_LOWER #b00000000000000000000000000000010)
 (defconstant TRM$M_CV_NUMERIC #b00000000000000000000000000000100)
 (defconstant TRM$M_CV_NUMPUNC #b00000000000000000000000000001000)
 (defconstant TRM$M_CV_PRINTABLE #b00000000000000000000000000010000)
 (defconstant TRM$M_CV_ANY #b00000000000000000000000000100000)
            
(define-alien-structure (TRM    ( :conc-name nil))
    ;FUNCTION CODE 
    (TRMDEF$$_FILL_1 :unsigned-integer #.(+ 0 0/8) #.(+ 0 6/8)) 
    ;NOECHO 
    (TRM$V_TM_NOECHO :unsigned-integer #.(+ 0 6/8) #.(+ 0 7/8)) 
    ;TIMED 
    (TRM$V_TM_TIMED :unsigned-integer #.(+ 0 7/8) #.(+ 0 8/8)) 
    ;CONVERT LOWER CASE 
    (TRM$V_TM_CVTLOW :unsigned-integer #.(+ 0 8/8) #.(+ 0 9/8)) 
    ;NO FILTER 
    (TRM$V_TM_NOFILTR :unsigned-integer #.(+ 0 9/8) #.(+ 0 10/8)) 
    ;DISABLE MAILBOX 
    (TRM$V_TM_DSABLMBX :unsigned-integer #.(+ 0 10/8) #.(+ 0 11/8)) 
    ;PURGE TYPEAHEAD 
    (TRM$V_TM_PURGE :unsigned-integer #.(+ 0 11/8) #.(+ 0 12/8)) 
    ;TERMINATORS ARE NOT ECHOED 
    (TRM$V_TM_TRMNOECHO :unsigned-integer #.(+ 0 12/8) #.(+ 0 13/8)) 
    ;Control-R interrupted read n
    (TRM$V_TM_REFRESH :unsigned-integer #.(+ 0 13/8) #.(+ 0 14/8)) 
    ;TERMINATE READ ON ESCAPE SEQUENCE 
    (TRM$V_TM_ESCAPE :unsigned-integer #.(+ 0 14/8) #.(+ 0 15/8)) 
    ;DISABLE ADVANCED EDITING
    (TRM$V_TM_NOEDIT :unsigned-integer #.(+ 0 15/8) #.(+ 0 16/8)) 
    ;Disable the recall feature of advanced editing
    (TRM$V_TM_NORECALL :unsigned-integer #.(+ 0 16/8) #.(+ 0 17/8)) 
    ;Right justification
    (TRM$V_TM_R_JUST :unsigned-integer #.(+ 0 17/8) #.(+ 0 18/8)) 
    ;Auto tab field
    (TRM$V_TM_AUTO_TAB :unsigned-integer #.(+ 0 18/8) #.(+ 0 19/8)) 
    (TRM$V_fill_1 :unsigned-integer #.(+ 0 19/8) #.(+ 0 24/8)) 
    ; picture string mask
    ; upper case
    (TRM$V_CV_UPPER :unsigned-integer #.(+ 0 0/8) #.(+ 0 1/8)) 
    ; lower case
    (TRM$V_CV_LOWER :unsigned-integer #.(+ 0 1/8) #.(+ 0 2/8)) 
    ; numeric (0-9)
    (TRM$V_CV_NUMERIC :unsigned-integer #.(+ 0 2/8) #.(+ 0 3/8)) 
    ; numeric punctuation (+ - .)
    (TRM$V_CV_NUMPUNC :unsigned-integer #.(+ 0 3/8) #.(+ 0 4/8)) 
    ; printable character
    (TRM$V_CV_PRINTABLE :unsigned-integer #.(+ 0 4/8) #.(+ 0 5/8)) 
    ; any character
    (TRM$V_CV_ANY :unsigned-integer #.(+ 0 5/8) #.(+ 0 6/8)) 
    (TRM$V_fill_2 :unsigned-integer #.(+ 0 6/8) #.(+ 0 8/8)) )
      
 
;;;*** MODULE $TTDEF ***
      
;;;
;;; DEFINE TERMINAL SPECIAL SYMBOLS
;;;
 (defconstant TT$C_BAUD_50 1)
 (defconstant TT$C_BAUD_75 2)
 (defconstant TT$C_BAUD_110 3)
 (defconstant TT$C_BAUD_134 4)
 (defconstant TT$C_BAUD_150 5)
 (defconstant TT$C_BAUD_300 6)
 (defconstant TT$C_BAUD_600 7)
 (defconstant TT$C_BAUD_1200 8)
 (defconstant TT$C_BAUD_1800 9)
 (defconstant TT$C_BAUD_2000 10)
 (defconstant TT$C_BAUD_2400 11)
 (defconstant TT$C_BAUD_3600 12)
 (defconstant TT$C_BAUD_4800 13)
 (defconstant TT$C_BAUD_7200 14)
 (defconstant TT$C_BAUD_9600 15)
 (defconstant TT$C_BAUD_19200 16)
 (defconstant TT$C_BAUD_38400 17)
;;; *** MATCHES DCDEF MACRO 
 (defconstant TT$_UNKNOWN 0)
 (defconstant TT$_VT05 1)   ;  VT05 
 (defconstant TT$_VK100 2)   ;  strange terminals 
 (defconstant TT$_VT173 3)
 (defconstant TT$_TQ_BTS 4)
 (defconstant TT$_TEK401X 10)
 (defconstant TT$_FT1 16)   ;  FOREIGN TERMINAL TYPES 
 (defconstant TT$_FT2 17)   ;  new support also includes
 (defconstant TT$_FT3 18)   ;  the negative numbers
 (defconstant TT$_FT4 19)
 (defconstant TT$_FT5 20)
 (defconstant TT$_FT6 21)
 (defconstant TT$_FT7 22)
 (defconstant TT$_FT8 23)   ;  END OF FOREIGN TYPES 
;;; RESERVE REST UP TO 32 FOR EXTENSIONS
 (defconstant TT$_LAX 32)
 (defconstant TT$_LA36 32)
 (defconstant TT$_LA120 33)
 (defconstant TT$_LA34 34)
 (defconstant TT$_LA38 35)
 (defconstant TT$_LA12 36)
 (defconstant TT$_LA100 37)
 (defconstant TT$_LA24 37)
 (defconstant TT$_LQP02 38)
 (defconstant TT$_LA84 39)
 (defconstant TT$_LA210 40)
 (defconstant TT$_LN03 41)
 (defconstant TT$_LN01K 42)
 (defconstant TT$_LA80 43)
 (defconstant TT$_VT5X 64)
 (defconstant TT$_VT52 64)
 (defconstant TT$_VT55 65)
 (defconstant TT$_VT100 96)   ;  VT100 
 (defconstant TT$_VT101 97)
 (defconstant TT$_VT102 98)
 (defconstant TT$_VT105 99)
 (defconstant TT$_VT125 100)
 (defconstant TT$_VT131 101)
 (defconstant TT$_VT132 102)
 (defconstant TT$_VT80 103)
 (defconstant TT$_VT200_Series 110)
 (defconstant TT$_Pro_Series 111)
 (defconstant TT$_VT300_Series 112)
;;; from 128 on is reserved for foreign terminals and must not be 
;;; used for terminal definitions
 (defconstant TT$M_PASSALL #b00000000000000000000000000000001)
 (defconstant TT$M_NOECHO #b00000000000000000000000000000010)
 (defconstant TT$M_NOTYPEAHD #b00000000000000000000000000000100)
 (defconstant TT$M_ESCAPE #b00000000000000000000000000001000)
 (defconstant TT$M_HOSTSYNC #b00000000000000000000000000010000)
 (defconstant TT$M_TTSYNC #b00000000000000000000000000100000)
 (defconstant TT$M_SCRIPT #b00000000000000000000000001000000)
 (defconstant TT$M_LOWER #b00000000000000000000000010000000)
 (defconstant TT$M_MECHTAB #b00000000000000000000000100000000)
 (defconstant TT$M_WRAP #b00000000000000000000001000000000)
 (defconstant TT$M_CRFILL #b00000000000000000000010000000000)
 (defconstant TT$M_LFFILL #b00000000000000000000100000000000)
 (defconstant TT$M_SCOPE #b00000000000000000001000000000000)
 (defconstant TT$M_REMOTE #b00000000000000000010000000000000)
 (defconstant TT$M_RESERVED #b00000000000000000100000000000000)
 (defconstant TT$M_EIGHTBIT #b00000000000000001000000000000000)
 (defconstant TT$M_MBXDSABL #b00000000000000010000000000000000)
 (defconstant TT$M_NOBRDCST #b00000000000000100000000000000000)
 (defconstant TT$M_READSYNC #b00000000000001000000000000000000)
 (defconstant TT$M_MECHFORM #b00000000000010000000000000000000)
 (defconstant TT$M_HALFDUP #b00000000000100000000000000000000)
 (defconstant TT$M_MODEM #b00000000001000000000000000000000)
 (defconstant TT$M_OPER #b00000000010000000000000000000000)
 (defconstant TT$M_PAGE #b11111111000000000000000000000000)
 (defconstant TT$M_ALTFRAME #b00000000000000000000000000010000)
 (defconstant TT$M_ALTRPAR #b00000000000000000000000000100000)
 (defconstant TT$M_PARITY #b00000000000000000000000001000000)
 (defconstant TT$M_ODD #b00000000000000000000000010000000)
 (defconstant TT$M_TWOSTOP #b00000000000000000000000100000000)
 (defconstant TT$M_DISPARERR #b00000000000000000000001000000000)
 (defconstant TT$M_ALTDISPAR #b00000000000000000000010000000000)
 (defconstant TT$M_BREAK #b00000000000000000000100000000000)
 (defconstant TT$M_DS_DTR #b00000000000000000000000000000010)
 (defconstant TT$M_DS_SECTX #b00000000000000000000000000001000)
 (defconstant TT$M_DS_RTS #b00000000000000000000000000010000)
 (defconstant TT$M_DS_SECREC #b00000000000000000000000000001000)
 (defconstant TT$M_DS_CTS #b00000000000000000000000000010000)
 (defconstant TT$M_DS_CARRIER #b00000000000000000000000000100000)
 (defconstant TT$M_DS_RING #b00000000000000000000000001000000)
 (defconstant TT$M_DS_DSR #b00000000000000000000000010000000)
            
(define-alien-structure (TT    ( :conc-name nil))
    (TT$V_PASSALL :unsigned-integer #.(+ 0 0/8) #.(+ 0 1/8)) 
    (TT$V_NOECHO :unsigned-integer #.(+ 0 1/8) #.(+ 0 2/8)) 
    (TT$V_NOTYPEAHD :unsigned-integer #.(+ 0 2/8) #.(+ 0 3/8)) 
    (TT$V_ESCAPE :unsigned-integer #.(+ 0 3/8) #.(+ 0 4/8)) 
    (TT$V_HOSTSYNC :unsigned-integer #.(+ 0 4/8) #.(+ 0 5/8)) 
    (TT$V_TTSYNC :unsigned-integer #.(+ 0 5/8) #.(+ 0 6/8)) 
    (TT$V_SCRIPT :unsigned-integer #.(+ 0 6/8) #.(+ 0 7/8)) 
    (TT$V_LOWER :unsigned-integer #.(+ 0 7/8) #.(+ 0 8/8)) 
    (TT$V_MECHTAB :unsigned-integer #.(+ 0 8/8) #.(+ 0 9/8)) 
    (TT$V_WRAP :unsigned-integer #.(+ 0 9/8) #.(+ 0 10/8)) 
    (TT$V_CRFILL :unsigned-integer #.(+ 0 10/8) #.(+ 0 11/8)) 
    (TT$V_LFFILL :unsigned-integer #.(+ 0 11/8) #.(+ 0 12/8)) 
    (TT$V_SCOPE :unsigned-integer #.(+ 0 12/8) #.(+ 0 13/8)) 
    (TT$V_REMOTE :unsigned-integer #.(+ 0 13/8) #.(+ 0 14/8)) 
    (TT$V_RESERVED :unsigned-integer #.(+ 0 14/8) #.(+ 0 15/8)) 
    (TT$V_EIGHTBIT :unsigned-integer #.(+ 0 15/8) #.(+ 0 16/8)) 
    (TT$V_MBXDSABL :unsigned-integer #.(+ 0 16/8) #.(+ 0 17/8)) 
    (TT$V_NOBRDCST :unsigned-integer #.(+ 0 17/8) #.(+ 0 18/8)) 
    (TT$V_READSYNC :unsigned-integer #.(+ 0 18/8) #.(+ 0 19/8)) 
    (TT$V_MECHFORM :unsigned-integer #.(+ 0 19/8) #.(+ 0 20/8)) 
    (TT$V_HALFDUP :unsigned-integer #.(+ 0 20/8) #.(+ 0 21/8)) 
    (TT$V_MODEM :unsigned-integer #.(+ 0 21/8) #.(+ 0 22/8)) 
    (TT$V_OPER :unsigned-integer #.(+ 0 22/8) #.(+ 0 23/8)) 
    (TTDEF$$_FILL_1 :unsigned-integer #.(+ 0 23/8) #.(+ 0 24/8)) 
    (TT$V_PAGE :unsigned-integer #.(+ 0 24/8) #.(+ 0 32/8)) 
    (TTDEF$$_FILL_2 :unsigned-integer #.(+ 0 0/8) #.(+ 0 4/8)) 
    (TT$V_ALTFRAME :unsigned-integer #.(+ 0 4/8) #.(+ 0 5/8)) 
    (TT$V_ALTRPAR :unsigned-integer #.(+ 0 5/8) #.(+ 0 6/8)) 
    (TT$V_PARITY :unsigned-integer #.(+ 0 6/8) #.(+ 0 7/8)) 
    (TT$V_ODD :unsigned-integer #.(+ 0 7/8) #.(+ 0 8/8)) 
    (TT$V_TWOSTOP :unsigned-integer #.(+ 0 8/8) #.(+ 0 9/8)) 
    (TT$V_DISPARERR :unsigned-integer #.(+ 0 9/8) #.(+ 0 10/8)) 
    (TT$V_ALTDISPAR :unsigned-integer #.(+ 0 10/8) #.(+ 0 11/8)) 
    (TT$V_BREAK :unsigned-integer #.(+ 0 11/8) #.(+ 0 12/8)) 
    (TT$V_fill_3 :unsigned-integer #.(+ 0 12/8) #.(+ 0 16/8)) 
    (TTDEF$$_FILL_3 :unsigned-integer #.(+ 0 0/8) #.(+ 0 1/8)) 
    ;OUTPUT MODEM CONTROL 
    (TT$V_DS_DTR :unsigned-integer #.(+ 0 1/8) #.(+ 0 2/8)) 
    (TTDEF$$_FILL_4 :unsigned-integer #.(+ 0 2/8) #.(+ 0 3/8)) 
    (TT$V_DS_SECTX :unsigned-integer #.(+ 0 3/8) #.(+ 0 4/8)) 
    (TT$V_DS_RTS :unsigned-integer #.(+ 0 4/8) #.(+ 0 5/8)) 
    (TT$V_fill_4 :unsigned-integer #.(+ 0 5/8) #.(+ 0 8/8)) 
    (TTDEF$$_FILL_5 :unsigned-integer #.(+ 0 0/8) #.(+ 0 3/8)) 
    (TT$V_DS_SECREC :unsigned-integer #.(+ 0 3/8) #.(+ 0 4/8)) 
    (TT$V_DS_CTS :unsigned-integer #.(+ 0 4/8) #.(+ 0 5/8)) 
    (TT$V_DS_CARRIER :unsigned-integer #.(+ 0 5/8) #.(+ 0 6/8)) 
    (TT$V_DS_RING :unsigned-integer #.(+ 0 6/8) #.(+ 0 7/8)) 
    (TT$V_DS_DSR :unsigned-integer #.(+ 0 7/8) #.(+ 0 8/8)) )
      
 
;;;*** MODULE $TT2DEF ***
      
 (defconstant TT2$M_LOCALECHO #b00000000000000000000000000000001)
 (defconstant TT2$M_AUTOBAUD #b00000000000000000000000000000010)
 (defconstant TT2$M_HANGUP #b00000000000000000000000000000100)
 (defconstant TT2$M_MODHANGUP #b00000000000000000000000000001000)
 (defconstant TT2$M_BRDCSTMBX #b00000000000000000000000000010000)
 (defconstant TT2$M_XON #b00000000000000000000000000100000)
 (defconstant TT2$M_DMA #b00000000000000000000000001000000)
 (defconstant TT2$M_ALTYPEAHD #b00000000000000000000000010000000)
 (defconstant TT2$M_SETSPEED #b00000000000000000000000100000000)
 (defconstant TT2$M_DCL_MAILBX #b00000000000000000000001000000000)
 (defconstant TT2$M_DCL_OUTBND #b00000000000000000000010000000000)
 (defconstant TT2$M_DCL_CTRLC #b00000000000000000000100000000000)
 (defconstant TT2$M_EDITING #b00000000000000000001000000000000)
 (defconstant TT2$M_INSERT #b00000000000000000010000000000000)
 (defconstant TT2$M_FALLBACK #b00000000000000000100000000000000)
 (defconstant TT2$M_DIALUP #b00000000000000001000000000000000)
 (defconstant TT2$M_SECURE #b00000000000000010000000000000000)
 (defconstant TT2$M_DISCONNECT #b00000000000000100000000000000000)
 (defconstant TT2$M_PASTHRU #b00000000000001000000000000000000)
 (defconstant TT2$M_SYSPWD #b00000000000010000000000000000000)
 (defconstant TT2$M_SIXEL #b00000000000100000000000000000000)
 (defconstant TT2$M_DRCS #b00000000001000000000000000000000)
 (defconstant TT2$M_PRINTER #b00000000010000000000000000000000)
 (defconstant TT2$M_APP_KEYPAD #b00000000100000000000000000000000)
 (defconstant TT2$M_ANSICRT #b00000001000000000000000000000000)
 (defconstant TT2$M_REGIS #b00000010000000000000000000000000)
 (defconstant TT2$M_BLOCK #b00000100000000000000000000000000)
 (defconstant TT2$M_AVO #b00001000000000000000000000000000)
 (defconstant TT2$M_EDIT #b00010000000000000000000000000000)
 (defconstant TT2$M_DECCRT #b00100000000000000000000000000000)
 (defconstant TT2$M_DECCRT2 #b01000000000000000000000000000000)
 (defconstant TT2$M_DECCRT3 #b10000000000000000000000000000000)
            
(define-alien-structure (TT2    ( :conc-name nil))
    (TT2$V_LOCALECHO :unsigned-integer #.(+ 0 0/8) #.(+ 0 1/8)) 
    (TT2$V_AUTOBAUD :unsigned-integer #.(+ 0 1/8) #.(+ 0 2/8)) 
    (TT2$V_HANGUP :unsigned-integer #.(+ 0 2/8) #.(+ 0 3/8)) 
    (TT2$V_MODHANGUP :unsigned-integer #.(+ 0 3/8) #.(+ 0 4/8)) 
    (TT2$V_BRDCSTMBX :unsigned-integer #.(+ 0 4/8) #.(+ 0 5/8)) 
    (TT2$V_XON :unsigned-integer #.(+ 0 5/8) #.(+ 0 6/8)) 
    (TT2$V_DMA :unsigned-integer #.(+ 0 6/8) #.(+ 0 7/8)) 
    (TT2$V_ALTYPEAHD :unsigned-integer #.(+ 0 7/8) #.(+ 0 8/8)) 
    (TT2$V_SETSPEED :unsigned-integer #.(+ 0 8/8) #.(+ 0 9/8)) 
    ; TEMP DEFINITIONS FOR DCL SPAWN 
    (TT2$V_DCL_MAILBX :unsigned-integer #.(+ 0 9/8) #.(+ 0 10/8)) 
    (TT2$V_DCL_OUTBND :unsigned-integer #.(+ 0 10/8) #.(+ 0 11/8)) 
    (TT2$V_DCL_CTRLC :unsigned-integer #.(+ 0 11/8) #.(+ 0 12/8)) 
    ; enable advanced editing
    (TT2$V_EDITING :unsigned-integer #.(+ 0 12/8) #.(+ 0 13/8)) 
    ; INPUT EDITING INSTER DEFAULT
    (TT2$V_INSERT :unsigned-integer #.(+ 0 13/8) #.(+ 0 14/8)) 
    ; USE MULTINATIONAL FALLBACK
    (TT2$V_FALLBACK :unsigned-integer #.(+ 0 14/8) #.(+ 0 15/8)) 
    ; TERMINAL IS CONNECTED TO DIALUP
    (TT2$V_DIALUP :unsigned-integer #.(+ 0 15/8) #.(+ 0 16/8)) 
    ; RECOGNIZE SECURE SERVER
    (TT2$V_SECURE :unsigned-integer #.(+ 0 16/8) #.(+ 0 17/8)) 
    ; TERMINAL CAN BE DISCONNECTED
    (TT2$V_DISCONNECT :unsigned-integer #.(+ 0 17/8) #.(+ 0 18/8)) 
    ; passall with flowcontrol
    (TT2$V_PASTHRU :unsigned-integer #.(+ 0 18/8) #.(+ 0 19/8)) 
    ; System password required
    (TT2$V_SYSPWD :unsigned-integer #.(+ 0 19/8) #.(+ 0 20/8)) 
    ; SIXEL SUPPORTED
    (TT2$V_SIXEL :unsigned-integer #.(+ 0 20/8) #.(+ 0 21/8)) 
    ; 
    (TT2$V_DRCS :unsigned-integer #.(+ 0 21/8) #.(+ 0 22/8)) 
    ; PRINTER PORT AVAILABLE
    (TT2$V_PRINTER :unsigned-integer #.(+ 0 22/8) #.(+ 0 23/8)) 
    ; Keypad in applicationis mode
    (TT2$V_APP_KEYPAD :unsigned-integer #.(+ 0 23/8) #.(+ 0 24/8)) 
    ; ANSI, REGIS, BLOCK and AVO 
    (TT2$V_ANSICRT :unsigned-integer #.(+ 0 24/8) #.(+ 0 25/8)) 
    ; must be contiguous for SCRPKG. 
    (TT2$V_REGIS :unsigned-integer #.(+ 0 25/8) #.(+ 0 26/8)) 
    (TT2$V_BLOCK :unsigned-integer #.(+ 0 26/8) #.(+ 0 27/8)) 
    (TT2$V_AVO :unsigned-integer #.(+ 0 27/8) #.(+ 0 28/8)) 
    (TT2$V_EDIT :unsigned-integer #.(+ 0 28/8) #.(+ 0 29/8)) 
    (TT2$V_DECCRT :unsigned-integer #.(+ 0 29/8) #.(+ 0 30/8)) 
    ; DECCRT level 2
    (TT2$V_DECCRT2 :unsigned-integer #.(+ 0 30/8) #.(+ 0 31/8)) 
    ; DECCRT level 3
    (TT2$V_DECCRT3 :unsigned-integer #.(+ 0 31/8) #.(+ 0 32/8)) )    ; DECCRT level 3
      
 
;;;*** MODULE $TT3DEF ***
      
 
;;;*** MODULE $UAIDEF ***
      
;;;+
;;;
;;; Get User Authorization Information Data Identifier Definitions
;;;
;;; **** NOTE ****
;;;
;;;        New items must always be added to the END of each item list
;;;        so that users will not have to relink.
;;;-
 (defconstant UAI$_RTYPE 1)   ;  UAF record type
 (defconstant UAI$_VERSION 2)   ;  UAF format version
 (defconstant UAI$_USRDATOFF 3)   ;  offset of counted string of user data
 (defconstant UAI$_USERNAME 4)   ;  username
 (defconstant UAI$_USERNAME_TAG 5)   ;  tag to differentiate records
 (defconstant UAI$_UIC 6)   ;  user ID code
 (defconstant UAI$_MEM 7)   ;  member subfield
 (defconstant UAI$_GRP 8)   ;  group subfield
 (defconstant UAI$_SUB_ID 9)   ;  user sub-identifier
 (defconstant UAI$_PARENT_ID 10)   ;  identifier of owner of this account
 (defconstant UAI$_ACCOUNT 11)   ;  account name
 (defconstant UAI$_OWNER 12)   ;  owner's name
 (defconstant UAI$_DEFDEV 13)   ;  default device
 (defconstant UAI$_DEFDIR 14)   ;  default directory
 (defconstant UAI$_LGICMD 15)   ;  login command file
 (defconstant UAI$_DEFCLI 16)   ;  default command interpreter
 (defconstant UAI$_CLITABLES 17)   ;  user CLI tables
 (defconstant UAI$_PWD 18)   ;  hashed password
 (defconstant UAI$_PWD2 19)   ;  second password
 (defconstant UAI$_LOGFAILS 20)   ;  count of login failures
 (defconstant UAI$_SALT 21)   ;  random password salt
 (defconstant UAI$_ENCRYPT 22)   ;  encryption algorithm
 (defconstant UAI$_ENCRYPT2 23)   ;  encryption algorithm for 2nd pwd
 (defconstant UAI$_PWD_LENGTH 24)   ;  minimum password length
 (defconstant UAI$_EXPIRATION 25)   ;  expiration date for account
 (defconstant UAI$_PWD_LIFETIME 26)   ;  password lifetime
 (defconstant UAI$_PWD_DATE 27)   ;  date of password change
 (defconstant UAI$_PWD2_DATE 28)   ;  date of 2nd password change
 (defconstant UAI$_LASTLOGIN_I 29)   ;  date of last interactive login
 (defconstant UAI$_LASTLOGIN_N 30)   ;  date of last non-interactive login
 (defconstant UAI$_PRIV 31)   ;  process privilege vector
 (defconstant UAI$_DEF_PRIV 32)   ;  default process privileges
 (defconstant UAI$_MIN_CLASS 33)   ;  minimum security class
 (defconstant UAI$_MAX_CLASS 34)   ;  maximum security class
 (defconstant UAI$_FLAGS 35)   ;  user flags longword
 (defconstant UAI$_NETWORK_ACCESS_P 36)   ;  hourly network access, primary
 (defconstant UAI$_NETWORK_ACCESS_S 37)   ;  hourly network access, secondary
 (defconstant UAI$_BATCH_ACCESS_P 38)   ;  hourly batch access, primary
 (defconstant UAI$_BATCH_ACCESS_S 39)   ;  hourly batch access, secondary
 (defconstant UAI$_LOCAL_ACCESS_P 40)   ;  hourly local access, primary
 (defconstant UAI$_LOCAL_ACCESS_S 41)   ;  hourly local access, secondary
 (defconstant UAI$_DIALUP_ACCESS_P 42)   ;  hourly dialup access, primary
 (defconstant UAI$_DIALUP_ACCESS_S 43)   ;  hourly dialup access, secondary
 (defconstant UAI$_REMOTE_ACCESS_P 44)   ;  hourly remote access, primary
 (defconstant UAI$_REMOTE_ACCESS_S 45)   ;  hourly remote access, secondary
 (defconstant UAI$_PRIMEDAYS 46)   ;  bits representing primary days
 (defconstant UAI$_PRI 47)   ;  base process priority
 (defconstant UAI$_QUEPRI 48)   ;  maximum job queuing priority
 (defconstant UAI$_MAXJOBS 49)   ;  maximum jobs for UIC allowed
 (defconstant UAI$_MAXACCTJOBS 50)   ;  maximum jobs for account allowed
 (defconstant UAI$_MAXDETACH 51)   ;  maximum detached processes for UIC
 (defconstant UAI$_PRCCNT 52)   ;  subprocess creation limit
 (defconstant UAI$_BIOLM 53)   ;  buffered I/O limit
 (defconstant UAI$_DIOLM 54)   ;  direct I/O limit
 (defconstant UAI$_TQCNT 55)   ;  timer queue entry limit
 (defconstant UAI$_ASTLM 56)   ;  AST queue limit
 (defconstant UAI$_ENQLM 57)   ;  enqueue limit
 (defconstant UAI$_FILLM 58)   ;  open file limit
 (defconstant UAI$_SHRFILLM 59)   ;  shared file limit
 (defconstant UAI$_WSQUOTA 60)   ;  working set size quota
 (defconstant UAI$_DFWSCNT 61)   ;  default working set size
 (defconstant UAI$_WSEXTENT 62)   ;  working set size limit
 (defconstant UAI$_PGFLQUOTA 63)   ;  page file quota
 (defconstant UAI$_CPUTIM 64)   ;  CPU time quota
 (defconstant UAI$_BYTLM 65)   ;  buffered I/O byte count limit
 (defconstant UAI$_PBYTLM 66)   ;  paged buffer I/O byte count limit
 (defconstant UAI$_JTQUOTA 67)   ;  job-wide logical name table creation quota
 (defconstant UAI$_PROXY_LIM 68)   ;  number of proxies user can grant
 (defconstant UAI$_PROXIES 69)   ;  number of proxies granted
 (defconstant UAI$_ACCOUNT_LIM 70)   ;  number of sub-accounts allowed
 (defconstant UAI$_ACCOUNTS 71)   ;  number of sub-accounts in use
 (defconstant UAI$_USER_DATA 72)   ;  user data area
 (defconstant UAI$_PASSWORD 73)   ;  plaintext primary password
 (defconstant UAI$_PASSWORD2 74)   ;  plaintext secondary password
;;; ADD ITEM-CODES BEFORE THIS COMMENT
 (defconstant UAI$_MAX_ITEM_CODE 75)   ;  maximum legal item code + 1
;;; Define the various encryption codes, returned by the encryption algorithm
;;; item.
 (defconstant UAI$C_AD_II 0)   ;  AUTODIN-II 32 bit crc code
 (defconstant UAI$C_PURDY 1)   ;  Purdy polynomial over salted input
 (defconstant UAI$C_PURDY_V 2)   ;  Purdy polynomial + variable length username
;;; Define the flags for the user flags longword.
 (defconstant UAI$M_DISCTLY #b00000000000000000000000000000001)
 (defconstant UAI$M_DEFCLI #b00000000000000000000000000000010)
 (defconstant UAI$M_LOCKPWD #b00000000000000000000000000000100)
 (defconstant UAI$M_RESTRICTED #b00000000000000000000000000001000)
 (defconstant UAI$M_DISACNT #b00000000000000000000000000010000)
 (defconstant UAI$M_DISWELCOM #b00000000000000000000000000100000)
 (defconstant UAI$M_DISMAIL #b00000000000000000000000001000000)
 (defconstant UAI$M_NOMAIL #b00000000000000000000000010000000)
 (defconstant UAI$M_GENPWD #b00000000000000000000000100000000)
 (defconstant UAI$M_PWD_EXPIRED #b00000000000000000000001000000000)
 (defconstant UAI$M_PWD2_EXPIRED #b00000000000000000000010000000000)
 (defconstant UAI$M_AUDIT #b00000000000000000000100000000000)
 (defconstant UAI$M_DISREPORT #b00000000000000000001000000000000)
 (defconstant UAI$M_DISRECONNECT #b00000000000000000010000000000000)
 (defconstant UAI$M_AUTOLOGIN #b00000000000000000100000000000000)
 (defconstant UAI$M_DISFORCE_PWD_CHANGE #b00000000000000001000000000000000)
 (defconstant UAI$M_CAPTIVE #b00000000000000010000000000000000)
 (defconstant UAI$M_DISIMAGE #b00000000000000100000000000000000)
            
(define-alien-structure (FLAGS ( :conc-name nil))
    ; no user control-y
  (UAI$V_DISCTLY :unsigned-integer #.(+ 0 0/8) #.(+ 0 1/8)) 
    ; only allow user default CLI
  (UAI$V_DEFCLI :unsigned-integer #.(+ 0 1/8) #.(+ 0 2/8)) 
    ; disable SET PASSWORD command
  (UAI$V_LOCKPWD :unsigned-integer #.(+ 0 2/8) #.(+ 0 3/8)) 
    ; restricted account (pre-V5.2 CAPTIVE)
  (UAI$V_RESTRICTED :unsigned-integer #.(+ 0 3/8) #.(+ 0 4/8)) 
    ; no interactive login
  (UAI$V_DISACNT :unsigned-integer #.(+ 0 4/8) #.(+ 0 5/8)) 
    ; skip welcome message
  (UAI$V_DISWELCOM :unsigned-integer #.(+ 0 5/8) #.(+ 0 6/8)) 
    ; skip new mail message
  (UAI$V_DISMAIL :unsigned-integer #.(+ 0 6/8) #.(+ 0 7/8)) 
    ; disable mail delivery
  (UAI$V_NOMAIL :unsigned-integer #.(+ 0 7/8) #.(+ 0 8/8)) 
    ; passwords must be generated
  (UAI$V_GENPWD :unsigned-integer #.(+ 0 8/8) #.(+ 0 9/8)) 
    ; password has expired
  (UAI$V_PWD_EXPIRED :unsigned-integer #.(+ 0 9/8) #.(+ 0 10/8)) 
    ; 2nd password has expired
  (UAI$V_PWD2_EXPIRED :unsigned-integer #.(+ 0 10/8) #.(+ 0 11/8)) 
    ; audit all actions
  (UAI$V_AUDIT :unsigned-integer #.(+ 0 11/8) #.(+ 0 12/8)) 
    ; skip last login messages
  (UAI$V_DISREPORT :unsigned-integer #.(+ 0 12/8) #.(+ 0 13/8)) 
    ; inhibit reconnections
  (UAI$V_DISRECONNECT :unsigned-integer #.(+ 0 13/8) #.(+ 0 14/8)) 
    ; auto-login only
  (UAI$V_AUTOLOGIN :unsigned-integer #.(+ 0 14/8) #.(+ 0 15/8)) 
    ; disable forced password change
  (UAI$V_DISFORCE_PWD_CHANGE :unsigned-integer #.(+ 0 15/8) #.(+ 0 16/8)) 
    ; captive account (no overrides)
  (UAI$V_CAPTIVE :unsigned-integer #.(+ 0 16/8) #.(+ 0 17/8)) 
    ; disable arbitrary image activation
  (UAI$V_DISIMAGE :unsigned-integer #.(+ 0 17/8) #.(+ 0 18/8)) 
  (UAI$V_fill_5 :unsigned-integer #.(+ 0 18/8) #.(+ 0 24/8)) )
      
;;; Define the flags representing primary days.
            
(define-alien-structure (PRIMEDAYS ( :conc-name nil))
    ; bit clear means this is a primary day
  (UAI$V_MONDAY :unsigned-integer #.(+ 0 0/8) #.(+ 0 1/8)) 
    ; bit set means this is an off day
  (UAI$V_TUESDAY :unsigned-integer #.(+ 0 1/8) #.(+ 0 2/8)) 
  (UAI$V_WEDNESDAY :unsigned-integer #.(+ 0 2/8) #.(+ 0 3/8)) 
  (UAI$V_THURSDAY :unsigned-integer #.(+ 0 3/8) #.(+ 0 4/8)) 
  (UAI$V_FRIDAY :unsigned-integer #.(+ 0 4/8) #.(+ 0 5/8)) 
  (UAI$V_SATURDAY :unsigned-integer #.(+ 0 5/8) #.(+ 0 6/8)) 
  (UAI$V_SUNDAY :unsigned-integer #.(+ 0 6/8) #.(+ 0 7/8)) 
  (UAI$V_fill_6 :unsigned-integer #.(+ 0 7/8) #.(+ 0 8/8)) )
      
 
;;;*** MODULE $UICDEF ***
      
;;;+
;;;
;;; Format of UIC - user identification code. May be either two part
;;; group / member identifier, or a single uniform identifier.
;;;
;;;-
 (defconstant UIC$K_MAX_UIC 1073741823)   ;  Highest possible UIC
 (defconstant UIC$K_WILD_MEMBER 65535)   ;  Code for wild card member
 (defconstant UIC$K_WILD_GROUP 16383)   ;  Code for wild card group
 (defconstant UIC$K_UIC_FORMAT 0)   ;  UIC format code
 (defconstant UIC$K_ID_FORMAT 2)   ;  ID format code
 (defconstant UIC$K_FIRST_ID -2147418112)   ;  First general identifier
 (defconstant UIC$K_LAST_ID -1879048193)   ;  Last general identifier
 (defconstant UIC$K_MATCH_ALL -1)   ;  Match all identifiers
            
(define-alien-structure (UIC    ( :conc-name nil))
    ; Full longword
  (UIC$L_UIC :unsigned-integer 0 4)
    ; Group / member format
    ; Member number
    (UIC$V_MEMBER :unsigned-integer #.(+ 0 0/8) #.(+ 0 16/8)) 
    ; Group number
    (UIC$V_GROUP :unsigned-integer #.(+ 0 16/8) #.(+ 0 30/8)) 
    ; Format code
    (UIC$V_FORMAT :unsigned-integer #.(+ 0 30/8) #.(+ 0 32/8)) 
    ; General identifier format
    ; ID code
    (UIC$V_ID_CODE :unsigned-integer #.(+ 0 0/8) #.(+ 0 28/8)) 
    ; Reserved ID bits
    (UIC$V_FILL_1 :unsigned-integer #.(+ 0 28/8) #.(+ 0 30/8)) 
    ; Dummy to cover format code
    (UIC$V_FILL_2 :unsigned-integer #.(+ 0 30/8) #.(+ 0 32/8)) )    ; Dummy to cover format code
      
 
;;;*** MODULE $USGDEF ***
      
;;;+
;;; Disk usage accounting file produced by ANALYZE/DISK_STRUCTURE utility.
;;;-
 (defconstant USG$K_IDENT 1)   ;  Identification record 
 (defconstant USG$K_FILE 2)   ;  File record 
 (defconstant USG$K_IDENT_LEN 61)   ;  Length of IDENT record 
 (defconstant USG$C_IDENT_LEN 61)   ;  Length of IDENT record 
            
(define-alien-structure (USG    ( :conc-name nil))
    ; Record type 
  (USG$B_TYPE :unsigned-integer 0 1)
    ; Pack serial number 
  (USG$L_SERIALNUM :unsigned-integer 1 5)
    ; Volume set name 
  (USG$T_STRUCNAME :string 5 17)
    ; Volume name 
  (USG$T_VOLNAME :string 17 29)
    ; Volume owner name 
  (USG$T_OWNERNAME :string 29 41)
    ; Volume format type 
  (USG$T_FORMAT :string 41 53)
    ; *** Preceding same as home block ***
    ; Time usage file created 
  (USG$Q_TIME :unsigned-integer 53 61))    ; Time usage file created 
      
;;; *** Preceding same as home block ***
 (defconstant USG$K_FILE_LEN 423)   ;  Maximum length of FILE record 
 (defconstant USG$C_FILE_LEN 423)   ;  Maximum length of FILE record 
            
(define-alien-structure (USG1    ( :conc-name nil))
  (USGDEF$$_FILL_1 :signed-integer 0 1)
    ; File owner UIC 
    (USG$L_FILEOWNER :unsigned-integer 1 5)
    ; UIC member number 
      (USG$W_UICMEMBER :unsigned-integer 1 3)
    ; UIC group number 
      (USG$W_UICGROUP :unsigned-integer 3 5)
    ; Blocks allocated, including headers 
  (USG$L_ALLOCATED :unsigned-integer 5 9)
    ; Blocks used 
  (USG$L_USED :unsigned-integer 9 13)
    ; Length of directory string 
  (USG$W_DIR_LEN :unsigned-integer 13 15)
    ; Length of complete file specification 
  (USG$W_SPEC_LEN :unsigned-integer 15 17)
    ; File spec "[dir]nam.typ;ver" 
  (USG$T_FILESPEC :string 17 423))    ; File spec "[dir]nam.typ;ver" 
      
 
;;;*** MODULE $USRIDEF ***
      
;;;
;;; User image bit definitions
;;;
;;;
 (defconstant USRI$M_DBG_MAPPED #b00000000000000000000000000000001)
            
(define-alien-structure (USRI    ( :conc-name nil))
    ; Debugger is now mapped
    (USRI$V_DBG_MAPPED :unsigned-integer #.(+ 0 0/8) #.(+ 0 1/8)) 
    (USRI$V_fill_7 :unsigned-integer #.(+ 0 1/8) #.(+ 0 8/8)) )
      
 
;;;*** MODULE $VPSRDEF ***
      
;;;+
;;; Vector Processor Status Register field definitions
;;;-
 (defconstant VPSR$M_VEN #b00000000000000000000000000000001)
 (defconstant VPSR$M_RST #b00000000000000000000000000000010)
 (defconstant VPSR$M_STS #b00000000000000000000000000000100)
 (defconstant VPSR$M_RLD #b00000000000000000000000000001000)
 (defconstant VPSR$M_MF #b00000000000000000000000000100000)
 (defconstant VPSR$M_PMF #b00000000000000000000000001000000)
 (defconstant VPSR$M_AEX #b00000000000000000000000010000000)
 (defconstant VPSR$M_IMP #b00000001000000000000000000000000)
 (defconstant VPSR$M_IVO #b00000010000000000000000000000000)
 (defconstant VPSR$M_BSY #b10000000000000000000000000000000)
            
(define-alien-structure (VPSR    ( :conc-name nil))
    ;Enabled
    (VPSR$V_VEN :unsigned-integer #.(+ 0 0/8) #.(+ 0 1/8)) 
    ;Reset
    (VPSR$V_RST :unsigned-integer #.(+ 0 1/8) #.(+ 0 2/8)) 
    ;State store
    (VPSR$V_STS :unsigned-integer #.(+ 0 2/8) #.(+ 0 3/8)) 
    ;State reload
    (VPSR$V_RLD :unsigned-integer #.(+ 0 3/8) #.(+ 0 4/8)) 
    ;Must be zero
    (VPSRDEF$$_FILL_1 :unsigned-integer #.(+ 0 4/8) #.(+ 0 5/8)) 
    ;Memory fault
    (VPSR$V_MF :unsigned-integer #.(+ 0 5/8) #.(+ 0 6/8)) 
    ;Pending memory fault
    (VPSR$V_PMF :unsigned-integer #.(+ 0 6/8) #.(+ 0 7/8)) 
    ;Arithmetic exception
    (VPSR$V_AEX :unsigned-integer #.(+ 0 7/8) #.(+ 0 8/8)) 
    ;Must be zero
    (VPSRDEF$$_FILL_2 :unsigned-integer #.(+ 0 8/8) #.(+ 0 24/8)) 
    ;Implementation-specific error
    (VPSR$V_IMP :unsigned-integer #.(+ 0 24/8) #.(+ 0 25/8)) 
    ;Illegal vector opcode
    (VPSR$V_IVO :unsigned-integer #.(+ 0 25/8) #.(+ 0 26/8)) 
    ;Must be zero
    (VPSRDEF$$_FILL_3 :unsigned-integer #.(+ 0 26/8) #.(+ 0 31/8)) 
    ;Busy
    (VPSR$V_BSY :unsigned-integer #.(+ 0 31/8) #.(+ 0 32/8)) )    ;Busy
      
 
;;;*** MODULE $VAERDEF ***
      
;;;+
;;; Vector Arithmetic Error Register longword mask and field definitions
;;;-
 (defconstant VAER$M_SUMMARY #b00000000000000001111111111111111)
 (defconstant VAER$M_F_UNDF #b00000000000000000000000000000001)
 (defconstant VAER$M_F_DIVZ #b00000000000000000000000000000010)
 (defconstant VAER$M_F_ROPR #b00000000000000000000000000000100)
 (defconstant VAER$M_F_OVFL #b00000000000000000000000000001000)
 (defconstant VAER$M_I_OVFL #b00000000000000000000000000100000)
 (defconstant VAER$M_REGISTER_MASK #b11111111111111110000000000000000)
            
(define-alien-structure (VAER    ( :conc-name nil))
      (VAER$V_SUMMARY :unsigned-integer #.(+ 0 0/8) #.(+ 0 16/8)) 
    ;Exception summary
    ;Floating underflow
        (VAER$V_F_UNDF :unsigned-integer #.(+ 0 0/8) #.(+ 0 1/8)) 
    ;Floating divide by zero
        (VAER$V_F_DIVZ :unsigned-integer #.(+ 0 1/8) #.(+ 0 2/8)) 
    ;Floating reserved operand
        (VAER$V_F_ROPR :unsigned-integer #.(+ 0 2/8) #.(+ 0 3/8)) 
    ;Floating overflow
        (VAER$V_F_OVFL :unsigned-integer #.(+ 0 3/8) #.(+ 0 4/8)) 
    ;Must be zero
        (VAERDEF$$_FILL_1 :unsigned-integer #.(+ 0 4/8) #.(+ 0 5/8)) 
    ;Integer overflow
        (VAER$V_I_OVFL :unsigned-integer #.(+ 0 5/8) #.(+ 0 6/8)) 
    ;Must be zero
        (VPSRDEF$$_FILL_2 :unsigned-integer #.(+ 0 6/8) #.(+ 0 16/8)) 
    ;Desination register mask	
    (VAER$V_REGISTER_MASK :unsigned-integer #.(+ 0 16/8) #.(+ 0 32/8)) )    ;Desination register mask	
      
 
;;;*** MODULE $XADEF ***
      
;;;+
;;; DR11-W DEFINITIONS FOR DEVICE SPECIFIC CHARACTERISTICS
;;;-                              
 (defconstant XA$M_DATAPATH #b00000000000000000000000000000001)
 (defconstant XA$M_LINK #b00000000000000000000000000000010)
            
(define-alien-structure (XA    ( :conc-name nil))
    ; USE BUFFERED DATAPATH 
    (XA$V_DATAPATH :unsigned-integer #.(+ 0 0/8) #.(+ 0 1/8)) 
    ; INTERPROCESSOR LINK MODE 
    (XA$V_LINK :unsigned-integer #.(+ 0 1/8) #.(+ 0 2/8)) 
    (XA$V_fill_8 :unsigned-integer #.(+ 0 2/8) #.(+ 0 8/8)) )
      
 
;;;*** MODULE $XFDEF ***
      
;;;+
;;;
;;; DR32 DEFINITIONS FOR COMMAND TABLE, PACKETS, AND CHARACTERISTICS
;;;
;;;-
;;;
;;; QIO COMMAND TABLE OFFSETS
;;;
 (defconstant XF$M_IOS_SUCCES #b00000000000000000000000000000001)
 (defconstant XF$M_IOS_CMDSTD #b00000000000000000000000000000010)
 (defconstant XF$M_IOS_INVPTE #b00000000000000000000000000000100)
 (defconstant XF$M_IOS_FREQPK #b00000000000000000000000000001000)
 (defconstant XF$M_IOS_DDIDIS #b00000000000000000000000000010000)
 (defconstant XF$M_IOS_SLFTST #b00000000000000000000000000100000)
 (defconstant XF$M_IOS_RNGERR #b00000000000000000000000001000000)
 (defconstant XF$M_IOS_UNQERR #b00000000000000000000000010000000)
 (defconstant XF$M_IOS_INVPKT #b00000000000000000000000100000000)
 (defconstant XF$M_IOS_FREQMT #b00000000000000000000001000000000)
 (defconstant XF$M_IOS_RNDENB #b00000000000000000000010000000000)
 (defconstant XF$M_IOS_INVDDI #b00000000000000000000100000000000)
 (defconstant XF$M_IOS_LENERR #b00000000000000000001000000000000)
 (defconstant XF$M_IOS_DRVABT #b00000000000000000010000000000000)
 (defconstant XF$M_IOS_PARERR #b00000000000000000100000000000000)
 (defconstant XF$M_IOS_BUSERR #b00001000000000000000000000000000)
 (defconstant XF$M_IOS_RDSERR #b00010000000000000000000000000000)
 (defconstant XF$M_IOS_WCSPE #b00100000000000000000000000000000)
 (defconstant XF$M_IOS_CIPE #b01000000000000000000000000000000)
 (defconstant XF$M_IOS_DIPE #b10000000000000000000000000000000)
 (defconstant XF$M_IOS_NEXREG #b00000000000000000000000000100000)
 (defconstant XF$M_IOS_LOG #b00000000000000000000000001000000)
 (defconstant XF$M_IOS_DDIERR #b00000000000000000000000010000000)
            
(define-alien-structure (XF    ( :conc-name nil))
    ; SUCCESS 
    (XF$V_IOS_SUCCES :unsigned-integer #.(+ 0 0/8) #.(+ 0 1/8)) 
    ; COMMAND STARTED 
    (XF$V_IOS_CMDSTD :unsigned-integer #.(+ 0 1/8) #.(+ 0 2/8)) 
    ; INVALID PTE 
    (XF$V_IOS_INVPTE :unsigned-integer #.(+ 0 2/8) #.(+ 0 3/8)) 
    ; FREE QUEUE PACKET 
    (XF$V_IOS_FREQPK :unsigned-integer #.(+ 0 3/8) #.(+ 0 4/8)) 
    ; DDI DISABLE 
    (XF$V_IOS_DDIDIS :unsigned-integer #.(+ 0 4/8) #.(+ 0 5/8)) 
    ; SELF TEST 
    (XF$V_IOS_SLFTST :unsigned-integer #.(+ 0 5/8) #.(+ 0 6/8)) 
    ; RANGE ERROR 
    (XF$V_IOS_RNGERR :unsigned-integer #.(+ 0 6/8) #.(+ 0 7/8)) 
    ; UNALIGNED QUEUE ERROR 
    (XF$V_IOS_UNQERR :unsigned-integer #.(+ 0 7/8) #.(+ 0 8/8)) 
    ; INVALID COMMAND PACKET 
    (XF$V_IOS_INVPKT :unsigned-integer #.(+ 0 8/8) #.(+ 0 9/8)) 
    ; FREE QUEUE EMPTY 
    (XF$V_IOS_FREQMT :unsigned-integer #.(+ 0 9/8) #.(+ 0 10/8)) 
    ; RANDOM ENABLE 
    (XF$V_IOS_RNDENB :unsigned-integer #.(+ 0 10/8) #.(+ 0 11/8)) 
    ; INVALID DDI COMMAND 
    (XF$V_IOS_INVDDI :unsigned-integer #.(+ 0 11/8) #.(+ 0 12/8)) 
    ; LENGTH ERROR 
    (XF$V_IOS_LENERR :unsigned-integer #.(+ 0 12/8) #.(+ 0 13/8)) 
    ; DRIVER ABORT 
    (XF$V_IOS_DRVABT :unsigned-integer #.(+ 0 13/8) #.(+ 0 14/8)) 
    ; PARITY ERROR (CI OR DI) 
    (XF$V_IOS_PARERR :unsigned-integer #.(+ 0 14/8) #.(+ 0 15/8)) 
    ; RESERVED 
    (XFDEF$$_FILL_7 :unsigned-integer #.(+ 0 15/8) #.(+ 0 16/8)) 
    ; DDI STATUS 
    (XF$V_IOS_DDISTS :unsigned-integer #.(+ 0 16/8) #.(+ 0 24/8)) 
    ; RESERVED 
    (XFDEF$$_FILL_8 :unsigned-integer #.(+ 0 24/8) #.(+ 0 27/8)) 
    ; BUS ERROR 
    (XF$V_IOS_BUSERR :unsigned-integer #.(+ 0 27/8) #.(+ 0 28/8)) 
    ; READ DATA SUBSTITUTE ERROR 
    (XF$V_IOS_RDSERR :unsigned-integer #.(+ 0 28/8) #.(+ 0 29/8)) 
    ; WCS PARITY ERROR 
    (XF$V_IOS_WCSPE :unsigned-integer #.(+ 0 29/8) #.(+ 0 30/8)) 
    ; CONTROL INTERCONNECT PARITY ERROR 
    (XF$V_IOS_CIPE :unsigned-integer #.(+ 0 30/8) #.(+ 0 31/8)) 
    ; DATA INTERCONNECT PARITY ERROR 
    (XF$V_IOS_DIPE :unsigned-integer #.(+ 0 31/8) #.(+ 0 32/8)) 
    ; SKIP OVER 5 BITS 
    (XFDEF$$_FILL_9 :unsigned-integer #.(+ 0 0/8) #.(+ 0 5/8)) 
    ; NON-EXISTENT REGISTER 
    (XF$V_IOS_NEXREG :unsigned-integer #.(+ 0 5/8) #.(+ 0 6/8)) 
    ; LOG 
    (XF$V_IOS_LOG :unsigned-integer #.(+ 0 6/8) #.(+ 0 7/8)) 
    ; ERROR ON FAR-END DEVICE 
    (XF$V_IOS_DDIERR :unsigned-integer #.(+ 0 7/8) #.(+ 0 8/8)) )    ; ERROR ON FAR-END DEVICE 
      
 (defconstant XF$M_CMT_SETRTE #b00000000000000000000000000000001)
 (defconstant XF$M_CMT_DIPEAB #b00000000000000000000000000000010)
 (defconstant XF$K_CMT_LENGTH 32)   ;  LENGTH OF COMMAND TABLE 
 (defconstant XF$C_CMT_LENGTH 32)   ;  LENGTH OF COMMAND TABLE 
;;;
            
(define-alien-structure (XF1    ( :conc-name nil))
    ; COMMAND BLOCK SIZE 
  (XF$L_CMT_CBLKSZ :unsigned-integer 0 4)
    ; COMMAND BLOCK ADDRESS 
  (XF$L_CMT_CBLKAD :pointer 4 8)
    ; BUFFER BLOCK SIZE 
  (XF$L_CMT_BBLKSZ :unsigned-integer 8 12)
    ; BUFFER BLOCK ADDRESS 
  (XF$L_CMT_BBLKAD :pointer 12 16)
    ; PACKET AST ADDRESS 
  (XF$L_CMT_PASTAD :pointer 16 20)
    ; PACKET AST ADDRESS 
  (XF$L_CMT_PASTPM :pointer 20 24)
    ; DATA RATE 
  (XF$B_CMT_RATE :unsigned-integer 24 25)
    ; FLAGS 
    (XF$B_CMT_FLAGS :unsigned-integer 25 26)
    ; SET DATA RATE 
      (XF$V_CMT_SETRTE :unsigned-integer #.(+ 25 0/8) #.(+ 25 1/8)) 
    ; DISABLE PARITY ERROR ABORT 
      (XF$V_CMT_DIPEAB :unsigned-integer #.(+ 25 1/8) #.(+ 25 2/8)) 
      (XF$V_fill_9 :unsigned-integer #.(+ 25 2/8) #.(+ 25 8/8)) 
    ; SPARE 
  (XFDEF$$_FILL_1 :signed-integer 26 28)
  (XF$L_CMT_GBITAD :pointer 28 32))    ; GO BIT ADDRESS 
    ;
      
;;; COMMAND PACKET OFFSETS
 (defconstant XF$K_PKT_RD 0)   ;  READ 
 (defconstant XF$K_PKT_RDCHN 1)   ;  READ CHAINED 
 (defconstant XF$K_PKT_WRT 2)   ;  WRITE 
 (defconstant XF$K_PKT_WRTCHN 3)   ;  WRITE CHAINED 
 (defconstant XF$K_PKT_WRTCM 4)   ;  WRITE CONTROL MESSAGE 
;;;  VALUE 5 IS RESERVED
 (defconstant XF$K_PKT_SETTST 6)   ;  SET SELF TEST 
 (defconstant XF$K_PKT_CLRTST 7)   ;  CLEAR SELF TEST 
 (defconstant XF$K_PKT_NOP 8)   ;  NOP 
 (defconstant XF$K_PKT_DIAGRI 9)   ;  DIAGNOSTIC READ INTERNAL 
 (defconstant XF$K_PKT_DIAGWI 10)   ;  DIAGNOSTIC WRITE INTERNAL 
 (defconstant XF$K_PKT_DIAGRD 11)   ;  DIAGNOSTIC READ DDI 
 (defconstant XF$K_PKT_DIAGWC 12)   ;  WRITE CONTROL MESSAGE 
 (defconstant XF$K_PKT_SETRND 13)   ;  SET RANDOM ENABLE 
 (defconstant XF$K_PKT_CLRRND 14)   ;  CLEAR RANDOM ENABLE 
 (defconstant XF$K_PKT_HALT 15)   ;  HALT 
 (defconstant XF$M_PKT_SLNERR #b00000000000000000000000000100000)
 (defconstant XF$K_PKT_NOTRAN 0)   ;  NO TRANSMISSION 
 (defconstant XF$K_PKT_CB 1)   ;  COMMAND BYTE ONLY 
 (defconstant XF$K_PKT_CBDM 2)   ;  COMMAND BYTE AND DEVICE MESSAGE 
 (defconstant XF$K_PKT_CBDMBC 3)   ;  CMD. BYTE, DEV. MSG, AND BYTE COUNT 
;;; VALUES FOR INTERRUPT CONTOL 
 (defconstant XF$K_PKT_UNCOND 0)   ;  UNCONDITIONAL INTERRUPT 
 (defconstant XF$K_PKT_TMQMT 1)   ;  INTERRUPT ON TERM. QUEUE EMPTY 
 (defconstant XF$K_PKT_NOINT 2)   ;  NO INTERRUPT 
 (defconstant XF$M_PKT_SUCCES #b00000000000000000000000000000001)
 (defconstant XF$M_PKT_CMDSTD #b00000000000000000000000000000010)
 (defconstant XF$M_PKT_INVPTE #b00000000000000000000000000000100)
 (defconstant XF$M_PKT_FREQPK #b00000000000000000000000000001000)
 (defconstant XF$M_PKT_DDIDIS #b00000000000000000000000000010000)
 (defconstant XF$M_PKT_SLFTST #b00000000000000000000000000100000)
 (defconstant XF$M_PKT_RNGERR #b00000000000000000000000001000000)
 (defconstant XF$M_PKT_UNQERR #b00000000000000000000000010000000)
 (defconstant XF$M_PKT_INVPKT #b00000000000000000000000100000000)
 (defconstant XF$M_PKT_FREQMT #b00000000000000000000001000000000)
 (defconstant XF$M_PKT_RNDENB #b00000000000000000000010000000000)
 (defconstant XF$M_PKT_INVDDI #b00000000000000000000100000000000)
 (defconstant XF$M_PKT_LENERR #b00000000000000000001000000000000)
 (defconstant XF$M_PKT_DRVABT #b00000000000000000010000000000000)
 (defconstant XF$M_PKT_PARERR #b00000000000000000100000000000000)
 (defconstant XF$M_PKT_NEXREG #b00000000000000000000000000100000)
 (defconstant XF$M_PKT_LOG #b00000000000000000000000001000000)
 (defconstant XF$M_PKT_DDIERR #b00000000000000000000000010000000)
            
(define-alien-structure (XF2    ( :conc-name nil))
    ; FORWARD LINK 
  (XF$L_PKT_FLINK :unsigned-integer 0 4)
    ; BACKWARD LINK 
  (XF$L_PKT_BLINK :unsigned-integer 4 8)
    ; LENGTH OF DEVICE MESSAGE AREA 
  (XF$B_PKT_MSGLEN :unsigned-integer 8 9)
    ; LENGTH OF LOG AREA 
  (XF$B_PKT_LOGLEN :unsigned-integer 9 10)
    ; COMMAND CONTROL 
    (XF$B_PKT_CMDCTL :unsigned-integer 10 11)
    ; FUNCTION CODE 
      (XF$V_PKT_FUNC :unsigned-integer #.(+ 10 0/8) #.(+ 10 4/8)) 
    ; MUST BE ZERO 
      (XFDEF$$_FILL_2 :unsigned-integer #.(+ 10 4/8) #.(+ 10 8/8)) 
    ; FUNCTION CODE VALUES 
    ; PACKET CONTROL 
    (XF$B_PKT_PKTCTL :unsigned-integer 11 12)
    ; UNUSED 
      (XFDEF$$_FILL_3 :unsigned-integer #.(+ 11 0/8) #.(+ 11 3/8)) 
    ; CONTROL INTERCONNECT SELECT 
      (XF$V_PKT_CISEL :unsigned-integer #.(+ 11 3/8) #.(+ 11 5/8)) 
    ; SUPPRESS LENGTH ERROR 
      (XF$V_PKT_SLNERR :unsigned-integer #.(+ 11 5/8) #.(+ 11 6/8)) 
    ; INTERRUPT CONTROL 
      (XF$V_PKT_INTCTL :unsigned-integer #.(+ 11 6/8) #.(+ 11 8/8)) 
    ; VALUES FOR CONTROL INTERCONNECT SELECT 
    ; BUFFER SIZE 
  (XF$L_PKT_BFRSIZ :unsigned-integer 12 16)
    ; BUFFER ADDRESS 
  (XF$L_PKT_BFRADR :pointer 16 20)
    ; RESIDUAL MEMORY BYTE COUNT 
  (XF$L_PKT_RMBCNT :unsigned-integer 20 24)
    ; RESIDUAL DDI BYTE COUNT 
  (XF$L_PKT_RDBCNT :unsigned-integer 24 28)
    ; DR32 STATUS LONGWORD 
    (XF$L_PKT_DSL :unsigned-integer 28 32)
    ; SUCCESS 
      (XF$V_PKT_SUCCES :unsigned-integer #.(+ 28 0/8) #.(+ 28 1/8)) 
    ; COMMAND STARTED 
      (XF$V_PKT_CMDSTD :unsigned-integer #.(+ 28 1/8) #.(+ 28 2/8)) 
    ; INVALID PTE 
      (XF$V_PKT_INVPTE :unsigned-integer #.(+ 28 2/8) #.(+ 28 3/8)) 
    ; FREE QUEUE PACKET 
      (XF$V_PKT_FREQPK :unsigned-integer #.(+ 28 3/8) #.(+ 28 4/8)) 
    ; DDI DISABLE 
      (XF$V_PKT_DDIDIS :unsigned-integer #.(+ 28 4/8) #.(+ 28 5/8)) 
    ; SELF TEST 
      (XF$V_PKT_SLFTST :unsigned-integer #.(+ 28 5/8) #.(+ 28 6/8)) 
    ; RANGE ERROR 
      (XF$V_PKT_RNGERR :unsigned-integer #.(+ 28 6/8) #.(+ 28 7/8)) 
    ; UNALIGNED QUEUE ERROR 
      (XF$V_PKT_UNQERR :unsigned-integer #.(+ 28 7/8) #.(+ 28 8/8)) 
    ; INVALID COMMAND PACKET 
      (XF$V_PKT_INVPKT :unsigned-integer #.(+ 28 8/8) #.(+ 28 9/8)) 
    ; FREE QUEUE EMPTY 
      (XF$V_PKT_FREQMT :unsigned-integer #.(+ 28 9/8) #.(+ 28 10/8)) 
    ; RANDOM ENABLE 
      (XF$V_PKT_RNDENB :unsigned-integer #.(+ 28 10/8) #.(+ 28 11/8)) 
    ; INVALID DDI COMMAND 
      (XF$V_PKT_INVDDI :unsigned-integer #.(+ 28 11/8) #.(+ 28 12/8)) 
    ; LENGTH ERROR 
      (XF$V_PKT_LENERR :unsigned-integer #.(+ 28 12/8) #.(+ 28 13/8)) 
    ; DRIVER ABORT 
      (XF$V_PKT_DRVABT :unsigned-integer #.(+ 28 13/8) #.(+ 28 14/8)) 
    ; PARITY ERROR 
      (XF$V_PKT_PARERR :unsigned-integer #.(+ 28 14/8) #.(+ 28 15/8)) 
    ; RESERVED 
      (XFDEF$$_FILL_4 :unsigned-integer #.(+ 28 15/8) #.(+ 28 16/8)) 
    ; DDI STATUS 
      (XF$V_PKT_DDISTS :unsigned-integer #.(+ 28 16/8) #.(+ 28 24/8)) 
    ; RESERVED 
      (XFDEF$$_FILL_5 :unsigned-integer #.(+ 28 24/8) #.(+ 28 32/8)) 
    ; SKIP OVER 5 BITS 
      (XFDEF$$_FILL_6 :unsigned-integer #.(+ 28 0/8) #.(+ 28 5/8)) 
    ; NON-EXISTENT REGISTER 
      (XF$V_PKT_NEXREG :unsigned-integer #.(+ 28 5/8) #.(+ 28 6/8)) 
    ; LOG 
      (XF$V_PKT_LOG :unsigned-integer #.(+ 28 6/8) #.(+ 28 7/8)) 
    ; ERROR ON FAR-END DEVICE 
      (XF$V_PKT_DDIERR :unsigned-integer #.(+ 28 7/8) #.(+ 28 8/8)) 
  (XF$B_PKT_DEVMSG :unsigned-integer 32 33))    ; START OF DEVICE MESSAGE 
    ;
      
;;;
;;; SECOND LONGWORD OF I/O STATUS BLOCK DEFINITIONS
 
;;;*** MODULE $XKSTSDEF ***
      
;;;
;;; DEFINITIONS FOR 3271 LINE STATUS BLOCK (RETURNED BY IO$_RDSTATS)
;;;
 (defconstant XKSTS$K_LSTR 0)   ;  OFFSET OF BEGINNING OF DATA AREA 
 (defconstant XKSTS$C_LSTR 0)   ;  OFFSET OF BEGINNING OF DATA AREA 
 (defconstant XKSTS$M_ACT #b00000000000000000000000000000001)
 (defconstant XKSTS$M_DGN #b00000000000000000000000000000010)
 (defconstant XKSTS$K_DSTR 45)   ;  LENGTH OF THE LINE STATUS BLOCK 
 (defconstant XKSTS$C_DSTR 45)   ;  LENGTH OF THE LINE STATUS BLOCK 
            
(define-alien-structure (XKSTS    ( :conc-name nil))
    ; CONTROL UNIT ADDRESS (HEX EBCDIC) 
  (XKSTS$B_CUAD :unsigned-integer 0 1)
    ; LINE STATUS 
    (XKSTS$W_LSTS :unsigned-integer 1 3)
    ; IF SET, LINE IS 'ON' (ACTIVE IN 3271 MODE) 
      (XKSTS$V_ACT :unsigned-integer #.(+ 1 0/8) #.(+ 1 1/8)) 
    ; IF SET, LINE IS EXECUTING A DIAGNOSTIC QIO 
      (XKSTS$V_DGN :unsigned-integer #.(+ 1 1/8) #.(+ 1 2/8)) 
      (XKSTS$V_fill_10 :unsigned-integer #.(+ 1 2/8) #.(+ 1 8/8)) 
    ; POOL SIZE 
  (XKSTS$B_PLSZ :unsigned-integer 3 4)
    ; MAXIMUM BLOCK TO BE RECEIVED FROM IBM 
  (XKSTS$W_BSIZ :unsigned-integer 4 6)
    ; ENQ THRESHOLD 
  (XKSTS$B_ECNT :unsigned-integer 6 7)
    ; NUMBER OF NAKS TRANSMITTED 
  (XKSTS$W_TNAK :unsigned-integer 7 9)
    ; NUMBER OF NAKS RECEIVED 
  (XKSTS$W_RNAK :unsigned-integer 9 11)
    ; NUMBER OF ENQS SENT 
  (XKSTS$W_TENQ :unsigned-integer 11 13)
    ; NUMBER OF ENQS RECEIVED 
  (XKSTS$W_RENQ :unsigned-integer 13 15)
    ; NUMBER OF RVIS TRANSMITTED 
  (XKSTS$W_TRVI :unsigned-integer 15 17)
    ; NUMBER OF RVIS RECEIVED 
  (XKSTS$W_RRVI :unsigned-integer 17 19)
    ; NUMBER OF CONVERSATIONAL MODE RESPONSES 
  (XKSTS$W_RCNV :unsigned-integer 19 21)
    ;  RECEIVED
    ; NUMBER OF CHAINED WRITES RECEIVED 
  (XKSTS$W_CHAI :unsigned-integer 21 23)
    ; NUMBER OF GENERAL POLLS RECEIVED 
  (XKSTS$W_GPOL :unsigned-integer 23 25)
    ; NUMBER OF INVALID ACKS RECEIVED 
  (XKSTS$W_XACK :unsigned-integer 25 27)
    ; NUMBER OF HOST ABORTS ENCOUNTERED 
  (XKSTS$W_HABO :unsigned-integer 27 29)
    ; NUMBER OF DRIVER ABORTS ENCOUNTERED 
  (XKSTS$W_DABO :unsigned-integer 29 31)
    ; NUMBER OF ACK RESPONSE TIMEOUTS 
  (XKSTS$W_RTIM :unsigned-integer 31 33)
    ; NUMBER OF DISCONNECTS ENCOUNTERED 
  (XKSTS$W_DISC :unsigned-integer 33 35)
    ; NUMBER OF HARDWARE FAILURES (INCLUDING 
  (XKSTS$W_HARD :unsigned-integer 35 37)
    ;  DISCONNECTS) ENCOUNTERED
    ; NUMBER OF BLOCKS TRANSMITTED 
  (XKSTS$W_TBLK :unsigned-integer 37 39)
    ; NUMBER OF BLOCKS RECEIVED 
  (XKSTS$W_RBLK :unsigned-integer 39 41)
    ; NUMBER OF DUBIOUS ACK OUTS 
  (XKSTS$W_HABX :unsigned-integer 41 43)
    ; NUMBER OF EOTS IMPLYING ACK 
  (XKSTS$W_IEOT :unsigned-integer 43 45))    ; NUMBER OF EOTS IMPLYING ACK 
      
;;;  RECEIVED
;;;  DISCONNECTS) ENCOUNTERED
 
;;;*** MODULE $XKDEVDEF ***
      
;;;
;;; 3271 DEVICE STATUS BLOCK
;;;
;;; THE DRIVER RETURNS N COPIES OF THIS BLOCK FOLLOWING THE LINE STATUS BLOCK
;;; IN THE USER'S BUFFER, WHERE N IS THE NUMBER OF ACTIVE DEVICES ON THE LINE.
;;;
 (defconstant XKDEV$K_SIZE 15)   ;  SIZE OF THE DEVICE STATUS BLOCK 
 (defconstant XKDEV$C_SIZE 15)   ;  SIZE OF THE DEVICE STATUS BLOCK 
            
(define-alien-structure (XKDEV    ( :conc-name nil))
    ; DEVICE ADDRESS (DU - HEX EBCDIC) 
  (XKDEV$B_DUEB :unsigned-integer 0 1)
    ; PROCESS ID OF PROCESS OWNING THIS DU 
  (XKDEV$L_DPID :unsigned-integer 1 5)
    ; NUMBER OF BLOCKS TRANSMITTED 
  (XKDEV$W_TBLK :unsigned-integer 5 7)
    ; NUMBER OF BLOCKS RECEIVED 
  (XKDEV$W_RBLK :unsigned-integer 7 9)
    ; NUMBER OF SPECIFIC POLLS RECEIVED 
  (XKDEV$W_SPOL :unsigned-integer 9 11)
    ; NUMBER OF ADDRESS SELECTS RECEIVED 
  (XKDEV$W_ASEL :unsigned-integer 11 13)
    ; NUMBER OF COMMAND REJECTS SENT 
  (XKDEV$W_CREJ :unsigned-integer 13 15))    ; NUMBER OF COMMAND REJECTS SENT 
      
 
;;;*** MODULE $XMDEF ***
      
;;;
;;; DEFINITIONS FOR STATUS, CHARACTERISTICS AND ERRORS FOR DMC-11/DMR-11/DMP-11
;;;
            
(define-alien-structure (XMDEV ( :conc-name nil))
    ; Device Class
  (XMDEV$B_P1_CLASS :unsigned-integer 0 1)
    ; Device type
  (XMDEV$B_P1_TYPE :unsigned-integer 1 2)
    ; Maximum message size
  (XMDEV$W_P1_MMS :unsigned-integer 2 4)
    ; Unit characteristics
  (XMDEV$B_P1_CHAR :unsigned-integer 4 5)
    ; Unit Status
  (XMDEV$B_P1_STS :unsigned-integer 5 6)
    ; Error Summary
  (XMDEV$B_P1_ESUM :unsigned-integer 6 7)
    ; Transmit Pipeline no.
  (XMDEV$B_P1_TPI :unsigned-integer 7 8))    ; Transmit Pipeline no.
      
 (defconstant XM$M_CHR_MOP #b00000000000000000000000000000001)
 (defconstant XM$M_CHR_LOOPB #b00000000000000000000000000000010)
 (defconstant XM$M_CHR_HDPLX #b00000000000000000000000000000100)
 (defconstant XM$M_CHR_SLAVE #b00000000000000000000000000001000)
 (defconstant XM$M_CHR_MBX #b00000000000000000000000000010000)
 (defconstant XM$M_CHR_DMC #b00000000000000000000000000100000)
 (defconstant XM$M_CHR_CTRL #b00000000000000000000000001000000)
 (defconstant XM$M_CHR_TRIB #b00000000000000000000000010000000)
 (defconstant XM$M_STS_DCHK #b00000000000000000000000100000000)
 (defconstant XM$M_STS_TIMO #b00000000000000000000001000000000)
 (defconstant XM$M_STS_ORUN #b00000000000000000000010000000000)
 (defconstant XM$M_STS_ACTIVE #b00000000000000000000100000000000)
 (defconstant XM$M_STS_BUFFAIL #b00000000000000000001000000000000)
 (defconstant XM$M_STS_RUNNING #b00000000000000000010000000000000)
 (defconstant XM$M_STS_DISC #b00000000000000000100000000000000)
 (defconstant XM$M_ERR_FATAL #b00000000000000010000000000000000)
 (defconstant XM$M_ERR_MAINT #b00000000000010000000000000000000)
 (defconstant XM$M_ERR_LOST #b00000000000100000000000000000000)
 (defconstant XM$M_ERR_THRESH #b00000000001000000000000000000000)
 (defconstant XM$M_ERR_TRIB #b00000000010000000000000000000000)
 (defconstant XM$M_ERR_START #b00000000100000000000000000000000)
 (defconstant XM$M_MDM_RTSHLD #b00000000000000000000000000000001)
 (defconstant XM$M_MDM_STNDBY #b00000000000000000000000000000010)
 (defconstant XM$M_MDM_MAINT2 #b00000000000000000000000000000100)
 (defconstant XM$M_MDM_MAINT1 #b00000000000000000000000000001000)
 (defconstant XM$M_MDM_FREQ #b00000000000000000000000000100000)
 (defconstant XM$M_MDM_RDY #b00000000000000000000000001000000)
 (defconstant XM$M_MDM_POLL #b00000000000000000000000010000000)
 (defconstant XM$M_MDM_SELM #b00000000000000000000000100000000)
 (defconstant XM$M_MDM_INT #b00000000000000000000100000000000)
 (defconstant XM$M_MDM_V35 #b00000000000000000001000000000000)
 (defconstant XM$M_MDM_RS232 #b00000000000000000100000000000000)
 (defconstant XM$M_MDM_RS422 #b00000000000000001000000000000000)
 (defconstant XM$M_MDM_CARRDET #b00000000000000000000000000000001)
 (defconstant XM$M_MDM_MSTNDBY #b00000000000000000000000000000010)
 (defconstant XM$M_MDM_CTS #b00000000000000000000000000000100)
 (defconstant XM$M_MDM_DSR #b00000000000000000000000000001000)
 (defconstant XM$M_MDM_HDX #b00000000000000000000000000010000)
 (defconstant XM$M_MDM_RTS #b00000000000000000000000000100000)
 (defconstant XM$M_MDM_DTR #b00000000000000000000000001000000)
 (defconstant XM$M_MDM_RING #b00000000000000000000000010000000)
 (defconstant XM$M_MDM_CHRMOD #b00000000000000000000000100000000)
 (defconstant XM$M_MDM_MCLOCK #b00000000000000000000001000000000)
 (defconstant XM$M_MDM_MODTEST #b00000000000000000000010000000000)
 (defconstant XM$M_MDM_SIGQUAL #b00000000000000000100000000000000)
 (defconstant XM$M_MDM_SIGRATE #b00000000000000001000000000000000)
            
(define-alien-structure (XM    ( :conc-name nil))
    ; MOP MODE 
    (XM$V_CHR_MOP :unsigned-integer #.(+ 0 0/8) #.(+ 0 1/8)) 
    ; LOOP BACK 
    (XM$V_CHR_LOOPB :unsigned-integer #.(+ 0 1/8) #.(+ 0 2/8)) 
    ; HALF DUPLEX 
    (XM$V_CHR_HDPLX :unsigned-integer #.(+ 0 2/8) #.(+ 0 3/8)) 
    ; HALF DUPLEX SLAVE STATION 
    (XM$V_CHR_SLAVE :unsigned-integer #.(+ 0 3/8) #.(+ 0 4/8)) 
    ; MAILBOX IS ENABLED 
    (XM$V_CHR_MBX :unsigned-integer #.(+ 0 4/8) #.(+ 0 5/8)) 
    ; DMC-11 COMPATABILITY MODE 
    (XM$V_CHR_DMC :unsigned-integer #.(+ 0 5/8) #.(+ 0 6/8)) 
    ; CONTROL STATION 
    (XM$V_CHR_CTRL :unsigned-integer #.(+ 0 6/8) #.(+ 0 7/8)) 
    ; TRIBUTARY STATION 
    (XM$V_CHR_TRIB :unsigned-integer #.(+ 0 7/8) #.(+ 0 8/8)) 
    ; DATA CHECK OCCURED 
    (XM$V_STS_DCHK :unsigned-integer #.(+ 0 8/8) #.(+ 0 9/8)) 
    ; TIMEOUT OCCURED 
    (XM$V_STS_TIMO :unsigned-integer #.(+ 0 9/8) #.(+ 0 10/8)) 
    ; DATA OVER RUN OCCURED 
    (XM$V_STS_ORUN :unsigned-integer #.(+ 0 10/8) #.(+ 0 11/8)) 
    ; ACTIVE UNIT 
    (XM$V_STS_ACTIVE :unsigned-integer #.(+ 0 11/8) #.(+ 0 12/8)) 
    ; BUFFER ALLOCATION FAILURE OCCURED 
    (XM$V_STS_BUFFAIL :unsigned-integer #.(+ 0 12/8) #.(+ 0 13/8)) 
    ; PROTOCOL RUNNING 
    (XM$V_STS_RUNNING :unsigned-integer #.(+ 0 13/8) #.(+ 0 14/8)) 
    ; LINE DISCONNECT OCCURED 
    (XM$V_STS_DISC :unsigned-integer #.(+ 0 14/8) #.(+ 0 15/8)) 
    ; SPARE 
    (XMDEF$$_FILL_1 :unsigned-integer #.(+ 0 15/8) #.(+ 0 16/8)) 
    ; HARDWARE ERROR 
    (XM$V_ERR_FATAL :unsigned-integer #.(+ 0 16/8) #.(+ 0 17/8)) 
    (XMDEF$$_FILL_2 :unsigned-integer #.(+ 0 17/8) #.(+ 0 19/8)) 
    ; DDCMP MAINT MESSAGE RECEIVED 
    (XM$V_ERR_MAINT :unsigned-integer #.(+ 0 19/8) #.(+ 0 20/8)) 
    ; DATA LOST BECAUSE OF BUFFER SIZE MISMATCH 
    (XM$V_ERR_LOST :unsigned-integer #.(+ 0 20/8) #.(+ 0 21/8)) 
    ; THRESHOLD ERRORS 
    (XM$V_ERR_THRESH :unsigned-integer #.(+ 0 21/8) #.(+ 0 22/8)) 
    ; TRIBUTARY MALFUNCTIONING 
    (XM$V_ERR_TRIB :unsigned-integer #.(+ 0 22/8) #.(+ 0 23/8)) 
    ; DDCMP START MESSAGE RECEIVED 
    (XM$V_ERR_START :unsigned-integer #.(+ 0 23/8) #.(+ 0 24/8)) 
    ; RTS HOLD 
    (XM$V_MDM_RTSHLD :unsigned-integer #.(+ 0 0/8) #.(+ 0 1/8)) 
    ; SELECT STANDBY 
    (XM$V_MDM_STNDBY :unsigned-integer #.(+ 0 1/8) #.(+ 0 2/8)) 
    ; MAINTENANCE MODE 2 
    (XM$V_MDM_MAINT2 :unsigned-integer #.(+ 0 2/8) #.(+ 0 3/8)) 
    ; MAINTENANCE MODE 1 
    (XM$V_MDM_MAINT1 :unsigned-integer #.(+ 0 3/8) #.(+ 0 4/8)) 
    ; HALF-DUPLEX 
    (XMDEF$$_FILL_3 :unsigned-integer #.(+ 0 4/8) #.(+ 0 5/8)) 
    ; SELECT FREQUENCY 
    (XM$V_MDM_FREQ :unsigned-integer #.(+ 0 5/8) #.(+ 0 6/8)) 
    ; DATA TERMINAL READY 
    (XM$V_MDM_RDY :unsigned-integer #.(+ 0 6/8) #.(+ 0 7/8)) 
    ; SELECT POLLING MODEM MODE 
    (XM$V_MDM_POLL :unsigned-integer #.(+ 0 7/8) #.(+ 0 8/8)) 
    ; MODEM INTERFACE PROGRAM SELECTED 
    (XM$V_MDM_SELM :unsigned-integer #.(+ 0 8/8) #.(+ 0 9/8)) 
    ; UNUSED 
    (XMDEF$$_FILL_4 :unsigned-integer #.(+ 0 9/8) #.(+ 0 11/8)) 
    ; INTEGRAL MODEM 
    (XM$V_MDM_INT :unsigned-integer #.(+ 0 11/8) #.(+ 0 12/8)) 
    ; V.35 
    (XM$V_MDM_V35 :unsigned-integer #.(+ 0 12/8) #.(+ 0 13/8)) 
    ; UNUSED 
    (XMDEF$$_FILL_5 :unsigned-integer #.(+ 0 13/8) #.(+ 0 14/8)) 
    ; RS-232-C OR RS423 
    (XM$V_MDM_RS232 :unsigned-integer #.(+ 0 14/8) #.(+ 0 15/8)) 
    ; RS-422 
    (XM$V_MDM_RS422 :unsigned-integer #.(+ 0 15/8) #.(+ 0 16/8)) 
    ; CARRIER DETECT 
    (XM$V_MDM_CARRDET :unsigned-integer #.(+ 0 0/8) #.(+ 0 1/8)) 
    ; MODEM STANDBY 
    (XM$V_MDM_MSTNDBY :unsigned-integer #.(+ 0 1/8) #.(+ 0 2/8)) 
    ; CLEAR TO SEND 
    (XM$V_MDM_CTS :unsigned-integer #.(+ 0 2/8) #.(+ 0 3/8)) 
    ; DATA SET READY 
    (XM$V_MDM_DSR :unsigned-integer #.(+ 0 3/8) #.(+ 0 4/8)) 
    ; HALF-DUPLEX 
    (XM$V_MDM_HDX :unsigned-integer #.(+ 0 4/8) #.(+ 0 5/8)) 
    ; REQUEST TO SEND 
    (XM$V_MDM_RTS :unsigned-integer #.(+ 0 5/8) #.(+ 0 6/8)) 
    ; DATA TERMINAL READY 
    (XM$V_MDM_DTR :unsigned-integer #.(+ 0 6/8) #.(+ 0 7/8)) 
    ; RING 
    (XM$V_MDM_RING :unsigned-integer #.(+ 0 7/8) #.(+ 0 8/8)) 
    ; CHARACTER OR BIT PROTOCOL MODE 
    (XM$V_MDM_CHRMOD :unsigned-integer #.(+ 0 8/8) #.(+ 0 9/8)) 
    ; MAINTENANCE CLOCK 
    (XM$V_MDM_MCLOCK :unsigned-integer #.(+ 0 9/8) #.(+ 0 10/8)) 
    ; MODEM TEST MODE 
    (XM$V_MDM_MODTEST :unsigned-integer #.(+ 0 10/8) #.(+ 0 11/8)) 
    ; UNUSED 
    (XMDEF$$_FILL_6 :unsigned-integer #.(+ 0 11/8) #.(+ 0 14/8)) 
    ; SIGNAL QUALITY 
    (XM$V_MDM_SIGQUAL :unsigned-integer #.(+ 0 14/8) #.(+ 0 15/8)) 
    ; SIGNAL RATE 
    (XM$V_MDM_SIGRATE :unsigned-integer #.(+ 0 15/8) #.(+ 0 16/8)) )    ; SIGNAL RATE 
      
 
;;;*** MODULE $XWDEF ***
      
;;;++
;;;
;;; XWDEF - System definitions for software DDCMP
;;;
;;;--
 (defconstant XW$M_CHA_FDX #b00000000000000000000000000000001)
 (defconstant XW$M_CHA_XPR #b00000000000000000000000000000010)
 (defconstant XW$M_CHA_DSR #b00000000000000000000000000000100)
 (defconstant XW$M_FAT_STAT #b00000000000000000000001111111111)
 (defconstant XW$M_INFO_STAT #b00000000000000001111110000000000)
 (defconstant XW$M_EOT #b00000000000000000000000000000001)
 (defconstant XW$M_DATACK #b00000000000000000000000000000010)
 (defconstant XW$M_NODSR #b00000000000000000000000000000100)
 (defconstant XW$M_DISCON #b00000000000000000000000000001000)
 (defconstant XW$M_TRABINTMO #b00000000000000000000000000010000)
 (defconstant XW$M_PIPE_MARK #b00000000000000000000000000100000)
 (defconstant XW$M_BADCHAIN #b00000000000000000000000001000000)
 (defconstant XW$M_ILLMOD #b00000000000000000000000010000000)
 (defconstant XW$M_RVI #b00000000000000000000010000000000)
 (defconstant XW$M_CONACK #b00000000000000000000100000000000)
 (defconstant XW$M_XPR #b00000000000000000001000000000000)
 (defconstant XW$M_ETXEND #b00000000000000000010000000000000)
 (defconstant XW$M_PUNCH #b00000000000000010000000000000000)
 (defconstant XW$M_HOR_FOR #b00000000000000100000000000000000)
 (defconstant XW$M_IOMOD #b00000000000000001110000000000000)
            
(define-alien-structure (XW    ( :conc-name nil))
    ; Full duplex line 
    (XW$V_CHA_FDX :unsigned-integer #.(+ 0 0/8) #.(+ 0 1/8)) 
    ; Transparency 
    (XW$V_CHA_XPR :unsigned-integer #.(+ 0 1/8) #.(+ 0 2/8)) 
    ; Data Set Ready set 
    (XW$V_CHA_DSR :unsigned-integer #.(+ 0 2/8) #.(+ 0 3/8)) 
    (XW$V_fill_11 :unsigned-integer #.(+ 0 3/8) #.(+ 0 8/8)) 
    ;
    ; Device dependent status
    ;
    ; Beginning of fatal stat flags 
    (XW$V_FAT_STAT :unsigned-integer #.(+ 0 0/8) #.(+ 0 10/8)) 
    ; Start of informational status 
    (XW$V_INFO_STAT :unsigned-integer #.(+ 0 10/8) #.(+ 0 16/8)) 
    ;
    ; Bit definitions for fatal and informational status fields
    ;
    ; EOT received 
    (XW$V_EOT :unsigned-integer #.(+ 0 0/8) #.(+ 0 1/8)) 
    ; Retry threshold exceeded 
    (XW$V_DATACK :unsigned-integer #.(+ 0 1/8) #.(+ 0 2/8)) 
    ; Line not connected 
    (XW$V_NODSR :unsigned-integer #.(+ 0 2/8) #.(+ 0 3/8)) 
    ; Disconnect (DLE, EOT) rcvd 
    (XW$V_DISCON :unsigned-integer #.(+ 0 3/8) #.(+ 0 4/8)) 
    ; Binary transmit timeout 
    (XW$V_TRABINTMO :unsigned-integer #.(+ 0 4/8) #.(+ 0 5/8)) 
    ; Aborted because of pipe mark 
    (XW$V_PIPE_MARK :unsigned-integer #.(+ 0 5/8) #.(+ 0 6/8)) 
    ; Bad record list 
    (XW$V_BADCHAIN :unsigned-integer #.(+ 0 6/8) #.(+ 0 7/8)) 
    ; Illegal QIO modifier 
    (XW$V_ILLMOD :unsigned-integer #.(+ 0 7/8) #.(+ 0 8/8)) 
    (XWDEF$$_FILL_1 :unsigned-integer #.(+ 0 8/8) #.(+ 0 10/8)) 
    ; Buffer ACKed with RVI 
    (XW$V_RVI :unsigned-integer #.(+ 0 10/8) #.(+ 0 11/8)) 
    ; Buffer ACKed with conver resp 
    (XW$V_CONACK :unsigned-integer #.(+ 0 11/8) #.(+ 0 12/8)) 
    ; Buffer rcvd with transparency 
    (XW$V_XPR :unsigned-integer #.(+ 0 12/8) #.(+ 0 13/8)) 
    ; Rcvd block ended with ETX 
    (XW$V_ETXEND :unsigned-integer #.(+ 0 13/8) #.(+ 0 14/8)) 
    (XWDEF$$_FILL_2 :unsigned-integer #.(+ 0 14/8) #.(+ 0 16/8)) 
    ; Punch select found 
    (XW$V_PUNCH :unsigned-integer #.(+ 0 16/8) #.(+ 0 17/8)) 
    ; Horizontal forms record rcvd 
    (XW$V_HOR_FOR :unsigned-integer #.(+ 0 17/8) #.(+ 0 18/8)) 
    (XW$V_fill_12 :unsigned-integer #.(+ 0 18/8) #.(+ 0 24/8)) 
    ;
    ; Read/Write function modifier definition
    ;
    (XWDEF$$_FILL_3 :unsigned-integer #.(+ 0 0/8) #.(+ 0 13/8)) 
    ; I/O modifier field start 
    (XW$V_IOMOD :unsigned-integer #.(+ 0 13/8) #.(+ 0 16/8)) )    ; I/O modifier field start 
      
;;;
;;; Device dependent status
;;;
;;;
;;; Bit definitions for fatal and informational status fields
;;;
;;;
;;; Read/Write function modifier definition
