(proclaim '(optimize (speed 3) (safety 0)))
 
;;;*** MODULE STARLET ***
      
;;;
;;; SYSTEM SERVICE ENTRY POINT DESCRIPTIONS
;;;
;;;
;;;  $ABORT_TRANS
;;;
;;;    Abort a transaction
;;;
;;;	$ABORT_TRANS	[efn], [flags], iosb, [astadr], [astprm], [tid]
;;;	  ($ABORT_TRANSW)
;;;
;;;	efn	= event flag to be set at completion
;;;	flags	= operation flags
;;;	iosb	= address of a quadword I/O status block
;;;	astadr	= address of an entry mask of AST routine
;;;	astprm	= value to be passed to AST routine as an argument
;;;	tid	= identifier of transaction to be aborted
;;;
(define-external-routine (SYS$ABORT_TRANS

		:result  
		        (:lisp-type integer :vax-type :longword))
  (EFN		:lisp-type integer
		:vax-type  :unsigned-longword
		:mechanism :value
		:access :in)
  (FLAGS	:lisp-type integer
		:vax-type  :unsigned-longword
		:mechanism :value
		:access :in)
  (IOSB		:lisp-type integer
		:vax-type  :unsigned-quadword
		:mechanism :reference
		:access :in-out)
  (ASTADR	:lisp-type integer
		:vax-type  :unsigned-longword
		:mechanism :value
		:access :in)
  (ASTPRM	:lisp-type integer
		:vax-type  :unsigned-longword
		:mechanism :value
		:access :in)
  (TID		:lisp-type integer
		:vax-type  :unsigned-quadword ; :unsigned-octaword ??
		:mechanism :reference
		:access :in))
 
 
(defun lisp$SYS_ABORT_TRANS (EFN FLAGS ASTADR ASTPRM TID &optional IOSB)
  (declare (integer EFN))
  (declare (integer FLAGS))
  (declare (integer ASTADR))
  (declare (integer ASTPRM))
  (declare (integer TID))
  (declare (integer IOSB))
     (call-out SYS$ABORT_TRANS EFN FLAGS IOSB ASTADR ASTPRM TID)
			(values IOSB))
 
 
(define-external-routine (SYS$ABORT_TRANSW

		:result  
		        (:lisp-type integer :vax-type :longword))
  (EFN		:lisp-type integer
		:vax-type  :unsigned-longword
		:mechanism :value
		:access :in)
  (FLAGS	:lisp-type integer
		:vax-type  :unsigned-longword
		:mechanism :value
		:access :in)
  (IOSB		:lisp-type integer
		:vax-type  :unsigned-quadword
		:mechanism :reference
		:access :in-out)
  (ASTADR	:lisp-type integer
		:vax-type  :unsigned-longword
		:mechanism :value
		:access :in)
  (ASTPRM	:lisp-type integer
		:vax-type  :unsigned-longword
		:mechanism :value
		:access :in)
  (TID		:lisp-type integer
		:vax-type  :unsigned-quadword ; :unsigned-octaword ??
		:mechanism :reference
		:access :in))
 
 
(defun lisp$SYS_ABORT_TRANSW (EFN FLAGS ASTADR ASTPRM TID &optional IOSB)
  (declare (integer EFN))
  (declare (integer FLAGS))
  (declare (integer ASTADR))
  (declare (integer ASTPRM))
  (declare (integer TID))
  (declare (integer IOSB))
     (call-out SYS$ABORT_TRANSW EFN FLAGS IOSB ASTADR ASTPRM TID)
			(values IOSB))
 
 
;;;
;;; $ADD_BRANCH
;;;
;;;    Add a transaction branch
;;;
;;;	$ADD_BRANCH	[efn], [flags], iosb, [astadr], [astprm], [tid], node
;;;	   ($ADD_BRANCHW)
;;;
;;;	efn	= event flag to be set at completion
;;;	flags	= operation flags
;;;	iosb	= address of a quadword I/O status block
;;;	astadr	= address of an entry mask of AST routine
;;;	astprm	= value to be passed to AST routine as an argument
;;;	tid	= transaction id for this branch
;;;	node	= address of node name descriptor
;;;
(define-external-routine (SYS$ADD_BRANCH

		:result  
		        (:lisp-type integer :vax-type :longword))
  (EFN		:lisp-type integer
		:vax-type  :unsigned-longword
		:mechanism :value
		:access :in)
  (FLAGS	:lisp-type integer
		:vax-type  :unsigned-longword
		:mechanism :value
		:access :in)
  (IOSB		:lisp-type integer
		:vax-type  :unsigned-quadword
		:mechanism :reference
		:access :in-out)
  (ASTADR	:lisp-type integer
		:vax-type  :unsigned-longword
		:mechanism :value
		:access :in)
  (ASTPRM	:lisp-type integer
		:vax-type  :unsigned-longword
		:mechanism :value
		:access :in)
  (TID		:lisp-type integer
		:vax-type  :unsigned-quadword ; :unsigned-octaword ??
		:mechanism :reference
		:access :in)
  (NODE		:lisp-type simple-string
		:vax-type  :text
		:mechanism :descriptor
		:access :in))
 
 
(defun lisp$SYS_ADD_BRANCH (EFN FLAGS ASTADR ASTPRM TID NODE &optional IOSB)
  (declare (integer EFN))
  (declare (integer FLAGS))
  (declare (integer ASTADR))
  (declare (integer ASTPRM))
  (declare (integer TID))
  (declare (simple-string NODE))
  (declare (integer IOSB))
     (call-out SYS$ADD_BRANCH EFN FLAGS IOSB ASTADR ASTPRM TID NODE)
			(values IOSB))
 
 
(define-external-routine (SYS$ADD_BRANCHW

		:result  
		        (:lisp-type integer :vax-type :longword))
  (EFN		:lisp-type integer
		:vax-type  :unsigned-longword
		:mechanism :value
		:access :in)
  (FLAGS	:lisp-type integer
		:vax-type  :unsigned-longword
		:mechanism :value
		:access :in)
  (IOSB		:lisp-type integer
		:vax-type  :unsigned-quadword
		:mechanism :reference
		:access :in-out)
  (ASTADR	:lisp-type integer
		:vax-type  :unsigned-longword
		:mechanism :value
		:access :in)
  (ASTPRM	:lisp-type integer
		:vax-type  :unsigned-longword
		:mechanism :value
		:access :in)
  (TID		:lisp-type integer
		:vax-type  :unsigned-quadword ; :unsigned-octaword ??
		:mechanism :reference
		:access :in)
  (NODE		:lisp-type simple-string
		:vax-type  :text
		:mechanism :descriptor
		:access :in))
 
 
(defun lisp$SYS_ADD_BRANCHW (EFN FLAGS ASTADR ASTPRM TID NODE &optional IOSB)
  (declare (integer EFN))
  (declare (integer FLAGS))
  (declare (integer ASTADR))
  (declare (integer ASTPRM))
  (declare (integer TID))
  (declare (simple-string NODE))
  (declare (integer IOSB))
     (call-out SYS$ADD_BRANCHW EFN FLAGS IOSB ASTADR ASTPRM TID 
NODE)
			(values IOSB))
 
 
;;;
;;;  $ADD_HOLDER
;;;
;;;    Add Holder Record To The Rights Database
;;;
;;;	$ADD_HOLDER id, holder, [attrib]
;;;
;;;	id	= identifier longword to associate the
;;;		  holder record with
;;;	holder	= address of the holder identifier quadword
;;;	attrib	= attributes longword to grant to the holder
;;;
(define-external-routine (SYS$ADD_HOLDER

		:result  
		        (:lisp-type integer :vax-type :longword))
  (ID		:lisp-type integer
		:vax-type  :unsigned-longword
		:mechanism :value
		:access :in)
  (HOLDER	:lisp-type integer
		:vax-type  :unsigned-quadword
		:mechanism :reference
		:access :in)
  (ATTRIB	:lisp-type integer
		:vax-type  :unsigned-longword
		:mechanism :value
		:access :in))
 
 
(defun lisp$SYS_ADD_HOLDER (ID HOLDER ATTRIB)
  (declare (integer ID))
  (declare (integer HOLDER))
  (declare (integer ATTRIB))
     (call-out SYS$ADD_HOLDER ID HOLDER ATTRIB))
 
 
;;;
;;;  $ADD_IDENT
;;;
;;;    Add Identifier To The Rights Database
;;;
;;;	$ADD_IDENT name, [id], [attrib], [resid]
;;;
;;;	name	= address of the identifier name character
;;;		  string descriptor
;;;	id	= identifier longword to associate with 'name'
;;;	attrib	= attributes longword to grant to the
;;;		  identifier
;;;	resid	= address of a longword to return the assigned
;;;		  identifier
;;;
(define-external-routine (SYS$ADD_IDENT

		:result  
		        (:lisp-type integer :vax-type :longword))
  (NAME		:lisp-type simple-string
		:vax-type  :text
		:mechanism :descriptor
		:access :in)
  (ID		:lisp-type integer
		:vax-type  :unsigned-longword
		:mechanism :value
		:access :in)
  (ATTRIB	:lisp-type integer
		:vax-type  :unsigned-longword
		:mechanism :value
		:access :in)
  (RESID	:lisp-type integer
		:vax-type  :unsigned-longword
		:mechanism :reference
		:access :in-out))
 
 
(defun lisp$SYS_ADD_IDENT (NAME ID ATTRIB &optional RESID)
  (declare (simple-string NAME))
  (declare (integer ID))
  (declare (integer ATTRIB))
  (declare (integer RESID))
     (call-out SYS$ADD_IDENT NAME ID ATTRIB RESID)
			(values RESID))
 
 
;;;
;;;  $ADJSTK
;;;
;;;    Adjust Outer Mode Stack Pointer
;;;
;;;      $ADJSTK [acmode] ,[adjust] ,newadr
;;;
;;;      acmode = access mode for which to adjust stack pointer
;;;      adjust = 16-bit signed adjustment value
;;;      newadr = address of longword to store updated value
;;;
(define-external-routine (SYS$ADJSTK

		:result  
		        (:lisp-type integer :vax-type :longword))
  (ACMODE	:lisp-type integer
		:vax-type  :unsigned-longword
		:mechanism :value
		:access :in)
  (ADJUST	:lisp-type integer ; unsigned-byte 16
		:vax-type  :unsigned-word
		:mechanism :value
		:access :in)
  (NEWADR	:lisp-type integer
		:vax-type  :unsigned-longword
		:mechanism :reference
		:access :in-out))
 
 
(defun lisp$SYS_ADJSTK (ACMODE ADJUST &optional NEWADR)
  (declare (integer ACMODE))
  (declare (fixnum ADJUST))
  (declare (integer NEWADR))
     (call-out SYS$ADJSTK ACMODE ADJUST NEWADR)
			(values NEWADR))
 
 
;;;
;;;  $ADJWSL                                                             
;;;
;;;    Adjust Working Set Limit
;;;                          
;;;      $ADJWSL [pagcnt] ,[wsetlm]
;;;
;;;      pagcnt = number of pages to add to working set (if  positive).
;;;               Number  of  pages  to  subtract  from working set (if
;;;               negative).
;;;      wsetlm = address of longword to receive new working set limit,
;;;               or current working set limit if pagcnt not specified.
;;;
(define-external-routine (SYS$ADJWSL

		:result  
		        (:lisp-type integer :vax-type :longword))
  (PAGCNT	:lisp-type integer
		:vax-type  :unsigned-longword
		:mechanism :value
		:access :in)
  (WSETLM	:lisp-type integer
		:vax-type  :unsigned-longword
		:mechanism :reference
		:access :in-out))
 
 
(defun lisp$SYS_ADJWSL (PAGCNT &optional WSETLM)
  (declare (integer PAGCNT))
  (declare (integer WSETLM))
     (call-out SYS$ADJWSL PAGCNT WSETLM)
			(values WSETLM))
 
 
;;;
;;;  $ALLOC
;;;
;;;    Allocate Device
;;;
;;;      $ALLOC devnam ,[phylen] ,[phybuf] ,[acmode] ,[flags]
;;;
;;;      devnam = address  of  device  name  or  logical  name   string
;;;               descriptor
;;;      phylen = address of word to receive length of physical name
;;;      phybuf = address of physical name buffer descriptor
;;;      acmode = access mode associated with allocated device
;;;	flags  = options flags longword
;;;
(define-external-routine (SYS$ALLOC

		:result  
		        (:lisp-type integer :vax-type :longword))
  (DEVNAM	:lisp-type simple-string
		:vax-type  :text
		:mechanism :descriptor
		:access :in)
  (PHYLEN	:lisp-type integer ; unsigned-byte 16
		:vax-type  :unsigned-word
		:mechanism :reference
		:access :in-out)
  (PHYBUF	:lisp-type simple-string
		:vax-type  :text
		:mechanism :descriptor
		:access :in-out)
  (ACMODE	:lisp-type integer
		:vax-type  :unsigned-longword
		:mechanism :value
		:access :in)
  (FLAGS	:lisp-type integer
		:vax-type  :unsigned-longword
		:mechanism :value
		:access :in))
 
 
(defun lisp$SYS_ALLOC (DEVNAM ACMODE FLAGS &optional PHYLEN PHYBUF)
  (declare (simple-string DEVNAM))
  (declare (integer ACMODE))
  (declare (integer FLAGS))
  (declare (fixnum PHYLEN))
  (declare (simple-string PHYBUF))
     (call-out SYS$ALLOC DEVNAM PHYLEN PHYBUF ACMODE FLAGS)
			(values PHYLEN PHYBUF))
 
 
;;;
;;;  $ASCEFC
;;;
;;;    Associate Common Event Flag Cluster
;;;
;;;      $ASCEFC  efn ,name ,[prot] ,[perm]
;;;
;;;      efn    = number of any event flag in the cluster with which to
;;;               associate
;;;      name   = address of the text name string descriptor
;;;      prot   = protection indicator for the cluster
;;;               0 -> default, any process in group
;;;               1 -> only owner's UIC
;;;      perm   = permanent indicator
;;;               0 -> temporary cluster
;;;               1 -> permanent cluster
;;;
(define-external-routine (SYS$ASCEFC

		:result  
		        (:lisp-type integer :vax-type :longword))
  (EFN		:lisp-type integer
		:vax-type  :unsigned-longword
		:mechanism :value
		:access :in)
  (NAME		:lisp-type simple-string
		:vax-type  :text
		:mechanism :descriptor
		:access :in)
  (PROT		:lisp-type integer
		:vax-type  :byte
		:mechanism :value
		:access :in)
  (PERM		:lisp-type integer
		:vax-type  :byte
		:mechanism :value
		:access :in))
 
 
(defun lisp$SYS_ASCEFC (EFN NAME PROT PERM)
  (declare (integer EFN))
  (declare (simple-string NAME))
  (declare (integer PROT))
  (declare (integer PERM))
     (call-out SYS$ASCEFC EFN NAME PROT PERM))
 
 
;;;              
;;;  $ASCTIM
;;;
;;;    Convert Binary Time to ASCII String
;;;
;;;      $ASCTIM  [timlen] ,timbuf ,[timadr] ,[cvtflg]
;;;
;;;      timlen = address of a word to receive the number of characters
;;;               inserted into the output buffer.
;;;      timbuf = address  of a  character string descriptor describing
;;;               the buffer to receive the converted time.
;;;      timadr = address of the quadword containing the 64-bit time to
;;;               be converted to ASCII.  If 0, use current time.
;;;      cvtflg = conversion indicator
;;;               0 -> return full date and time
;;;               1 -> return converted time only
;;;
(define-external-routine (SYS$ASCTIM

		:result  
		        (:lisp-type integer :vax-type :longword))
  (TIMLEN	:lisp-type integer ; unsigned-byte 16
		:vax-type  :unsigned-word
		:mechanism :reference
		:access :in-out)
  (TIMBUF	:lisp-type simple-string
		:vax-type  :text
		:mechanism :descriptor
		:access :in-out)
  (TIMADR	:lisp-type integer
		:vax-type  :unsigned-quadword
		:mechanism :reference
		:access :in)
  (CVTFLG	:lisp-type integer
		:vax-type  :byte
		:mechanism :value
		:access :in))
 
 
(defun lisp$SYS_ASCTIM (TIMADR CVTFLG &optional TIMLEN TIMBUF)
  (declare (integer TIMADR))
  (declare (integer CVTFLG))
  (declare (fixnum TIMLEN))
  (declare (simple-string TIMBUF))
     (call-out SYS$ASCTIM TIMLEN TIMBUF TIMADR CVTFLG)
			(values TIMLEN TIMBUF))
 
 
;;;
;;;  $ASCTOID
;;;
;;;    Ascii To Identifier Conversion
;;;
;;;	$ASCTOID name, [id], [attrib]
;;;
;;;	name	= address of the identifier name character
;;;		  string descriptor to be converted
;;;	id	= address to return the identifier longword
;;;	attrib	= address to return the attributes longword      
;;;
(define-external-routine (SYS$ASCTOID

		:result  
		        (:lisp-type integer :vax-type :longword))
  (NAME		:lisp-type simple-string
		:vax-type  :text
		:mechanism :descriptor
		:access :in)
  (ID		:lisp-type integer
		:vax-type  :unsigned-longword
		:mechanism :reference
		:access :in-out)
  (ATTRIB	:lisp-type integer
		:vax-type  :unsigned-longword
		:mechanism :reference
		:access :in-out))
 
 
(defun lisp$SYS_ASCTOID (NAME &optional ID ATTRIB)
  (declare (simple-string NAME))
  (declare (integer ID))
  (declare (integer ATTRIB))
     (call-out SYS$ASCTOID NAME ID ATTRIB)
			(values ID ATTRIB))
 
 
;;;
;;;  $ASSIGN
;;;
;;;    Assign I/O Channel
;;;
;;;      $ASSIGN  devnam ,chan ,[acmode]  ,[mbxnam]
;;;
;;;      devnam = address  of  device  name  or  logical  name   string
;;;               descriptor
;;;      chan   = address of word to receive channel number assigned
;;;      acmode = access mode associated with channel
;;;      mbxnam = address of mailbox logical name string descriptor, if
;;;               mailbox associated with device
;;;
(define-external-routine (SYS$ASSIGN

		:result  
		        (:lisp-type integer :vax-type :longword))
  (DEVNAM	:lisp-type simple-string
		:vax-type  :text
		:mechanism :descriptor
		:access :in)
  (CHAN		:lisp-type integer ; unsigned-byte 16
		:vax-type  :unsigned-word
		:mechanism :reference
		:access :in-out)
  (ACMODE	:lisp-type integer
		:vax-type  :unsigned-longword
		:mechanism :value
		:access :in)
  (MBXNAM	:lisp-type simple-string
		:vax-type  :text
		:mechanism :descriptor
		:access :in))
 
 
(defun lisp$SYS_ASSIGN (DEVNAM ACMODE MBXNAM &optional CHAN)
  (declare (simple-string DEVNAM))
  (declare (integer ACMODE))
  (declare (simple-string MBXNAM))
  (declare (fixnum CHAN))
     (call-out SYS$ASSIGN DEVNAM CHAN ACMODE MBXNAM)
			(values CHAN))
 
 
;;;
;;;  $BINTIM
;;;
;;;    Convert ASCII String to Binary Time
;;;
;;;      $BINTIM  timbuf ,timadr
;;;
;;;      timbuf = address of string descriptor for ASCII time string
;;;      timadr = address of quadword to  receive  64-bit  binary  time
;;;               value
;;;
;;;          Absolute time strings are specified in the format:
;;;               dd-mmm-yyyy hh:mm:ss.cc
;;;          Delta time strings are specified in the format:
;;;               dddd hh:mm:ss.cc     
;;;
(define-external-routine (SYS$BINTIM

		:result  
		        (:lisp-type integer :vax-type :longword))
  (TIMBUF	:lisp-type simple-string
		:vax-type  :text
		:mechanism :descriptor
		:access :in)
  (TIMADR	:lisp-type integer
		:vax-type  :unsigned-quadword
		:mechanism :reference
		:access :in-out))
 
 
(defun lisp$SYS_BINTIM (TIMBUF &optional TIMADR)
  (declare (simple-string TIMBUF))
  (declare (integer TIMADR))
     (call-out SYS$BINTIM TIMBUF TIMADR)
			(values TIMADR))
 
 
;;;
;;;  $BRDCST
;;;
;;;    Broadcast
;;;
;;;      $BRDCST  msgbuf ,[devnam]
;;;
;;;      msgbuf   = address of message buffer string descriptor
;;;      devnam   = terminal device name string descriptor.  If 0, send
;;;                 message   to  all  terminals.   If  first  word  in
;;;                 descriptor is 0,  send  message  to  all  allocated
;;;                 terminals.
;;;
(define-external-routine (SYS$BRDCST

		:result  
		        (:lisp-type integer :vax-type :longword))
  (MSGBUF	:lisp-type simple-string
		:vax-type  :text
		:mechanism :descriptor
		:access :in)
  (DEVNAM	:lisp-type simple-string
		:vax-type  :text
		:mechanism :descriptor
		:access :in)
  (FLAGS	:lisp-type integer
		:vax-type  :unsigned-longword
		:mechanism :value
		:access :in)
  (CARCON	:lisp-type integer
		:vax-type  :unsigned-longword
		:mechanism :value
		:access :in))
 
 
(defun lisp$SYS_BRDCST (MSGBUF DEVNAM FLAGS CARCON)
  (declare (simple-string MSGBUF))
  (declare (simple-string DEVNAM))
  (declare (integer FLAGS))
  (declare (integer CARCON))
     (call-out SYS$BRDCST MSGBUF DEVNAM FLAGS CARCON))
 
 
;;;  $BRKTHRU
;;;
;;;    Write to terminal breakthru
;;;
;;;     $BRKTHRU     [efn] ,msgbuf, [sendto], [sndtyp], [iosb],
;;;	($BRKTHRUW) [carcon], [flags], [reqid], [timout], 
;;;		    [astadr], [astprm]
;;;
;;;     efn    = event flag to be set at completion
;;;
;;;     msgbuf = address of message buffer descriptor
;;;
;;;     sendto = address of send address descriptor
;;;
;;;     sndtyp = value to describe sendto
;;;
;;;     iosb   = address of a quadword I/O status block
;;;
;;;     carcon = carriage control
;;;
;;;     flags = flags to modify broadcast
;;;
;;;     reqid = broadcast class requestor id
;;;
;;;     timout = address of timeout value
;;;
;;;     astadr = address of entry mask of AST routine
;;;                  
;;;     astprm = value to be passed to AST routine as an argument
;;;                  
;;;
(define-external-routine (SYS$BRKTHRU

		:result  
		        (:lisp-type integer :vax-type :longword))
  (EFN		:lisp-type integer
		:vax-type  :unsigned-longword
		:mechanism :value
		:access :in)
  (MSGBUF	:lisp-type simple-string
		:vax-type  :text
		:mechanism :descriptor
		:access :in)
  (SENDTO	:lisp-type simple-string
		:vax-type  :text
		:mechanism :descriptor
		:access :in)
  (SNDTYP	:lisp-type integer
		:vax-type  :unsigned-longword
		:mechanism :value
		:access :in)
  (IOSB		:lisp-type integer
		:vax-type  :unsigned-quadword
		:mechanism :reference
		:access :in-out)
  (CARCON	:lisp-type integer
		:vax-type  :unsigned-longword
		:mechanism :value
		:access :in)
  (FLAGS	:lisp-type integer
		:vax-type  :unsigned-longword
		:mechanism :value
		:access :in)
  (REQID	:lisp-type integer
		:vax-type  :unsigned-longword
		:mechanism :value
		:access :in)
  (TIMOUT	:lisp-type integer
		:vax-type  :unsigned-longword
		:mechanism :value
		:access :in)
  (ASTADR	:lisp-type integer
		:vax-type  :unsigned-longword
		:mechanism :value
		:access :in)
  (ASTPRM	:lisp-type integer
		:vax-type  :unsigned-longword
		:mechanism :value
		:access :in))
 
 
(defun lisp$SYS_BRKTHRU (EFN MSGBUF SENDTO SNDTYP CARCON FLAGS REQID 
TIMOUT ASTADR ASTPRM &optional IOSB)
  (declare (integer EFN))
  (declare (simple-string MSGBUF))
  (declare (simple-string SENDTO))
  (declare (integer SNDTYP))
  (declare (integer CARCON))
  (declare (integer FLAGS))
  (declare (integer REQID))
  (declare (integer TIMOUT))
  (declare (integer ASTADR))
  (declare (integer ASTPRM))
  (declare (integer IOSB))
     (call-out SYS$BRKTHRU EFN MSGBUF SENDTO SNDTYP IOSB CARCON 
FLAGS REQID TIMOUT ASTADR ASTPRM)
			(values IOSB))
 
 
(define-external-routine (SYS$BRKTHRUW

		:result  
		        (:lisp-type integer :vax-type :longword))
  (EFN		:lisp-type integer
		:vax-type  :unsigned-longword
		:mechanism :value
		:access :in)
  (MSGBUF	:lisp-type simple-string
		:vax-type  :text
		:mechanism :descriptor
		:access :in)
  (SENDTO	:lisp-type simple-string
		:vax-type  :text
		:mechanism :descriptor
		:access :in)
  (SNDTYP	:lisp-type integer
		:vax-type  :unsigned-longword
		:mechanism :value
		:access :in)
  (IOSB		:lisp-type integer
		:vax-type  :unsigned-quadword
		:mechanism :reference
		:access :in-out)
  (CARCON	:lisp-type integer
		:vax-type  :unsigned-longword
		:mechanism :value
		:access :in)
  (FLAGS	:lisp-type integer
		:vax-type  :unsigned-longword
		:mechanism :value
		:access :in)
  (REQID	:lisp-type integer
		:vax-type  :unsigned-longword
		:mechanism :value
		:access :in)
  (TIMOUT	:lisp-type integer
		:vax-type  :unsigned-longword
		:mechanism :value
		:access :in)
  (ASTADR	:lisp-type integer
		:vax-type  :unsigned-longword
		:mechanism :value
		:access :in)
  (ASTPRM	:lisp-type integer
		:vax-type  :unsigned-longword
		:mechanism :value
		:access :in))
 
 
(defun lisp$SYS_BRKTHRUW (EFN MSGBUF SENDTO SNDTYP CARCON FLAGS 
REQID TIMOUT ASTADR ASTPRM &optional IOSB)
  (declare (integer EFN))
  (declare (simple-string MSGBUF))
  (declare (simple-string SENDTO))
  (declare (integer SNDTYP))
  (declare (integer CARCON))
  (declare (integer FLAGS))
  (declare (integer REQID))
  (declare (integer TIMOUT))
  (declare (integer ASTADR))
  (declare (integer ASTPRM))
  (declare (integer IOSB))
     (call-out SYS$BRKTHRUW EFN MSGBUF SENDTO SNDTYP IOSB CARCON 
FLAGS REQID TIMOUT ASTADR ASTPRM)
			(values IOSB))
 
 
;;;
;;;  $CANCEL
;;;
;;;    Cancel I/O on Channel
;;;
;;;      $CANCEL  chan
;;;
;;;      chan   = number of the channel on which I/O is to be canceled
;;;                                    
(define-external-routine (SYS$CANCEL

		:result  
		        (:lisp-type integer :vax-type :longword))
  (CHAN		:lisp-type integer ; unsigned-byte 16
		:vax-type  :unsigned-word
		:mechanism :value
		:access :in))
 
 
(defun lisp$SYS_CANCEL (CHAN)
  (declare (fixnum CHAN))
     (call-out SYS$CANCEL CHAN))
 
 
;;;
;;;  $CANEXH
;;;
;;;    Cancel Exit Handler
;;;
;;;      $CANEXH  [desblk]             
;;;
;;;      desblk = address of exit control block describing exit handler
;;;               to be deleted.  If 0, delete all.
;;;
(define-external-routine (SYS$CANEXH

		:result  
		        (:lisp-type integer :vax-type :longword))
  (DESBLK	:lisp-type alien-structure
		:mechanism :reference
		:access :in))
 
 
(defun lisp$SYS_CANEXH (DESBLK)
     (call-out SYS$CANEXH DESBLK))
 
 
;;;
;;;  $CANTIM
;;;
;;;    Cancel Timer Request
;;;
;;;      $CANTIM  [reqidt] ,[acmode]
;;;                                          
;;;      reqidt = request identification for request  to  be  canceled.
;;;               If 0, all requests canceled.
;;;      acmode = access mode of requests to be canceled
;;;
(define-external-routine (SYS$CANTIM

		:result  
		        (:lisp-type integer :vax-type :longword))
  (REQIDT	:lisp-type integer
		:vax-type  :unsigned-longword
		:mechanism :value
		:access :in)
  (ACMODE	:lisp-type integer
		:vax-type  :unsigned-longword
		:mechanism :value
		:access :in))
 
 
(defun lisp$SYS_CANTIM (REQIDT ACMODE)
  (declare (integer REQIDT))
  (declare (integer ACMODE))
     (call-out SYS$CANTIM REQIDT ACMODE))
 
 
;;;
;;;  $CANWAK
;;;
;;;    Cancel Wakeup
;;;
;;;      $CANWAK  [pidadr] ,[prcnam]
;;;
;;;      pidadr = address of  process  identification  of  process  for
;;;               which wakeups are to be canceled
;;;      prcnam = address of process name string descriptor
;;;
(define-external-routine (SYS$CANWAK

		:result  
		        (:lisp-type integer :vax-type :longword))
  (PIDADR	:lisp-type integer
		:vax-type  :unsigned-longword
		:mechanism :reference
		:access :in-out)
  (PRCNAM	:lisp-type simple-string
		:vax-type  :text
		:mechanism :descriptor
		:access :in))
 
 
(defun lisp$SYS_CANWAK (PRCNAM &optional PIDADR)
  (declare (simple-string PRCNAM))
  (declare (integer PIDADR))
     (call-out SYS$CANWAK PIDADR PRCNAM)
			(values PIDADR))
 
 
;;;  $CHANGE_ACL
;;;
;;;    Set or modify an object's ACL
;;;
;;;	$CHANGE_ACL	[chan], objtyp, [objnam],
;;;			itmlst, [acmode], [iosb],
;;;			[contxt] , [routin], [orbadr]
;;;
;;;	chan   = number of a channel assigned to the object or
;;; 		 0 if object is specified by the objnam parameter
;;;
;;;	objtyp = address of an object type code
;;;
;;;	objnam = address of object name
;;;
;;;	itmlst = address of a list of item descriptors
;;;
;;;	acmode = address of a byte containing the access mode in
;;;		 which the arguments will be validated
;;;
;;;	iosb   = address of a quadword I/O status block
;;;
;;;	contxt = address of a context long word (used for iterative
;;;		 calls or a multi-entry item list)
;;;
;;;	routin = address of routine to be executed in kernel mode
;;;		 (obsolete)
;;;
;;;	orbadr = address of a user supplied ORB
;;;
(define-external-routine (SYS$CHANGE_ACL

		:result  
		        (:lisp-type integer :vax-type :longword))
  (CHAN		:lisp-type integer ; unsigned-byte 16
		:vax-type  :unsigned-word
		:mechanism :value
		:access :in)
  (OBJTYP	:lisp-type integer
		:vax-type  :unsigned-longword
		:mechanism :reference
		:access :in)
  (OBJNAM	:lisp-type simple-string
		:vax-type  :text
		:mechanism :descriptor
		:access :in)
  (ITMLST	:lisp-type alien-structure
		:mechanism :reference
		:access :in)
  (ACMODE	:lisp-type integer
		:vax-type  :unsigned-longword
		:mechanism :reference
		:access :in)
  (IOSB		:lisp-type integer
		:vax-type  :unsigned-quadword
		:mechanism :reference
		:access :in-out)
  (CONTXT	:lisp-type integer
		:vax-type  :unsigned-longword
		:mechanism :reference
		:access :in-out)
  (ROUTIN	:lisp-type integer
		:vax-type  :unsigned-longword
		:mechanism :value
		:access :in)
  (ORBADR	:lisp-type integer
		:vax-type  :unsigned-longword
		:mechanism :reference
		:access :in))
 
 
(defun lisp$SYS_CHANGE_ACL (CHAN OBJTYP OBJNAM ITMLST ACMODE ROUTIN 
ORBADR &optional IOSB CONTXT)
  (declare (fixnum CHAN))
  (declare (integer OBJTYP))
  (declare (simple-string OBJNAM))
  (declare (integer ACMODE))
  (declare (integer ROUTIN))
  (declare (integer ORBADR))
  (declare (integer IOSB))
  (declare (integer CONTXT))
     (call-out SYS$CHANGE_ACL CHAN OBJTYP OBJNAM ITMLST ACMODE IOSB 
CONTXT ROUTIN ORBADR)
			(values IOSB CONTXT))
 
 
;;;  $CHANGE_CLASS	objtyp, [objnam], itmlst
;;;			[acmode], [orbadr]
;;;
;;;    Modify an objects access class
;;;
;;;     objtyp = address of an object type code
;;;
;;;     objnam = address of an object name descriptor
;;;
;;;     itmlst = address of a list of item descriptors
;;;
;;;     acmode = address of a byte containing the access mode in
;;;		which the arguments will be validated
;;;
;;;     orbadr = address of routine to be executed in kernel mode
;;;
;;;
(define-external-routine (SYS$CHANGE_CLASS

		:result  
		        (:lisp-type integer :vax-type :longword))
  (OBJTYP	:lisp-type integer
		:vax-type  :unsigned-longword
		:mechanism :reference
		:access :in)
  (OBJNAM	:lisp-type simple-string
		:vax-type  :text
		:mechanism :descriptor
		:access :in)
  (ITMLST	:lisp-type alien-structure
		:mechanism :reference
		:access :in)
  (ACMODE	:lisp-type integer
		:vax-type  :unsigned-longword
		:mechanism :value
		:access :in)
  (ORBADR	:lisp-type integer
		:vax-type  :unsigned-longword
		:mechanism :reference
		:access :in))
 
 
(defun lisp$SYS_CHANGE_CLASS (OBJTYP OBJNAM ITMLST ACMODE ORBADR)
  (declare (integer OBJTYP))
  (declare (simple-string OBJNAM))
  (declare (integer ACMODE))
  (declare (integer ORBADR))
     (call-out SYS$CHANGE_CLASS OBJTYP OBJNAM ITMLST ACMODE ORBADR)
)
 
 
;;;  $CHECK_ACCESS
;;;
;;;    Check User Access to an Object
;;;
;;;     objtyp = address of an object type code
;;;
;;;     objnam = address of an object name descriptor
;;;
;;;     usrnam = address of a user name descriptor
;;;
;;;     itmlst = address of a list of item descriptors
;;;
;;;     orbadr = address of a user supplied ORB
;;;
(define-external-routine (SYS$CHECK_ACCESS

		:result  
		        (:lisp-type integer :vax-type :longword))
  (OBJTYP	:lisp-type integer
		:vax-type  :unsigned-longword
		:mechanism :reference
		:access :in)
  (OBJNAM	:lisp-type simple-string
		:vax-type  :text
		:mechanism :descriptor
		:access :in)
  (USRNAM	:lisp-type simple-string
		:vax-type  :text
		:mechanism :descriptor
		:access :in)
  (ITMLST	:lisp-type alien-structure
		:mechanism :reference
		:access :in)
  (ORBADR	:lisp-type integer
		:vax-type  :unsigned-longword
		:mechanism :reference
		:access :in))
 
 
(defun lisp$SYS_CHECK_ACCESS (OBJTYP OBJNAM USRNAM ITMLST ORBADR)
  (declare (integer OBJTYP))
  (declare (simple-string OBJNAM))
  (declare (simple-string USRNAM))
  (declare (integer ORBADR))
     (call-out SYS$CHECK_ACCESS OBJTYP OBJNAM USRNAM ITMLST ORBADR)
)
 
 
;;;
;;;  $CHKPRO
;;;
;;;	Check Access Protection
;;;
;;;      $CHKPRO itmlst
;;;
;;;	itmlst = address of a list of item descriptors
;;;
(define-external-routine (SYS$CHKPRO

		:result  
		        (:lisp-type integer :vax-type :longword))
  (ITMLST	:lisp-type alien-structure
		:mechanism :reference
		:access :in))
 
 
(defun lisp$SYS_CHKPRO (ITMLST)
     (call-out SYS$CHKPRO ITMLST))
 
 
;;;
;;;  $CLREF
;;;
;;;    Clear Event Flag
;;;
;;;      $CLREF efn
;;;
;;;      efn    = number of event flag to be cleared
;;;
(define-external-routine (SYS$CLREF

		:result  
		        (:lisp-type integer :vax-type :longword))
  (EFN		:lisp-type integer
		:vax-type  :unsigned-longword
		:mechanism :value
		:access :in))
 
 
(defun lisp$SYS_CLREF (EFN)
  (declare (integer EFN))
     (call-out SYS$CLREF EFN))
 
 
;;;
;;;  $CLOSE
;;;
;;;    Close File
;;;
;;;      $CLOSE fab, [err], [suc]
;;;
;;;      fab	= address of fab
;;;
;;;	err	= address of user error completion routine
;;;
;;;	suc	= address of user success completion routine
;;;                                    
(define-external-routine (SYS$CLOSE

		:result  
		        (:lisp-type integer :vax-type :longword))
  (FAB		:lisp-type alien-structure
		:mechanism :reference
		:access :in-out)
  (ERR		:lisp-type integer
		:vax-type  :unsigned-longword
		:mechanism :value
		:access :in)
  (SUC		:lisp-type integer
		:vax-type  :unsigned-longword
		:mechanism :value
		:access :in))
 
 
(defun lisp$SYS_CLOSE (ERR SUC &optional FAB)
  (declare (integer ERR))
  (declare (integer SUC))
     (call-out SYS$CLOSE FAB ERR SUC)
			(values FAB))
 
 
;;;
;;;  $CMEXEC
;;;
;;;    Change to Executive Mode
;;;
;;;      $CMEXEC  routin ,[arglst]
;;;
;;;      routin = address of the routine to be  executed  in  executive
;;;               mode
;;;      arglst = address of  argument  list  to  be  supplied  to  the
;;;               routine
;;;                                    
(define-external-routine (SYS$CMEXEC

		:result  
		        (:lisp-type integer :vax-type :longword))
  (ROUTIN	:lisp-type integer
		:vax-type  :unsigned-longword
		:mechanism :value
		:access :in)
  (ARGLST	:lisp-type alien-structure
		:mechanism :reference
		:access :in))
 
 
(defun lisp$SYS_CMEXEC (ROUTIN ARGLST)
  (declare (integer ROUTIN))
     (call-out SYS$CMEXEC ROUTIN ARGLST))
 
 
;;;  $CMKRNL
;;;
;;;    Change to Kernel Mode
;;;
;;;     $CMKRNL  routin ,[arglst]
;;;
;;;     routin = address of routine to be executed in kernel mode
;;;
;;;     arglst = address of argument list to be supplied to routine
;;;                                    
(define-external-routine (SYS$CMKRNL

		:result  
		        (:lisp-type integer :vax-type :longword))
  (ROUTIN	:lisp-type integer
		:vax-type  :unsigned-longword
		:mechanism :value
		:access :in)
  (ARGLST	:lisp-type alien-structure
		:mechanism :reference
		:access :in))
 
 
(defun lisp$SYS_CMKRNL (ROUTIN ARGLST)
  (declare (integer ROUTIN))
     (call-out SYS$CMKRNL ROUTIN ARGLST))
 
 
;;;
;;;  $CONNECT
;;;
;;;    Connect File
;;;
;;;      $CONNECT rab, [err], [suc]
;;;
;;;      rab	= address of rab
;;;
;;;	err	= address of user error completion routine
;;;
;;;	suc	= address of user success completion routine
;;;                                         
(define-external-routine (SYS$CONNECT

		:result  
		        (:lisp-type integer :vax-type :longword))
  (RAB		:lisp-type alien-structure
		:mechanism :reference
		:access :in-out)
  (ERR		:lisp-type integer
		:vax-type  :unsigned-longword
		:mechanism :value
		:access :in)
  (SUC		:lisp-type integer
		:vax-type  :unsigned-longword
		:mechanism :value
		:access :in))
 
 
(defun lisp$SYS_CONNECT (ERR SUC &optional RAB)
  (declare (integer ERR))
  (declare (integer SUC))
     (call-out SYS$CONNECT RAB ERR SUC)
			(values RAB))
 
 
;;;  $CNTREG
;;;
;;;    Contract Program/Control Region
;;;
;;;     $CNTREG  pagcnt ,[retadr] ,[acmode] ,[region]
;;;
;;;     pagcnt = number of pages to be deleted from end of region
;;;
;;;     retadr = address  of  2-longword  array  to  receive   virtual
;;;	     addresses of starting and ending page of deleted area
;;;
;;;     acmode = access mode for which service is performed
;;;
;;;     region = region indicator
;;;      0 -> program (P0) region   1 -> control (P1) region
;;;
(define-external-routine (SYS$CNTREG

		:result  
		        (:lisp-type integer :vax-type :longword))
  (PAGCNT	:lisp-type integer
		:vax-type  :unsigned-longword
		:mechanism :value
		:access :in)
  (RETADR	:lisp-type (unsigned-byte 32 (array (2)))
		:mechanism :reference
		:access :in-out)
  (ACMODE	:lisp-type integer
		:vax-type  :unsigned-longword
		:mechanism :value
		:access :in)
  (REGION	:lisp-type integer
		:vax-type  :byte
		:mechanism :value
		:access :in))
 
 
(defun lisp$SYS_CNTREG (PAGCNT ACMODE REGION &optional RETADR)
  (declare (integer PAGCNT))
  (declare (integer ACMODE))
  (declare (integer REGION))
     (call-out SYS$CNTREG PAGCNT RETADR ACMODE REGION)
			(values RETADR))
 
 
;;;
;;;  $CREATE
;;;
;;;    Create File
;;;
;;;      $CREATE fab, [err], [suc]
;;;
;;;      fab	= address of fab
;;;
;;;	err	= address of user error completion routine
;;;
;;;	suc	= address of user success completion routine
;;;                                    
(define-external-routine (SYS$CREATE

		:result  
		        (:lisp-type integer :vax-type :longword))
  (FAB		:lisp-type alien-structure
		:mechanism :reference
		:access :in-out)
  (ERR		:lisp-type integer
		:vax-type  :unsigned-longword
		:mechanism :value
		:access :in)
  (SUC		:lisp-type integer
		:vax-type  :unsigned-longword
		:mechanism :value
		:access :in))
 
 
(defun lisp$SYS_CREATE (ERR SUC &optional FAB)
  (declare (integer ERR))
  (declare (integer SUC))
     (call-out SYS$CREATE FAB ERR SUC)
			(values FAB))
 
 
;;;
;;;  $CREATEUID
;;;
;;;    Create a Universal Identifier
;;;
;;;	$CREATEUID UID
;;;
;;;	UID	= address of the 16 byte buffer to receive the UID.
;;;
(define-external-routine (SYS$CREATEUID

		:result  
		        (:lisp-type integer :vax-type :longword))
  (UID		:lisp-type integer
		:vax-type  :unsigned-longword
		:mechanism :reference
		:access :in))
 
 
(defun lisp$SYS_CREATEUID (UID)
  (declare (integer UID))
     (call-out SYS$CREATEUID UID))
 
 
;;;
;;;  $CREATE_RDB
;;;
;;;    Create The Rights Database
;;;
;;;	$CREATE_RDB [sysid]
;;;
;;;	sysid	= address of the quadword system identifier
;;;		  to store in the maintenance record
;;;
(define-external-routine (SYS$CREATE_RDB

		:result  
		        (:lisp-type integer :vax-type :longword))
  (SYSID	:lisp-type integer
		:vax-type  :unsigned-quadword
		:mechanism :reference
		:access :in))
 
 
(defun lisp$SYS_CREATE_RDB (SYSID)
  (declare (integer SYSID))
     (call-out SYS$CREATE_RDB SYSID))
 
 
;;;  $CRELNM
;;;
;;;    Create Logical Name
;;;
;;;     $CRELNM  [attr], tabnam, lognam, [acmode], [itemlist]
;;;
;;;     attr = address of logical name attributes
;;;
;;;	Attribute	Meaning
;;;	LNM$M_CONFINE   Logical name not to be copied into sub-process
;;;	LNM$M_NO_ALIAS  Logical name can not be aliased
;;;	LNM$M_CRELOG	Logical name created using $CRELOG
;;;
;;;     tabnam = address of logical name table string descriptor
;;;
;;;     lognam = address of logical name string descriptor
;;;
;;;     acmode = address of access mode for logical name
;;;
;;;     itmlst = address of a list of item descriptors
;;; 
(define-external-routine (SYS$CRELNM

		:result  
		        (:lisp-type integer :vax-type :longword))
  (ATTR		:lisp-type integer
		:vax-type  :unsigned-longword
		:mechanism :reference
		:access :in)
  (TABNAM	:lisp-type simple-string
		:vax-type  :text
		:mechanism :descriptor
		:access :in)
  (LOGNAM	:lisp-type simple-string
		:vax-type  :text
		:mechanism :descriptor
		:access :in)
  (ACMODE	:lisp-type integer ; unsigned-byte 8
		:vax-type  :byte
		:mechanism :reference
		:access :in)
  (ITMLST	:lisp-type alien-structure
		:mechanism :reference
		:access :in))
 
 
(defun lisp$SYS_CRELNM (ATTR TABNAM LOGNAM ACMODE ITMLST)
  (declare (integer ATTR))
  (declare (simple-string TABNAM))
  (declare (simple-string LOGNAM))
  (declare (fixnum ACMODE))
     (call-out SYS$CRELNM ATTR TABNAM LOGNAM ACMODE ITMLST))
 
 
;;;  $CRELNT
;;;
;;;    Create Logical Name Table
;;;
;;;     $CRELNT  [attr], [resnam], [reslen], [quota],
;;;	        [promsk], [tabnam], [acmode], [partab]
;;;
;;;     attr = address of logical name table attributes
;;;
;;;     resnam = address of descriptor of a buffer to receive the
;;;		    created table's name
;;;
;;;     reslen = address of word to recieve length of created table's
;;;		    name
;;;
;;;     quota = address of quota associated with logical name table
;;;
;;;     promsk = address of protection mask
;;;
;;;     tabnam = address of descriptor of logical name table name to be created 
;;;
;;;     partab = address of name of table parent string descriptor
;;; 
;;;     acmode = address of access mode for logical name
;;;
(define-external-routine (SYS$CRELNT

		:result  
		        (:lisp-type integer :vax-type :longword))
  (ATTR		:lisp-type integer
		:vax-type  :unsigned-longword
		:mechanism :reference
		:access :in)
  (RESNAM	:lisp-type simple-string
		:vax-type  :text
		:mechanism :descriptor
		:access :in-out)
  (RESLEN	:lisp-type integer ; unsigned-byte 16
		:vax-type  :unsigned-word
		:mechanism :reference
		:access :in-out)
  (QUOTA	:lisp-type integer
		:vax-type  :unsigned-longword
		:mechanism :reference
		:access :in)
  (PROMSK	:lisp-type integer ; unsigned-byte 16
		:vax-type  :unsigned-word
		:mechanism :reference
		:access :in)
  (TABNAM	:lisp-type simple-string
		:vax-type  :text
		:mechanism :descriptor
		:access :in)
  (PARTAB	:lisp-type simple-string
		:vax-type  :text
		:mechanism :descriptor
		:access :in)
  (ACMODE	:lisp-type integer ; unsigned-byte 8
		:vax-type  :byte
		:mechanism :reference
		:access :in))
 
 
(defun lisp$SYS_CRELNT (ATTR QUOTA PROMSK TABNAM PARTAB ACMODE &optional RESNAM 
RESLEN)
  (declare (integer ATTR))
  (declare (integer QUOTA))
  (declare (fixnum PROMSK))
  (declare (simple-string TABNAM))
  (declare (simple-string PARTAB))
  (declare (fixnum ACMODE))
  (declare (simple-string RESNAM))
  (declare (fixnum RESLEN))
     (call-out SYS$CRELNT ATTR RESNAM RESLEN QUOTA PROMSK TABNAM 
PARTAB ACMODE)
			(values RESNAM RESLEN))
 
 
;;;  $CRELOG
;;;
;;;    Create Logical Name
;;;
;;;     $CRELOG  [tblflg] ,lognam ,eqlnam ,[acmode]
;;;
;;;     tblflg = logical name table number
;;;       0 -> system (default)   1 -> group    2 -> process
;;;
;;;     lognam = address of logical name string descriptor
;;;
;;;     eqlnam = address of equivalence name string descriptor
;;;
;;;     acmode = access mode for logical name (process table only)
;;;
(define-external-routine (SYS$CRELOG

		:result  
		        (:lisp-type integer :vax-type :longword))
  (TBLFLG	:lisp-type integer
		:vax-type  :unsigned-longword
		:mechanism :value
		:access :in)
  (LOGNAM	:lisp-type simple-string
		:vax-type  :text
		:mechanism :descriptor
		:access :in)
  (EQLNAM	:lisp-type simple-string
		:vax-type  :text
		:mechanism :descriptor
		:access :in)
  (ACMODE	:lisp-type integer
		:vax-type  :unsigned-longword
		:mechanism :value
		:access :in))
 
 
(defun lisp$SYS_CRELOG (TBLFLG LOGNAM EQLNAM ACMODE)
  (declare (integer TBLFLG))
  (declare (simple-string LOGNAM))
  (declare (simple-string EQLNAM))
  (declare (integer ACMODE))
     (call-out SYS$CRELOG TBLFLG LOGNAM EQLNAM ACMODE))
 
 
;;;  $CREMBX
;;;
;;;    Create Mailbox and Assign Channel
;;;
;;;     $CREMBX  [prmflg] ,chan ,[maxmsg] ,[bufquo] ,[promsk] ,[acmode] ,[lognam]
;;;
;;;     prmflg = permanent flag
;;;       0 -> temporary (default)   1 -> permanent
;;;
;;;     chan   = address of word to receive channel
;;;
;;;     maxmsg = maximum message size that may be received
;;;
;;;     bufquo = number of bytes that can be used to buffer messages
;;;
;;;     promsk = protection mask
;;;
;;;     acmode = access mode of created mailbox
;;;
;;;     lognam = address of logical name string descriptor for mailbox
;;;
(define-external-routine (SYS$CREMBX

		:result  
		        (:lisp-type integer :vax-type :longword))
  (PRMFLG	:lisp-type integer
		:vax-type  :byte
		:mechanism :value
		:access :in)
  (CHAN		:lisp-type integer ; unsigned-byte 16
		:vax-type  :unsigned-word
		:mechanism :reference
		:access :in-out)
  (MAXMSG	:lisp-type integer
		:vax-type  :unsigned-longword
		:mechanism :value
		:access :in)
  (BUFQUO	:lisp-type integer
		:vax-type  :unsigned-longword
		:mechanism :value
		:access :in)
  (PROMSK	:lisp-type integer
		:vax-type  :unsigned-longword
		:mechanism :value
		:access :in)
  (ACMODE	:lisp-type integer
		:vax-type  :unsigned-longword
		:mechanism :value
		:access :in)
  (LOGNAM	:lisp-type simple-string
		:vax-type  :text
		:mechanism :descriptor
		:access :in))
 
 
(defun lisp$SYS_CREMBX (PRMFLG MAXMSG BUFQUO PROMSK ACMODE LOGNAM 
&optional CHAN)
  (declare (integer PRMFLG))
  (declare (integer MAXMSG))
  (declare (integer BUFQUO))
  (declare (integer PROMSK))
  (declare (integer ACMODE))
  (declare (simple-string LOGNAM))
  (declare (fixnum CHAN))
     (call-out SYS$CREMBX PRMFLG CHAN MAXMSG BUFQUO PROMSK ACMODE 
LOGNAM)
			(values CHAN))
 
 
;;;  $CREPRC
;;;
;;;    Create Process
;;;
;;;     $CREPRC  [pidadr] ,[image] ,[input] ,[output] ,[error] ,[prvadr]
;;;     ,[quota] ,[prcnam] ,[baspri] ,[uic] ,[mbxunt] ,[stsflg] ,[itmlst]
;;;
;;;     pidadr = address of longword to return id of created process
;;;
;;;     image  = address of string descriptor for image name
;;;
;;;     input  = address of string descriptor for SYS$INPUT
;;;
;;;     output = address of string descriptor for SYS$OUTPUT
;;;
;;;     error  = address of string descriptor for SYS$ERROR
;;;
;;;     prvadr = address of quadword privilege list
;;;
;;;     quota  = address of quota list
;;;
;;;     prcnam = address of string descriptor for process name
;;;
;;;     baspri = base priority (0-31)
;;;
;;;     uic    = user identification code.  If 0, create a subprocess
;;;
;;;     mbxunt = mailbox unit for termination message
;;;
;;;     stsflg = status and mode flag bits
;;;
;;;          Bit  Meaning
;;;
;;;           0   disable resource wait mode
;;;	     1   enable system service failure exception mode
;;;	     2   inhibit process swapping
;;;           3   disable accounting messages
;;;           4   batch process
;;;           5   cause created process to hibernate
;;;           6   allow login without authorization file check
;;;           7   process is a network connect object
;;;
;;;     itmlst = address of a list of item descriptors
;;;
(define-external-routine (SYS$CREPRC

		:result  
		        (:lisp-type integer :vax-type :longword))
  (PIDADR	:lisp-type integer
		:vax-type  :unsigned-longword
		:mechanism :reference
		:access :in-out)
  (IMAGE	:lisp-type simple-string
		:vax-type  :text
		:mechanism :descriptor
		:access :in)
  (INPUT	:lisp-type simple-string
		:vax-type  :text
		:mechanism :descriptor
		:access :in)
  (OUTPUT	:lisp-type simple-string
		:vax-type  :text
		:mechanism :descriptor
		:access :in)
  (ERROR	:lisp-type simple-string
		:vax-type  :text
		:mechanism :descriptor
		:access :in)
  (PRVADR	:lisp-type integer
		:vax-type  :unsigned-quadword
		:mechanism :reference
		:access :in)
  (QUOTA	:lisp-type alien-structure
		:mechanism :reference
		:access :in)
  (PRCNAM	:lisp-type simple-string
		:vax-type  :text
		:mechanism :descriptor
		:access :in)
  (BASPRI	:lisp-type integer
		:vax-type  :unsigned-longword
		:mechanism :value
		:access :in)
  (UIC		:lisp-type integer
		:vax-type  :unsigned-longword
		:mechanism :value
		:access :in)
  (MBXUNT	:lisp-type integer ; unsigned-byte 16
		:vax-type  :unsigned-word
		:mechanism :value
		:access :in)
  (STSFLG	:lisp-type integer
		:vax-type  :unsigned-longword
		:mechanism :value
		:access :in)
  (ITMLST	:lisp-type alien-structure
		:mechanism :reference
		:access :in))
 
 
(defun lisp$SYS_CREPRC (IMAGE INPUT OUTPUT ERROR PRVADR QUOTA PRCNAM 
BASPRI UIC MBXUNT STSFLG ITMLST &optional PIDADR)
  (declare (simple-string IMAGE))
  (declare (simple-string INPUT))
  (declare (simple-string OUTPUT))
  (declare (simple-string ERROR))
  (declare (integer PRVADR))
  (declare (simple-string PRCNAM))
  (declare (integer BASPRI))
  (declare (integer UIC))
  (declare (fixnum MBXUNT))
  (declare (integer STSFLG))
  (declare (integer PIDADR))
     (call-out SYS$CREPRC PIDADR IMAGE INPUT OUTPUT ERROR PRVADR 
QUOTA PRCNAM BASPRI UIC MBXUNT STSFLG ITMLST)
			(values PIDADR))
 
 
;;;  $CRETVA
;;;
;;;    Create Virtual Address Space
;;;
;;;     $CRETVA  inadr ,[retadr] ,[acmode]
;;;
;;;     inadr  = address of 2-longword array containing  starting  and
;;;              ending virtual address of pages to be created
;;;
;;;     retadr = address of a 2-longword array to receive starting and
;;;              ending virtual address of pages actually created
;;;
;;;     acmode = access  mode  for  the  new  pages   (protection   is
;;;              read/write for acmode and more privileged modes)
;;;                                    
(define-external-routine (SYS$CRETVA

		:result  
		        (:lisp-type integer :vax-type :longword))
  (INADR	:lisp-type (unsigned-byte 32 (array (2)))
		:mechanism :reference
		:access :in)
  (RETADR	:lisp-type (unsigned-byte 32 (array (2)))
		:mechanism :reference
		:access :in-out)
  (ACMODE	:lisp-type integer
		:vax-type  :unsigned-longword
		:mechanism :value
		:access :in))
 
 
(defun lisp$SYS_CRETVA (INADR ACMODE &optional RETADR)
  (declare (integer ACMODE))
     (call-out SYS$CRETVA INADR RETADR ACMODE)
			(values RETADR))
 
 
;;;  $CRMPSC
;;;
;;;    Create and Map Section
;;;
;;;     $CRMPSC  [inadr] ,[retadr] ,[acmode] ,[flags] ,[gsdnam] ,[ident]
;;;              ,[relpag] ,[chan] ,[pagcnt] ,[vbn] ,[prot] ,[pfc]
;;;
;;;     inadr  = address of 2-longword array containing  starting  and
;;;              ending virtual addresses of space to map section
;;;
;;;     retadr = address of  2-longword  array  to  receive  addresses
;;;              actually mapped
;;;
;;;     acmode = access mode of owner of pages
;;;
;;;     flags  = section characteristics
;;;
;;;       Flag         Meaning
;;;
;;;       SEC$M_GBL    Global section
;;;       SEC$M_CRF    Copy-on-reference pages
;;;       SEC$M_DZRO   Demand zero pages
;;;       SEC$M_EXPREG Find first available space
;;;       SEC$M_PERM   Permanent section
;;;       SEC$M_PFNMAP Physical page frame section
;;;       SEC$M_SYSGBL System global section
;;;       SEC$M_WRT    Read/write section
;;;
;;;     gsdnam = address of global section name string descriptor
;;;
;;;     ident  = address of quadword containing version id and match control
;;;
;;;     relpag = relative page number within section
;;;
;;;     chan   = number of channel on which file is accessed
;;;
;;;     pagcnt = number of pages in section
;;;
;;;     vbn    = virtual block  number  of  beginning  of  section  or
;;;              physical page frame number of beginning of section
;;;
;;;     prot   = protection mask
;;;
;;;     pfc    = page fault cluster size
;;;
(define-external-routine (SYS$CRMPSC

		:result  
		        (:lisp-type integer :vax-type :longword))
  (INADR	:lisp-type (unsigned-byte 32 (array (2)))
		:mechanism :reference
		:access :in)
  (RETADR	:lisp-type (unsigned-byte 32 (array (2)))
		:mechanism :reference
		:access :in-out)
  (ACMODE	:lisp-type integer
		:vax-type  :unsigned-longword
		:mechanism :value
		:access :in)
  (FLAGS	:lisp-type integer
		:vax-type  :unsigned-longword
		:mechanism :value
		:access :in)
  (GSDNAM	:lisp-type simple-string
		:vax-type  :text
		:mechanism :descriptor
		:access :in)
  (IDENT	:lisp-type integer
		:vax-type  :unsigned-quadword
		:mechanism :reference
		:access :in)
  (RELPAG	:lisp-type integer
		:vax-type  :unsigned-longword
		:mechanism :value
		:access :in)
  (CHAN		:lisp-type integer ; unsigned-byte 16
		:vax-type  :unsigned-word
		:mechanism :value
		:access :in)
  (PAGCNT	:lisp-type integer
		:vax-type  :unsigned-longword
		:mechanism :value
		:access :in)
  (VBN		:lisp-type integer
		:vax-type  :unsigned-longword
		:mechanism :value
		:access :in)
  (PROT		:lisp-type integer
		:vax-type  :unsigned-longword
		:mechanism :value
		:access :in)
  (PFC		:lisp-type integer
		:vax-type  :unsigned-longword
		:mechanism :value
		:access :in))
 
 
(defun lisp$SYS_CRMPSC (INADR ACMODE FLAGS GSDNAM IDENT RELPAG CHAN 
PAGCNT VBN PROT PFC &optional RETADR)
  (declare (integer ACMODE))
  (declare (integer FLAGS))
  (declare (simple-string GSDNAM))
  (declare (integer IDENT))
  (declare (integer RELPAG))
  (declare (fixnum CHAN))
  (declare (integer PAGCNT))
  (declare (integer VBN))
  (declare (integer PROT))
  (declare (integer PFC))
     (call-out SYS$CRMPSC INADR RETADR ACMODE FLAGS GSDNAM IDENT 
RELPAG CHAN PAGCNT VBN PROT PFC)
			(values RETADR))
 
 
;;;  $DACEFC
;;;
;;;    Disassociate Common Event Flag Cluster
;;;
;;;     $DACEFC  efn
;;;
;;;     efn    = number of any event flag in the cluster
;;;
(define-external-routine (SYS$DACEFC

		:result  
		        (:lisp-type integer :vax-type :longword))
  (EFN		:lisp-type integer
		:vax-type  :unsigned-longword
		:mechanism :value
		:access :in))
 
 
(defun lisp$SYS_DACEFC (EFN)
  (declare (integer EFN))
     (call-out SYS$DACEFC EFN))
 
 
;;;  $DALLOC
;;;
;;;    Deallocate Device
;;;
;;;     $DALLOC  [devnam] ,[acmode]
;;;
;;;     devnam = address of device name descriptor.  If 0, deallocate all
;;;
;;;     acmode = access mode associated with device
;;;
(define-external-routine (SYS$DALLOC

		:result  
		        (:lisp-type integer :vax-type :longword))
  (DEVNAM	:lisp-type simple-string
		:vax-type  :text
		:mechanism :descriptor
		:access :in)
  (ACMODE	:lisp-type integer
		:vax-type  :unsigned-longword
		:mechanism :value
		:access :in))
 
 
(defun lisp$SYS_DALLOC (DEVNAM ACMODE)
  (declare (simple-string DEVNAM))
  (declare (integer ACMODE))
     (call-out SYS$DALLOC DEVNAM ACMODE))
 
 
;;;  $DASSGN
;;;
;;;    Deassign I/O Channel
;;;
;;;     $DASSGN  chan
;;;
;;;     chan   = number of channel to be deassigned
;;;                                    
(define-external-routine (SYS$DASSGN

		:result  
		        (:lisp-type integer :vax-type :longword))
  (CHAN		:lisp-type integer ; unsigned-byte 16
		:vax-type  :unsigned-word
		:mechanism :value
		:access :in))
 
 
(defun lisp$SYS_DASSGN (CHAN)
  (declare (fixnum CHAN))
     (call-out SYS$DASSGN CHAN))
 
 
;;;
;;;  $DECLARE_RM	[efn], [flags], iosb, [astadr], [astprm], rm_name,
;;;    ($DECLARE_RMW)		rm_id, evt_rtn, [acmode]
;;;
;;;    Declare Resource Manager to DDTM
;;;
;;;	efn	= event flag to set upon completion
;;;	flags	= operation flags
;;;	iosb	= address of I/O status block
;;;	astadr	= address of entry mask of AST routine
;;;	astprm	= value to be passed to AST routine
;;;	rm_name	= address of resource manager name descriptor
;;;	rm_id	= address of longword to receive resource manager id
;;;	evt_rtn	= address of entry mask of transaction event routine
;;;	acmode	= value of access mode in which to invoke evt_rtn
;;;
(define-external-routine (SYS$DECLARE_RM

		:result  
		        (:lisp-type integer :vax-type :longword))
  (EFN		:lisp-type integer
		:vax-type  :unsigned-longword
		:mechanism :value
		:access :in)
  (FLAGS	:lisp-type integer
		:vax-type  :unsigned-longword
		:mechanism :value
		:access :in)
  (IOSB		:lisp-type integer
		:vax-type  :unsigned-quadword
		:mechanism :reference
		:access :in-out)
  (ASTADR	:lisp-type integer
		:vax-type  :unsigned-longword
		:mechanism :value
		:access :in)
  (ASTPRM	:lisp-type integer
		:vax-type  :unsigned-longword
		:mechanism :value
		:access :in)
  (RM_NAME	:lisp-type simple-string
		:vax-type  :text
		:mechanism :descriptor
		:access :in)
  (RM_ID	:lisp-type integer
		:vax-type  :unsigned-longword
		:mechanism :reference
		:access :in-out)
  (EVT_RTN	:lisp-type integer
		:vax-type  :unsigned-longword
		:mechanism :value
		:access :in)
  (ACMODE	:lisp-type integer ; unsigned-byte 8
		:vax-type  :byte
		:mechanism :value
		:access :in))
 
 
(defun lisp$SYS_DECLARE_RM (EFN FLAGS ASTADR ASTPRM RM_NAME EVT_RTN 
ACMODE &optional IOSB RM_ID)
  (declare (integer EFN))
  (declare (integer FLAGS))
  (declare (integer ASTADR))
  (declare (integer ASTPRM))
  (declare (simple-string RM_NAME))
  (declare (integer EVT_RTN))
  (declare (fixnum ACMODE))
  (declare (integer IOSB))
  (declare (integer RM_ID))
     (call-out SYS$DECLARE_RM EFN FLAGS IOSB ASTADR ASTPRM RM_NAME 
RM_ID EVT_RTN ACMODE)
			(values IOSB RM_ID))
 
 
(define-external-routine (SYS$DECLARE_RMW

		:result  
		        (:lisp-type integer :vax-type :longword))
  (EFN		:lisp-type integer
		:vax-type  :unsigned-longword
		:mechanism :value
		:access :in)
  (FLAGS	:lisp-type integer
		:vax-type  :unsigned-longword
		:mechanism :value
		:access :in)
  (IOSB		:lisp-type integer
		:vax-type  :unsigned-quadword
		:mechanism :reference
		:access :in-out)
  (ASTADR	:lisp-type integer
		:vax-type  :unsigned-longword
		:mechanism :value
		:access :in)
  (ASTPRM	:lisp-type integer
		:vax-type  :unsigned-longword
		:mechanism :value
		:access :in)
  (RM_NAME	:lisp-type simple-string
		:vax-type  :text
		:mechanism :descriptor
		:access :in)
  (RM_ID	:lisp-type integer
		:vax-type  :unsigned-longword
		:mechanism :reference
		:access :in-out)
  (EVT_RTN	:lisp-type integer
		:vax-type  :unsigned-longword
		:mechanism :value
		:access :in)
  (ACMODE	:lisp-type integer ; unsigned-byte 8
		:vax-type  :byte
		:mechanism :value
		:access :in))
 
 
(defun lisp$SYS_DECLARE_RMW (EFN FLAGS ASTADR ASTPRM RM_NAME EVT_RTN 
ACMODE &optional IOSB RM_ID)
  (declare (integer EFN))
  (declare (integer FLAGS))
  (declare (integer ASTADR))
  (declare (integer ASTPRM))
  (declare (simple-string RM_NAME))
  (declare (integer EVT_RTN))
  (declare (fixnum ACMODE))
  (declare (integer IOSB))
  (declare (integer RM_ID))
     (call-out SYS$DECLARE_RMW EFN FLAGS IOSB ASTADR ASTPRM RM_NAME 
RM_ID EVT_RTN ACMODE)
			(values IOSB RM_ID))
 
 
;;;  $DCLAST
;;;
;;;    Declare AST
;;;
;;;     $DCLAST  astadr ,[astprm] ,[acmode]
;;;
;;;     astadr = address of entry mask of AST routine
;;;
;;;     astprm = value to be passed to AST routine
;;;
;;;     acmode = access mode for which the AST is to be declared
;;;
(define-external-routine (SYS$DCLAST

		:result  
		        (:lisp-type integer :vax-type :longword))
  (ASTADR	:lisp-type integer
		:vax-type  :unsigned-longword
		:mechanism :value
		:access :in)
  (ASTPRM	:lisp-type integer
		:vax-type  :unsigned-longword
		:mechanism :value
		:access :in)
  (ACMODE	:lisp-type integer
		:vax-type  :unsigned-longword
		:mechanism :value
		:access :in))
 
 
(defun lisp$SYS_DCLAST (ASTADR ASTPRM ACMODE)
  (declare (integer ASTADR))
  (declare (integer ASTPRM))
  (declare (integer ACMODE))
     (call-out SYS$DCLAST ASTADR ASTPRM ACMODE))
 
 
;;;  $DCLCMH
;;;
;;;    Declare Change Mode or Compatibility Mode Handler
;;;
;;;     $DCLCMH  addres ,[prvhnd] ,[type]
;;;
;;;     addres = address of handler
;;;
;;;     prvhnd = address of longword to receive previous handler address
;;;
;;;     type   = handler type indicator
;;;               0 -> change mode (current mode)   1 -> compatibility mode
;;;                                                              
(define-external-routine (SYS$DCLCMH

		:result  
		        (:lisp-type integer :vax-type :longword))
  (ADDRES	:lisp-type integer
		:vax-type  :unsigned-longword
		:mechanism :value
		:access :in)
  (PRVHND	:lisp-type integer
		:vax-type  :unsigned-longword
		:mechanism :reference
		:access :in-out)
  (TYPE		:lisp-type integer
		:vax-type  :byte
		:mechanism :value
		:access :in))
 
 
(defun lisp$SYS_DCLCMH (ADDRES TYPE &optional PRVHND)
  (declare (integer ADDRES))
  (declare (integer TYPE))
  (declare (integer PRVHND))
     (call-out SYS$DCLCMH ADDRES PRVHND TYPE)
			(values PRVHND))
 
 
;;;  $DCLEXH
;;;
;;;    Declare Exit Handler
;;;
;;;     $DCLEXH  desblk
;;;
;;;     desblk = address of exit control block containing:
;;;
;;;      +-------------------------------+
;;;      |         forward link          |
;;;      +-------------------------------+
;;;      |     exit handler address      |
;;;      +-------------------------------+
;;;      |        argument count         |
;;;      +-------------------------------+
;;;      |   address to store reason     |
;;;      +-------------------------------+
;;;      |     additional arguments      |
;;;      +--      for exit handler,    --+
;;;      |            if any             |
;;;      +-------------------------------+
;;;                                    
(define-external-routine (SYS$DCLEXH

		:result  
		        (:lisp-type integer :vax-type :longword))
  (DESBLK	:lisp-type alien-structure
		:mechanism :reference
		:access :in))
 
 
(defun lisp$SYS_DCLEXH (DESBLK)
     (call-out SYS$DCLEXH DESBLK))
 
 
;;;
;;;  $DELETE
;;;
;;;    Delete Record
;;;
;;;      $DELETE rab, [err], [suc]
;;;
;;;      rab	= address of rab
;;;
;;;	err	= address of user error completion routine
;;;
;;;	suc	= address of user success completion routine
;;;
(define-external-routine (SYS$DELETE

		:result  
		        (:lisp-type integer :vax-type :longword))
  (RAB		:lisp-type alien-structure
		:mechanism :reference
		:access :in-out)
  (ERR		:lisp-type integer
		:vax-type  :unsigned-longword
		:mechanism :value
		:access :in)
  (SUC		:lisp-type integer
		:vax-type  :unsigned-longword
		:mechanism :value
		:access :in))
 
 
(defun lisp$SYS_DELETE (ERR SUC &optional RAB)
  (declare (integer ERR))
  (declare (integer SUC))
     (call-out SYS$DELETE RAB ERR SUC)
			(values RAB))
 
 
;;;  $DELLNM
;;;
;;;    Delete Logical Name and/or Table
;;;
;;;     $DELLNM  [tabnam], [lognam], [acmode]
;;;
;;;     tabnam = address of descriptor of logical name table name string
;;;
;;;     lognam = address of descriptor of logical name string
;;;
;;;     acmode = address of access mode for logical name
;;; 
(define-external-routine (SYS$DELLNM

		:result  
		        (:lisp-type integer :vax-type :longword))
  (TABNAM	:lisp-type simple-string
		:vax-type  :text
		:mechanism :descriptor
		:access :in)
  (LOGNAM	:lisp-type simple-string
		:vax-type  :text
		:mechanism :descriptor
		:access :in)
  (ACMODE	:lisp-type integer ; unsigned-byte 8
		:vax-type  :byte
		:mechanism :reference
		:access :in))
 
 
(defun lisp$SYS_DELLNM (TABNAM LOGNAM ACMODE)
  (declare (simple-string TABNAM))
  (declare (simple-string LOGNAM))
  (declare (fixnum ACMODE))
     (call-out SYS$DELLNM TABNAM LOGNAM ACMODE))
 
 
;;;  $DELLOG
;;;
;;;    Delete Logical Name
;;;
;;;     $DELLOG  [tblflg] ,[lognam] ,[acmode]
;;;
;;;     tblflg = logical name table number
;;;                0 -> system   1 -> group   2 -> process
;;;
;;;     lognam = address of logical name string descriptor.  If 0,
;;;              delete all names
;;;
;;;     acmode = access mode of logical name (process table only)
;;;
(define-external-routine (SYS$DELLOG

		:result  
		        (:lisp-type integer :vax-type :longword))
  (TBLFLG	:lisp-type integer
		:vax-type  :unsigned-longword
		:mechanism :value
		:access :in)
  (LOGNAM	:lisp-type simple-string
		:vax-type  :text
		:mechanism :descriptor
		:access :in)
  (ACMODE	:lisp-type integer
		:vax-type  :unsigned-longword
		:mechanism :value
		:access :in))
 
 
(defun lisp$SYS_DELLOG (TBLFLG LOGNAM ACMODE)
  (declare (integer TBLFLG))
  (declare (simple-string LOGNAM))
  (declare (integer ACMODE))
     (call-out SYS$DELLOG TBLFLG LOGNAM ACMODE))
 
 
;;;  $DELMBX
;;;
;;;    Delete Mailbox
;;;
;;;     $DELMBX  chan
;;;
;;;     chan   = channel number assigned to the mailbox
;;;
(define-external-routine (SYS$DELMBX

		:result  
		        (:lisp-type integer :vax-type :longword))
  (CHAN		:lisp-type integer ; unsigned-byte 16
		:vax-type  :unsigned-word
		:mechanism :value
		:access :in))
 
 
(defun lisp$SYS_DELMBX (CHAN)
  (declare (fixnum CHAN))
     (call-out SYS$DELMBX CHAN))
 
 
;;;  $DELPRC
;;;
;;;    Delete Process
;;;
;;;     $DELPRC  [pidadr] ,[prcnam]
;;;
;;;     pidadr = address of longword containing id of process to be deleted
;;;
;;;     prcnam = address of string descriptor for process name to be deleted
;;;
(define-external-routine (SYS$DELPRC

		:result  
		        (:lisp-type integer :vax-type :longword))
  (PIDADR	:lisp-type integer
		:vax-type  :unsigned-longword
		:mechanism :reference
		:access :in-out)
  (PRCNAM	:lisp-type simple-string
		:vax-type  :text
		:mechanism :descriptor
		:access :in))
 
 
(defun lisp$SYS_DELPRC (PRCNAM &optional PIDADR)
  (declare (simple-string PRCNAM))
  (declare (integer PIDADR))
     (call-out SYS$DELPRC PIDADR PRCNAM)
			(values PIDADR))
 
 
;;;  $DELTVA
;;;
;;;    Delete Virtual Address Space
;;;
;;;     $DELTVA  inadr ,[retadr] ,[acmode]
;;;
;;;     inadr  = address of 2-longword array containing  starting  and
;;;              ending virtual addresses of pages to delete
;;;
;;;     retadr = address of 2-longword array to receive  starting  and
;;;              ending addresses of pages actually deleted
;;;
;;;     acmode = access mode for which service is performed
;;;
(define-external-routine (SYS$DELTVA

		:result  
		        (:lisp-type integer :vax-type :longword))
  (INADR	:lisp-type (unsigned-byte 32 (array (2)))
		:mechanism :reference
		:access :in)
  (RETADR	:lisp-type (unsigned-byte 32 (array (2)))
		:mechanism :reference
		:access :in-out)
  (ACMODE	:lisp-type integer
		:vax-type  :unsigned-longword
		:mechanism :value
		:access :in))
 
 
(defun lisp$SYS_DELTVA (INADR ACMODE &optional RETADR)
  (declare (integer ACMODE))
     (call-out SYS$DELTVA INADR RETADR ACMODE)
			(values RETADR))
 
 
;;;  $DEQ
;;;
;;;    Dequeue Lock
;;;
;;;     $DEQ  [lkid] ,[valblk] ,[acmode] ,[flags]
;;;
;;;     lkid   = lock ID of the lock to be dequeued
;;;
;;;     valblk = address of the lock value block
;;;
;;;     acmode = access mode of the locks to be dequeued
;;;
;;;     flags  = optional flags.
;;;
;;;                   LCK$M_DEQALL
;;;
(define-external-routine (SYS$DEQ

		:result  
		        (:lisp-type integer :vax-type :longword))
  (LKID		:lisp-type integer
		:vax-type  :unsigned-longword
		:mechanism :value
		:access :in)
  (VALBLK	:lisp-type alien-structure
		:mechanism :reference
		:access :in-out)
  (ACMODE	:lisp-type integer
		:vax-type  :unsigned-longword
		:mechanism :value
		:access :in)
  (FLAGS	:lisp-type integer
		:vax-type  :unsigned-longword
		:mechanism :value
		:access :in))
 
 
(defun lisp$SYS_DEQ (LKID ACMODE FLAGS &optional VALBLK)
  (declare (integer LKID))
  (declare (integer ACMODE))
  (declare (integer FLAGS))
     (call-out SYS$DEQ LKID VALBLK ACMODE FLAGS)
			(values VALBLK))
 
 
;;;  $DEVICE_SCAN
;;;
;;;    Wildcard device scan
;;;
;;;     $DEVICE_SCAN  return_devnam, retlen, [search_devnam], [itmlst], [contxt]
;;;
;;;     return_devnam = address of descriptor of returned device name buffer
;;;
;;;     retlen        = address to store length of device name returned
;;;
;;;     search_devnam = address of descriptor of search device name
;;;
;;;     itmlst        = address of a list of item descriptors
;;;
;;;     contxt        = address of quadword context structures
;;;
;;;
(define-external-routine (SYS$DEVICE_SCAN

		:result  
		        (:lisp-type integer :vax-type :longword))
  (RETURN_DEVNAM	:lisp-type simple-string
		:vax-type  :text
		:mechanism :descriptor
		:access :in-out)
  (RETLEN	:lisp-type integer ; unsigned-byte 16
		:vax-type  :unsigned-word
		:mechanism :reference
		:access :in-out)
  (SEARCH_DEVNAM	:lisp-type simple-string
		:vax-type  :text
		:mechanism :descriptor
		:access :in)
  (ITMLST	:lisp-type alien-structure
		:mechanism :reference
		:access :in)
  (CONTXT	:lisp-type integer
		:vax-type  :unsigned-quadword
		:mechanism :reference
		:access :in-out))
 
 
(defun lisp$SYS_DEVICE_SCAN (SEARCH_DEVNAM ITMLST &optional RETURN_DEVNAM 
RETLEN CONTXT)
  (declare (simple-string SEARCH_DEVNAM))
  (declare (simple-string RETURN_DEVNAM))
  (declare (fixnum RETLEN))
  (declare (integer CONTXT))
     (call-out SYS$DEVICE_SCAN RETURN_DEVNAM RETLEN SEARCH_DEVNAM 
ITMLST CONTXT)
			(values RETURN_DEVNAM RETLEN CONTXT))
 
 
;;;  $DGBLSC
;;;
;;;    Delete Global Section
;;;
;;;     $DGBLSC  [flags] ,gsdnam ,[ident]
;;;
;;;     flags  = type of section
;;;                0 -> group section   SEC$M_SYSGBL -> system section
;;;
;;;     gsdnam = address of global section name string descriptor
;;;
;;;     ident  = address of quadword containing version id and match control
;;;                                    
(define-external-routine (SYS$DGBLSC

		:result  
		        (:lisp-type integer :vax-type :longword))
  (FLAGS	:lisp-type integer
		:vax-type  :unsigned-longword
		:mechanism :value
		:access :in)
  (GSDNAM	:lisp-type simple-string
		:vax-type  :text
		:mechanism :descriptor
		:access :in)
  (IDENT	:lisp-type integer
		:vax-type  :unsigned-quadword
		:mechanism :reference
		:access :in))
 
 
(defun lisp$SYS_DGBLSC (FLAGS GSDNAM IDENT)
  (declare (integer FLAGS))
  (declare (simple-string GSDNAM))
  (declare (integer IDENT))
     (call-out SYS$DGBLSC FLAGS GSDNAM IDENT))
 
 
;;;
;;;  $DISCONNECT
;;;
;;;    Disconnect Record Stream
;;;
;;;      $DISCONNECT rab, [err], [suc]
;;;
;;;      rab	= address of rab
;;;
;;;	err	= address of user error completion routine
;;;
;;;	suc	= address of user success completion routine
;;;                                    
(define-external-routine (SYS$DISCONNECT

		:result  
		        (:lisp-type integer :vax-type :longword))
  (RAB		:lisp-type alien-structure
		:mechanism :reference
		:access :in-out)
  (ERR		:lisp-type integer
		:vax-type  :unsigned-longword
		:mechanism :value
		:access :in)
  (SUC		:lisp-type integer
		:vax-type  :unsigned-longword
		:mechanism :value
		:access :in))
 
 
(defun lisp$SYS_DISCONNECT (ERR SUC &optional RAB)
  (declare (integer ERR))
  (declare (integer SUC))
     (call-out SYS$DISCONNECT RAB ERR SUC)
			(values RAB))
 
 
;;;  $DISMOU
;;;
;;;    Dismount Volume
;;;
;;;     $DISMOU devnam ,[flags]
;;;
;;;     devnam = address of device name string descriptor
;;;
;;;     flags  = 32-bit status mask  selecting options for  the  dismount
;;;              The  symbols  for  the flags are  defined by the $DMTDEF
;;;              macro.
;;;
;;;               Flag      Meaning
;;;
;;;           DMT$M_NOUNLOAD   Do not unload the volume.
;;;
;;;           DMT$M_UNIT       Dismount the specified device, rather
;;;                            than the entire volume set.
;;;                                    
(define-external-routine (SYS$DISMOU

		:result  
		        (:lisp-type integer :vax-type :longword))
  (DEVNAM	:lisp-type simple-string
		:vax-type  :text
		:mechanism :descriptor
		:access :in)
  (FLAGS	:lisp-type integer
		:vax-type  :unsigned-longword
		:mechanism :value
		:access :in))
 
 
(defun lisp$SYS_DISMOU (DEVNAM FLAGS)
  (declare (simple-string DEVNAM))
  (declare (integer FLAGS))
     (call-out SYS$DISMOU DEVNAM FLAGS))
 
 
;;;
;;;  $DISPLAY
;;;
;;;    Display File
;;;
;;;      $DISPLAY fab, [err], [suc]
;;;
;;;      fab	= address of fab
;;;
;;;	err	= address of user error completion routine
;;;
;;;	suc	= address of user success completion routine
;;;
(define-external-routine (SYS$DISPLAY

		:result  
		        (:lisp-type integer :vax-type :longword))
  (FAB		:lisp-type alien-structure
		:mechanism :reference
		:access :in-out)
  (ERR		:lisp-type integer
		:vax-type  :unsigned-longword
		:mechanism :value
		:access :in)
  (SUC		:lisp-type integer
		:vax-type  :unsigned-longword
		:mechanism :value
		:access :in))
 
 
(defun lisp$SYS_DISPLAY (ERR SUC &optional FAB)
  (declare (integer ERR))
  (declare (integer SUC))
     (call-out SYS$DISPLAY FAB ERR SUC)
			(values FAB))
 
 
;;;  $DLCEFC
;;;
;;;    Delete Common Event Flag Cluster
;;;
;;;     $DLCEFC  name
;;;
;;;     name   = address of cluster name string descriptor
;;;
(define-external-routine (SYS$DLCEFC

		:result  
		        (:lisp-type integer :vax-type :longword))
  (NAME		:lisp-type simple-string
		:vax-type  :text
		:mechanism :descriptor
		:access :in))
 
 
(defun lisp$SYS_DLCEFC (NAME)
  (declare (simple-string NAME))
     (call-out SYS$DLCEFC NAME))
 
 
;;;  $DNS
;;;
;;;    DNS Clerk system service
;;;
;;;     $DNS     [efn], func , itmlst, [dnsb] ,[astadr] ,[astprm]
;;;     ($DNSW)
;;;                    
;;;     efn    = number of event flag to set on completion
;;;
;;;     func   = function code specifying action to be performed
;;;
;;;     itmlst = address of a list of item descriptors
;;;          
;;;     dnsb   = address of quadword I/O status block to receive final
;;;              completion status
;;;
;;;     astadr = address of entry mask of AST routine
;;;
;;;     astprm = value to be passed to AST routine as argument
;;;
(define-external-routine (SYS$DNS

		:result  
		        (:lisp-type integer :vax-type :longword))
  (EFN		:lisp-type integer
		:vax-type  :unsigned-longword
		:mechanism :value
		:access :in)
  (FUNC		:lisp-type integer
		:vax-type  :unsigned-longword
		:mechanism :value
		:access :in)
  (ITMLST	:lisp-type alien-structure
		:mechanism :reference
		:access :in)
  (DNSB		:lisp-type integer
		:vax-type  :unsigned-quadword
		:mechanism :reference
		:access :in-out)
  (ASTADR	:lisp-type integer
		:vax-type  :unsigned-longword
		:mechanism :value
		:access :in)
  (ASTPRM	:lisp-type integer
		:vax-type  :unsigned-longword
		:mechanism :value
		:access :in))
 
 
(defun lisp$SYS_DNS (EFN FUNC ITMLST ASTADR ASTPRM &optional DNSB)
  (declare (integer EFN))
  (declare (integer FUNC))
  (declare (integer ASTADR))
  (declare (integer ASTPRM))
  (declare (integer DNSB))
     (call-out SYS$DNS EFN FUNC ITMLST DNSB ASTADR ASTPRM)
			(values DNSB))
 
 
(define-external-routine (SYS$DNSW

		:result  
		        (:lisp-type integer :vax-type :longword))
  (EFN		:lisp-type integer
		:vax-type  :unsigned-longword
		:mechanism :value
		:access :in)
  (FUNC		:lisp-type integer
		:vax-type  :unsigned-longword
		:mechanism :value
		:access :in)
  (ITMLST	:lisp-type alien-structure
		:mechanism :reference
		:access :in)
  (DNSB		:lisp-type integer
		:vax-type  :unsigned-quadword
		:mechanism :reference
		:access :in-out)
  (ASTADR	:lisp-type integer
		:vax-type  :unsigned-longword
		:mechanism :value
		:access :in)
  (ASTPRM	:lisp-type integer
		:vax-type  :unsigned-longword
		:mechanism :value
		:access :in))
 
 
(defun lisp$SYS_DNSW (EFN FUNC ITMLST ASTADR ASTPRM &optional DNSB)
  (declare (integer EFN))
  (declare (integer FUNC))
  (declare (integer ASTADR))
  (declare (integer ASTPRM))
  (declare (integer DNSB))
     (call-out SYS$DNSW EFN FUNC ITMLST DNSB ASTADR ASTPRM)
			(values DNSB))
 
 
;;;
;;;  $EMAA
;;;
;;;    Call Entity Management Assist Agent
;;;
;;;	$EMAA
;;;
(define-external-routine (SYS$EMAA

		:result  
		        (:lisp-type integer :vax-type :longword))
  (ARGLIST	:lisp-type simple-string
		:vax-type  :text
		:mechanism :descriptor
		:access :in)
  (INVOKEID	:lisp-type integer
		:vax-type  :unsigned-longword
		:mechanism :reference
		:access :in))
 
 
(defun lisp$SYS_EMAA (ARGLIST INVOKEID)
  (declare (simple-string ARGLIST))
  (declare (integer INVOKEID))
     (call-out SYS$EMAA ARGLIST INVOKEID))
 
 
;;;
;;;  $END_TRANS
;;;
;;;    Commit a transaction
;;;
;;;	$END_TRANS	[efn], [flags], iosb, [astadr], [astprm], [tid]
;;;	  ($END_TRANSW)
;;;
;;;	efn	= event flag to be set at completion
;;;	flags	= operation flags
;;;	iosb	= address of a quadword I/O status block
;;;	astadr	= address of an entry mask of AST routine
;;;	astprm	= value to be passed to AST routine as an argument
;;;	tid	= identifier of transaction to be committed
;;;
(define-external-routine (SYS$END_TRANS

		:result  
		        (:lisp-type integer :vax-type :longword))
  (EFN		:lisp-type integer
		:vax-type  :unsigned-longword
		:mechanism :value
		:access :in)
  (FLAGS	:lisp-type integer
		:vax-type  :unsigned-longword
		:mechanism :value
		:access :in)
  (IOSB		:lisp-type integer
		:vax-type  :unsigned-quadword
		:mechanism :reference
		:access :in-out)
  (ASTADR	:lisp-type integer
		:vax-type  :unsigned-longword
		:mechanism :value
		:access :in)
  (ASTPRM	:lisp-type integer
		:vax-type  :unsigned-longword
		:mechanism :value
		:access :in)
  (TID		:lisp-type integer
		:vax-type  :unsigned-quadword ; :unsigned-octaword ??
		:mechanism :reference
		:access :in))
 
 
(defun lisp$SYS_END_TRANS (EFN FLAGS ASTADR ASTPRM TID &optional IOSB)
  (declare (integer EFN))
  (declare (integer FLAGS))
  (declare (integer ASTADR))
  (declare (integer ASTPRM))
  (declare (integer TID))
  (declare (integer IOSB))
     (call-out SYS$END_TRANS EFN FLAGS IOSB ASTADR ASTPRM TID)
			(values IOSB))
 
 
(define-external-routine (SYS$END_TRANSW

		:result  
		        (:lisp-type integer :vax-type :longword))
  (EFN		:lisp-type integer
		:vax-type  :unsigned-longword
		:mechanism :value
		:access :in)
  (FLAGS	:lisp-type integer
		:vax-type  :unsigned-longword
		:mechanism :value
		:access :in)
  (IOSB		:lisp-type integer
		:vax-type  :unsigned-quadword
		:mechanism :reference
		:access :in-out)
  (ASTADR	:lisp-type integer
		:vax-type  :unsigned-longword
		:mechanism :value
		:access :in)
  (ASTPRM	:lisp-type integer
		:vax-type  :unsigned-longword
		:mechanism :value
		:access :in)
  (TID		:lisp-type integer
		:vax-type  :unsigned-quadword ; :unsigned-octaword ??
		:mechanism :reference
		:access :in))
 
 
(defun lisp$SYS_END_TRANSW (EFN FLAGS ASTADR ASTPRM TID &optional IOSB)
  (declare (integer EFN))
  (declare (integer FLAGS))
  (declare (integer ASTADR))
  (declare (integer ASTPRM))
  (declare (integer TID))
  (declare (integer IOSB))
     (call-out SYS$END_TRANSW EFN FLAGS IOSB ASTADR ASTPRM TID)
			(values IOSB))
 
 
;;;  $ENQ
;;;
;;;    Enqueue Lock Request
;;;
;;;     $ENQ     [efn] ,lkmode ,lksb ,[flags] ,[resnam] ,[parid]
;;;     ($ENQW)  ,[astadr] ,[astprm] ,[blkast] ,[acmode], [prot]
;;;
;;;     efn    = event flag to be set at completion
;;;
;;;     lkmode = type of lock mode requested.  Modes are:
;;;
;;;               LCK$K_NLMODE null lock
;;;               LCK$K_CRMODE concurrent read
;;;               LCK$K_CWMODE concurrent write
;;;               LCK$K_PRMODE protected read
;;;               LCK$K_PWMODE protected write
;;;               LCK$K_EXMODE exclusive lock
;;;
;;;     lksb  = address of the lock status block
;;;
;;;     flags = flags defining the characteristics of the lock.  These are:
;;;
;;;               LCK$M_NOQUEUE
;;;               LCK$M_SYNCSTS
;;;               LCK$M_SYSTEM
;;;               LCK$M_VALBLK
;;;               LCK$M_CONVERT
;;;
;;;     resnam = address of string descriptor of the resource name
;;;
;;;     parid  = lock ID of the parent lock
;;;
;;;     astadr = address of entry mask of AST routine
;;;
;;;     astprm = value to be passed to AST routine
;;;
;;;     blkast = address of entry mask of blocking AST routine
;;;
;;;     acmode = Access mode to be associated with the lock
;;;
;;;	prot  = optional additional arg for extension
;;;
(define-external-routine (SYS$ENQ

		:result  
		        (:lisp-type integer :vax-type :longword))
  (EFN		:lisp-type integer
		:vax-type  :unsigned-longword
		:mechanism :value
		:access :in)
  (LKMODE	:lisp-type integer
		:vax-type  :unsigned-longword
		:mechanism :value
		:access :in)
  (LKSB		:lisp-type alien-structure
		:mechanism :reference
		:access :in-out)
  (FLAGS	:lisp-type integer
		:vax-type  :unsigned-longword
		:mechanism :value
		:access :in)
  (RESNAM	:lisp-type simple-string
		:vax-type  :text
		:mechanism :descriptor
		:access :in)
  (PARID	:lisp-type integer
		:vax-type  :unsigned-longword
		:mechanism :value
		:access :in)
  (ASTADR	:lisp-type integer
		:vax-type  :unsigned-longword
		:mechanism :value
		:access :in)
  (ASTPRM	:lisp-type integer
		:vax-type  :unsigned-longword
		:mechanism :value
		:access :in)
  (BLKAST	:lisp-type integer
		:vax-type  :unsigned-longword
		:mechanism :value
		:access :in)
  (ACMODE	:lisp-type integer
		:vax-type  :unsigned-longword
		:mechanism :value
		:access :in)
  (PROT		:lisp-type integer
		:vax-type  :unsigned-longword
		:mechanism :value
		:access :in))
 
 
(defun lisp$SYS_ENQ (EFN LKMODE FLAGS RESNAM PARID ASTADR ASTPRM 
BLKAST ACMODE PROT &optional LKSB)
  (declare (integer EFN))
  (declare (integer LKMODE))
  (declare (integer FLAGS))
  (declare (simple-string RESNAM))
  (declare (integer PARID))
  (declare (integer ASTADR))
  (declare (integer ASTPRM))
  (declare (integer BLKAST))
  (declare (integer ACMODE))
  (declare (integer PROT))
     (call-out SYS$ENQ EFN LKMODE LKSB FLAGS RESNAM PARID ASTADR 
ASTPRM BLKAST ACMODE PROT)
			(values LKSB))
 
 
(define-external-routine (SYS$ENQW

		:result  
		        (:lisp-type integer :vax-type :longword))
  (EFN		:lisp-type integer
		:vax-type  :unsigned-longword
		:mechanism :value
		:access :in)
  (LKMODE	:lisp-type integer
		:vax-type  :unsigned-longword
		:mechanism :value
		:access :in)
  (LKSB		:lisp-type alien-structure
		:mechanism :reference
		:access :in-out)
  (FLAGS	:lisp-type integer
		:vax-type  :unsigned-longword
		:mechanism :value
		:access :in)
  (RESNAM	:lisp-type simple-string
		:vax-type  :text
		:mechanism :descriptor
		:access :in)
  (PARID	:lisp-type integer
		:vax-type  :unsigned-longword
		:mechanism :value
		:access :in)
  (ASTADR	:lisp-type integer
		:vax-type  :unsigned-longword
		:mechanism :value
		:access :in)
  (ASTPRM	:lisp-type integer
		:vax-type  :unsigned-longword
		:mechanism :value
		:access :in)
  (BLKAST	:lisp-type integer
		:vax-type  :unsigned-longword
		:mechanism :value
		:access :in)
  (ACMODE	:lisp-type integer
		:vax-type  :unsigned-longword
		:mechanism :value
		:access :in)
  (PROT		:lisp-type integer
		:vax-type  :unsigned-longword
		:mechanism :value
		:access :in))
 
 
(defun lisp$SYS_ENQW (EFN LKMODE FLAGS RESNAM PARID ASTADR ASTPRM 
BLKAST ACMODE PROT &optional LKSB)
  (declare (integer EFN))
  (declare (integer LKMODE))
  (declare (integer FLAGS))
  (declare (simple-string RESNAM))
  (declare (integer PARID))
  (declare (integer ASTADR))
  (declare (integer ASTPRM))
  (declare (integer BLKAST))
  (declare (integer ACMODE))
  (declare (integer PROT))
     (call-out SYS$ENQW EFN LKMODE LKSB FLAGS RESNAM PARID ASTADR 
ASTPRM BLKAST ACMODE PROT)
			(values LKSB))
 
 
;;;
;;;  $ENTER
;;;
;;;    Enter File
;;;
;;;      $ENTER fab, [err], [suc]
;;;
;;;      fab	= address of fab
;;;
;;;	err	= address of user error completion routine
;;;
;;;	suc	= address of user success completion routine
;;;                                    
(define-external-routine (SYS$ENTER

		:result  
		        (:lisp-type integer :vax-type :longword))
  (FAB		:lisp-type alien-structure
		:mechanism :reference
		:access :in-out)
  (ERR		:lisp-type integer
		:vax-type  :unsigned-longword
		:mechanism :value
		:access :in)
  (SUC		:lisp-type integer
		:vax-type  :unsigned-longword
		:mechanism :value
		:access :in))
 
 
(defun lisp$SYS_ENTER (ERR SUC &optional FAB)
  (declare (integer ERR))
  (declare (integer SUC))
     (call-out SYS$ENTER FAB ERR SUC)
			(values FAB))
 
 
;;;  $ERAPAT
;;;
;;;    Generate a security erase pattern.
;;;
;;;	$ERAPAT type, [count], patadr
;;;
;;;	type	= type of security erase
;;;
;;;	count	= iteration count (seed for erase pattern)
;;;
;;;	patadr	= address of longword to receive erase pattern
;;;
(define-external-routine (SYS$ERAPAT

		:result  
		        (:lisp-type integer :vax-type :longword))
  (TYPE		:lisp-type integer
		:vax-type  :unsigned-longword
		:mechanism :value
		:access :in)
  (COUNT	:lisp-type integer
		:vax-type  :unsigned-longword
		:mechanism :value
		:access :in)
  (PATADR	:lisp-type integer
		:vax-type  :unsigned-longword
		:mechanism :reference
		:access :in-out))
 
 
(defun lisp$SYS_ERAPAT (TYPE COUNT &optional PATADR)
  (declare (integer TYPE))
  (declare (integer COUNT))
  (declare (integer PATADR))
     (call-out SYS$ERAPAT TYPE COUNT PATADR)
			(values PATADR))
 
 
;;;  $ERASE
;;;
;;;    Erase File
;;;
;;;      $ERASE fab, [err], [suc]
;;;
;;;      fab	= address of fab
;;;
;;;	err	= address of user error completion routine
;;;
;;;	suc	= address of user success completion routine
;;;
(define-external-routine (SYS$ERASE

		:result  
		        (:lisp-type integer :vax-type :longword))
  (FAB		:lisp-type alien-structure
		:mechanism :reference
		:access :in-out)
  (ERR		:lisp-type integer
		:vax-type  :unsigned-longword
		:mechanism :value
		:access :in)
  (SUC		:lisp-type integer
		:vax-type  :unsigned-longword
		:mechanism :value
		:access :in))
 
 
(defun lisp$SYS_ERASE (ERR SUC &optional FAB)
  (declare (integer ERR))
  (declare (integer SUC))
     (call-out SYS$ERASE FAB ERR SUC)
			(values FAB))
 
 
;;;
;;;  $EVDPOSTEVENT
;;;
;;;    Post Event to EVD
;;;
;;;	$EVDPOSTEVENT  EVENT
;;;
(define-external-routine (SYS$EVDPOSTEVENT

		:result  
		        (:lisp-type integer :vax-type :longword))
  (EVENT	:lisp-type simple-string
		:vax-type  :text
		:mechanism :descriptor
		:access :in))
 
 
(defun lisp$SYS_EVDPOSTEVENT (EVENT)
  (declare (simple-string EVENT))
     (call-out SYS$EVDPOSTEVENT EVENT))
 
 
;;;  $EXIT
;;;
;;;    Exit image
;;;
;;;     $EXIT    [code]
;;;
;;;     code   = longword completion status
;;;
(define-external-routine (SYS$EXIT

		:result  
		        (:lisp-type integer :vax-type :longword))
  (CODE		:lisp-type integer
		:vax-type  :unsigned-longword
		:mechanism :value
		:access :in))
 
 
(defun lisp$SYS_EXIT (CODE)
  (declare (integer CODE))
     (call-out SYS$EXIT CODE))
 
 
;;;  $EXPREG
;;;
;;;    Expand Program/Control Region
;;;
;;;     $EXPREG  pagcnt ,[retadr] ,[acmode] ,[region]
;;;
;;;     pagcnt = number of pages to add to end of specified region
;;;
;;;     retadr = address  of  2-longword  array  to  receive   virtual
;;;              addresses of starting and ending pages
;;;
;;;     acmode = access mode of the new pages
;;;
;;;     region = region indicator
;;;               0 -> program (P0) region   1 -> control (P1) region
;;;
(define-external-routine (SYS$EXPREG

		:result  
		        (:lisp-type integer :vax-type :longword))
  (PAGCNT	:lisp-type integer
		:vax-type  :unsigned-longword
		:mechanism :value
		:access :in)
  (RETADR	:lisp-type (unsigned-byte 32 (array (2)))
		:mechanism :reference
		:access :in-out)
  (ACMODE	:lisp-type integer
		:vax-type  :unsigned-longword
		:mechanism :value
		:access :in)
  (REGION	:lisp-type integer
		:vax-type  :byte
		:mechanism :value
		:access :in))
 
 
(defun lisp$SYS_EXPREG (PAGCNT ACMODE REGION &optional RETADR)
  (declare (integer PAGCNT))
  (declare (integer ACMODE))
  (declare (integer REGION))
     (call-out SYS$EXPREG PAGCNT RETADR ACMODE REGION)
			(values RETADR))
 
 
;;;
;;;  $EXTEND
;;;
;;;    Extend File
;;;
;;;      $EXTEND fab, [err], [suc]
;;;
;;;      fab	= address of fab
;;;
;;;	err	= address of user error completion routine
;;;
;;;	suc	= address of user success completion routine
;;;
(define-external-routine (SYS$EXTEND

		:result  
		        (:lisp-type integer :vax-type :longword))
  (FAB		:lisp-type alien-structure
		:mechanism :reference
		:access :in-out)
  (ERR		:lisp-type integer
		:vax-type  :unsigned-longword
		:mechanism :value
		:access :in)
  (SUC		:lisp-type integer
		:vax-type  :unsigned-longword
		:mechanism :value
		:access :in))
 
 
(defun lisp$SYS_EXTEND (ERR SUC &optional FAB)
  (declare (integer ERR))
  (declare (integer SUC))
     (call-out SYS$EXTEND FAB ERR SUC)
			(values FAB))
 
 
;;;  $FAO
;;;
;;;    Formatted ASCII Output
;;;
;;;     $FAO     ctrstr ,[outlen] ,outbuf ,[p1] ,[p2]...[pn]
;;;
;;;     ctrstr = address of string descriptor for control string
;;;
;;;     outlen = address of word in which to store output length
;;;
;;;     outbuf = address of output buffer string descriptor
;;;
;;;     p1...  = variable number of arguments to FAO
;;;
(define-external-routine (SYS$FAO

		:result  
		        (:lisp-type integer :vax-type :longword))
  (CTRSTR	:lisp-type simple-string
		:vax-type  :text
		:mechanism :descriptor
		:access :in)
  (OUTLEN	:lisp-type integer ; unsigned-byte 16
		:vax-type  :unsigned-word
		:mechanism :reference
		:access :in-out)
  (OUTBUF	:lisp-type simple-string
		:vax-type  :text
		:mechanism :descriptor
		:access :in-out)
  (P1		:lisp-type integer
		:vax-type  :unsigned-longword
		:mechanism :value
		:access :in))
 
 
(defun lisp$SYS_FAO (CTRSTR P1 &optional OUTLEN OUTBUF)
  (declare (simple-string CTRSTR))
  (declare (integer P1))
  (declare (fixnum OUTLEN))
  (declare (simple-string OUTBUF))
     (call-out SYS$FAO CTRSTR OUTLEN OUTBUF P1)
			(values OUTLEN OUTBUF))
 
 
;;;  $FAOL
;;;
;;;    Formatted ASCII Output With List Parameter
;;;
;;;     $FAOL    ctrstr ,[outlen] ,outbuf ,prmlst
;;;
;;;     ctrstr = address of string descriptor for control string
;;;
;;;     outlen = address of word to receive output string length
;;;
;;;     outbuf = address of output buffer string descriptor
;;;                                             
;;;     prmlst = address of a list of longword parameters
;;;
(define-external-routine (SYS$FAOL

		:result  
		        (:lisp-type integer :vax-type :longword))
  (CTRSTR	:lisp-type simple-string
		:vax-type  :text
		:mechanism :descriptor
		:access :in)
  (OUTLEN	:lisp-type integer ; unsigned-byte 16
		:vax-type  :unsigned-word
		:mechanism :reference
		:access :in-out)
  (OUTBUF	:lisp-type simple-string
		:vax-type  :text
		:mechanism :descriptor
		:access :in-out)
  (PRMLST	:lisp-type alien-structure
		:mechanism :reference
		:access :in))
 
 
(defun lisp$SYS_FAOL (CTRSTR PRMLST &optional OUTLEN OUTBUF)
  (declare (simple-string CTRSTR))
  (declare (fixnum OUTLEN))
  (declare (simple-string OUTBUF))
     (call-out SYS$FAOL CTRSTR OUTLEN OUTBUF PRMLST)
			(values OUTLEN OUTBUF))
 
 
;;;  $FILESCAN
;;;
;;;    Scan a string and identify a file specification
;;;
;;;     $FILESCAN    srcstr, [valuelst], [fldflags]
;;;
;;;     srcstr = address of string descriptor for source string
;;;
;;;     valuelst = address of a list of item descriptors
;;;
;;;	fldflags = address of a longword to receive flags
;;;
(define-external-routine (SYS$FILESCAN

		:result  
		        (:lisp-type integer :vax-type :longword))
  (SRCSTR	:lisp-type simple-string
		:vax-type  :text
		:mechanism :descriptor
		:access :in)
  (VALUELST	:lisp-type alien-structure
		:mechanism :reference
		:access :in-out)
  (FLDFLAGS	:lisp-type integer
		:vax-type  :unsigned-longword
		:mechanism :reference
		:access :in-out))
 
 
(defun lisp$SYS_FILESCAN (SRCSTR &optional VALUELST FLDFLAGS)
  (declare (simple-string SRCSTR))
  (declare (integer FLDFLAGS))
     (call-out SYS$FILESCAN SRCSTR VALUELST FLDFLAGS)
			(values VALUELST FLDFLAGS))
 
 
;;;
;;;  $FIND
;;;
;;;    Find Record in File
;;;
;;;      $FIND rab, [err], [suc]
;;;
;;;      rab	= address of rab
;;;
;;;	err	= address of user error completion routine
;;;
;;;	suc	= address of user success completion routine
;;;                                    
(define-external-routine (SYS$FIND

		:result  
		        (:lisp-type integer :vax-type :longword))
  (RAB		:lisp-type alien-structure
		:mechanism :reference
		:access :in-out)
  (ERR		:lisp-type integer
		:vax-type  :unsigned-longword
		:mechanism :value
		:access :in)
  (SUC		:lisp-type integer
		:vax-type  :unsigned-longword
		:mechanism :value
		:access :in))
 
 
(defun lisp$SYS_FIND (ERR SUC &optional RAB)
  (declare (integer ERR))
  (declare (integer SUC))
     (call-out SYS$FIND RAB ERR SUC)
			(values RAB))
 
 
;;;
;;;  $FIND_HELD
;;;
;;;    Find Identifiers Held By Holder
;;;
;;;	$FIND_HELD holder, [id], [attrib], [contxt]
;;;
;;;	holder	= address of a quadword which specifies the holder
;;;		  id of the records to find
;;;	id	= address to return the identifier longword
;;;	attrib	= address to return the holder attributes longword
;;;	contxt	= address of a longword containing the record stream
;;;		  context. initially should be zero, value output
;;;		  on first call, value input on subsequent calls.
;;;                                    
(define-external-routine (SYS$FIND_HELD

		:result  
		        (:lisp-type integer :vax-type :longword))
  (HOLDER	:lisp-type integer
		:vax-type  :unsigned-quadword
		:mechanism :reference
		:access :in)
  (ID		:lisp-type integer
		:vax-type  :unsigned-longword
		:mechanism :reference
		:access :in-out)
  (ATTRIB	:lisp-type integer
		:vax-type  :unsigned-longword
		:mechanism :reference
		:access :in-out)
  (CONTXT	:lisp-type integer
		:vax-type  :unsigned-longword
		:mechanism :reference
		:access :in-out))
 
 
(defun lisp$SYS_FIND_HELD (HOLDER &optional ID ATTRIB CONTXT)
  (declare (integer HOLDER))
  (declare (integer ID))
  (declare (integer ATTRIB))
  (declare (integer CONTXT))
     (call-out SYS$FIND_HELD HOLDER ID ATTRIB CONTXT)
			(values ID ATTRIB CONTXT))
 
 
;;;
;;;  $FIND_HOLDER
;;;
;;;    Find Holder Of Identifier
;;;
;;;	$FIND_HOLDER id, [holder], [attrib], [contxt]
;;;
;;;	id	= identifier longword whose holder records
;;;		  are to be found
;;;	holder	= address to return the holder id quadword
;;;	attrib	= address to return the attributes longword
;;;	contxt	= address of a longword containing the record stream
;;;		  context. initially should be zero, value output
;;;		  on first call, value input on subsequent calls.
;;;                                    
(define-external-routine (SYS$FIND_HOLDER

		:result  
		        (:lisp-type integer :vax-type :longword))
  (ID		:lisp-type integer
		:vax-type  :unsigned-longword
		:mechanism :value
		:access :in)
  (HOLDER	:lisp-type integer
		:vax-type  :unsigned-quadword
		:mechanism :reference
		:access :in-out)
  (ATTRIB	:lisp-type integer
		:vax-type  :unsigned-longword
		:mechanism :reference
		:access :in-out)
  (CONTXT	:lisp-type integer
		:vax-type  :unsigned-longword
		:mechanism :reference
		:access :in-out))
 
 
(defun lisp$SYS_FIND_HOLDER (ID &optional HOLDER ATTRIB CONTXT)
  (declare (integer ID))
  (declare (integer HOLDER))
  (declare (integer ATTRIB))
  (declare (integer CONTXT))
     (call-out SYS$FIND_HOLDER ID HOLDER ATTRIB CONTXT)
			(values HOLDER ATTRIB CONTXT))
 
 
;;;
;;;  $FINISH_RDB
;;;
;;;    Clean up RMS Stream
;;;
;;;	$FINISH_RDB contxt
;;;
;;;	contxt	= address of a longword containing the record stream
;;;		  context.
;;;
(define-external-routine (SYS$FINISH_RDB

		:result  
		        (:lisp-type integer :vax-type :longword))
  (CONTXT	:lisp-type integer
		:vax-type  :unsigned-longword
		:mechanism :reference
		:access :in-out))
 
 
(defun lisp$SYS_FINISH_RDB (&optional CONTXT)
  (declare (integer CONTXT))
     (call-out SYS$FINISH_RDB CONTXT)
			(values CONTXT))
 
 
;;;
;;;  $FINISH_RMOP
;;;
;;;    Finish resource manager transaction event operation
;;;
;;;	$FINISH_RMOP	[efn], [flags], iosb, [astadr], [astprm], part_id,
;;;	  ($FINISH_RMOPW)		retsts
;;;
;;;	efn	= event flag to set upon completion
;;;	flags	= operation flags
;;;	iosb	= address of I/O status block
;;;	astadr	= address of entry mask of AST routine
;;;	astprm	= value to be passed to AST routine
;;;	part_id	= participant id value
;;;	retsts	= value of completion status
;;;
(define-external-routine (SYS$FINISH_RMOP

		:result  
		        (:lisp-type integer :vax-type :longword))
  (EFN		:lisp-type integer
		:vax-type  :unsigned-longword
		:mechanism :value
		:access :in)
  (FLAGS	:lisp-type integer
		:vax-type  :unsigned-longword
		:mechanism :value
		:access :in)
  (IOSB		:lisp-type integer
		:vax-type  :unsigned-quadword
		:mechanism :reference
		:access :in-out)
  (ASTADR	:lisp-type integer
		:vax-type  :unsigned-longword
		:mechanism :value
		:access :in)
  (ASTPRM	:lisp-type integer
		:vax-type  :unsigned-longword
		:mechanism :value
		:access :in)
  (PART_ID	:lisp-type integer
		:vax-type  :unsigned-longword
		:mechanism :value
		:access :in)
  (RETSTS	:lisp-type integer
		:vax-type  :unsigned-longword
		:mechanism :value
		:access :in))
 
 
(defun lisp$SYS_FINISH_RMOP (EFN FLAGS ASTADR ASTPRM PART_ID RETSTS 
&optional IOSB)
  (declare (integer EFN))
  (declare (integer FLAGS))
  (declare (integer ASTADR))
  (declare (integer ASTPRM))
  (declare (integer PART_ID))
  (declare (integer RETSTS))
  (declare (integer IOSB))
     (call-out SYS$FINISH_RMOP EFN FLAGS IOSB ASTADR ASTPRM PART_ID 
RETSTS)
			(values IOSB))
 
 
(define-external-routine (SYS$FINISH_RMOPW

		:result  
		        (:lisp-type integer :vax-type :longword))
  (EFN		:lisp-type integer
		:vax-type  :unsigned-longword
		:mechanism :value
		:access :in)
  (FLAGS	:lisp-type integer
		:vax-type  :unsigned-longword
		:mechanism :value
		:access :in)
  (IOSB		:lisp-type integer
		:vax-type  :unsigned-quadword
		:mechanism :reference
		:access :in-out)
  (ASTADR	:lisp-type integer
		:vax-type  :unsigned-longword
		:mechanism :value
		:access :in)
  (ASTPRM	:lisp-type integer
		:vax-type  :unsigned-longword
		:mechanism :value
		:access :in)
  (PART_ID	:lisp-type integer
		:vax-type  :unsigned-longword
		:mechanism :value
		:access :in)
  (RETSTS	:lisp-type integer
		:vax-type  :unsigned-longword
		:mechanism :value
		:access :in))
 
 
(defun lisp$SYS_FINISH_RMOPW (EFN FLAGS ASTADR ASTPRM PART_ID RETSTS 
&optional IOSB)
  (declare (integer EFN))
  (declare (integer FLAGS))
  (declare (integer ASTADR))
  (declare (integer ASTPRM))
  (declare (integer PART_ID))
  (declare (integer RETSTS))
  (declare (integer IOSB))
     (call-out SYS$FINISH_RMOPW EFN FLAGS IOSB ASTADR ASTPRM PART_ID 
RETSTS)
			(values IOSB))
 
 
;;;  $FORCEX
;;;
;;;    Force Exit
;;;
;;;     $FORCEX  [pidadr] ,[prcnam] ,[code]
;;;
;;;     pidadr = address of process id of process to be forced to exit
;;;
;;;     prcnam = address of process name descriptor for forced process
;;;
;;;     code   = longword completion status for exit service
;;;
(define-external-routine (SYS$FORCEX

		:result  
		        (:lisp-type integer :vax-type :longword))
  (PIDADR	:lisp-type integer
		:vax-type  :unsigned-longword
		:mechanism :reference
		:access :in-out)
  (PRCNAM	:lisp-type simple-string
		:vax-type  :text
		:mechanism :descriptor
		:access :in)
  (CODE		:lisp-type integer
		:vax-type  :unsigned-longword
		:mechanism :value
		:access :in))
 
 
(defun lisp$SYS_FORCEX (PRCNAM CODE &optional PIDADR)
  (declare (simple-string PRCNAM))
  (declare (integer CODE))
  (declare (integer PIDADR))
     (call-out SYS$FORCEX PIDADR PRCNAM CODE)
			(values PIDADR))
 
 
;;;
;;;  $FORGET_RM
;;;
;;;    Forget a resource manager previously declared to DDTM
;;;
;;;	$FORGET_RM	[efn], [flags], iosb, [astadr], [astprm], rm_id
;;;	  ($FORGET_RMW)
;;;
;;;	efn	= event flag to set upon completion
;;;	flags	= operation flags
;;;	iosb	= address of I/O status block
;;;	astadr	= address of entry mask of AST routine
;;;	astprm	= value to be passed to AST routine
;;;	rm_id	= resource manager id value
;;;
(define-external-routine (SYS$FORGET_RM

		:result  
		        (:lisp-type integer :vax-type :longword))
  (EFN		:lisp-type integer
		:vax-type  :unsigned-longword
		:mechanism :value
		:access :in)
  (FLAGS	:lisp-type integer
		:vax-type  :unsigned-longword
		:mechanism :value
		:access :in)
  (IOSB		:lisp-type integer
		:vax-type  :unsigned-quadword
		:mechanism :reference
		:access :in-out)
  (ASTADR	:lisp-type integer
		:vax-type  :unsigned-longword
		:mechanism :value
		:access :in)
  (ASTPRM	:lisp-type integer
		:vax-type  :unsigned-longword
		:mechanism :value
		:access :in)
  (RM_ID	:lisp-type integer
		:vax-type  :unsigned-longword
		:mechanism :value
		:access :in))
 
 
(defun lisp$SYS_FORGET_RM (EFN FLAGS ASTADR ASTPRM RM_ID &optional IOSB)
  (declare (integer EFN))
  (declare (integer FLAGS))
  (declare (integer ASTADR))
  (declare (integer ASTPRM))
  (declare (integer RM_ID))
  (declare (integer IOSB))
     (call-out SYS$FORGET_RM EFN FLAGS IOSB ASTADR ASTPRM RM_ID)
			(values IOSB))
 
 
(define-external-routine (SYS$FORGET_RMW

		:result  
		        (:lisp-type integer :vax-type :longword))
  (EFN		:lisp-type integer
		:vax-type  :unsigned-longword
		:mechanism :value
		:access :in)
  (FLAGS	:lisp-type integer
		:vax-type  :unsigned-longword
		:mechanism :value
		:access :in)
  (IOSB		:lisp-type integer
		:vax-type  :unsigned-quadword
		:mechanism :reference
		:access :in-out)
  (ASTADR	:lisp-type integer
		:vax-type  :unsigned-longword
		:mechanism :value
		:access :in)
  (ASTPRM	:lisp-type integer
		:vax-type  :unsigned-longword
		:mechanism :value
		:access :in)
  (RM_ID	:lisp-type integer
		:vax-type  :unsigned-longword
		:mechanism :value
		:access :in))
 
 
(defun lisp$SYS_FORGET_RMW (EFN FLAGS ASTADR ASTPRM RM_ID &optional IOSB)
  (declare (integer EFN))
  (declare (integer FLAGS))
  (declare (integer ASTADR))
  (declare (integer ASTPRM))
  (declare (integer RM_ID))
  (declare (integer IOSB))
     (call-out SYS$FORGET_RMW EFN FLAGS IOSB ASTADR ASTPRM RM_ID)
			(values IOSB))
 
 
;;;
;;;  $FORMAT_ACL
;;;
;;;    Format an Access Control list Entry
;;;
;;;	$FORMAT_ACL acl-entry, [acl-length], acl-string,
;;;		    [line-width], [term-desc], [line-indent],
;;;		    [bit-names], [routin]
;;;
;;;	acl-entry	= address of a descriptor of a buffer which
;;;			  contains the ACE
;;;
;;;	acl-length	= address of a word to receive the length of
;;;			  the output string
;;;
;;;	acl-string	= address of a descriptor of a buffer into
;;;			  which the output string is to be stored
;;;
;;;	line-width	= address of the maximum line width
;;;			  (0 = infinite)
;;;
;;;	term_desc	= address of a character descriptor containing
;;;			  a character string to be inserted whenever
;;;			  the line segment length exceeds the line-width
;;;
;;;	line-indent	= address of the number of columns to indent
;;;			  the output line segment
;;;
;;;	bit-names	= address of a access bit name table (32 entries)
;;;
;;;	routin		= address of routine to be executed in kernel mode
;;;                                    
(define-external-routine (SYS$FORMAT_ACL

		:result  
		        (:lisp-type integer :vax-type :longword))
  (ACLENT	:lisp-type simple-string
		:vax-type  :text
		:mechanism :descriptor
		:access :in)
  (ACLLEN	:lisp-type integer ; unsigned-byte 16
		:vax-type  :unsigned-word
		:mechanism :reference
		:access :in-out)
  (ACLSTR	:lisp-type simple-string
		:vax-type  :text
		:mechanism :descriptor
		:access :in-out)
  (WIDTH	:lisp-type integer ; unsigned-byte 16
		:vax-type  :unsigned-word
		:mechanism :reference
		:access :in)
  (TRMDSC	:lisp-type simple-string
		:vax-type  :text
		:mechanism :descriptor
		:access :in)
  (INDENT	:lisp-type integer ; unsigned-byte 16
		:vax-type  :unsigned-word
		:mechanism :reference
		:access :in)
  (ACCNAM	:lisp-type alien-structure
		:mechanism :reference
		:access :in)
  (ROUTIN	:lisp-type integer
		:vax-type  :unsigned-longword
		:mechanism :value
		:access :in))
 
 
(defun lisp$SYS_FORMAT_ACL (ACLENT WIDTH TRMDSC INDENT ACCNAM ROUTIN 
&optional ACLLEN ACLSTR)
  (declare (simple-string ACLENT))
  (declare (fixnum WIDTH))
  (declare (simple-string TRMDSC))
  (declare (fixnum INDENT))
  (declare (integer ROUTIN))
  (declare (fixnum ACLLEN))
  (declare (simple-string ACLSTR))
     (call-out SYS$FORMAT_ACL ACLENT ACLLEN ACLSTR WIDTH TRMDSC 
INDENT ACCNAM ROUTIN)
			(values ACLLEN ACLSTR))
 
 
;;;  $FORMAT_CLASS	itmlst, [routin]
;;;
;;;    Format access class strings
;;;
;;;     itmlst = address of a list of item descriptors
;;;
;;;     routin = address of routine to be executed in kernel mode
;;;
;;;
(define-external-routine (SYS$FORMAT_CLASS

		:result  
		        (:lisp-type integer :vax-type :longword))
  (ITMLST	:lisp-type alien-structure
		:mechanism :reference
		:access :in)
  (ROUTIN	:lisp-type integer
		:vax-type  :unsigned-longword
		:mechanism :value
		:access :in))
 
 
(defun lisp$SYS_FORMAT_CLASS (ITMLST ROUTIN)
  (declare (integer ROUTIN))
     (call-out SYS$FORMAT_CLASS ITMLST ROUTIN))
 
 
;;;
;;;  $FREE
;;;
;;;    Free Record
;;;
;;;      $FREE rab, [err], [suc]
;;;
;;;      rab	= address of fab
;;;
;;;	err	= address of user error completion routine
;;;
;;;	suc	= address of user success completion routine
;;;
(define-external-routine (SYS$FREE

		:result  
		        (:lisp-type integer :vax-type :longword))
  (RAB		:lisp-type alien-structure
		:mechanism :reference
		:access :in-out)
  (ERR		:lisp-type integer
		:vax-type  :unsigned-longword
		:mechanism :value
		:access :in)
  (SUC		:lisp-type integer
		:vax-type  :unsigned-longword
		:mechanism :value
		:access :in))
 
 
(defun lisp$SYS_FREE (ERR SUC &optional RAB)
  (declare (integer ERR))
  (declare (integer SUC))
     (call-out SYS$FREE RAB ERR SUC)
			(values RAB))
 
 
;;;
;;;  $FLUSH
;;;
;;;    Flush Record
;;;
;;;      $FLUSH rab, [err], [suc]
;;;
;;;      rab	= address of rab
;;;
;;;	err	= address of user error completion routine
;;;
;;;	suc	= address of user success completion routine
;;;
(define-external-routine (SYS$FLUSH

		:result  
		        (:lisp-type integer :vax-type :longword))
  (RAB		:lisp-type alien-structure
		:mechanism :reference
		:access :in-out)
  (ERR		:lisp-type integer
		:vax-type  :unsigned-longword
		:mechanism :value
		:access :in)
  (SUC		:lisp-type integer
		:vax-type  :unsigned-longword
		:mechanism :value
		:access :in))
 
 
(defun lisp$SYS_FLUSH (ERR SUC &optional RAB)
  (declare (integer ERR))
  (declare (integer SUC))
     (call-out SYS$FLUSH RAB ERR SUC)
			(values RAB))
 
 
;;;
;;;  $GET
;;;
;;;    Get Record from File
;;;
;;;      $GET rab, [err], [suc]
;;;
;;;      rab	= address of rab
;;;
;;;	err	= address of user error completion routine
;;;
;;;	suc	= address of user success completion routine
;;;                                    
(define-external-routine (SYS$GET

		:result  
		        (:lisp-type integer :vax-type :longword))
  (RAB		:lisp-type alien-structure
		:mechanism :reference
		:access :in-out)
  (ERR		:lisp-type integer
		:vax-type  :unsigned-longword
		:mechanism :value
		:access :in)
  (SUC		:lisp-type integer
		:vax-type  :unsigned-longword
		:mechanism :value
		:access :in))
 
 
(defun lisp$SYS_GET (ERR SUC &optional RAB)
  (declare (integer ERR))
  (declare (integer SUC))
     (call-out SYS$GET RAB ERR SUC)
			(values RAB))
 
 
;;;  $GETCHN
;;;
;;;    Get I/O Channel Information
;;;
;;;     $GETCHN  chan ,[prilen] ,[pribuf] ,[scdlen] ,[scdbuf]
;;;
;;;     chan   = number of a channel assigned to the device
;;;
;;;     prilen = address of word to receive length of primary buffer
;;;
;;;     pribuf = address of primary buffer descriptor
;;;
;;;     scdlen = address of word to receive length of secondary buffer
;;;
;;;     scdbuf = address of secondary buffer descriptor
;;;
(define-external-routine (SYS$GETCHN

		:result  
		        (:lisp-type integer :vax-type :longword))
  (CHAN		:lisp-type integer ; unsigned-byte 16
		:vax-type  :unsigned-word
		:mechanism :value
		:access :in)
  (PRILEN	:lisp-type integer ; unsigned-byte 16
		:vax-type  :unsigned-word
		:mechanism :reference
		:access :in-out)
  (PRIBUF	:lisp-type simple-string
		:vax-type  :text
		:mechanism :descriptor
		:access :in-out)
  (SCDLEN	:lisp-type integer ; unsigned-byte 16
		:vax-type  :unsigned-word
		:mechanism :reference
		:access :in-out)
  (SCDBUF	:lisp-type simple-string
		:vax-type  :text
		:mechanism :descriptor
		:access :in-out))
 
 
(defun lisp$SYS_GETCHN (CHAN &optional PRILEN PRIBUF SCDLEN SCDBUF)
  (declare (fixnum CHAN))
  (declare (fixnum PRILEN))
  (declare (simple-string PRIBUF))
  (declare (fixnum SCDLEN))
  (declare (simple-string SCDBUF))
     (call-out SYS$GETCHN CHAN PRILEN PRIBUF SCDLEN SCDBUF)
			(values PRILEN PRIBUF SCDLEN SCDBUF))
 
 
;;;  $GETDEV
;;;
;;;    Get I/O Device Information
;;;
;;;     $GETDEV  devnam  ,[prilen] ,[pribuf] ,[scdlen] ,[scdbuf]
;;;
;;;     devnam = address of device name or logical name descriptor
;;;
;;;     prilen = address of word to receive length of primary buffer
;;;
;;;     pribuf = address of primary buffer descriptor
;;;
;;;     scdlen = address of word to receive length of secondary buffer
;;;
;;;     scdbuf = address of secondary buffer descriptor
;;;
(define-external-routine (SYS$GETDEV

		:result  
		        (:lisp-type integer :vax-type :longword))
  (DEVNAM	:lisp-type simple-string
		:vax-type  :text
		:mechanism :descriptor
		:access :in)
  (PRILEN	:lisp-type integer ; unsigned-byte 16
		:vax-type  :unsigned-word
		:mechanism :reference
		:access :in-out)
  (PRIBUF	:lisp-type simple-string
		:vax-type  :text
		:mechanism :descriptor
		:access :in-out)
  (SCDLEN	:lisp-type integer ; unsigned-byte 16
		:vax-type  :unsigned-word
		:mechanism :reference
		:access :in-out)
  (SCDBUF	:lisp-type simple-string
		:vax-type  :text
		:mechanism :descriptor
		:access :in-out))
 
 
(defun lisp$SYS_GETDEV (DEVNAM &optional PRILEN PRIBUF SCDLEN SCDBUF)
  (declare (simple-string DEVNAM))
  (declare (fixnum PRILEN))
  (declare (simple-string PRIBUF))
  (declare (fixnum SCDLEN))
  (declare (simple-string SCDBUF))
     (call-out SYS$GETDEV DEVNAM PRILEN PRIBUF SCDLEN SCDBUF)
			(values PRILEN PRIBUF SCDLEN SCDBUF))
 
 
;;;
;;;  $GETDTI
;;;
;;;    Get Distributed Transaction Information
;;;
;;;	$GETDTI	[efn], [flags], iosb, [astadr], [astprm], [log_id], contxt,
;;;	  ($GETDTIW)		search, itmlst
;;;
;;;	efn	= event flag to set at completion
;;;	flags	= operation flags
;;;	iosb	= address of a quadword I/O status block
;;;	astadr	= address of the entry mask of an AST routine
;;;	astprm	= value to be passed to AST routine
;;;	log_id	= address of log id for TM log
;;;	contxt	= address of longword search context
;;;	search	= address of a list of search criteria items
;;;	itmlst	= address of a list of item descriptors
;;;
(define-external-routine (SYS$GETDTI

		:result  
		        (:lisp-type integer :vax-type :longword))
  (EFN		:lisp-type integer
		:vax-type  :unsigned-longword
		:mechanism :value
		:access :in)
  (FLAGS	:lisp-type integer
		:vax-type  :unsigned-longword
		:mechanism :value
		:access :in)
  (IOSB		:lisp-type integer
		:vax-type  :unsigned-quadword
		:mechanism :reference
		:access :in-out)
  (ASTADR	:lisp-type integer
		:vax-type  :unsigned-longword
		:mechanism :value
		:access :in)
  (ASTPRM	:lisp-type integer
		:vax-type  :unsigned-longword
		:mechanism :value
		:access :in)
  (LOG_ID	:lisp-type integer
		:vax-type  :unsigned-quadword ; :unsigned-octaword ??
		:mechanism :reference
		:access :in)
  (CONTXT	:lisp-type integer
		:vax-type  :unsigned-longword
		:mechanism :reference
		:access :in-out)
  (SEARCH	:lisp-type alien-structure
		:mechanism :reference
		:access :in)
  (ITMLST	:lisp-type alien-structure
		:mechanism :reference
		:access :in))
 
 
(defun lisp$SYS_GETDTI (EFN FLAGS ASTADR ASTPRM LOG_ID SEARCH ITMLST 
&optional IOSB CONTXT)
  (declare (integer EFN))
  (declare (integer FLAGS))
  (declare (integer ASTADR))
  (declare (integer ASTPRM))
  (declare (integer LOG_ID))
  (declare (integer IOSB))
  (declare (integer CONTXT))
     (call-out SYS$GETDTI EFN FLAGS IOSB ASTADR ASTPRM LOG_ID CONTXT 
SEARCH ITMLST)
			(values IOSB CONTXT))
 
 
(define-external-routine (SYS$GETDTIW

		:result  
		        (:lisp-type integer :vax-type :longword))
  (EFN		:lisp-type integer
		:vax-type  :unsigned-longword
		:mechanism :value
		:access :in)
  (FLAGS	:lisp-type integer
		:vax-type  :unsigned-longword
		:mechanism :value
		:access :in)
  (IOSB		:lisp-type integer
		:vax-type  :unsigned-quadword
		:mechanism :reference
		:access :in-out)
  (ASTADR	:lisp-type integer
		:vax-type  :unsigned-longword
		:mechanism :value
		:access :in)
  (ASTPRM	:lisp-type integer
		:vax-type  :unsigned-longword
		:mechanism :value
		:access :in)
  (LOG_ID	:lisp-type integer
		:vax-type  :unsigned-quadword ; :unsigned-octaword ??
		:mechanism :reference
		:access :in)
  (CONTXT	:lisp-type integer
		:vax-type  :unsigned-longword
		:mechanism :reference
		:access :in-out)
  (SEARCH	:lisp-type alien-structure
		:mechanism :reference
		:access :in)
  (ITMLST	:lisp-type alien-structure
		:mechanism :reference
		:access :in))
 
 
(defun lisp$SYS_GETDTIW (EFN FLAGS ASTADR ASTPRM LOG_ID SEARCH ITMLST 
&optional IOSB CONTXT)
  (declare (integer EFN))
  (declare (integer FLAGS))
  (declare (integer ASTADR))
  (declare (integer ASTPRM))
  (declare (integer LOG_ID))
  (declare (integer IOSB))
  (declare (integer CONTXT))
     (call-out SYS$GETDTIW EFN FLAGS IOSB ASTADR ASTPRM LOG_ID CONTXT 
SEARCH ITMLST)
			(values IOSB CONTXT))
 
 
;;;
;;;  $GETDVI
;;;
;;;    Get Device/Volume Information
;;;
;;;     $GETDVI  [efn] ,[chan] ,[devnam] ,itmlst ,[iosb] ,[astadr]
;;;    ($GETDVIW)          ,[astprm] ,[nullarg]
;;;
;;;     efn    = event flag to be set at completion
;;;
;;;     chan   = number of a channel assigned to the device or
;;;              0 if device is specified by the devnam parameter
;;;
;;;     devnam = address of device name or logical name descriptor
;;;
;;;     itmlst = address of a list of item descriptors
;;;
;;;     iosb   = address of a quadword I/O status block
;;;
;;;     astadr = address of entry mask of AST routine
;;;
;;;     astprm = value to be passed to AST routine
;;;                                    
;;;     nullarg = reserved argument
;;;
;;;                                    
(define-external-routine (SYS$GETDVI

		:result  
		        (:lisp-type integer :vax-type :longword))
  (EFN		:lisp-type integer
		:vax-type  :unsigned-longword
		:mechanism :value
		:access :in)
  (CHAN		:lisp-type integer ; unsigned-byte 16
		:vax-type  :unsigned-word
		:mechanism :value
		:access :in)
  (DEVNAM	:lisp-type simple-string
		:vax-type  :text
		:mechanism :descriptor
		:access :in)
  (ITMLST	:lisp-type alien-structure
		:mechanism :reference
		:access :in)
  (IOSB		:lisp-type integer
		:vax-type  :unsigned-quadword
		:mechanism :reference
		:access :in-out)
  (ASTADR	:lisp-type integer
		:vax-type  :unsigned-longword
		:mechanism :value
		:access :in)
  (ASTPRM	:lisp-type integer
		:vax-type  :unsigned-longword
		:mechanism :value
		:access :in)
  (NULLARG	:lisp-type integer
		:vax-type  :unsigned-quadword
		:mechanism :reference
		:access :in))
 
 
(defun lisp$SYS_GETDVI (EFN CHAN DEVNAM ITMLST ASTADR ASTPRM NULLARG 
&optional IOSB)
  (declare (integer EFN))
  (declare (fixnum CHAN))
  (declare (simple-string DEVNAM))
  (declare (integer ASTADR))
  (declare (integer ASTPRM))
  (declare (integer NULLARG))
  (declare (integer IOSB))
     (call-out SYS$GETDVI EFN CHAN DEVNAM ITMLST IOSB ASTADR ASTPRM 
NULLARG)
			(values IOSB))
 
 
(define-external-routine (SYS$GETDVIW

		:result  
		        (:lisp-type integer :vax-type :longword))
  (EFN		:lisp-type integer
		:vax-type  :unsigned-longword
		:mechanism :value
		:access :in)
  (CHAN		:lisp-type integer ; unsigned-byte 16
		:vax-type  :unsigned-word
		:mechanism :value
		:access :in)
  (DEVNAM	:lisp-type simple-string
		:vax-type  :text
		:mechanism :descriptor
		:access :in)
  (ITMLST	:lisp-type alien-structure
		:mechanism :reference
		:access :in)
  (IOSB		:lisp-type integer
		:vax-type  :unsigned-quadword
		:mechanism :reference
		:access :in-out)
  (ASTADR	:lisp-type integer
		:vax-type  :unsigned-longword
		:mechanism :value
		:access :in)
  (ASTPRM	:lisp-type integer
		:vax-type  :unsigned-longword
		:mechanism :value
		:access :in)
  (NULLARG	:lisp-type integer
		:vax-type  :unsigned-quadword
		:mechanism :reference
		:access :in))
 
 
(defun lisp$SYS_GETDVIW (EFN CHAN DEVNAM ITMLST ASTADR ASTPRM NULLARG 
&optional IOSB)
  (declare (integer EFN))
  (declare (fixnum CHAN))
  (declare (simple-string DEVNAM))
  (declare (integer ASTADR))
  (declare (integer ASTPRM))
  (declare (integer NULLARG))
  (declare (integer IOSB))
     (call-out SYS$GETDVIW EFN CHAN DEVNAM ITMLST IOSB ASTADR ASTPRM 
NULLARG)
			(values IOSB))
 
 
;;;  $GETJPI
;;;
;;;    Get Job/Process Information
;;;
;;;     $GETJPI  [efn] ,[pidadr] ,[prcnam] ,itmlst ,[iosb], [astadr],
;;;     ($GETJPIW)   [astprm]
;;;
;;;     efn    = event flag to be set at completion
;;;
;;;     pidadr = address of process identification
;;;
;;;     prcnam = address of process name string descriptor
;;;
;;;     itmlst = address of a list of item descriptors
;;;
;;;     iosb   = address of a quadword I/O status block
;;;
;;;     astadr = address of entry mask of AST routine
;;;
;;;     astprm = value to be passed to AST routine as an argument
;;;
;;;                                    
(define-external-routine (SYS$GETJPI

		:result  
		        (:lisp-type integer :vax-type :longword))
  (EFN		:lisp-type integer
		:vax-type  :unsigned-longword
		:mechanism :value
		:access :in)
  (PIDADR	:lisp-type integer
		:vax-type  :unsigned-longword
		:mechanism :reference
		:access :in-out)
  (PRCNAM	:lisp-type simple-string
		:vax-type  :text
		:mechanism :descriptor
		:access :in)
  (ITMLST	:lisp-type alien-structure
		:mechanism :reference
		:access :in)
  (IOSB		:lisp-type integer
		:vax-type  :unsigned-quadword
		:mechanism :reference
		:access :in-out)
  (ASTADR	:lisp-type integer
		:vax-type  :unsigned-longword
		:mechanism :value
		:access :in)
  (ASTPRM	:lisp-type integer
		:vax-type  :unsigned-longword
		:mechanism :value
		:access :in))
 
 
(defun lisp$SYS_GETJPI (EFN PRCNAM ITMLST ASTADR ASTPRM &optional PIDADR 
IOSB)
  (declare (integer EFN))
  (declare (simple-string PRCNAM))
  (declare (integer ASTADR))
  (declare (integer ASTPRM))
  (declare (integer PIDADR))
  (declare (integer IOSB))
     (call-out SYS$GETJPI EFN PIDADR PRCNAM ITMLST IOSB ASTADR ASTPRM)
			(values PIDADR IOSB))
 
 
(define-external-routine (SYS$GETJPIW

		:result  
		        (:lisp-type integer :vax-type :longword))
  (EFN		:lisp-type integer
		:vax-type  :unsigned-longword
		:mechanism :value
		:access :in)
  (PIDADR	:lisp-type integer
		:vax-type  :unsigned-longword
		:mechanism :reference
		:access :in-out)
  (PRCNAM	:lisp-type simple-string
		:vax-type  :text
		:mechanism :descriptor
		:access :in)
  (ITMLST	:lisp-type alien-structure
		:mechanism :reference
		:access :in)
  (IOSB		:lisp-type integer
		:vax-type  :unsigned-quadword
		:mechanism :reference
		:access :in-out)
  (ASTADR	:lisp-type integer
		:vax-type  :unsigned-longword
		:mechanism :value
		:access :in)
  (ASTPRM	:lisp-type integer
		:vax-type  :unsigned-longword
		:mechanism :value
		:access :in))
 
 
(defun lisp$SYS_GETJPIW (EFN PRCNAM ITMLST ASTADR ASTPRM &optional PIDADR 
IOSB)
  (declare (integer EFN))
  (declare (simple-string PRCNAM))
  (declare (integer ASTADR))
  (declare (integer ASTPRM))
  (declare (integer PIDADR))
  (declare (integer IOSB))
     (call-out SYS$GETJPIW EFN PIDADR PRCNAM ITMLST IOSB ASTADR 
ASTPRM)
			(values PIDADR IOSB))
 
 
;;;  $GETLKI
;;;
;;;    Get Lock Information
;;;
;;;     $GETLKI  [efn] ,lkidadr ,itmlst ,[iosb], [astadr], [astprm],
;;;     ($GETLKIW)   [reserved]
;;;
;;;     efn    = event flag to be set at completion
;;;
;;;     lkidadr = address of lock identification
;;;
;;;     itmlst = address of a list of item descriptors
;;;
;;;     iosb   = address of a quadword I/O status block
;;;
;;;     astadr = address of entry mask of AST routine
;;;
;;;     astprm = value to be passed to AST routine as an argument
;;;
;;;     reserved = reserved parameter
;;;
;;;                                    
(define-external-routine (SYS$GETLKI

		:result  
		        (:lisp-type integer :vax-type :longword))
  (EFN		:lisp-type integer
		:vax-type  :unsigned-longword
		:mechanism :value
		:access :in)
  (LKIDADR	:lisp-type integer
		:vax-type  :unsigned-longword
		:mechanism :reference
		:access :in-out)
  (ITMLST	:lisp-type alien-structure
		:mechanism :reference
		:access :in)
  (IOSB		:lisp-type integer
		:vax-type  :unsigned-quadword
		:mechanism :reference
		:access :in-out)
  (ASTADR	:lisp-type integer
		:vax-type  :unsigned-longword
		:mechanism :value
		:access :in)
  (ASTPRM	:lisp-type integer
		:vax-type  :unsigned-longword
		:mechanism :value
		:access :in)
  (RESERVED	:lisp-type integer
		:vax-type  :unsigned-longword
		:mechanism :value
		:access :in))
 
 
(defun lisp$SYS_GETLKI (EFN ITMLST ASTADR ASTPRM RESERVED &optional LKIDADR 
IOSB)
  (declare (integer EFN))
  (declare (integer ASTADR))
  (declare (integer ASTPRM))
  (declare (integer RESERVED))
  (declare (integer LKIDADR))
  (declare (integer IOSB))
     (call-out SYS$GETLKI EFN LKIDADR ITMLST IOSB ASTADR ASTPRM 
RESERVED)
			(values LKIDADR IOSB))
 
 
(define-external-routine (SYS$GETLKIW

		:result  
		        (:lisp-type integer :vax-type :longword))
  (EFN		:lisp-type integer
		:vax-type  :unsigned-longword
		:mechanism :value
		:access :in)
  (LKIDADR	:lisp-type integer
		:vax-type  :unsigned-longword
		:mechanism :reference
		:access :in-out)
  (ITMLST	:lisp-type alien-structure
		:mechanism :reference
		:access :in)
  (IOSB		:lisp-type integer
		:vax-type  :unsigned-quadword
		:mechanism :reference
		:access :in-out)
  (ASTADR	:lisp-type integer
		:vax-type  :unsigned-longword
		:mechanism :value
		:access :in)
  (ASTPRM	:lisp-type integer
		:vax-type  :unsigned-longword
		:mechanism :value
		:access :in)
  (RESERVED	:lisp-type integer
		:vax-type  :unsigned-longword
		:mechanism :value
		:access :in))
 
 
(defun lisp$SYS_GETLKIW (EFN ITMLST ASTADR ASTPRM RESERVED &optional LKIDADR 
IOSB)
  (declare (integer EFN))
  (declare (integer ASTADR))
  (declare (integer ASTPRM))
  (declare (integer RESERVED))
  (declare (integer LKIDADR))
  (declare (integer IOSB))
     (call-out SYS$GETLKIW EFN LKIDADR ITMLST IOSB ASTADR ASTPRM 
RESERVED)
			(values LKIDADR IOSB))
 
 
;;;  $GETMSG
;;;
;;;    Get Message
;;;
;;;     $GETMSG  msgid ,msglen ,bufadr ,[flags] ,[outadr]
;;;
;;;     msgid  = identification of message to be retrieved
;;;
;;;     msglen = address  of  a  word  to  receive  length  of  string
;;;       returned
;;;
;;;     bufadr = address of buffer descriptor  of  buffer  to  receive
;;;       string
;;;
;;;     flags  = flag bits for message content (macro default = 15)
;;;
;;;           Bit  Value/Meaning
;;;
;;;            0  1 Include text
;;;               0 Do not include text
;;;            1  1 Include identifier
;;;               0 Do not include identifier
;;;            2  1 Include severity
;;;               0 Do not include severity
;;;            3  1 Include component
;;;               0 Do not include component
;;;
;;;     outadr = address of 4-byte array to receive the following values:
;;;
;;;       Byte       Contents
;;;
;;;        0  Reserved
;;;        1  Count of FAO arguments
;;;        2  User value                                                     
;;;        3  Reserved
;;;
(define-external-routine (SYS$GETMSG

		:result  
		        (:lisp-type integer :vax-type :longword))
  (MSGID	:lisp-type integer
		:vax-type  :unsigned-longword
		:mechanism :value
		:access :in)
  (MSGLEN	:lisp-type integer ; unsigned-byte 16
		:vax-type  :unsigned-word
		:mechanism :reference
		:access :in-out)
  (BUFADR	:lisp-type simple-string
		:vax-type  :text
		:mechanism :descriptor
		:access :in-out)
  (FLAGS	:lisp-type integer
		:vax-type  :unsigned-longword
		:mechanism :value
		:access :in)
  (OUTADR	:lisp-type (unsigned-byte 32 (array  (4)))
		:mechanism :reference
		:access :in-out))
 
 
(defun lisp$SYS_GETMSG (MSGID FLAGS &optional MSGLEN BUFADR OUTADR)
  (declare (integer MSGID))
  (declare (integer FLAGS))
  (declare (fixnum MSGLEN))
  (declare (simple-string BUFADR))
     (call-out SYS$GETMSG MSGID MSGLEN BUFADR FLAGS OUTADR)
			(values MSGLEN BUFADR OUTADR))
 
 
;;;  $GETPTI
;;;
;;;    Get Page Table Information
;;;
;;;     $GETPTI  [inadr],[retadr],[acmode],[mask],[pagcnt]
;;;
;;;     inadr	= address of two longwords containing starting
;;;	and ending virtual address to operate on
;;;
;;;     retadr	= address of two longwords into which starting
;;;	and ending address of pages operated on is returned
;;;
;;;     acmode   = access mode against which ownership is checked
;;;
;;;     mask	= mask of page table information control bits
;;;
;;;     pagcnt	= minimum page count
;;;
;;;
(define-external-routine (SYS$GETPTI

		:result  
		        (:lisp-type integer :vax-type :longword))
  (INADR	:lisp-type (unsigned-byte 32 (array (2)))
		:mechanism :reference
		:access :in)
  (RETADR	:lisp-type (unsigned-byte 32 (array (2)))
		:mechanism :reference
		:access :in-out)
  (ACMODE	:lisp-type integer
		:vax-type  :unsigned-longword
		:mechanism :value
		:access :in)
  (MASK		:lisp-type integer
		:vax-type  :unsigned-longword
		:mechanism :value
		:access :in)
  (PAGCNT	:lisp-type integer
		:vax-type  :unsigned-longword
		:mechanism :value
		:access :in))
 
 
(defun lisp$SYS_GETPTI (INADR ACMODE MASK PAGCNT &optional RETADR)
  (declare (integer ACMODE))
  (declare (integer MASK))
  (declare (integer PAGCNT))
     (call-out SYS$GETPTI INADR RETADR ACMODE MASK PAGCNT)
			(values RETADR))
 
 
;;;  $GETQUI
;;;
;;;    Get Queue Information
;;;
;;;     $GETQUI   [efn], func, [nullarg], [itmlst],
;;;    ($GETQUIW) [iosb], [astadr], [astprm]
;;;
;;;     efn     = event flag to be set when request completes
;;;     func    = code specifying function to be performed
;;;     nullarg = reserved argument for similarity with $getxxx services
;;;     itmlst  = address of a list of item descriptors for the operation
;;;     iosb    = address of a quadword status block to receive the final status
;;;     astadr  = address of an ast routine to be called when request completes
;;;     astprm  = 32-bit ast parameter 
;;;                 
(define-external-routine (SYS$GETQUI

		:result  
		        (:lisp-type integer :vax-type :longword))
  (EFN		:lisp-type integer
		:vax-type  :unsigned-longword
		:mechanism :value
		:access :in)
  (FUNC		:lisp-type integer ; unsigned-byte 16
		:vax-type  :unsigned-word
		:mechanism :value
		:access :in)
  (NULLARG	:lisp-type integer
		:vax-type  :unsigned-longword
		:mechanism :value
		:access :in)
  (ITMLST	:lisp-type alien-structure
		:mechanism :reference
		:access :in)
  (IOSB		:lisp-type integer
		:vax-type  :unsigned-quadword
		:mechanism :reference
		:access :in-out)
  (ASTADR	:lisp-type integer
		:vax-type  :unsigned-longword
		:mechanism :value
		:access :in)
  (ASTPRM	:lisp-type integer
		:vax-type  :unsigned-longword
		:mechanism :value
		:access :in))
 
 
(defun lisp$SYS_GETQUI (EFN FUNC NULLARG ITMLST ASTADR ASTPRM &optional IOSB)
  (declare (integer EFN))
  (declare (fixnum FUNC))
  (declare (integer NULLARG))
  (declare (integer ASTADR))
  (declare (integer ASTPRM))
  (declare (integer IOSB))
     (call-out SYS$GETQUI EFN FUNC NULLARG ITMLST IOSB ASTADR ASTPRM)
			(values IOSB))
 
 
(define-external-routine (SYS$GETQUIW

		:result  
		        (:lisp-type integer :vax-type :longword))
  (EFN		:lisp-type integer
		:vax-type  :unsigned-longword
		:mechanism :value
		:access :in)
  (FUNC		:lisp-type integer ; unsigned-byte 16
		:vax-type  :unsigned-word
		:mechanism :value
		:access :in)
  (NULLARG	:lisp-type integer
		:vax-type  :unsigned-longword
		:mechanism :value
		:access :in)
  (ITMLST	:lisp-type alien-structure
		:mechanism :reference
		:access :in)
  (IOSB		:lisp-type integer
		:vax-type  :unsigned-quadword
		:mechanism :reference
		:access :in-out)
  (ASTADR	:lisp-type integer
		:vax-type  :unsigned-longword
		:mechanism :value
		:access :in)
  (ASTPRM	:lisp-type integer
		:vax-type  :unsigned-longword
		:mechanism :value
		:access :in))
 
 
(defun lisp$SYS_GETQUIW (EFN FUNC NULLARG ITMLST ASTADR ASTPRM &optional IOSB)
  (declare (integer EFN))
  (declare (fixnum FUNC))
  (declare (integer NULLARG))
  (declare (integer ASTADR))
  (declare (integer ASTPRM))
  (declare (integer IOSB))
     (call-out SYS$GETQUIW EFN FUNC NULLARG ITMLST IOSB ASTADR ASTPRM)
			(values IOSB))
 
 
;;;  $GETSYI
;;;
;;;    Get System-Wide Information
;;;
;;;     $GETSYI  [efn] ,[csidadr],[nodename],itmlst ,[iosb] ,[astadr],
;;;    ($GETSYIW)  [astprm]
;;;
;;;     efn    = event flag to be set at completion
;;;
;;;     csidadr = address of cluster system identification
;;;
;;;     nodename = address of node name string descriptor
;;;
;;;     itmlst = address of a list of item descriptors
;;;
;;;     iosb   = address of a quadword I/O status block
;;;
;;;     astadr = address of entry mask of AST routine
;;;
;;;     astprm = value to be passed to AST routine
;;;
;;;
;;;     The second and third arguments in the $GETSYI argument list are
;;;     not used; they are reserved for future use.
;;;                                    
(define-external-routine (SYS$GETSYI

		:result  
		        (:lisp-type integer :vax-type :longword))
  (EFN		:lisp-type integer
		:vax-type  :unsigned-longword
		:mechanism :value
		:access :in)
  (CSIDADR	:lisp-type integer
		:vax-type  :unsigned-longword
		:mechanism :reference
		:access :in-out)
  (NODENAME	:lisp-type simple-string
		:vax-type  :text
		:mechanism :descriptor
		:access :in)
  (ITMLST	:lisp-type alien-structure
		:mechanism :reference
		:access :in)
  (IOSB		:lisp-type integer
		:vax-type  :unsigned-quadword
		:mechanism :reference
		:access :in-out)
  (ASTADR	:lisp-type integer
		:vax-type  :unsigned-longword
		:mechanism :value
		:access :in)
  (ASTPRM	:lisp-type integer
		:vax-type  :unsigned-longword
		:mechanism :value
		:access :in))
 
 
(defun lisp$SYS_GETSYI (EFN NODENAME ITMLST ASTADR ASTPRM &optional CSIDADR 
IOSB)
  (declare (integer EFN))
  (declare (simple-string NODENAME))
  (declare (integer ASTADR))
  (declare (integer ASTPRM))
  (declare (integer CSIDADR))
  (declare (integer IOSB))
     (call-out SYS$GETSYI EFN CSIDADR NODENAME ITMLST IOSB ASTADR 
ASTPRM)
			(values CSIDADR IOSB))
 
 
(define-external-routine (SYS$GETSYIW

		:result  
		        (:lisp-type integer :vax-type :longword))
  (EFN		:lisp-type integer
		:vax-type  :unsigned-longword
		:mechanism :value
		:access :in)
  (CSIDADR	:lisp-type integer
		:vax-type  :unsigned-longword
		:mechanism :reference
		:access :in-out)
  (NODENAME	:lisp-type simple-string
		:vax-type  :text
		:mechanism :descriptor
		:access :in)
  (ITMLST	:lisp-type alien-structure
		:mechanism :reference
		:access :in)
  (IOSB		:lisp-type integer
		:vax-type  :unsigned-quadword
		:mechanism :reference
		:access :in-out)
  (ASTADR	:lisp-type integer
		:vax-type  :unsigned-longword
		:mechanism :value
		:access :in)
  (ASTPRM	:lisp-type integer
		:vax-type  :unsigned-longword
		:mechanism :value
		:access :in))
 
 
(defun lisp$SYS_GETSYIW (EFN NODENAME ITMLST ASTADR ASTPRM &optional CSIDADR 
IOSB)
  (declare (integer EFN))
  (declare (simple-string NODENAME))
  (declare (integer ASTADR))
  (declare (integer ASTPRM))
  (declare (integer CSIDADR))
  (declare (integer IOSB))
     (call-out SYS$GETSYIW EFN CSIDADR NODENAME ITMLST IOSB ASTADR 
ASTPRM)
			(values CSIDADR IOSB))
 
 
;;;  $GETTIM
;;;
;;;    Get Time
;;;
;;;     $GETTIM  timadr
;;;
;;;     timadr = address of a quadword to receive 64-bit current time value
;;;                                    
(define-external-routine (SYS$GETTIM

		:result  
		        (:lisp-type integer :vax-type :longword))
  (TIMADR	:lisp-type integer
		:vax-type  :unsigned-quadword
		:mechanism :reference
		:access :in-out))
 
 
(defun lisp$SYS_GETTIM (&optional TIMADR)
  (declare (integer TIMADR))
     (call-out SYS$GETTIM TIMADR)
			(values TIMADR))
 
 
;;;  $GETUAI
;;;
;;;    Get User Authorization Information
;;;
;;;     $GETUAI  [efn] ,[contxt] ,usrnam ,itmlst ,[iosb] ,[astadr]
;;;    		,[astprm]
;;;
;;;     efn    = event flag to be set at completion
;;;
;;;     contxt = address of a context longword (UAF IFI & ISI)
;;;
;;;     usrnam = address of user name descriptor
;;;
;;;     itmlst = address of a list of item descriptors
;;;
;;;     iosb   = address of a quadword I/O status block
;;;
;;;     astadr = address of entry mask of AST routine
;;;
;;;     astprm = value to be passed to AST routine
;;;
;;;                                    
(define-external-routine (SYS$GETUAI

		:result  
		        (:lisp-type integer :vax-type :longword))
  (EFN		:lisp-type integer
		:vax-type  :unsigned-longword
		:mechanism :value
		:access :in)
  (CONTXT	:lisp-type integer
		:vax-type  :unsigned-longword
		:mechanism :reference
		:access :in)
  (USRNAM	:lisp-type simple-string
		:vax-type  :text
		:mechanism :descriptor
		:access :in)
  (ITMLST	:lisp-type alien-structure
		:mechanism :reference
		:access :in)
  (IOSB		:lisp-type integer
		:vax-type  :unsigned-quadword
		:mechanism :reference
		:access :in-out)
  (ASTADR	:lisp-type integer
		:vax-type  :unsigned-longword
		:mechanism :value
		:access :in)
  (ASTPRM	:lisp-type integer
		:vax-type  :unsigned-longword
		:mechanism :value
		:access :in))
 
 
(defun lisp$SYS_GETUAI (EFN CONTXT USRNAM ITMLST ASTADR ASTPRM &optional IOSB)
  (declare (integer EFN))
  (declare (integer CONTXT))
  (declare (simple-string USRNAM))
  (declare (integer ASTADR))
  (declare (integer ASTPRM))
  (declare (integer IOSB))
     (call-out SYS$GETUAI EFN CONTXT USRNAM ITMLST IOSB ASTADR ASTPRM)
			(values IOSB))
 
 
;;;
;;;  $GRANTID
;;;
;;;    Grant Identifier to Process
;;;
;;;	$GRANTID [pidadr], [prcnam], [id], [name], [prvatr]
;;;
;;;	pidadr  = address of PID of affected process
;;;	prcnam  = address of string descriptor of process name
;;;	id      = address of quadword identifier and attributes
;;;	name    = address of string descriptor of identifier name
;;;	prvatr  = address to store attributes of superseded id
;;;
(define-external-routine (SYS$GRANTID

		:result  
		        (:lisp-type integer :vax-type :longword))
  (PIDADR	:lisp-type integer
		:vax-type  :unsigned-longword
		:mechanism :reference
		:access :in-out)
  (PRCNAM	:lisp-type simple-string
		:vax-type  :text
		:mechanism :descriptor
		:access :in)
  (ID		:lisp-type integer
		:vax-type  :unsigned-quadword
		:mechanism :reference
		:access :in-out)
  (NAME		:lisp-type simple-string
		:vax-type  :text
		:mechanism :descriptor
		:access :in)
  (PRVATR	:lisp-type integer
		:vax-type  :unsigned-longword
		:mechanism :reference
		:access :in-out))
 
 
(defun lisp$SYS_GRANTID (PRCNAM NAME &optional PIDADR ID PRVATR)
  (declare (simple-string PRCNAM))
  (declare (simple-string NAME))
  (declare (integer PIDADR))
  (declare (integer ID))
  (declare (integer PRVATR))
     (call-out SYS$GRANTID PIDADR PRCNAM ID NAME PRVATR)
			(values PIDADR ID PRVATR))
 
 
;;;
;;;  $GRANT_LICENSE
;;;
;;;  Grant authorization to execute licensed software product.
;;;
;;;	$GRANT_LICENSE  prdnam ,prducer [,contxt] [,itmlst]
;;;
;;;	prdnam	= address of descriptor for software product name
;;;	prducer	= address of descriptor for software producer name
;;;	contxt  = address of context buffer (4 longwords)
;;;	itmlst	= address of a list of item descriptors
;;;
(define-external-routine (SYS$GRANT_LICENSE

		:result  
		        (:lisp-type integer :vax-type :longword))
  (PRDNAM	:lisp-type simple-string
		:vax-type  :text
		:mechanism :descriptor
		:access :in)
  (PRDUCER	:lisp-type simple-string
		:vax-type  :text
		:mechanism :descriptor
		:access :in)
  (CONTXT	:lisp-type (unsigned-byte 32 (array  (4)))
		:mechanism :reference
		:access :in)
  (ITMLST	:lisp-type alien-structure
		:mechanism :reference
		:access :in))
 
 
(defun lisp$SYS_GRANT_LICENSE (PRDNAM PRDUCER CONTXT ITMLST)
  (declare (simple-string PRDNAM))
  (declare (simple-string PRDUCER))
     (call-out SYS$GRANT_LICENSE PRDNAM PRDUCER CONTXT ITMLST))
 
 
;;;  $HIBER
;;;
;;;    Hibernate
;;;
;;;     $HIBER_S
;;;
(define-external-routine (SYS$HIBER

		:result  
		        (:lisp-type integer :vax-type :longword)))
;;;
;;;  $IDTOASC
;;;
;;;    Identifier To Ascii Conversion
;;;
;;;	$IDTOASC id, [namlen], [nambuf], [resid], [attrib], [contxt]
;;;
;;;	id	= identifier longword to convert, or zero to
;;;		  find all identifiers (wildcarding)
;;;	namlen	= address of a word to store the length of the
;;;		  identifier name
;;;	nambuf	= address of a character string descriptor that
;;;		  describes the buffer to return the identifier name
;;;	resid	= address of a longword to return the id found
;;;		  while wildcarding
;;;	attrib	= address to return the attributes longword
;;;	contxt	= address of a longword containing the record stream
;;;		  context. initially should be zero, value output
;;;		  on first call, value input on subsequent calls.
;;;
(define-external-routine (SYS$IDTOASC

		:result  
		        (:lisp-type integer :vax-type :longword))
  (ID		:lisp-type integer
		:vax-type  :unsigned-longword
		:mechanism :value
		:access :in)
  (NAMLEN	:lisp-type integer ; unsigned-byte 16
		:vax-type  :unsigned-word
		:mechanism :reference
		:access :in-out)
  (NAMBUF	:lisp-type simple-string
		:vax-type  :text
		:mechanism :descriptor
		:access :in-out)
  (RESID	:lisp-type integer
		:vax-type  :unsigned-longword
		:mechanism :reference
		:access :in-out)
  (ATTRIB	:lisp-type integer
		:vax-type  :unsigned-longword
		:mechanism :reference
		:access :in-out)
  (CONTXT	:lisp-type integer
		:vax-type  :unsigned-longword
		:mechanism :reference
		:access :in-out))
 
 
(defun lisp$SYS_IDTOASC (ID &optional NAMLEN NAMBUF RESID ATTRIB 
CONTXT)
  (declare (integer ID))
  (declare (fixnum NAMLEN))
  (declare (simple-string NAMBUF))
  (declare (integer RESID))
  (declare (integer ATTRIB))
  (declare (integer CONTXT))
     (call-out SYS$IDTOASC ID NAMLEN NAMBUF RESID ATTRIB CONTXT)
			(values NAMLEN NAMBUF RESID ATTRIB CONTXT))
 
 
;;;  $IMGACT
;;;
;;;    Image Activation
;;;
;;;     $IMGACT	name,[dflnam],hdrbuf,[imgctl],[inadr],
;;;		[retadr], [ident], [acmode]
;;;
;;;
;;;     name	= address of descriptor for file name string
;;;
;;;     dflnam	= descriptor for file name string
;;;
;;;     hdrbuf	= address of 512 byte buffer to write in
;;;
;;;     imgctl	= image activation control flags
;;;
;;;     inadr	= address of quadword specifying virtual address
;;;		  range to be mapped
;;;
;;;     retadr	= address of quadword specifying virtual address
;;;		  range actually mapped
;;;                                    
;;;     ident	= address of quadword holding image section match
;;;		  control and identifier
;;;
;;;     acmode	= access mode to be the owner of the created pages
;;;
(define-external-routine (SYS$IMGACT

		:result  
		        (:lisp-type integer :vax-type :longword))
  (NAME		:lisp-type simple-string
		:vax-type  :text
		:mechanism :descriptor
		:access :in)
  (DFLNAM	:lisp-type simple-string
		:vax-type  :text
		:mechanism :descriptor
		:access :in)
  (HDRBUF	:lisp-type integer
		:vax-type  :unsigned-longword
		:mechanism :reference
		:access :in-out)
  (IMGCTL	:lisp-type integer
		:vax-type  :unsigned-longword
		:mechanism :value
		:access :in)
  (INADR	:lisp-type (unsigned-byte 32 (array (2)))
		:mechanism :reference
		:access :in)
  (RETADR	:lisp-type (unsigned-byte 32 (array (2)))
		:mechanism :reference
		:access :in-out)
  (IDENT	:lisp-type integer
		:vax-type  :unsigned-quadword
		:mechanism :reference
		:access :in)
  (ACMODE	:lisp-type integer
		:vax-type  :unsigned-longword
		:mechanism :value
		:access :in))
 
 
(defun lisp$SYS_IMGACT (NAME DFLNAM IMGCTL INADR IDENT ACMODE &optional HDRBUF 
RETADR)
  (declare (simple-string NAME))
  (declare (simple-string DFLNAM))
  (declare (integer IMGCTL))
  (declare (integer IDENT))
  (declare (integer ACMODE))
  (declare (integer HDRBUF))
     (call-out SYS$IMGACT NAME DFLNAM HDRBUF IMGCTL INADR RETADR 
IDENT ACMODE)
			(values HDRBUF RETADR))
 
 
;;;  $IMGFIX
;;;
;;;    Image Address Fixup Service
;;;
;;;     $IMGFIX                        
;;;
(define-external-routine (SYS$IMGFIX

		:result  
		        (:lisp-type integer :vax-type :longword)))
;;;  $IPC
;;;
;;;    Interprocess Communication Request
;;;
;;;     $IPC     [efn] ,func ,ipcb ,[astadr] ,[astprm]
;;;     ($IPCW)  ,[inplst] ,[tmplst] ,[outlst] 
;;;
;;;     efn    = number of event flag to set on completion
;;;
;;;     func   = function code specifying action to be performed
;;;
;;;     ipcb   = address of Interprocess Communication Block
;;;
;;;     astadr = address of entry mask of AST routine
;;;
;;;     astprm = value to be passed to AST routine as argument
;;;
;;;     inplst = address of descriptor describing a network item list
;;;		This input item list contains input parameters for
;;;		the function.
;;;
;;;     tmplst = address of descriptor describing a network item list.
;;;		This template item list contains parameters describing
;;;		the requested items to be returned.
;;;
;;;     outlst = address of descriptor describing an output buffer.  This
;;;		buffer will receive the parameters described by the tmplst
;;;		item list.	        
;;;                                    
(define-external-routine (SYS$IPC

		:result  
		        (:lisp-type integer :vax-type :longword))
  (EFN		:lisp-type integer
		:vax-type  :unsigned-longword
		:mechanism :value
		:access :in)
  (FUNC		:lisp-type integer ; unsigned-byte 16
		:vax-type  :unsigned-word
		:mechanism :value
		:access :in)
  (IPCB		:lisp-type integer
		:vax-type  :unsigned-longword
		:mechanism :reference
		:access :in)
  (ASTADR	:lisp-type integer
		:vax-type  :unsigned-longword
		:mechanism :value
		:access :in)
  (ASTPRM	:lisp-type integer
		:vax-type  :unsigned-longword
		:mechanism :value
		:access :in)
  (INPLST	:lisp-type simple-string
		:vax-type  :text
		:mechanism :descriptor
		:access :in)
  (TMPLST	:lisp-type simple-string
		:vax-type  :text
		:mechanism :descriptor
		:access :in)
  (OUTLST	:lisp-type simple-string
		:vax-type  :text
		:mechanism :descriptor
		:access :in))
 
 
(defun lisp$SYS_IPC (EFN FUNC IPCB ASTADR ASTPRM INPLST TMPLST OUTLST)
  (declare (integer EFN))
  (declare (fixnum FUNC))
  (declare (integer IPCB))
  (declare (integer ASTADR))
  (declare (integer ASTPRM))
  (declare (simple-string INPLST))
  (declare (simple-string TMPLST))
  (declare (simple-string OUTLST))
     (call-out SYS$IPC EFN FUNC IPCB ASTADR ASTPRM INPLST TMPLST 
OUTLST))
 
 
(define-external-routine (SYS$IPCW

		:result  
		        (:lisp-type integer :vax-type :longword))
  (EFN		:lisp-type integer
		:vax-type  :unsigned-longword
		:mechanism :value
		:access :in)
  (FUNC		:lisp-type integer ; unsigned-byte 16
		:vax-type  :unsigned-word
		:mechanism :value
		:access :in)
  (IPCB		:lisp-type integer
		:vax-type  :unsigned-longword
		:mechanism :reference
		:access :in)
  (ASTADR	:lisp-type integer
		:vax-type  :unsigned-longword
		:mechanism :value
		:access :in)
  (ASTPRM	:lisp-type integer
		:vax-type  :unsigned-longword
		:mechanism :value
		:access :in)
  (INPLST	:lisp-type simple-string
		:vax-type  :text
		:mechanism :descriptor
		:access :in)
  (TMPLST	:lisp-type simple-string
		:vax-type  :text
		:mechanism :descriptor
		:access :in)
  (OUTLST	:lisp-type simple-string
		:vax-type  :text
		:mechanism :descriptor
		:access :in))
 
 
(defun lisp$SYS_IPCW (EFN FUNC IPCB ASTADR ASTPRM INPLST TMPLST 
OUTLST)
  (declare (integer EFN))
  (declare (fixnum FUNC))
  (declare (integer IPCB))
  (declare (integer ASTADR))
  (declare (integer ASTPRM))
  (declare (simple-string INPLST))
  (declare (simple-string TMPLST))
  (declare (simple-string OUTLST))
     (call-out SYS$IPCW EFN FUNC IPCB ASTADR ASTPRM INPLST TMPLST 
OUTLST))
 
 
;;;
;;;  $JOIN_RM
;;;
;;;    Forget a resource manager previously declared to DDTM
;;;
;;;	$JOIN_RM	[efn], [flags], iosb, [astadr], [astprm], rm_id,
;;;	  ($JOIN_RMW)			rm_log_id, tid, part_id, tm_log_id,
;;;					rm_ctx, [parent]
;;;
;;;	efn	= event flag to set upon completion
;;;	flags	= operation flags
;;;	iosb	= address of I/O status block
;;;	astadr	= address of entry mask of AST routine
;;;	astprm	= value to be passed to AST routine
;;;	rm_id	= resource manager id value
;;;	rm_log_id = address of resource manager log id
;;;	tid	= address of transaction id
;;;	part_id	= address of longword to receive participant id
;;;	tm_log_id = address to receive transaction mgr log id
;;;	rm_ctx	= value to be passed to evt_rtn (see $DECLARE_RM)
;;;	parent	= address of parent node name descriptor
;;;
(define-external-routine (SYS$JOIN_RM

		:result  
		        (:lisp-type integer :vax-type :longword))
  (EFN		:lisp-type integer
		:vax-type  :unsigned-longword
		:mechanism :value
		:access :in)
  (FLAGS	:lisp-type integer
		:vax-type  :unsigned-longword
		:mechanism :value
		:access :in)
  (IOSB		:lisp-type integer
		:vax-type  :unsigned-quadword
		:mechanism :reference
		:access :in-out)
  (ASTADR	:lisp-type integer
		:vax-type  :unsigned-longword
		:mechanism :value
		:access :in)
  (ASTPRM	:lisp-type integer
		:vax-type  :unsigned-longword
		:mechanism :value
		:access :in)
  (RM_ID	:lisp-type integer
		:vax-type  :unsigned-longword
		:mechanism :value
		:access :in)
  (RM_LOG_ID	:lisp-type integer
		:vax-type  :unsigned-quadword ; :unsigned-octaword ??
		:mechanism :reference
		:access :in)
  (TID		:lisp-type integer
		:vax-type  :unsigned-quadword ; :unsigned-octaword ??
		:mechanism :reference
		:access :in)
  (PART_ID	:lisp-type integer
		:vax-type  :unsigned-longword
		:mechanism :reference
		:access :in-out)
  (TM_LOG_ID	:lisp-type integer
		:vax-type  :unsigned-quadword ; :unsigned-octaword ??
		:mechanism :reference
		:access :in-out)
  (RM_CTX	:lisp-type integer
		:vax-type  :unsigned-longword
		:mechanism :value
		:access :in)
  (PARENT	:lisp-type simple-string
		:vax-type  :text
		:mechanism :descriptor
		:access :in))
 
 
(defun lisp$SYS_JOIN_RM (EFN FLAGS ASTADR ASTPRM RM_ID RM_LOG_ID 
TID RM_CTX PARENT &optional IOSB PART_ID TM_LOG_ID)
  (declare (integer EFN))
  (declare (integer FLAGS))
  (declare (integer ASTADR))
  (declare (integer ASTPRM))
  (declare (integer RM_ID))
  (declare (integer RM_LOG_ID))
  (declare (integer TID))
  (declare (integer RM_CTX))
  (declare (simple-string PARENT))
  (declare (integer IOSB))
  (declare (integer PART_ID))
  (declare (integer TM_LOG_ID))
     (call-out SYS$JOIN_RM EFN FLAGS IOSB ASTADR ASTPRM RM_ID RM_LOG_ID 
TID PART_ID TM_LOG_ID RM_CTX PARENT)
			(values IOSB PART_ID TM_LOG_ID))
 
 
(define-external-routine (SYS$JOIN_RMW

		:result  
		        (:lisp-type integer :vax-type :longword))
  (EFN		:lisp-type integer
		:vax-type  :unsigned-longword
		:mechanism :value
		:access :in)
  (FLAGS	:lisp-type integer
		:vax-type  :unsigned-longword
		:mechanism :value
		:access :in)
  (IOSB		:lisp-type integer
		:vax-type  :unsigned-quadword
		:mechanism :reference
		:access :in-out)
  (ASTADR	:lisp-type integer
		:vax-type  :unsigned-longword
		:mechanism :value
		:access :in)
  (ASTPRM	:lisp-type integer
		:vax-type  :unsigned-longword
		:mechanism :value
		:access :in)
  (RM_ID	:lisp-type integer
		:vax-type  :unsigned-longword
		:mechanism :value
		:access :in)
  (RM_LOG_ID	:lisp-type integer
		:vax-type  :unsigned-quadword ; :unsigned-octaword ??
		:mechanism :reference
		:access :in)
  (TID		:lisp-type integer
		:vax-type  :unsigned-quadword ; :unsigned-octaword ??
		:mechanism :reference
		:access :in)
  (PART_ID	:lisp-type integer
		:vax-type  :unsigned-longword
		:mechanism :reference
		:access :in-out)
  (TM_LOG_ID	:lisp-type integer
		:vax-type  :unsigned-quadword ; :unsigned-octaword ??
		:mechanism :reference
		:access :in-out)
  (RM_CTX	:lisp-type integer
		:vax-type  :unsigned-longword
		:mechanism :value
		:access :in)
  (PARENT	:lisp-type simple-string
		:vax-type  :text
		:mechanism :descriptor
		:access :in))
 
 
(defun lisp$SYS_JOIN_RMW (EFN FLAGS ASTADR ASTPRM RM_ID RM_LOG_ID 
TID RM_CTX PARENT &optional IOSB PART_ID TM_LOG_ID)
  (declare (integer EFN))
  (declare (integer FLAGS))
  (declare (integer ASTADR))
  (declare (integer ASTPRM))
  (declare (integer RM_ID))
  (declare (integer RM_LOG_ID))
  (declare (integer TID))
  (declare (integer RM_CTX))
  (declare (simple-string PARENT))
  (declare (integer IOSB))
  (declare (integer PART_ID))
  (declare (integer TM_LOG_ID))
     (call-out SYS$JOIN_RMW EFN FLAGS IOSB ASTADR ASTPRM RM_ID RM_LOG_ID 
TID PART_ID TM_LOG_ID RM_CTX PARENT)
			(values IOSB PART_ID TM_LOG_ID))
 
 
;;;  $LCKPAG
;;;
;;;    Lock Pages in Memory
;;;
;;;     $LCKPAG  inadr ,[retadr] ,[acmode]
;;;
;;;     inadr  = address of 2-longword array containing starting and
;;;              ending addresses of pages to be locked
;;;
;;;     retadr = address of 2-longword array to receive addresses of
;;;              pages actually locked
;;;
;;;     acmode = access mode to check against the owner of the pages
;;;
(define-external-routine (SYS$LCKPAG

		:result  
		        (:lisp-type integer :vax-type :longword))
  (INADR	:lisp-type (unsigned-byte 32 (array (2)))
		:mechanism :reference
		:access :in)
  (RETADR	:lisp-type (unsigned-byte 32 (array (2)))
		:mechanism :reference
		:access :in-out)
  (ACMODE	:lisp-type integer
		:vax-type  :unsigned-longword
		:mechanism :value
		:access :in))
 
 
(defun lisp$SYS_LCKPAG (INADR ACMODE &optional RETADR)
  (declare (integer ACMODE))
     (call-out SYS$LCKPAG INADR RETADR ACMODE)
			(values RETADR))
 
 
;;;  $LKWSET
;;;
;;;    Lock Pages in Working Set
;;;
;;;     $LKWSET  inadr ,[retadr] ,[acmode]
;;;
;;;     inadr  = address of 2-longword array containing starting and
;;;              ending virtual addresses of pages to be locked
;;;
;;;     retadr = address of a 2-longword array to receive starting and
;;;              ending virtual addresses of pages actually locked
;;;
;;;     acmode = access mode to be checked against the page owner
;;;
(define-external-routine (SYS$LKWSET

		:result  
		        (:lisp-type integer :vax-type :longword))
  (INADR	:lisp-type (unsigned-byte 32 (array (2)))
		:mechanism :reference
		:access :in)
  (RETADR	:lisp-type (unsigned-byte 32 (array (2)))
		:mechanism :reference
		:access :in-out)
  (ACMODE	:lisp-type integer
		:vax-type  :unsigned-longword
		:mechanism :value
		:access :in))
 
 
(defun lisp$SYS_LKWSET (INADR ACMODE &optional RETADR)
  (declare (integer ACMODE))
     (call-out SYS$LKWSET INADR RETADR ACMODE)
			(values RETADR))
 
 
;;;  $MGBLSC
;;;
;;;    Map Global Section
;;;
;;;     $MGBLSC  inadr ,[retadr] ,[acmode] ,[flags] ,gsdnam ,[ident] ,[relpag]
;;;
;;;     inadr  = address of 2-longword array containing starting and
;;;              ending addresses of pages to be mapped
;;;
;;;     retadr = address of 2-longword array to receive virtual
;;;              addresses of pages mapped
;;;
;;;     acmode = access mode of owner of mapped pages
;;;
;;;     flags  = flags overriding default section characteristics
;;;
;;;         Flag        Meaning
;;;
;;;       SEC$M_WRT      Read/write section
;;;       SEC$M_SYSGBL   System global section
;;;       SEC$M_EXPREG   Find first available space
;;;
;;;     gsdnam = address of global section name descriptor
;;;
;;;     ident  = address of quadword containing version id and match control
;;;
;;;     relpag = relative page number within global section
;;;
(define-external-routine (SYS$MGBLSC

		:result  
		        (:lisp-type integer :vax-type :longword))
  (INADR	:lisp-type (unsigned-byte 32 (array (2)))
		:mechanism :reference
		:access :in)
  (RETADR	:lisp-type (unsigned-byte 32 (array (2)))
		:mechanism :reference
		:access :in-out)
  (ACMODE	:lisp-type integer
		:vax-type  :unsigned-longword
		:mechanism :value
		:access :in)
  (FLAGS	:lisp-type integer
		:vax-type  :unsigned-longword
		:mechanism :value
		:access :in)
  (GSDNAM	:lisp-type simple-string
		:vax-type  :text
		:mechanism :descriptor
		:access :in)
  (IDENT	:lisp-type integer
		:vax-type  :unsigned-quadword
		:mechanism :reference
		:access :in)
  (RELPAG	:lisp-type integer
		:vax-type  :unsigned-longword
		:mechanism :value
		:access :in))
 
 
(defun lisp$SYS_MGBLSC (INADR ACMODE FLAGS GSDNAM IDENT RELPAG &optional RETADR)
  (declare (integer ACMODE))
  (declare (integer FLAGS))
  (declare (simple-string GSDNAM))
  (declare (integer IDENT))
  (declare (integer RELPAG))
     (call-out SYS$MGBLSC INADR RETADR ACMODE FLAGS GSDNAM IDENT 
RELPAG)
			(values RETADR))
 
 
;;;
;;;  $MODIFY
;;;
;;;    Modify File
;;;
;;;      $MODIFY fab, [err], [suc]
;;;
;;;      fab	= address of fab
;;;
;;;	err	= address of user error completion routine
;;;
;;;	suc	= address of user success completion routine
;;;                                    
(define-external-routine (SYS$MODIFY

		:result  
		        (:lisp-type integer :vax-type :longword))
  (FAB		:lisp-type alien-structure
		:mechanism :reference
		:access :in-out)
  (ERR		:lisp-type integer
		:vax-type  :unsigned-longword
		:mechanism :value
		:access :in)
  (SUC		:lisp-type integer
		:vax-type  :unsigned-longword
		:mechanism :value
		:access :in))
 
 
(defun lisp$SYS_MODIFY (ERR SUC &optional FAB)
  (declare (integer ERR))
  (declare (integer SUC))
     (call-out SYS$MODIFY FAB ERR SUC)
			(values FAB))
 
 
;;;
;;;  $MOD_HOLDER
;;;
;;;    Modify Holder Record In Rights Database
;;;
;;;	$MOD_HOLDER id, holder, [set_attrib], [clr_attrib]
;;;
;;;	id	   = identifier longword
;;;	holder	   = address of the holder identifier quadword
;;;	set_attrib = longword containing the attributes to set
;;;		     into the holder record
;;;	clr_attrib = longword containing the attributes to clear
;;;		     in the holder record
;;;
(define-external-routine (SYS$MOD_HOLDER

		:result  
		        (:lisp-type integer :vax-type :longword))
  (ID		:lisp-type integer
		:vax-type  :unsigned-longword
		:mechanism :value
		:access :in)
  (HOLDER	:lisp-type integer
		:vax-type  :unsigned-quadword
		:mechanism :reference
		:access :in)
  (SET_ATTRIB	:lisp-type integer
		:vax-type  :unsigned-longword
		:mechanism :value
		:access :in)
  (CLR_ATTRIB	:lisp-type integer
		:vax-type  :unsigned-longword
		:mechanism :value
		:access :in))
 
 
(defun lisp$SYS_MOD_HOLDER (ID HOLDER SET_ATTRIB CLR_ATTRIB)
  (declare (integer ID))
  (declare (integer HOLDER))
  (declare (integer SET_ATTRIB))
  (declare (integer CLR_ATTRIB))
     (call-out SYS$MOD_HOLDER ID HOLDER SET_ATTRIB CLR_ATTRIB))
 
 
;;;
;;;  $MOD_IDENT
;;;
;;;    Modify Identifier Record In Rights Database
;;;
;;;	$MOD_IDENT id, [set_attrib], [clr_attrib], [new_name], [new_value]
;;;
;;;	id	   = identifier longword
;;;	set_attrib = longword containing the attributes
;;;		     to set into the identifier record
;;;	clr_attrib = longword containing the attributes
;;;		     to clear in the identifier record
;;;	new_name   = address of the new identifier name character
;;;                   string descriptor
;;;	new_value  = new identifier value longword
;;;                                    
(define-external-routine (SYS$MOD_IDENT

		:result  
		        (:lisp-type integer :vax-type :longword))
  (ID		:lisp-type integer
		:vax-type  :unsigned-longword
		:mechanism :value
		:access :in)
  (SET_ATTRIB	:lisp-type integer
		:vax-type  :unsigned-longword
		:mechanism :value
		:access :in)
  (CLR_ATTRIB	:lisp-type integer
		:vax-type  :unsigned-longword
		:mechanism :value
		:access :in)
  (NEW_NAME	:lisp-type simple-string
		:vax-type  :text
		:mechanism :descriptor
		:access :in)
  (NEW_VALUE	:lisp-type integer
		:vax-type  :unsigned-longword
		:mechanism :value
		:access :in))
 
 
(defun lisp$SYS_MOD_IDENT (ID SET_ATTRIB CLR_ATTRIB NEW_NAME NEW_VALUE)
  (declare (integer ID))
  (declare (integer SET_ATTRIB))
  (declare (integer CLR_ATTRIB))
  (declare (simple-string NEW_NAME))
  (declare (integer NEW_VALUE))
     (call-out SYS$MOD_IDENT ID SET_ATTRIB CLR_ATTRIB NEW_NAME NEW_VALUE)
)
 
 
;;;  $MOUNT
;;;
;;;    Mount Volume
;;;
;;;     $MOUNT  itmlst
;;;
;;;     itmlst = Address of a list of item identifiers
;;;
(define-external-routine (SYS$MOUNT

		:result  
		        (:lisp-type integer :vax-type :longword))
  (ITMLST	:lisp-type alien-structure
		:mechanism :reference
		:access :in))
 
 
(defun lisp$SYS_MOUNT (ITMLST)
     (call-out SYS$MOUNT ITMLST))
 
 
;;;  $MTACCESS
;;;
;;;    Installation specific accessibility routine
;;;
;;;  $MTACCESS lblnam, [uic], [std_version], [access_char],
;;;	      [access_spec],type
;;;
;;;    lblnam = 	  On input this field is the address of the 
;;;		  VOL1 or HDR1 label read off the magnetic tape. On
;;;		  output of labels this field is zero. The type 
;;;		  of label is determined by the TYPE field.
;;;    uic   = 	  This field contains the longword volme UIC passed 
;;;		  by value.
;;;    std_version =  This field contains a byte value of the 
;;;		     decimal equivalent of the version number 
;;;		     gotten from the VOL1 label, passed by value.
;;;    access_char =  This field contins the byte value of the 
;;;		     accessibility character specified by the user, 
;;;		     passed by value. For output of labels only.
;;;    access_spec =  This field determines if the character passed 
;;;		     in ACCESS_CHAR  was specified by user, passed 
;;;		     by value.  It must contain one of the following 
;;;		     values:
;;;			MTA$K_CHARVALID = YES
;;;			MTA$K_NOCHAR = NO
;;;	 	     For output of labels only.
;;;    type = This field contains the type of accessibility to process,
;;;	     passed by value. It must contain one of the following
;;;	     values:
;;;			MTA$K_INVOL1 = Input a VOL1 label
;;;			MTA$K_INHDR1 = Input a HDR1 label
;;;			MTA$K_OUTVOL1 = Output a VOL1 label
;;;			MTA$K_OUTHDR1 = Output a HDR1 label
;;;
(define-external-routine (SYS$MTACCESS

		:result  
		        (:lisp-type integer :vax-type :longword))
  (LBLNAM	:lisp-type integer
		:vax-type  :unsigned-longword
		:mechanism :reference
		:access :in)
  (UIC		:lisp-type integer
		:vax-type  :unsigned-longword
		:mechanism :value
		:access :in)
  (STD_VERSION	:lisp-type integer
		:vax-type  :unsigned-longword
		:mechanism :value
		:access :in)
  (ACCESS_CHAR	:lisp-type integer
		:vax-type  :unsigned-longword
		:mechanism :value
		:access :in)
  (ACCESS_SPEC	:lisp-type integer
		:vax-type  :unsigned-longword
		:mechanism :value
		:access :in)
  (TYPE		:lisp-type integer
		:vax-type  :unsigned-longword
		:mechanism :value
		:access :in))
 
 
(defun lisp$SYS_MTACCESS (LBLNAM UIC STD_VERSION ACCESS_CHAR ACCESS_SPEC 
TYPE)
  (declare (integer LBLNAM))
  (declare (integer UIC))
  (declare (integer STD_VERSION))
  (declare (integer ACCESS_CHAR))
  (declare (integer ACCESS_SPEC))
  (declare (integer TYPE))
     (call-out SYS$MTACCESS LBLNAM UIC STD_VERSION ACCESS_CHAR ACCESS_SPEC 
TYPE))
 
 
;;;  $NUMTIM
;;;
;;;    Convert Binary Time to Numeric Time
;;;
;;;     $NUMTIM  timbuf ,[timadr]
;;;
;;;     timbuf = address of a 7-word buffer to receive numeric time
;;;              information
;;;
;;;     timadr = address of a quadword containing the 64-bit time.  If
;;;              0, use current time
;;;
(define-external-routine (SYS$NUMTIM

		:result  
		        (:lisp-type integer :vax-type :longword))
  (TIMBUF	:lisp-type (unsigned-byte 32 (array  (7)))
		:mechanism :reference
		:access :in-out)
  (TIMADR	:lisp-type integer
		:vax-type  :unsigned-quadword
		:mechanism :reference
		:access :in))
 
 
(defun lisp$SYS_NUMTIM (TIMADR &optional TIMBUF)
  (declare (integer TIMADR))
     (call-out SYS$NUMTIM TIMBUF TIMADR)
			(values TIMBUF))
 
 
;;;
;;;  $NXTVOL
;;;
;;;    Go to Next Volume
;;;
;;;      $NXTVOL rab, [err], [suc]
;;;
;;;      rab	= address of rab
;;;
;;;	err	= address of user error completion routine
;;;
;;;	suc	= address of user success completion routine
;;;
(define-external-routine (SYS$NXTVOL

		:result  
		        (:lisp-type integer :vax-type :longword))
  (RAB		:lisp-type alien-structure
		:mechanism :reference
		:access :in-out)
  (ERR		:lisp-type integer
		:vax-type  :unsigned-longword
		:mechanism :value
		:access :in)
  (SUC		:lisp-type integer
		:vax-type  :unsigned-longword
		:mechanism :value
		:access :in))
 
 
(defun lisp$SYS_NXTVOL (ERR SUC &optional RAB)
  (declare (integer ERR))
  (declare (integer SUC))
     (call-out SYS$NXTVOL RAB ERR SUC)
			(values RAB))
 
 
;;;
;;;  $OPEN
;;;
;;;    Open File
;;;
;;;      $OPEN fab, [err], [suc]
;;;
;;;      fab	= address of fab
;;;
;;;	err	= address of user error completion routine
;;;
;;;	suc	= address of user success completion routine
;;;                                    
(define-external-routine (SYS$OPEN

		:result  
		        (:lisp-type integer :vax-type :longword))
  (FAB		:lisp-type alien-structure
		:mechanism :reference
		:access :in-out)
  (ERR		:lisp-type integer
		:vax-type  :unsigned-longword
		:mechanism :value
		:access :in)
  (SUC		:lisp-type integer
		:vax-type  :unsigned-longword
		:mechanism :value
		:access :in))
 
 
(defun lisp$SYS_OPEN (ERR SUC &optional FAB)
  (declare (integer ERR))
  (declare (integer SUC))
     (call-out SYS$OPEN FAB ERR SUC)
			(values FAB))
 
 
;;;
;;;  $PARSE
;;;
;;;    Parse File Name
;;;
;;;      $PARSE fab, [err], [suc]
;;;
;;;      fab	= address of fab
;;;
;;;	err	= address of user error completion routine
;;;
;;;	suc	= address of user success completion routine
;;;
(define-external-routine (SYS$PARSE

		:result  
		        (:lisp-type integer :vax-type :longword))
  (FAB		:lisp-type alien-structure
		:mechanism :reference
		:access :in-out)
  (ERR		:lisp-type integer
		:vax-type  :unsigned-longword
		:mechanism :value
		:access :in)
  (SUC		:lisp-type integer
		:vax-type  :unsigned-longword
		:mechanism :value
		:access :in))
 
 
(defun lisp$SYS_PARSE (ERR SUC &optional FAB)
  (declare (integer ERR))
  (declare (integer SUC))
     (call-out SYS$PARSE FAB ERR SUC)
			(values FAB))
 
 
;;;
;;;  $PARSE_ACL
;;;
;;;    Parse an Access Control list Entry
;;;
;;;	$PARSE_ACL acl-string ,acl-entry ,[error-position],
;;;		   [bit-names], [routin]
;;;
;;;	acl-string	= address of a descriptor of a buffer which
;;;			  contains the text to be parsed
;;;
;;;	acl-entry	= address of a descriptor of a buffer into
;;;			  which the converted ACE is to be written
;;;
;;;	error-position	= address of a word to receive the number of
;;;			  characters actually processed by the service.
;;;			  If the service fails, this count points to
;;;			  the failing point in the input string.
;;;
;;;	bit-names	= address of a access bit name table (32 entries)
;;;
;;;	routin		= address of routine to be executed in kernel mode
;;;
(define-external-routine (SYS$PARSE_ACL

		:result  
		        (:lisp-type integer :vax-type :longword))
  (ACLSTR	:lisp-type simple-string
		:vax-type  :text
		:mechanism :descriptor
		:access :in)
  (ACLENT	:lisp-type simple-string
		:vax-type  :text
		:mechanism :descriptor
		:access :in-out)
  (ERRPOS	:lisp-type integer ; unsigned-byte 16
		:vax-type  :unsigned-word
		:mechanism :reference
		:access :in-out)
  (ACCNAM	:lisp-type alien-structure
		:mechanism :reference
		:access :in)
  (ROUTIN	:lisp-type integer
		:vax-type  :unsigned-longword
		:mechanism :value
		:access :in))
 
 
(defun lisp$SYS_PARSE_ACL (ACLSTR ACCNAM ROUTIN &optional ACLENT 
ERRPOS)
  (declare (simple-string ACLSTR))
  (declare (integer ROUTIN))
  (declare (simple-string ACLENT))
  (declare (fixnum ERRPOS))
     (call-out SYS$PARSE_ACL ACLSTR ACLENT ERRPOS ACCNAM ROUTIN)
			(values ACLENT ERRPOS))
 
 
;;;  $PARSE_CLASS	itmlst, [routin]
;;;
;;;    Parse access class strings
;;;
;;;     itmlst = address of a list of item descriptors
;;;
;;;     routin = address of routine to be executed in kernel mode
;;;
;;;                                    
(define-external-routine (SYS$PARSE_CLASS

		:result  
		        (:lisp-type integer :vax-type :longword))
  (ITMLST	:lisp-type alien-structure
		:mechanism :reference
		:access :in)
  (ROUTIN	:lisp-type integer
		:vax-type  :unsigned-longword
		:mechanism :value
		:access :in))
 
 
(defun lisp$SYS_PARSE_CLASS (ITMLST ROUTIN)
  (declare (integer ROUTIN))
     (call-out SYS$PARSE_CLASS ITMLST ROUTIN))
 
 
;;;  $PROCESS_SCAN
;;;
;;;    Initialize Process_scan context
;;;
;;;     $Process_scan  pidctx , [itmlst ]
;;;
;;;     pidctx = address of process ctx id
;;;
;;;     itmlst = address of a list of item descriptors
;;;
;;;                                    
(define-external-routine (SYS$PROCESS_SCAN

		:result  
		        (:lisp-type integer :vax-type :longword))
  (PIDCTX	:lisp-type integer
		:vax-type  :unsigned-longword
		:mechanism :reference
		:access :in-out)
  (ITMLST	:lisp-type alien-structure
		:mechanism :reference
		:access :in))
 
 
(defun lisp$SYS_PROCESS_SCAN (ITMLST &optional PIDCTX)
  (declare (integer PIDCTX))
     (call-out SYS$PROCESS_SCAN PIDCTX ITMLST)
			(values PIDCTX))
 
 
;;;  $PURGWS
;;;
;;;    Purge Working Set
;;;
;;;     $PURGWS  inadr
;;;
;;;     inadr  = address of 2-longword array containing starting and
;;;              ending addresses of pages to be removed
;;;
(define-external-routine (SYS$PURGWS

		:result  
		        (:lisp-type integer :vax-type :longword))
  (INADR	:lisp-type (unsigned-byte 32 (array (2)))
		:mechanism :reference
		:access :in))
 
 
(defun lisp$SYS_PURGWS (INADR)
     (call-out SYS$PURGWS INADR))
 
 
;;;
;;;  $PUT
;;;
;;;    Put Record to File
;;;
;;;      $PUT rab, [err], [suc]
;;;
;;;      rab	= address of rab
;;;
;;;	err	= address of user error completion routine
;;;
;;;	suc	= address of user success completion routine
;;;
(define-external-routine (SYS$PUT

		:result  
		        (:lisp-type integer :vax-type :longword))
  (RAB		:lisp-type alien-structure
		:mechanism :reference
		:access :in-out)
  (ERR		:lisp-type integer
		:vax-type  :unsigned-longword
		:mechanism :value
		:access :in)
  (SUC		:lisp-type integer
		:vax-type  :unsigned-longword
		:mechanism :value
		:access :in))
 
 
(defun lisp$SYS_PUT (ERR SUC &optional RAB)
  (declare (integer ERR))
  (declare (integer SUC))
     (call-out SYS$PUT RAB ERR SUC)
			(values RAB))
 
 
;;;  $PUTMSG
;;;
;;;    Put Message
;;;
;;;     $PUTMSG  msgvec ,[actrtn] ,[facnam], [actprm]
;;;
;;;     msgvec = address of message argument vector
;;;
;;;     actrtn = address of entry mask of action routine
;;;
;;;     facnam = address of facility name string descriptor
;;;
;;;     actprm = parameter to pass to action routine
;;;
(define-external-routine (SYS$PUTMSG

		:result  
		        (:lisp-type integer :vax-type :longword))
  (MSGVEC	:lisp-type alien-structure
		:mechanism :reference
		:access :in)
  (ACTRTN	:lisp-type integer
		:vax-type  :unsigned-longword
		:mechanism :value
		:access :in)
  (FACNAM	:lisp-type simple-string
		:vax-type  :text
		:mechanism :descriptor
		:access :in)
  (ACTPRM	:lisp-type integer
		:vax-type  :unsigned-longword
		:mechanism :value
		:access :in))
 
 
(defun lisp$SYS_PUTMSG (MSGVEC ACTRTN FACNAM ACTPRM)
  (declare (integer ACTRTN))
  (declare (simple-string FACNAM))
  (declare (integer ACTPRM))
     (call-out SYS$PUTMSG MSGVEC ACTRTN FACNAM ACTPRM))
 
 
;;;  $QIO
;;;
;;;    Queue I/O Request
;;;
;;;     $QIO     [efn] ,chan ,func ,[iosb] ,[astadr] ,[astprm]
;;;     ($QIOW)  ,[p1] ,[p2] ,[p3] ,[p4] ,[p5] ,[p6]
;;;
;;;     efn    = number of event flag to set on completion
;;;
;;;     chan   = number of channel on which I/O is directed
;;;
;;;     func   = function code specifying action to be performed
;;;
;;;     iosb   = address of quadword I/O status block to receive final
;;;              completion status
;;;
;;;     astadr = address of entry mask of AST routine
;;;
;;;     astprm = value to be passed to AST routine as argument
;;;
;;;     p1...  = optional device- and function-specific parameters
;;;                                    
(define-external-routine (SYS$QIO

		:result  
		        (:lisp-type integer :vax-type :longword))
  (EFN		:lisp-type integer
		:vax-type  :unsigned-longword
		:mechanism :value
		:access :in)
  (CHAN		:lisp-type integer ; unsigned-byte 16
		:vax-type  :unsigned-word
		:mechanism :value
		:access :in)
  (FUNC		:lisp-type integer ; unsigned-byte 16
		:vax-type  :unsigned-word
		:mechanism :value
		:access :in)
  (IOSB		:lisp-type alien-structure
		:mechanism :reference
		:access :in-out)
  (ASTADR	:lisp-type integer
		:vax-type  :unsigned-longword
		:mechanism :value
		:access :in)
  (ASTPRM	:lisp-type integer
		:vax-type  :unsigned-longword
		:mechanism :value
		:access :in)
  (P1		:lisp-type alien-structure
		:mechanism :reference
		:access :in)
  (P2		:lisp-type integer
		:vax-type  :unsigned-longword
		:mechanism :value
		:access :in)
  (P3		:lisp-type alien-structure
		:mechanism :reference
		:access :in)
  (P4		:lisp-type alien-structure
                :mechanism :reference
		:access :in)
  (P5		:lisp-type alien-structure
                :mechanism :reference
		:access :in)
  (P6		:lisp-type integer
		:vax-type  :unsigned-longword
		:mechanism :value
		:access :in))
 
 
(defun lisp$SYS_QIO (EFN CHAN FUNC ASTADR ASTPRM P1 P2 P3 P4 P5 
P6 &optional IOSB)
  (declare (integer EFN))
  (declare (fixnum CHAN))
  (declare (fixnum FUNC))
  (declare (integer ASTADR))
  (declare (integer ASTPRM))
  (declare (integer P2))
  (declare (integer P3))
  (declare (integer P4))
  (declare (integer P5))
  (declare (integer P6))
  (declare (integer IOSB))
     (call-out SYS$QIO EFN CHAN FUNC IOSB ASTADR ASTPRM P1 P2 P3 
P4 P5 P6)
			(values IOSB))
 
 
(define-external-routine (SYS$QIOW

		:result  
		        (:lisp-type integer :vax-type :longword))
  (EFN		:lisp-type integer
		:vax-type  :unsigned-longword
		:mechanism :value
		:access :in)
  (CHAN		:lisp-type integer ; unsigned-byte 16
		:vax-type  :unsigned-word
		:mechanism :value
		:access :in)
  (FUNC		:lisp-type integer ; unsigned-byte 16
		:vax-type  :unsigned-word
		:mechanism :value
		:access :in)
  (IOSB		:lisp-type alien-structure
                :mechanism :reference
		:access :in-out)
  (ASTADR	:lisp-type integer
		:vax-type  :unsigned-longword
		:mechanism :value
		:access :in)
  (ASTPRM	:lisp-type integer
		:vax-type  :unsigned-longword
		:mechanism :value
		:access :in)
  (P1		:lisp-type alien-structure
		:mechanism :reference
		:access :in)
  (P2		:lisp-type integer
		:vax-type  :unsigned-longword
		:mechanism :value
		:access :in)
  (P3		:lisp-type alien-structure
		:mechanism :reference
		:access :in)
  (P4		:lisp-type alien-structure
		:mechanism :reference
		:access :in)
  (P5		:lisp-type alien-structure
		:mechanism :reference
		:access :in)
  (P6		:lisp-type integer
		:vax-type  :unsigned-longword
		:mechanism :value
		:access :in))
 
 
(defun lisp$SYS_QIOW (EFN CHAN FUNC ASTADR ASTPRM P1 P2 P3 P4 P5 
P6 &optional IOSB)
  (declare (integer EFN))
  (declare (fixnum CHAN))
  (declare (fixnum FUNC))
  (declare (integer ASTADR))
  (declare (integer ASTPRM))
  (declare (integer P2))
  (declare (integer P3))
  (declare (integer P4))
  (declare (integer P5))
  (declare (integer P6))
  (declare (integer IOSB))
     (call-out SYS$QIOW EFN CHAN FUNC IOSB ASTADR ASTPRM P1 P2 P3 
P4 P5 P6)
			(values IOSB))
 
 
;;;
;;;  $READ
;;;
;;;    Read Block from File
;;;
;;;      $READ rab, [err], [suc]
;;;
;;;      rab	= address of rab
;;;
;;;	err	= address of user error completion routine
;;;
;;;	suc	= address of user success completion routine
;;;                                    
(define-external-routine (SYS$READ

		:result  
		        (:lisp-type integer :vax-type :longword))
  (RAB		:lisp-type alien-structure
		:mechanism :reference
		:access :in-out)
  (ERR		:lisp-type integer
		:vax-type  :unsigned-longword
		:mechanism :value
		:access :in)
  (SUC		:lisp-type integer
		:vax-type  :unsigned-longword
		:mechanism :value
		:access :in))
 
 
(defun lisp$SYS_READ (ERR SUC &optional RAB)
  (declare (integer ERR))
  (declare (integer SUC))
     (call-out SYS$READ RAB ERR SUC)
			(values RAB))
 
 
;;;  $READEF
;;;
;;;    Read Event Flag
;;;
;;;     $READEF  efn ,state
;;;
;;;     efn    = event flag number of any flag in the cluster
;;;
;;;     state  = address of a longword to receive current state of all
;;;              flags in the cluster  
;;;
(define-external-routine (SYS$READEF

		:result  
		        (:lisp-type integer :vax-type :longword))
  (EFN		:lisp-type integer
		:vax-type  :unsigned-longword
		:mechanism :value
		:access :in)
  (STATE	:lisp-type integer
		:vax-type  :unsigned-longword
		:mechanism :reference
		:access :in-out))
 
 
(defun lisp$SYS_READEF (EFN &optional STATE)
  (declare (integer EFN))
  (declare (integer STATE))
     (call-out SYS$READEF EFN STATE)
			(values STATE))
 
 
;;;
;;;  $RELEASE
;;;
;;;    Release Record
;;;
;;;      $RELEASE rab, [err], [suc]
;;;
;;;      rab	= address of rab
;;;
;;;	err	= address of user error completion routine
;;;
;;;	suc	= address of user success completion routine
;;;
(define-external-routine (SYS$RELEASE

		:result  
		        (:lisp-type integer :vax-type :longword))
  (RAB		:lisp-type alien-structure
		:mechanism :reference
		:access :in-out)
  (ERR		:lisp-type integer
		:vax-type  :unsigned-longword
		:mechanism :value
		:access :in)
  (SUC		:lisp-type integer
		:vax-type  :unsigned-longword
		:mechanism :value
		:access :in))
 
 
(defun lisp$SYS_RELEASE (ERR SUC &optional RAB)
  (declare (integer ERR))
  (declare (integer SUC))
     (call-out SYS$RELEASE RAB ERR SUC)
			(values RAB))
 
 
;;;
;;;  $RELEASE_LICENSE
;;;
;;;  Release authorization to execute licensed software product.
;;;
;;;	$RELEASE_LICENSE  context
;;;
;;;  	contxt	= address of context buffer returned by
;;;		  $grant_license (4 longwords)
;;;
(define-external-routine (SYS$RELEASE_LICENSE

		:result  
		        (:lisp-type integer :vax-type :longword))
  (CONTXT	:lisp-type alien-structure
		:mechanism :reference
		:access :in))
 
 
(defun lisp$SYS_RELEASE_LICENSE (CONTXT)
     (call-out SYS$RELEASE_LICENSE CONTXT))
 
 
;;;
;;;  $REMOVE
;;;
;;;    Remove File
;;;
;;;      $REMOVE fab, [err], [suc]
;;;
;;;      fab	= address of fab
;;;
;;;	err	= address of user error completion routine
;;;
;;;	suc	= address of user success completion routine
;;;                                    
(define-external-routine (SYS$REMOVE

		:result  
		        (:lisp-type integer :vax-type :longword))
  (FAB		:lisp-type alien-structure
		:mechanism :reference
		:access :in-out)
  (ERR		:lisp-type integer
		:vax-type  :unsigned-longword
		:mechanism :value
		:access :in)
  (SUC		:lisp-type integer
		:vax-type  :unsigned-longword
		:mechanism :value
		:access :in))
 
 
(defun lisp$SYS_REMOVE (ERR SUC &optional FAB)
  (declare (integer ERR))
  (declare (integer SUC))
     (call-out SYS$REMOVE FAB ERR SUC)
			(values FAB))
 
 
;;;
;;;  $REM_HOLDER
;;;
;;;    Remove Holder Record From Rights Database
;;;
;;;	$REM_HOLDER id, holder
;;;
;;;	id	= identifier longword
;;;	holder	= address of the holder identifier quadword
;;;
(define-external-routine (SYS$REM_HOLDER

		:result  
		        (:lisp-type integer :vax-type :longword))
  (ID		:lisp-type integer
		:vax-type  :unsigned-longword
		:mechanism :value
		:access :in)
  (HOLDER	:lisp-type integer
		:vax-type  :unsigned-quadword
		:mechanism :reference
		:access :in))
 
 
(defun lisp$SYS_REM_HOLDER (ID HOLDER)
  (declare (integer ID))
  (declare (integer HOLDER))
     (call-out SYS$REM_HOLDER ID HOLDER))
 
 
;;;
;;;  $REM_IDENT
;;;
;;;    Remove Identifier From Rights Database
;;;
;;;	$REM_IDENT id
;;;
;;;	id	= identifier longword
;;;                                    
(define-external-routine (SYS$REM_IDENT

		:result  
		        (:lisp-type integer :vax-type :longword))
  (ID		:lisp-type integer
		:vax-type  :unsigned-longword
		:mechanism :value
		:access :in))
 
 
(defun lisp$SYS_REM_IDENT (ID)
  (declare (integer ID))
     (call-out SYS$REM_IDENT ID))
 
 
;;;
;;;  $RENAME
;;;
;;;    Rename File
;;;
;;;      $RENAME oldfab, [err], [suc], newfab
;;;
;;;      oldfab	= address of oldfab
;;;
;;;	err	= address of user error completion routine
;;;
;;;	suc	= address of user success completion routine
;;;
;;;	newfab	= address of new fab  
(define-external-routine (SYS$RENAME

		:result  
		        (:lisp-type integer :vax-type :longword))
  (OLDFAB	:lisp-type alien-structure
		:mechanism :reference
		:access :in-out)
  (ERR		:lisp-type integer
		:vax-type  :unsigned-longword
		:mechanism :value
		:access :in)
  (SUC		:lisp-type integer
		:vax-type  :unsigned-longword
		:mechanism :value
		:access :in)
  (NEWFAB	:lisp-type alien-structure
		:mechanism :reference
		:access :in-out))
 
 
(defun lisp$SYS_RENAME (ERR SUC &optional OLDFAB NEWFAB)
  (declare (integer ERR))
  (declare (integer SUC))
     (call-out SYS$RENAME OLDFAB ERR SUC NEWFAB)
			(values OLDFAB NEWFAB))
 
 
;;;  $RESUME
;;;
;;;    Resume Suspended Process
;;;
;;;     $RESUME  [pidadr] ,[prcnam]
;;;
;;;     pidadr = address of process id of process to be resumed
;;;
;;;     prcnam = address of process name string descriptor
;;;
(define-external-routine (SYS$RESUME

		:result  
		        (:lisp-type integer :vax-type :longword))
  (PIDADR	:lisp-type integer
		:vax-type  :unsigned-longword
		:mechanism :reference
		:access :in-out)
  (PRCNAM	:lisp-type simple-string
		:vax-type  :text
		:mechanism :descriptor
		:access :in))
 
 
(defun lisp$SYS_RESUME (PRCNAM &optional PIDADR)
  (declare (simple-string PRCNAM))
  (declare (integer PIDADR))
     (call-out SYS$RESUME PIDADR PRCNAM)
			(values PIDADR))
 
 
;;;
;;;  $REVOKID
;;;
;;;    Revoke Identifier from Process
;;;
;;;	$REVOKID [pidadr], [prcnam], [id], [name], [prvatr]
;;;
;;;	pidadr  = address of PID of affected process
;;;	prcnam  = address of string descriptor of process name
;;;	id      = address of quadword identifier and attributes
;;;	name    = address of string descriptor of identifier name
;;;	prvatr  = address to store attributes of superseded id
;;;
(define-external-routine (SYS$REVOKID

		:result  
		        (:lisp-type integer :vax-type :longword))
  (PIDADR	:lisp-type integer
		:vax-type  :unsigned-longword
		:mechanism :reference
		:access :in-out)
  (PRCNAM	:lisp-type simple-string
		:vax-type  :text
		:mechanism :descriptor
		:access :in)
  (ID		:lisp-type integer
		:vax-type  :unsigned-quadword
		:mechanism :reference
		:access :in-out)
  (NAME		:lisp-type simple-string
		:vax-type  :text
		:mechanism :descriptor
		:access :in)
  (PRVATR	:lisp-type integer
		:vax-type  :unsigned-longword
		:mechanism :reference
		:access :in-out))
 
 
(defun lisp$SYS_REVOKID (PRCNAM NAME &optional PIDADR ID PRVATR)
  (declare (simple-string PRCNAM))
  (declare (simple-string NAME))
  (declare (integer PIDADR))
  (declare (integer ID))
  (declare (integer PRVATR))
     (call-out SYS$REVOKID PIDADR PRCNAM ID NAME PRVATR)
			(values PIDADR ID PRVATR))
 
 
;;;
;;;  $REWIND
;;;
;;;    Rewind File
;;;
;;;      $REWIND rab, [err], [suc]
;;;
;;;      rab	= address of rab
;;;
;;;	err	= address of user error completion routine
;;;
;;;	suc	= address of user success completion routine
;;;                                    
(define-external-routine (SYS$REWIND

		:result  
		        (:lisp-type integer :vax-type :longword))
  (RAB		:lisp-type alien-structure
		:mechanism :reference
		:access :in-out)
  (ERR		:lisp-type integer
		:vax-type  :unsigned-longword
		:mechanism :value
		:access :in)
  (SUC		:lisp-type integer
		:vax-type  :unsigned-longword
		:mechanism :value
		:access :in))
 
 
(defun lisp$SYS_REWIND (ERR SUC &optional RAB)
  (declare (integer ERR))
  (declare (integer SUC))
     (call-out SYS$REWIND RAB ERR SUC)
			(values RAB))
 
 
;;;  $RUNDWN
;;;
;;;    Rundown Process
;;;
;;;     $RUNDWN  [acmode]
;;;
;;;     acmode = access mode to rundown; this and all less
;;;		privileged access modes are rundown
;;;
(define-external-routine (SYS$RUNDWN

		:result  
		        (:lisp-type integer :vax-type :longword))
  (ACMODE	:lisp-type integer
		:vax-type  :unsigned-longword
		:mechanism :value
		:access :in))
 
 
(defun lisp$SYS_RUNDWN (ACMODE)
  (declare (integer ACMODE))
     (call-out SYS$RUNDWN ACMODE))
 
 
;;;  $SCHDWK
;;;
;;;    Schedule Wakeup
;;;
;;;     $SCHDWK  [pidadr] ,[prcnam] ,daytim ,[reptim]
;;;
;;;     pidadr = address of process id of process to be awakened
;;;
;;;     prcnam = address of process name string descriptor
;;;
;;;     daytim = address of quadword containing time to wake
;;;
;;;     reptim = address of quadword containing repeat time interval
;;;                                    
(define-external-routine (SYS$SCHDWK

		:result  
		        (:lisp-type integer :vax-type :longword))
  (PIDADR	:lisp-type integer
		:vax-type  :unsigned-longword
		:mechanism :reference
		:access :in-out)
  (PRCNAM	:lisp-type simple-string
		:vax-type  :text
		:mechanism :descriptor
		:access :in)
  (DAYTIM	:lisp-type integer
		:vax-type  :unsigned-quadword
		:mechanism :reference
		:access :in)
  (REPTIM	:lisp-type integer
		:vax-type  :unsigned-quadword
		:mechanism :reference
		:access :in))
 
 
(defun lisp$SYS_SCHDWK (PRCNAM DAYTIM REPTIM &optional PIDADR)
  (declare (simple-string PRCNAM))
  (declare (integer DAYTIM))
  (declare (integer REPTIM))
  (declare (integer PIDADR))
     (call-out SYS$SCHDWK PIDADR PRCNAM DAYTIM REPTIM)
			(values PIDADR))
 
 
;;;
;;;  $SEARCH
;;;
;;;    Search for File Name
;;;
;;;      $SEARCH fab, [err], [suc]
;;;
;;;      fab	= address of fab
;;;
;;;	err	= address of user error completion routine
;;;
;;;	suc	= address of user success completion routine
;;;                                    
(define-external-routine (SYS$SEARCH

		:result  
		        (:lisp-type integer :vax-type :longword))
  (FAB		:lisp-type alien-structure
		:mechanism :reference
		:access :in-out)
  (ERR		:lisp-type integer
		:vax-type  :unsigned-longword
		:mechanism :value
		:access :in)
  (SUC		:lisp-type integer
		:vax-type  :unsigned-longword
		:mechanism :value
		:access :in))
 
 
(defun lisp$SYS_SEARCH (ERR SUC &optional FAB)
  (declare (integer ERR))
  (declare (integer SUC))
     (call-out SYS$SEARCH FAB ERR SUC)
			(values FAB))
 
 
;;;  $SETAST
;;;
;;;    Set AST Enable
;;;
;;;     $SETAST  enbflg                
;;;
;;;     enbflg = AST enable indicator for current access mode
;;;                0 -> disable    1 -> enable
;;;
(define-external-routine (SYS$SETAST

		:result  
		        (:lisp-type integer :vax-type :longword))
  (ENBFLG	:lisp-type integer
		:vax-type  :byte
		:mechanism :value
		:access :in))
 
 
(defun lisp$SYS_SETAST (ENBFLG)
  (declare (integer ENBFLG))
     (call-out SYS$SETAST ENBFLG))
 
 
;;;  $SETEF
;;;
;;;    Set Event Flag
;;;
;;;     $SETEF  efn
;;;
;;;     efn    = event flag number of flag to set
;;;                                    
(define-external-routine (SYS$SETEF

		:result  
		        (:lisp-type integer :vax-type :longword))
  (EFN		:lisp-type integer
		:vax-type  :unsigned-longword
		:mechanism :value
		:access :in))
 
 
(defun lisp$SYS_SETEF (EFN)
  (declare (integer EFN))
     (call-out SYS$SETEF EFN))
 
 
;;;  $SETEXV
;;;
;;;    Set Exception Vector
;;;
;;;     $SETEXV  [vector] ,[addres] ,[acmode] ,[prvhnd]
;;;
;;;     vector = vector number
;;;                0 -> primary vector   1 -> secondary    2 -> last chance
;;;
;;;     addres = exception handler address (0 indicates deassign vector)
;;;
;;;     acmode = access mode for which vector is set
;;;                                    
;;;     prvhnd = address of longword to receive previous handler address
;;;
(define-external-routine (SYS$SETEXV

		:result  
		        (:lisp-type integer :vax-type :longword))
  (VECTOR	:lisp-type integer
		:vax-type  :unsigned-longword
		:mechanism :value
		:access :in)
  (ADDRES	:lisp-type integer
		:vax-type  :unsigned-longword
		:mechanism :value
		:access :in)
  (ACMODE	:lisp-type integer
		:vax-type  :unsigned-longword
		:mechanism :value
		:access :in)
  (PRVHND	:lisp-type integer
		:vax-type  :unsigned-longword
		:mechanism :reference
		:access :in-out))
 
 
(defun lisp$SYS_SETEXV (VECTOR ADDRES ACMODE &optional PRVHND)
  (declare (integer VECTOR))
  (declare (integer ADDRES))
  (declare (integer ACMODE))
  (declare (integer PRVHND))
     (call-out SYS$SETEXV VECTOR ADDRES ACMODE PRVHND)
			(values PRVHND))
 
 
;;;  $SETIME
;;;
;;;    Set System Time
;;;
;;;     $SETIME [timadr]
;;;
;;;     timadr = address of quadword containing  new  system  time  in
;;;              64-bit  format.   If 0, recalibrate system time using
;;;              hardware time-of-year clock.
;;;
(define-external-routine (SYS$SETIME

		:result  
		        (:lisp-type integer :vax-type :longword))
  (TIMADR	:lisp-type integer
		:vax-type  :unsigned-quadword
		:mechanism :reference
		:access :in))
 
 
(defun lisp$SYS_SETIME (TIMADR)
  (declare (integer TIMADR))
     (call-out SYS$SETIME TIMADR))
 
 
;;;  $SETIMR
;;;
;;;    Set Timer
;;;
;;;     $SETIMR  [efn] ,daytim ,[astadr] ,[reqidt] ,[flags]
;;;
;;;     efn    = event flag to set when timer expires
;;;
;;;     daytim = address of quadword containing 64-bit time value
;;;
;;;     astadr = address of entry mask of AST routine
;;;
;;;     reqidt = request identification of this timer request
;;;
;;;	flags = only bit 0 used right now.  If bit 0 is set,
;;;		 then this timer request is in terms of CPU time.
;;;
(define-external-routine (SYS$SETIMR

		:result  
		        (:lisp-type integer :vax-type :longword))
  (EFN		:lisp-type integer
		:vax-type  :unsigned-longword
		:mechanism :value
		:access :in)
  (DAYTIM	:lisp-type integer
		:vax-type  :unsigned-quadword
		:mechanism :reference
		:access :in)
  (ASTADR	:lisp-type integer
		:vax-type  :unsigned-longword
		:mechanism :value
		:access :in)
  (REQIDT	:lisp-type integer
		:vax-type  :unsigned-longword
		:mechanism :value
		:access :in)
  (FLAGS	:lisp-type integer
		:vax-type  :unsigned-longword
		:mechanism :value
		:access :in))
 
 
(defun lisp$SYS_SETIMR (EFN DAYTIM ASTADR REQIDT FLAGS)
  (declare (integer EFN))
  (declare (integer DAYTIM))
  (declare (integer ASTADR))
  (declare (integer REQIDT))
  (declare (integer FLAGS))
     (call-out SYS$SETIMR EFN DAYTIM ASTADR REQIDT FLAGS))
 
 
;;;  $SETPFM
;;;
;;;    Set Page Fault Monitoring
;;;
;;;     $SETPFM  [pfmflg] ,[astadr] ,[astprm] ,[acmode]
;;;
;;;	pfmflg	= function/subfunction bits
;;;
;;;	astadr	= address of entry mask of AST routine
;;;
;;;	astprm	= value to be passed to AST routine
;;;
;;;	acmode	= access mode for which the AST is to be declared
;;;
;;;	bufcntadr = address of longword for which the number of
;;;	            page fault monitoring buffers allocated is stored.
;;;
(define-external-routine (SYS$SETPFM

		:result  
		        (:lisp-type integer :vax-type :longword))
  (PFMFLG	:lisp-type integer
		:vax-type  :unsigned-longword
		:mechanism :value
		:access :in)
  (ASTADR	:lisp-type integer
		:vax-type  :unsigned-longword
		:mechanism :value
		:access :in)
  (ASTPRM	:lisp-type integer
		:vax-type  :unsigned-longword
		:mechanism :value
		:access :in)
  (ACMODE	:lisp-type integer
		:vax-type  :unsigned-longword
		:mechanism :value
		:access :in)
  (BUFCNTADR	:lisp-type integer
		:vax-type  :unsigned-longword
		:mechanism :value
		:access :in))
 
 
(defun lisp$SYS_SETPFM (PFMFLG ASTADR ASTPRM ACMODE BUFCNTADR)
  (declare (integer PFMFLG))
  (declare (integer ASTADR))
  (declare (integer ASTPRM))
  (declare (integer ACMODE))
  (declare (integer BUFCNTADR))
     (call-out SYS$SETPFM PFMFLG ASTADR ASTPRM ACMODE BUFCNTADR)
)
 
 
;;;  $SETPRA
;;;
;;;    Set Power Recovery AST
;;;
;;;     $SETPRA  astadr ,[acmode]
;;;
;;;     astadr = address of power recovery AST routine
;;;
;;;     acmode = access mode of AST    
;;;
(define-external-routine (SYS$SETPRA

		:result  
		        (:lisp-type integer :vax-type :longword))
  (ASTADR	:lisp-type integer
		:vax-type  :unsigned-longword
		:mechanism :value
		:access :in)
  (ACMODE	:lisp-type integer
		:vax-type  :unsigned-longword
		:mechanism :value
		:access :in))
 
 
(defun lisp$SYS_SETPRA (ASTADR ACMODE)
  (declare (integer ASTADR))
  (declare (integer ACMODE))
     (call-out SYS$SETPRA ASTADR ACMODE))
 
 
;;;  $SETPRI
;;;
;;;    Set Priority
;;;
;;;     $SETPRI  [pidadr] ,[prcnam] ,pri ,[prvpri]
;;;
;;;     pidadr = address of process id of process to be set
;;;
;;;     prcnam = address of process name string descriptor
;;;
;;;     pri    = new base priority for the process
;;;
;;;     prvpri = address of longword to receive previous base priority
;;;
(define-external-routine (SYS$SETPRI

		:result  
		        (:lisp-type integer :vax-type :longword))
  (PIDADR	:lisp-type integer
		:vax-type  :unsigned-longword
		:mechanism :reference
		:access :in-out)
  (PRCNAM	:lisp-type simple-string
		:vax-type  :text
		:mechanism :descriptor
		:access :in)
  (PRI		:lisp-type integer
		:vax-type  :unsigned-longword
		:mechanism :value
		:access :in)
  (PRVPRI	:lisp-type integer
		:vax-type  :unsigned-longword
		:mechanism :reference
		:access :in-out))
 
 
(defun lisp$SYS_SETPRI (PRCNAM PRI &optional PIDADR PRVPRI)
  (declare (simple-string PRCNAM))
  (declare (integer PRI))
  (declare (integer PIDADR))
  (declare (integer PRVPRI))
     (call-out SYS$SETPRI PIDADR PRCNAM PRI PRVPRI)
			(values PIDADR PRVPRI))
 
 
;;;  $SETPRN
;;;
;;;    Set Process Name
;;;
;;;     $SETPRN  [prcnam]
;;;
;;;     prcnam = address of the process name string descriptor
;;;
(define-external-routine (SYS$SETPRN

		:result  
		        (:lisp-type integer :vax-type :longword))
  (PRCNAM	:lisp-type simple-string
		:vax-type  :text
		:mechanism :descriptor
		:access :in))
 
 
(defun lisp$SYS_SETPRN (PRCNAM)
  (declare (simple-string PRCNAM))
     (call-out SYS$SETPRN PRCNAM))
 
 
;;;  $SETPRT
;;;
;;;    Set Protection on Pages
;;;
;;;     $SETPRT  inadr ,[retadr] ,[acmode] ,prot ,[prvprt]
;;;
;;;     inadr  = address of 2-longword array containing starting and
;;;              ending virtual addresses of pages to change
;;;
;;;     retadr = address of 2-longword array containing starting and
;;;              ending addresses of pages which were changed
;;;
;;;     acmode = access mode of request
;;;
;;;     prot   = new protection
;;;
;;;     prvprt = address of byte to receive previous protection of
;;;              last page changed
;;;
(define-external-routine (SYS$SETPRT

		:result  
		        (:lisp-type integer :vax-type :longword))
  (INADR	:lisp-type (unsigned-byte 32 (array (2)))
		:mechanism :reference
		:access :in)
  (RETADR	:lisp-type (unsigned-byte 32 (array (2)))
		:mechanism :reference
		:access :in-out)
  (ACMODE	:lisp-type integer
		:vax-type  :unsigned-longword
		:mechanism :value
		:access :in)
  (PROT		:lisp-type integer
		:vax-type  :unsigned-longword
		:mechanism :value
		:access :in)
  (PRVPRT	:lisp-type integer ; unsigned-byte 8
		:vax-type  :byte
		:mechanism :reference
		:access :in-out))
 
 
(defun lisp$SYS_SETPRT (INADR ACMODE PROT &optional RETADR PRVPRT)
  (declare (integer ACMODE))
  (declare (integer PROT))
  (declare (fixnum PRVPRT))
     (call-out SYS$SETPRT INADR RETADR ACMODE PROT PRVPRT)
			(values RETADR PRVPRT))
 
 
;;;  $SETPRV
;;;
;;;    Set privileges.
;;;     $SETPRV [enbflg] ,[prvadr] ,[prmflg] ,[prvprv]
;;;
;;;     enbflg = enable indicator
;;;                0 -> disable   1 -> enable
;;;
;;;     prvadr = 64-bit mask defining the privileges to be enabled or
;;;              disabled
;;;
;;;     prmflg = permanent indicator
;;;                0 -> temporary (for this image)  1 -> permanent
;;;
;;;     prvprv = address of quadword buffer to receive previous privileges
;;;
(define-external-routine (SYS$SETPRV

		:result  
		        (:lisp-type integer :vax-type :longword))
  (ENBFLG	:lisp-type integer
		:vax-type  :byte
		:mechanism :value
		:access :in)
  (PRVADR	:lisp-type integer
		:vax-type  :unsigned-quadword
		:mechanism :reference
		:access :in)
  (PRMFLG	:lisp-type integer
		:vax-type  :byte
		:mechanism :value
		:access :in)
  (PRVPRV	:lisp-type integer
		:vax-type  :unsigned-quadword
		:mechanism :reference
		:access :in-out))
 
 
(defun lisp$SYS_SETPRV (ENBFLG PRVADR PRMFLG &optional PRVPRV)
  (declare (integer ENBFLG))
  (declare (integer PRVADR))
  (declare (integer PRMFLG))
  (declare (integer PRVPRV))
     (call-out SYS$SETPRV ENBFLG PRVADR PRMFLG PRVPRV)
			(values PRVPRV))
 
 
;;;  $SETRWM
;;;
;;;    Set Resource Wait Mode
;;;
;;;     $SETRWM  [watflg]
;;;
;;;     watflg = wait indicator
;;;         0 -> wait for resources   1 -> return failure immediately
;;;	   (type is NUMBER rather than BOOLEAN since WATFLG=TRUE
;;;	   means don't wait, which is the opposite of what is seems)
;;;
(define-external-routine (SYS$SETRWM

		:result  
		        (:lisp-type integer :vax-type :longword))
  (WATFLG	:lisp-type integer
		:vax-type  :byte
		:mechanism :value
		:access :in))
 
 
(defun lisp$SYS_SETRWM (WATFLG)
  (declare (integer WATFLG))
     (call-out SYS$SETRWM WATFLG))
 
 
;;;  $SETSFM
;;;
;;;    Set System Service Failure Mode
;;;
;;;     $SETSFM  [enbflg]
;;;
;;;     enbflg = enable indicator
;;;                0 -> disable generation of exceptions on service failures
;;;                1 -> generate exceptions for system service failures
;;;                                    
(define-external-routine (SYS$SETSFM

		:result  
		        (:lisp-type integer :vax-type :longword))
  (ENBFLG	:lisp-type integer
		:vax-type  :byte
		:mechanism :value
		:access :in))
 
 
(defun lisp$SYS_SETSFM (ENBFLG)
  (declare (integer ENBFLG))
     (call-out SYS$SETSFM ENBFLG))
 
 
;;;  $SETSSF
;;;
;;;    Set System Service Filter
;;;
;;;     $SETSSF  [mask]
;;;
;;;     mask = flags for services to inhibit
;;;
(define-external-routine (SYS$SETSSF

		:result  
		        (:lisp-type integer :vax-type :longword))
  (MASK		:lisp-type integer
		:vax-type  :unsigned-longword
		:mechanism :value
		:access :in))
 
 
(defun lisp$SYS_SETSSF (MASK)
  (declare (integer MASK))
     (call-out SYS$SETSSF MASK))
 
 
;;;  $SETSTK
;;;
;;;    SET VIRTUAL STACK LIMITS
;;;
;;;     $SETSTK inadr ,[retadr] ,[acmode]
;;;
;;;     inadr  = address of 2-longword array containing  starting  and
;;;              ending virtual address of stack limits to set
;;;
;;;     retadr = address of a 2-longword array to receive starting and
;;;              ending virtual address of stack limits to set
;;;
;;;     acmode = access  mode  for  the  stack to change
;;;
(define-external-routine (SYS$SETSTK

		:result  
		        (:lisp-type integer :vax-type :longword))
  (INADR	:lisp-type (unsigned-byte 32 (array (2)))
		:mechanism :reference
		:access :in)
  (RETADR	:lisp-type (unsigned-byte 32 (array (2)))
		:mechanism :reference
		:access :in-out)
  (ACMODE	:lisp-type integer
		:vax-type  :unsigned-longword
		:mechanism :value
		:access :in))
 
 
(defun lisp$SYS_SETSTK (INADR ACMODE &optional RETADR)
  (declare (integer ACMODE))
     (call-out SYS$SETSTK INADR RETADR ACMODE)
			(values RETADR))
 
 
;;;  $SETSWM
;;;
;;;    Set Process Swap Mode
;;;
;;;     $SETSWM  [swpflg]
;;;
;;;     swpflg = swap indicator
;;;                0 -> enable swapping   1 -> disable swapping
;;;
(define-external-routine (SYS$SETSWM

		:result  
		        (:lisp-type integer :vax-type :longword))
  (SWPFLG	:lisp-type integer
		:vax-type  :byte
		:mechanism :value
		:access :in))
 
 
(defun lisp$SYS_SETSWM (SWPFLG)
  (declare (integer SWPFLG))
     (call-out SYS$SETSWM SWPFLG))
 
 
;;;
;;;  $SETDTI
;;;
;;;    Set Distributed Transaction Information
;;;
;;;	$SETDTI	[efn], [flags], iosb, [astadr], [astprm], contxt,
;;;	  ($SETDTIW)		func, itmlst
;;;
;;;	efn	= event flag to set at completion
;;;	flags	= operation flags
;;;	iosb	= address of a quadword I/O status block
;;;	astadr	= address of the entry mask of an AST routine
;;;	astprm	= value to be passed to AST routine
;;;	contxt	= address of longword search context
;;;	func	= function code to be performed
;;;	itmlst	= address of a list of item descriptors
;;;
(define-external-routine (SYS$SETDTI

		:result  
		        (:lisp-type integer :vax-type :longword))
  (EFN		:lisp-type integer
		:vax-type  :unsigned-longword
		:mechanism :value
		:access :in)
  (FLAGS	:lisp-type integer
		:vax-type  :unsigned-longword
		:mechanism :value
		:access :in)
  (IOSB		:lisp-type integer
		:vax-type  :unsigned-quadword
		:mechanism :reference
		:access :in-out)
  (ASTADR	:lisp-type integer
		:vax-type  :unsigned-longword
		:mechanism :value
		:access :in)
  (ASTPRM	:lisp-type integer
		:vax-type  :unsigned-longword
		:mechanism :value
		:access :in)
  (CONTXT	:lisp-type integer
		:vax-type  :unsigned-longword
		:mechanism :reference
		:access :in)
  (FUNC		:lisp-type integer ; unsigned-byte 16
		:vax-type  :unsigned-word
		:mechanism :value
		:access :in)
  (ITMLST	:lisp-type alien-structure
		:mechanism :reference
		:access :in))
 
 
(defun lisp$SYS_SETDTI (EFN FLAGS ASTADR ASTPRM CONTXT FUNC ITMLST 
&optional IOSB)
  (declare (integer EFN))
  (declare (integer FLAGS))
  (declare (integer ASTADR))
  (declare (integer ASTPRM))
  (declare (integer CONTXT))
  (declare (fixnum FUNC))
  (declare (integer IOSB))
     (call-out SYS$SETDTI EFN FLAGS IOSB ASTADR ASTPRM CONTXT FUNC 
ITMLST)
			(values IOSB))
 
 
(define-external-routine (SYS$SETDTIW

		:result  
		        (:lisp-type integer :vax-type :longword))
  (EFN		:lisp-type integer
		:vax-type  :unsigned-longword
		:mechanism :value
		:access :in)
  (FLAGS	:lisp-type integer
		:vax-type  :unsigned-longword
		:mechanism :value
		:access :in)
  (IOSB		:lisp-type integer
		:vax-type  :unsigned-quadword
		:mechanism :reference
		:access :in-out)
  (ASTADR	:lisp-type integer
		:vax-type  :unsigned-longword
		:mechanism :value
		:access :in)
  (ASTPRM	:lisp-type integer
		:vax-type  :unsigned-longword
		:mechanism :value
		:access :in)
  (CONTXT	:lisp-type integer
		:vax-type  :unsigned-longword
		:mechanism :reference
		:access :in)
  (FUNC		:lisp-type integer ; unsigned-byte 16
		:vax-type  :unsigned-word
		:mechanism :value
		:access :in)
  (ITMLST	:lisp-type alien-structure
		:mechanism :reference
		:access :in))
 
 
(defun lisp$SYS_SETDTIW (EFN FLAGS ASTADR ASTPRM CONTXT FUNC ITMLST 
&optional IOSB)
  (declare (integer EFN))
  (declare (integer FLAGS))
  (declare (integer ASTADR))
  (declare (integer ASTPRM))
  (declare (integer CONTXT))
  (declare (fixnum FUNC))
  (declare (integer IOSB))
     (call-out SYS$SETDTIW EFN FLAGS IOSB ASTADR ASTPRM CONTXT FUNC 
ITMLST)
			(values IOSB))
 
 
;;;  $SETUAI
;;;
;;;    Modify User Authorization Information
;;;
;;;     $SETUAI  [efn] ,[contxt] ,usrnam ,itmlst ,[iosb] ,[astadr]
;;;    		,[astprm]
;;;
;;;     efn    = event flag to be set at completion
;;;
;;;     contxt = address of a context longword (UAF IFI & ISI)
;;;
;;;     usrnam = address of user name descriptor
;;;
;;;     itmlst = address of a list of item descriptors
;;;
;;;     iosb   = address of a quadword I/O status block
;;;
;;;     astadr = address of entry mask of AST routine
;;;
;;;     astprm = value to be passed to AST routine
;;;
;;;                                    
(define-external-routine (SYS$SETUAI

		:result  
		        (:lisp-type integer :vax-type :longword))
  (EFN		:lisp-type integer
		:vax-type  :unsigned-longword
		:mechanism :value
		:access :in)
  (CONTXT	:lisp-type integer
		:vax-type  :unsigned-longword
		:mechanism :reference
		:access :in)
  (USRNAM	:lisp-type simple-string
		:vax-type  :text
		:mechanism :descriptor
		:access :in)
  (ITMLST	:lisp-type alien-structure
		:mechanism :reference
		:access :in)
  (IOSB		:lisp-type integer
		:vax-type  :unsigned-quadword
		:mechanism :reference
		:access :in-out)
  (ASTADR	:lisp-type integer
		:vax-type  :unsigned-longword
		:mechanism :value
		:access :in)
  (ASTPRM	:lisp-type integer
		:vax-type  :unsigned-longword
		:mechanism :value
		:access :in))
 
 
(defun lisp$SYS_SETUAI (EFN CONTXT USRNAM ITMLST ASTADR ASTPRM &optional IOSB)
  (declare (integer EFN))
  (declare (integer CONTXT))
  (declare (simple-string USRNAM))
  (declare (integer ASTADR))
  (declare (integer ASTPRM))
  (declare (integer IOSB))
     (call-out SYS$SETUAI EFN CONTXT USRNAM ITMLST IOSB ASTADR ASTPRM)
			(values IOSB))
 
 
;;;  $SNDACC
;;;
;;;    Send Message to Accounting Manager
;;;
;;;     $SNDACC  msgbuf ,[chan]
;;;
;;;     msgbuf = address of message buffer string descriptor
;;;
;;;     chan   = number of channel assigned to mailbox to receive reply
;;;
(define-external-routine (SYS$SNDACC

		:result  
		        (:lisp-type integer :vax-type :longword))
  (MSGBUF	:lisp-type simple-string
		:vax-type  :text
		:mechanism :descriptor
		:access :in)
  (CHAN		:lisp-type integer ; unsigned-byte 16
		:vax-type  :unsigned-word
		:mechanism :value
		:access :in))
 
 
(defun lisp$SYS_SNDACC (MSGBUF CHAN)
  (declare (simple-string MSGBUF))
  (declare (fixnum CHAN))
     (call-out SYS$SNDACC MSGBUF CHAN))
 
 
;;;  $SNDERR
;;;
;;;    Send Message to Error Logger
;;;
;;;     $SNDERR msgbuf
;;;
;;;     msgbuf = address of message buffer string descriptor
;;;                                    
(define-external-routine (SYS$SNDERR

		:result  
		        (:lisp-type integer :vax-type :longword))
  (MSGBUF	:lisp-type simple-string
		:vax-type  :text
		:mechanism :descriptor
		:access :in))
 
 
(defun lisp$SYS_SNDERR (MSGBUF)
  (declare (simple-string MSGBUF))
     (call-out SYS$SNDERR MSGBUF))
 
 
;;;  $SNDOPR
;;;
;;;    Send Message to Operator
;;;
;;;     $SNDOPR  msgbuf ,[chan]
;;;
;;;     msgbuf = address of message buffer string descriptor
;;;
;;;     chan   = number of channel assigned to mailbox to receive reply
;;;
(define-external-routine (SYS$SNDOPR

		:result  
		        (:lisp-type integer :vax-type :longword))
  (MSGBUF	:lisp-type simple-string
		:vax-type  :text
		:mechanism :descriptor
		:access :in)
  (CHAN		:lisp-type integer ; unsigned-byte 16
		:vax-type  :unsigned-word
		:mechanism :value
		:access :in))
 
 
(defun lisp$SYS_SNDOPR (MSGBUF CHAN)
  (declare (simple-string MSGBUF))
  (declare (fixnum CHAN))
     (call-out SYS$SNDOPR MSGBUF CHAN))
 
 
;;;  $SNDSMB
;;;
;;;    Send Message to Symbiont Manager
;;;
;;;     $SNDSMB  msgbuf ,[chan]
;;;
;;;     msgbuf = address of message buffer string descriptor
;;;
;;;     chan   = number of channel assigned to mailbox to receive reply
;;;                                    
(define-external-routine (SYS$SNDSMB

		:result  
		        (:lisp-type integer :vax-type :longword))
  (MSGBUF	:lisp-type simple-string
		:vax-type  :text
		:mechanism :descriptor
		:access :in)
  (CHAN		:lisp-type integer ; unsigned-byte 16
		:vax-type  :unsigned-word
		:mechanism :value
		:access :in))
 
 
(defun lisp$SYS_SNDSMB (MSGBUF CHAN)
  (declare (simple-string MSGBUF))
  (declare (fixnum CHAN))
     (call-out SYS$SNDSMB MSGBUF CHAN))
 
 
;;;  $SNDJBC
;;;
;;;    Send Message to Job Controller
;;;
;;;     $SNDJBC   [efn], func, [nullarg], [itmlst],
;;;    ($SNDJBCW) [iosb], [astadr], [astprm]
;;;
;;;     efn     = event flag to be set when request completes
;;;     func    = code specifying function to be performed
;;;     nullarg = reserved argument for similarity with $getxxx services
;;;     itmlst  = address of a list of item descriptors for the operation
;;;     iosb    = address of a quadword status block to receive the final status
;;;     astadr  = address of an ast routine to be called when request completes
;;;     astprm  = 32-bit ast parameter
;;;                                    
(define-external-routine (SYS$SNDJBC

		:result  
		        (:lisp-type integer :vax-type :longword))
  (EFN		:lisp-type integer
		:vax-type  :unsigned-longword
		:mechanism :value
		:access :in)
  (FUNC		:lisp-type integer ; unsigned-byte 16
		:vax-type  :unsigned-word
		:mechanism :value
		:access :in)
  (NULLARG	:lisp-type integer
		:vax-type  :unsigned-longword
		:mechanism :value
		:access :in)
  (ITMLST	:lisp-type alien-structure
		:mechanism :reference
		:access :in)
  (IOSB		:lisp-type integer
		:vax-type  :unsigned-quadword
		:mechanism :reference
		:access :in-out)
  (ASTADR	:lisp-type integer
		:vax-type  :unsigned-longword
		:mechanism :value
		:access :in)
  (ASTPRM	:lisp-type integer
		:vax-type  :unsigned-longword
		:mechanism :value
		:access :in))
 
 
(defun lisp$SYS_SNDJBC (EFN FUNC NULLARG ITMLST ASTADR ASTPRM &optional IOSB)
  (declare (integer EFN))
  (declare (fixnum FUNC))
  (declare (integer NULLARG))
  (declare (integer ASTADR))
  (declare (integer ASTPRM))
  (declare (integer IOSB))
     (call-out SYS$SNDJBC EFN FUNC NULLARG ITMLST IOSB ASTADR ASTPRM)
			(values IOSB))
 
 
(define-external-routine (SYS$SNDJBCW

		:result  
		        (:lisp-type integer :vax-type :longword))
  (EFN		:lisp-type integer
		:vax-type  :unsigned-longword
		:mechanism :value
		:access :in)
  (FUNC		:lisp-type integer ; unsigned-byte 16
		:vax-type  :unsigned-word
		:mechanism :value
		:access :in)
  (NULLARG	:lisp-type integer
		:vax-type  :unsigned-longword
		:mechanism :value
		:access :in)
  (ITMLST	:lisp-type alien-structure
		:mechanism :reference
		:access :in)
  (IOSB		:lisp-type integer
		:vax-type  :unsigned-quadword
		:mechanism :reference
		:access :in-out)
  (ASTADR	:lisp-type integer
		:vax-type  :unsigned-longword
		:mechanism :value
		:access :in)
  (ASTPRM	:lisp-type integer
		:vax-type  :unsigned-longword
		:mechanism :value
		:access :in))
 
 
(defun lisp$SYS_SNDJBCW (EFN FUNC NULLARG ITMLST ASTADR ASTPRM &optional IOSB)
  (declare (integer EFN))
  (declare (fixnum FUNC))
  (declare (integer NULLARG))
  (declare (integer ASTADR))
  (declare (integer ASTPRM))
  (declare (integer IOSB))
     (call-out SYS$SNDJBCW EFN FUNC NULLARG ITMLST IOSB ASTADR ASTPRM)
			(values IOSB))
 
 
;;;
;;;  $SPACE
;;;
;;;    Space to Record in File
;;;
;;;      $SPACE rab, [err], [suc]
;;;
;;;      rab	= address of rab
;;;
;;;	err	= address of user error completion routine
;;;
;;;	suc	= address of user success completion routine
;;;                                    
(define-external-routine (SYS$SPACE

		:result  
		        (:lisp-type integer :vax-type :longword))
  (RAB		:lisp-type alien-structure
		:mechanism :reference
		:access :in-out)
  (ERR		:lisp-type integer
		:vax-type  :unsigned-longword
		:mechanism :value
		:access :in)
  (SUC		:lisp-type integer
		:vax-type  :unsigned-longword
		:mechanism :value
		:access :in))
 
 
(defun lisp$SYS_SPACE (ERR SUC &optional RAB)
  (declare (integer ERR))
  (declare (integer SUC))
     (call-out SYS$SPACE RAB ERR SUC)
			(values RAB))
 
 
;;;
;;; $START_BRANCH
;;;
;;;    Start a transaction branch
;;;
;;;	$START_BRANCH	[efn], [flags], iosb, [astadr], [astprm], tid, parent
;;;	   ($START_BRANCHW)
;;;
;;;	efn	= event flag to be set at completion
;;;	flags	= operation flags
;;;	iosb	= address of a quadword I/O status block
;;;	astadr	= address of an entry mask of AST routine
;;;	astprm	= value to be passed to AST routine as an argument
;;;	tid	= transaction id for this branch
;;;	parent	= address of parent node name descriptor
;;;
(define-external-routine (SYS$START_BRANCH

		:result  
		        (:lisp-type integer :vax-type :longword))
  (EFN		:lisp-type integer
		:vax-type  :unsigned-longword
		:mechanism :value
		:access :in)
  (FLAGS	:lisp-type integer
		:vax-type  :unsigned-longword
		:mechanism :value
		:access :in)
  (IOSB		:lisp-type integer
		:vax-type  :unsigned-quadword
		:mechanism :reference
		:access :in-out)
  (ASTADR	:lisp-type integer
		:vax-type  :unsigned-longword
		:mechanism :value
		:access :in)
  (ASTPRM	:lisp-type integer
		:vax-type  :unsigned-longword
		:mechanism :value
		:access :in)
  (TID		:lisp-type integer
		:vax-type  :unsigned-quadword ; :unsigned-octaword ??
		:mechanism :reference
		:access :in)
  (PARENT	:lisp-type simple-string
		:vax-type  :text
		:mechanism :descriptor
		:access :in))
 
 
(defun lisp$SYS_START_BRANCH (EFN FLAGS ASTADR ASTPRM TID PARENT 
&optional IOSB)
  (declare (integer EFN))
  (declare (integer FLAGS))
  (declare (integer ASTADR))
  (declare (integer ASTPRM))
  (declare (integer TID))
  (declare (simple-string PARENT))
  (declare (integer IOSB))
     (call-out SYS$START_BRANCH EFN FLAGS IOSB ASTADR ASTPRM TID 
PARENT)
			(values IOSB))
 
 
(define-external-routine (SYS$START_BRANCHW

		:result  
		        (:lisp-type integer :vax-type :longword))
  (EFN		:lisp-type integer
		:vax-type  :unsigned-longword
		:mechanism :value
		:access :in)
  (FLAGS	:lisp-type integer
		:vax-type  :unsigned-longword
		:mechanism :value
		:access :in)
  (IOSB		:lisp-type integer
		:vax-type  :unsigned-quadword
		:mechanism :reference
		:access :in-out)
  (ASTADR	:lisp-type integer
		:vax-type  :unsigned-longword
		:mechanism :value
		:access :in)
  (ASTPRM	:lisp-type integer
		:vax-type  :unsigned-longword
		:mechanism :value
		:access :in)
  (TID		:lisp-type integer
		:vax-type  :unsigned-quadword ; :unsigned-octaword ??
		:mechanism :reference
		:access :in)
  (PARENT	:lisp-type simple-string
		:vax-type  :text
		:mechanism :descriptor
		:access :in))
 
 
(defun lisp$SYS_START_BRANCHW (EFN FLAGS ASTADR ASTPRM TID PARENT 
&optional IOSB)
  (declare (integer EFN))
  (declare (integer FLAGS))
  (declare (integer ASTADR))
  (declare (integer ASTPRM))
  (declare (integer TID))
  (declare (simple-string PARENT))
  (declare (integer IOSB))
     (call-out SYS$START_BRANCHW EFN FLAGS IOSB ASTADR ASTPRM TID 
PARENT)
			(values IOSB))
 
 
;;;
;;;  $START_TRANS
;;;
;;;    Start a new transaction
;;;
;;;	$START_TRANS	[efn], [flags], iosb, [astadr], [astprm], tid
;;;	  ($START_TRANSW)
;;;
;;;	efn	= event flag to be set at completion
;;;	flags	= operation flags
;;;	iosb	= address of a quadword I/O status block
;;;	astadr	= address of an entry mask of AST routine
;;;	astprm	= value to be passed to AST routine as an argument
;;;	tid	= identifier of transaction just started
;;;
(define-external-routine (SYS$START_TRANS

		:result  
		        (:lisp-type integer :vax-type :longword))
  (EFN		:lisp-type integer
		:vax-type  :unsigned-longword
		:mechanism :value
		:access :in)
  (FLAGS	:lisp-type integer
		:vax-type  :unsigned-longword
		:mechanism :value
		:access :in)
  (IOSB		:lisp-type integer
		:vax-type  :unsigned-quadword
		:mechanism :reference
		:access :in-out)
  (ASTADR	:lisp-type integer
		:vax-type  :unsigned-longword
		:mechanism :value
		:access :in)
  (ASTPRM	:lisp-type integer
		:vax-type  :unsigned-longword
		:mechanism :value
		:access :in)
  (TID		:lisp-type integer
		:vax-type  :unsigned-quadword ; :unsigned-octaword ??
		:mechanism :reference
		:access :in-out))
 
 
(defun lisp$SYS_START_TRANS (EFN FLAGS ASTADR ASTPRM &optional IOSB 
TID)
  (declare (integer EFN))
  (declare (integer FLAGS))
  (declare (integer ASTADR))
  (declare (integer ASTPRM))
  (declare (integer IOSB))
  (declare (integer TID))
     (call-out SYS$START_TRANS EFN FLAGS IOSB ASTADR ASTPRM TID)
			(values IOSB TID))
 
 
(define-external-routine (SYS$START_TRANSW

		:result  
		        (:lisp-type integer :vax-type :longword))
  (EFN		:lisp-type integer
		:vax-type  :unsigned-longword
		:mechanism :value
		:access :in)
  (FLAGS	:lisp-type integer
		:vax-type  :unsigned-longword
		:mechanism :value
		:access :in)
  (IOSB		:lisp-type integer
		:vax-type  :unsigned-quadword
		:mechanism :reference
		:access :in-out)
  (ASTADR	:lisp-type integer
		:vax-type  :unsigned-longword
		:mechanism :value
		:access :in)
  (ASTPRM	:lisp-type integer
		:vax-type  :unsigned-longword
		:mechanism :value
		:access :in)
  (TID		:lisp-type integer
		:vax-type  :unsigned-quadword ; :unsigned-octaword ??
		:mechanism :reference
		:access :in-out))
 
 
(defun lisp$SYS_START_TRANSW (EFN FLAGS ASTADR ASTPRM &optional IOSB 
TID)
  (declare (integer EFN))
  (declare (integer FLAGS))
  (declare (integer ASTADR))
  (declare (integer ASTPRM))
  (declare (integer IOSB))
  (declare (integer TID))
     (call-out SYS$START_TRANSW EFN FLAGS IOSB ASTADR ASTPRM TID)
			(values IOSB TID))
 
 
;;;  $SUSPND
;;;
;;;    Suspend Process
;;;
;;;     $SUSPND  [pidadr] ,[prcnam], [flags]
;;;
;;;     pidadr = address of process id of process to be suspended
;;;
;;;     prcnam = address of name string descriptor of process
;;;
;;;     flags  = longword of bit flags, of which only bit 0 is
;;;		  currently used.  If bit 0 is set, then this
;;;		  is a hard suspend request; if clear this is
;;;		  a soft suspend request.
;;;
(define-external-routine (SYS$SUSPND

		:result  
		        (:lisp-type integer :vax-type :longword))
  (PIDADR	:lisp-type integer
		:vax-type  :unsigned-longword
		:mechanism :reference
		:access :in-out)
  (PRCNAM	:lisp-type simple-string
		:vax-type  :text
		:mechanism :descriptor
		:access :in)
  (FLAGS	:lisp-type integer
		:vax-type  :unsigned-longword
		:mechanism :value
		:access :in))
 
 
(defun lisp$SYS_SUSPND (PRCNAM FLAGS &optional PIDADR)
  (declare (simple-string PRCNAM))
  (declare (integer FLAGS))
  (declare (integer PIDADR))
     (call-out SYS$SUSPND PIDADR PRCNAM FLAGS)
			(values PIDADR))
 
 
;;;  $SYNCH
;;;
;;;    Synchronize Event Completion
;;;
;;;     $SYNCH [iosb] ,[efn]
;;;
;;;     efn    = event flag to be set at completion
;;;
;;;     iosb   = address of a quadword I/O status block
;;;
(define-external-routine (SYS$SYNCH

		:result  
		        (:lisp-type integer :vax-type :longword))
  (EFN		:lisp-type integer
		:vax-type  :unsigned-longword
		:mechanism :value
		:access :in)
  (IOSB		:lisp-type integer
		:vax-type  :unsigned-quadword
		:mechanism :reference
		:access :in-out))
 
 
(defun lisp$SYS_SYNCH (EFN &optional IOSB)
  (declare (integer EFN))
  (declare (integer IOSB))
     (call-out SYS$SYNCH EFN IOSB)
			(values IOSB))
 
 
;;;  $TRNLNM
;;;
;;;    Translate Logical Name
;;;
;;;     $TRNLNM  [attr], tabnam, [lognam], [acmode], [itemlist]
;;;
;;;     attr = address of logical name translation attributes
;;;
;;;	Attribute	 Meaning
;;;	LNM$M_CASE_BLIND Search of string is case insensitive
;;;
;;;     tabnam = address of logical name table name string descriptor
;;;
;;;     lognam = address of logical name string descriptor
;;;
;;;     acmode = address of access mode for logical name
;;;
;;;     itmlst = address of a list of item descriptors
;;; 
(define-external-routine (SYS$TRNLNM

		:result  
		        (:lisp-type integer :vax-type :longword))
  (ATTR		:lisp-type integer
		:vax-type  :unsigned-longword
		:mechanism :reference
		:access :in)
  (TABNAM	:lisp-type simple-string
		:vax-type  :text
		:mechanism :descriptor
		:access :in)
  (LOGNAM	:lisp-type simple-string
		:vax-type  :text
		:mechanism :descriptor
		:access :in)
  (ACMODE	:lisp-type integer ; unsigned-byte 8
		:vax-type  :byte
		:mechanism :reference
		:access :in)
  (ITMLST	:lisp-type alien-structure
		:mechanism :reference
		:access :in))
 
 
(defun lisp$SYS_TRNLNM (ATTR TABNAM LOGNAM ACMODE ITMLST)
  (declare (integer ATTR))
  (declare (simple-string TABNAM))
  (declare (simple-string LOGNAM))
  (declare (fixnum ACMODE))
     (call-out SYS$TRNLNM ATTR TABNAM LOGNAM ACMODE ITMLST))
 
 
;;;  $TRNLOG
;;;
;;;    Translate Logical Name
;;;
;;;     $TRNLOG  lognam ,[rsllen] ,rslbuf ,[table] ,[acmode] ,[dsbmsk]
;;;
;;;     lognam = address of logical name string descriptor
;;;
;;;     rsllen = address of word to receive length of resultant name
;;;
;;;     rslbuf = address of descriptor for buffer to receive resultant
;;;              string
;;;
;;;     table  = address of byte to receive logical name table number
;;;
;;;     acmode = address of byte to receive access mode of entry
;;;              (process table only)
;;;
;;;     dsbmsk = table search disable mask
;;;
;;;       Bit Set    Meaning
;;;                                    
;;;          0       Do not search system table
;;;          1       Do not search group table
;;;          2       Do not search process table
;;;
(define-external-routine (SYS$TRNLOG

		:result  
		        (:lisp-type integer :vax-type :longword))
  (LOGNAM	:lisp-type simple-string
		:vax-type  :text
		:mechanism :descriptor
		:access :in)
  (RSLLEN	:lisp-type integer ; unsigned-byte 16
		:vax-type  :unsigned-word
		:mechanism :reference
		:access :in-out)
  (RSLBUF	:lisp-type simple-string
		:vax-type  :text
		:mechanism :descriptor
		:access :in-out)
  (TABLE	:lisp-type integer ; unsigned-byte 8
		:vax-type  :byte
		:mechanism :reference
		:access :in-out)
  (ACMODE	:lisp-type integer ; unsigned-byte 8
		:vax-type  :byte
		:mechanism :reference
		:access :in-out)
  (DSBMSK	:lisp-type integer
		:vax-type  :unsigned-longword
		:mechanism :value
		:access :in))
 
 
(defun lisp$SYS_TRNLOG (LOGNAM DSBMSK &optional RSLLEN RSLBUF TABLE 
ACMODE)
  (declare (simple-string LOGNAM))
  (declare (integer DSBMSK))
  (declare (fixnum RSLLEN))
  (declare (simple-string RSLBUF))
  (declare (fixnum TABLE))
  (declare (fixnum ACMODE))
     (call-out SYS$TRNLOG LOGNAM RSLLEN RSLBUF TABLE ACMODE DSBMSK)
			(values RSLLEN RSLBUF TABLE ACMODE))
 
 
;;;
;;;  $TRUNCATE
;;;
;;;    Truncate Record
;;;
;;;      $TRUNCATE rab, [err], [suc]
;;;
;;;      rab	= address of rab
;;;
;;;	err	= address of user error completion routine
;;;
;;;	suc	= address of user success completion routine
;;;
(define-external-routine (SYS$TRUNCATE

		:result  
		        (:lisp-type integer :vax-type :longword))
  (RAB		:lisp-type alien-structure
		:mechanism :reference
		:access :in-out)
  (ERR		:lisp-type integer
		:vax-type  :unsigned-longword
		:mechanism :value
		:access :in)
  (SUC		:lisp-type integer
		:vax-type  :unsigned-longword
		:mechanism :value
		:access :in))
 
 
(defun lisp$SYS_TRUNCATE (ERR SUC &optional RAB)
  (declare (integer ERR))
  (declare (integer SUC))
     (call-out SYS$TRUNCATE RAB ERR SUC)
			(values RAB))
 
 
;;;  $ULKPAG
;;;
;;;    Unlock Pages From Memory
;;;
;;;     $ULKPAG  inadr ,[retadr] ,[acmode]
;;;
;;;     inadr  = address of 2-longword array containing starting and
;;;              ending virtual addresses of pages to be unlocked
;;;
;;;     retadr = address of a 2-longword array to receive starting and
;;;              ending virtual addresses of pages actually unlocked
;;;
;;;     acmode = access mode to check against the owner of the pages
;;;
(define-external-routine (SYS$ULKPAG

		:result  
		        (:lisp-type integer :vax-type :longword))
  (INADR	:lisp-type (unsigned-byte 32 (array (2)))
		:mechanism :reference
		:access :in)
  (RETADR	:lisp-type (unsigned-byte 32 (array (2)))
		:mechanism :reference
		:access :in-out)
  (ACMODE	:lisp-type integer
		:vax-type  :unsigned-longword
		:mechanism :value
		:access :in))
 
 
(defun lisp$SYS_ULKPAG (INADR ACMODE &optional RETADR)
  (declare (integer ACMODE))
     (call-out SYS$ULKPAG INADR RETADR ACMODE)
			(values RETADR))
 
 
;;;  $ULWSET
;;;
;;;    Unlock Pages From Working Set
;;;
;;;     $ULWSET  inadr ,[retadr] ,[acmode]
;;;
;;;     inadr  = address of 2-longword array containing starting and
;;;              ending virtual addresses of pages to be unlocked
;;;
;;;     retadr = address of a 2-longword array to receive starting and
;;;              ending virtual addresses of pages actually unlocked
;;;
;;;     acmode = access mode to check against the owner of the pages
;;;                                    
(define-external-routine (SYS$ULWSET

		:result  
		        (:lisp-type integer :vax-type :longword))
  (INADR	:lisp-type (unsigned-byte 32 (array (2)))
		:mechanism :reference
		:access :in)
  (RETADR	:lisp-type (unsigned-byte 32 (array (2)))
		:mechanism :reference
		:access :in-out)
  (ACMODE	:lisp-type integer
		:vax-type  :unsigned-longword
		:mechanism :value
		:access :in))
 
 
(defun lisp$SYS_ULWSET (INADR ACMODE &optional RETADR)
  (declare (integer ACMODE))
     (call-out SYS$ULWSET INADR RETADR ACMODE)
			(values RETADR))
 
 
;;;  $UNWIND
;;;
;;;    Unwind Call Stack
;;;
;;;     $UNWIND  [depadr] ,[newpc]
;;;
;;;     depadr = address of longword containing number of logical frames
;;;              (depth) to unwind call stack
;;;
;;;     newpc  = address to be given control when the unwind is complete
;;;                                    
(define-external-routine (SYS$UNWIND

		:result  
		        (:lisp-type integer :vax-type :longword))
  (DEPADR	:lisp-type integer
		:vax-type  :unsigned-longword
		:mechanism :reference
		:access :in)
  (NEWPC	:lisp-type integer
		:vax-type  :unsigned-longword
		:mechanism :reference
		:access :in))
 
 
(defun lisp$SYS_UNWIND (DEPADR NEWPC)
  (declare (integer DEPADR))
  (declare (integer NEWPC))
     (call-out SYS$UNWIND DEPADR NEWPC))
 
 
;;;
;;;  $UPDATE
;;;
;;;    Update Record
;;;
;;;      $UPDATE fab, [err], [suc]
;;;
;;;      rab	= address of rab
;;;
;;;	err	= address of user error completion routine
;;;
;;;	suc	= address of user success completion routine
;;;                                    
(define-external-routine (SYS$UPDATE

		:result  
		        (:lisp-type integer :vax-type :longword))
  (RAB		:lisp-type alien-structure
		:mechanism :reference
		:access :in-out)
  (ERR		:lisp-type integer
		:vax-type  :unsigned-longword
		:mechanism :value
		:access :in)
  (SUC		:lisp-type integer
		:vax-type  :unsigned-longword
		:mechanism :value
		:access :in))
 
 
(defun lisp$SYS_UPDATE (ERR SUC &optional RAB)
  (declare (integer ERR))
  (declare (integer SUC))
     (call-out SYS$UPDATE RAB ERR SUC)
			(values RAB))
 
 
;;;  $UPDSEC
;;;
;;;    Update Section File on Disk
;;;
;;;     $UPDSEC  inadr ,[retadr] ,[acmode] ,[updflg] ,[efn] ,[iosb]
;;;     ($UPDSECW)  ,[astadr] ,[astprm]
;;;
;;;     inadr  = address of 2-longword array containing starting and
;;;              ending  addresses  of  the  pages  to  be potentially
;;;              written
;;;
;;;     retadr = address of 2-longword array to receive  addresses  of
;;;              the  first  and  last  page  queued  in the first I/O
;;;              request
;;;
;;;     acmode = access  mode  on  behalf  of  which  the  service  is
;;;              performed
;;;
;;;     updflg = update indicator for read/write global sections
;;;                0 -> write all read/write pages in the section
;;;                1 -> write all pages modified by the caller
;;;
;;;     efn    = number of event flag to set when the section file  is
;;;              updated
;;;
;;;     iosb   = address of quadword I/O status block
;;;
;;;     astadr = address of entry mask of an AST service routine
;;;
;;;     astprm = AST parameter to be passed to the AST service routine
;;;
(define-external-routine (SYS$UPDSEC

		:result  
		        (:lisp-type integer :vax-type :longword))
  (INADR	:lisp-type (unsigned-byte 32 (array (2)))
		:mechanism :reference
		:access :in)
  (RETADR	:lisp-type (unsigned-byte 32 (array (2)))
		:mechanism :reference
		:access :in-out)
  (ACMODE	:lisp-type integer
		:vax-type  :unsigned-longword
		:mechanism :value
		:access :in)
  (UPDFLG	:lisp-type integer
		:vax-type  :byte
		:mechanism :value
		:access :in)
  (EFN		:lisp-type integer
		:vax-type  :unsigned-longword
		:mechanism :value
		:access :in)
  (IOSB		:lisp-type integer
		:vax-type  :unsigned-quadword
		:mechanism :reference
		:access :in-out)
  (ASTADR	:lisp-type integer
		:vax-type  :unsigned-longword
		:mechanism :value
		:access :in)
  (ASTPRM	:lisp-type integer
		:vax-type  :unsigned-longword
		:mechanism :value
		:access :in))
 
 
(defun lisp$SYS_UPDSEC (INADR ACMODE UPDFLG EFN ASTADR ASTPRM &optional RETADR 
IOSB)
  (declare (integer ACMODE))
  (declare (integer UPDFLG))
  (declare (integer EFN))
  (declare (integer ASTADR))
  (declare (integer ASTPRM))
  (declare (integer IOSB))
     (call-out SYS$UPDSEC INADR RETADR ACMODE UPDFLG EFN IOSB ASTADR 
ASTPRM)
			(values RETADR IOSB))
 
 
(define-external-routine (SYS$UPDSECW

		:result  
		        (:lisp-type integer :vax-type :longword))
  (INADR	:lisp-type (unsigned-byte 32 (array (2)))
		:mechanism :reference
		:access :in)
  (RETADR	:lisp-type (unsigned-byte 32 (array (2)))
		:mechanism :reference
		:access :in-out)
  (ACMODE	:lisp-type integer
		:vax-type  :unsigned-longword
		:mechanism :value
		:access :in)
  (UPDFLG	:lisp-type integer
		:vax-type  :byte
		:mechanism :value
		:access :in)
  (EFN		:lisp-type integer
		:vax-type  :unsigned-longword
		:mechanism :value
		:access :in)
  (IOSB		:lisp-type integer
		:vax-type  :unsigned-quadword
		:mechanism :reference
		:access :in-out)
  (ASTADR	:lisp-type integer
		:vax-type  :unsigned-longword
		:mechanism :value
		:access :in)
  (ASTPRM	:lisp-type integer
		:vax-type  :unsigned-longword
		:mechanism :value
		:access :in))
 
 
(defun lisp$SYS_UPDSECW (INADR ACMODE UPDFLG EFN ASTADR ASTPRM &optional RETADR 
IOSB)
  (declare (integer ACMODE))
  (declare (integer UPDFLG))
  (declare (integer EFN))
  (declare (integer ASTADR))
  (declare (integer ASTPRM))
  (declare (integer IOSB))
     (call-out SYS$UPDSECW INADR RETADR ACMODE UPDFLG EFN IOSB ASTADR 
ASTPRM)
			(values RETADR IOSB))
 
 
;;;
;;;  $WAIT
;;;
;;;    Wait on File
;;;
;;;      $WAIT rab
;;;
;;;      rab	= address of rab
;;;                                    
;;;
(define-external-routine (SYS$WAIT

		:result  
		        (:lisp-type integer :vax-type :longword))
  (RAB		:lisp-type alien-structure
		:mechanism :reference
		:access :in-out))
 
 
(defun lisp$SYS_WAIT (&optional RAB)
     (call-out SYS$WAIT RAB)
			(values RAB))
 
 
;;;  $WAITFR
;;;
;;;    Wait for Single Event Flag
;;;
;;;     $WAITFR  efn
;;;
;;;     efn    = event flag number to wait for
;;;
(define-external-routine (SYS$WAITFR

		:result  
		        (:lisp-type integer :vax-type :longword))
  (EFN		:lisp-type integer
		:vax-type  :unsigned-longword
		:mechanism :value
		:access :in))
 
 
(defun lisp$SYS_WAITFR (EFN)
  (declare (integer EFN))
     (call-out SYS$WAITFR EFN))
 
 
;;;  $WAKE
;;;
;;;    Wake
;;;
;;;     $WAKE  [pidadr] ,[prcnam]
;;;
;;;     pidadr = address of process id  of process to be awakened
;;;
;;;     prcnam = address of name string descriptor of process to be
;;;              awakened
;;;
(define-external-routine (SYS$WAKE

		:result  
		        (:lisp-type integer :vax-type :longword))
  (PIDADR	:lisp-type integer
		:vax-type  :unsigned-longword
		:mechanism :reference
		:access :in-out)
  (PRCNAM	:lisp-type simple-string
		:vax-type  :text
		:mechanism :descriptor
		:access :in))
 
 
(defun lisp$SYS_WAKE (PRCNAM &optional PIDADR)
  (declare (simple-string PRCNAM))
  (declare (integer PIDADR))
     (call-out SYS$WAKE PIDADR PRCNAM)
			(values PIDADR))
 
 
;;;  $WFLAND
;;;
;;;    Wait for Logical AND of Event Flags
;;;
;;;     $WFLAND  efn ,mask
;;;
;;;     efn    = event flag number of any flag within the cluster
;;;
;;;     mask   = 32-bit mask of flags that must be set
;;;                                    
(define-external-routine (SYS$WFLAND

		:result  
		        (:lisp-type integer :vax-type :longword))
  (EFN		:lisp-type integer
		:vax-type  :unsigned-longword
		:mechanism :value
		:access :in)
  (MASK		:lisp-type integer
		:vax-type  :unsigned-longword
		:mechanism :value
		:access :in))
 
 
(defun lisp$SYS_WFLAND (EFN MASK)
  (declare (integer EFN))
  (declare (integer MASK))
     (call-out SYS$WFLAND EFN MASK))
 
 
;;;  $WFLOR
;;;
;;;    Wait for Logical OR of Event Flags
;;;
;;;     $WFLOR  efn ,mask
;;;
;;;     efn    = event flag number of any flag within the cluster
;;;
;;;     mask   = 32-bit mask of flags, any of which must be set
;;;
(define-external-routine (SYS$WFLOR

		:result  
		        (:lisp-type integer :vax-type :longword))
  (EFN		:lisp-type integer
		:vax-type  :unsigned-longword
		:mechanism :value
		:access :in)
  (MASK		:lisp-type integer
		:vax-type  :unsigned-longword
		:mechanism :value
		:access :in))
 
 
(defun lisp$SYS_WFLOR (EFN MASK)
  (declare (integer EFN))
  (declare (integer MASK))
     (call-out SYS$WFLOR EFN MASK))
 
 
;;;
;;;  $WRITE
;;;
;;;    Write Block to  File
;;;
;;;      $WRITE rab, [err], [suc]
;;;
;;;      rab	= address of rab
;;;
;;;	err	= address of user error completion routine
;;;                                    
;;;	suc	= address of user success completion routine
;;;
(define-external-routine (SYS$WRITE

		:result  
		        (:lisp-type integer :vax-type :longword))
  (RAB		:lisp-type alien-structure
		:mechanism :reference
		:access :in-out)
  (ERR		:lisp-type integer
		:vax-type  :unsigned-longword
		:mechanism :value
		:access :in)
  (SUC		:lisp-type integer
		:vax-type  :unsigned-longword
		:mechanism :value
		:access :in))
 
 
(defun lisp$SYS_WRITE (ERR SUC &optional RAB)
  (declare (integer ERR))
  (declare (integer SUC))
     (call-out SYS$WRITE RAB ERR SUC)
			(values RAB))
 
 
