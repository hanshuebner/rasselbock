(defconstant ARP$M_IN_USE #x1)
(defconstant ARP$M_COM #x2)
(defconstant ARP$M_PERM #x4)
(defconstant ARP$M_PUBL #x8)
(defconstant ARP$M_USETRAILERS #x10)
(defconstant ARP$C_LENGTH 34)
(defconstant ARP$K_LENGTH 34)

;; struct ARPREQDEF {
;;     char ARP$T_PA [16];                 ; IP address
;; ; $SOCKADDRINDEF defines offsets
;;     char ARP$T_HA [16];                 ; Ethernet hardware address
;; ; $SOCKADDRDEF defines offsets
;;     union  {                            ;
;;         unsigned short int ARP$W_FLAGS; ; flags
;;         struct  {                       ;
;;             unsigned ARP$V_IN_USE : 1;  ; ARP entry is in use
;;             unsigned ARP$V_COM : 1;     ; ARP entry is complete
;;             unsigned ARP$V_PERM : 1;    ; ARP entry is pemanent
;;             unsigned ARP$V_PUBL : 1;    ; ARP entry is public
;;             unsigned ARP$V_USETRAILERS : 1; ; hosts uses trailers
;;             unsigned ARP$V_FILL_0 : 3;
;;             } ARP$R_O_FLAGS;
;;         } ARP$R_OVLY;
;;     } ;

(defconstant IFR$M_IFF_UP #x1)
(defconstant IFR$M_IFF_BROADCAST #x2)
(defconstant IFR$M_IFF_DEBUG #x4)
(defconstant IFR$M_IFF_LOOPBACK #x8)
(defconstant IFR$M_IFF_POINTOPOINT #x10)
(defconstant IFR$M_IFF_NOTRAILERS #x20)
(defconstant IFR$M_IFF_RUNNING #x40)
(defconstant IFR$M_IFF_NOARP #x80)
(defconstant IFR$M_IFF_PROMISC #x100)
(defconstant IFR$M_IFF_ALLMULTI #x200)
(defconstant IFR$M_IFF_MULTICAST #x400)
(defconstant IFR$M_IFF_SIMPLEX #x800)
(defconstant IFR$M_IFF_OACTIVE #x1000)
(defconstant IFR$M_IFF_PFCOPYALL #x2000)
(defconstant IFR$M_IFF_D1 #x4000)
(defconstant IFR$M_IFF_D2 #x8000)
(defconstant IFR$M_IFF_UIOMOVE #x10000)
(defconstant IFR$M_IFF_PKTOK #x20000)
(defconstant IFR$M_IFF_SOCKBUF #x40000)
(defconstant IFR$M_IFF_VAR_MTU #x80000)
(defconstant IFR$M_IFF_NOCHECKSUM #x100000)
(defconstant IFR$M_IFF_DYNPROTO #x200000)
(defconstant IFR$M_IFF_MOP #x400000)
(defconstant IFR$M_IFF_SLIP #x800000)
(defconstant IFR$M_IFF_DELETE #x1000000)
(defconstant IFR$M_IFF_NONAME #x2000000)
(defconstant IFR$M_IFF_CLUSTER #x4000000)
(defconstant IFR$C_LENGTH 32)
(defconstant IFR$K_LENGTH 32)

;; struct IFREQDEF {
;;     char IFR$T_NAME [16];               ; device name
;;     union  {
;;         char IFR$T_ADDR [16];           ; SOCKADDRIN structure
;;         char IFR$T_DSTADDR [16];        ; SOCKADDRIN structure
;;         char IFR$T_BROADADDR [16];      ; SOCKADDRIN structure
;;         union  {
;;             unsigned short int IFR$W_FLAGS; ; flags
;;             struct  {
;;                 unsigned IFR$V_IFF_UP : 1; ; Interface is up
;;                 unsigned IFR$V_IFF_BROADCAST : 1; ; Broadcast address valid
;;                 unsigned IFR$V_IFF_DEBUG : 1; ; Turn on tracing
;;                 unsigned IFR$V_IFF_LOOPBACK : 1; ; Interface set to loopback
;;                 unsigned IFR$V_IFF_POINTOPOINT : 1; ; Interface is point-to-point link
;;                 unsigned IFR$V_IFF_NOTRAILERS : 1; ; Avoid use of trailers
;;                 unsigned IFR$V_IFF_RUNNING : 1; ; Resources are allocated
;;                 unsigned IFR$V_IFF_NOARP : 1; ; No address resolution protocol
;;                 unsigned IFR$V_IFF_PROMISC : 1; ; Receive all packets
;;                 unsigned IFR$V_IFF_ALLMULTI : 1; ; Receive all multicasting packets
;;                 unsigned IFR$V_IFF_MULTICAST : 1; ; supports multicast
;;                 unsigned IFR$V_IFF_SIMPLEX : 1; ; can't hear own transmissions
;;                 unsigned IFR$V_IFF_OACTIVE : 1; ; transmission in progress
;;                 unsigned IFR$V_IFF_PFCOPYALL : 1; ; pfilt gets packets to this host
;;                 unsigned IFR$V_IFF_D1 : 1; ; IFF_SNAP Ethernet driver outputs
;; ; SNAP hdr
;;                 unsigned IFR$V_IFF_D2 : 1;
;;                 unsigned IFR$V_IFF_UIOMOVE : 1; ; DART
;;                 unsigned IFR$V_IFF_PKTOK : 1; ; DART
;;                 unsigned IFR$V_IFF_SOCKBUF : 1; ; DART
;;                 unsigned IFR$V_IFF_VAR_MTU : 1; ; interface supports variable MTUs
;;                 unsigned IFR$V_IFF_NOCHECKSUM : 1; ; no checksums need reliable media
;;                 unsigned IFR$V_IFF_DYNPROTO : 1; ; Support dynamic proto dispatching
;;                 unsigned IFR$V_IFF_MOP : 1; ; Device in MOP mode; not in use
;;                 unsigned IFR$V_IFF_SLIP : 1; ; Interface is a SLIP IFNET
;;                 unsigned IFR$V_IFF_DELETE : 1; ; Started DELETE on this interface
;;                 unsigned IFR$V_IFF_NONAME : 1; ; Interface does not hold the cluster
;; ; name
;;                 unsigned IFR$V_IFF_CLUSTER : 1; ; Interface is a cluster IFNET
;;                 unsigned IFR$V_FILL_1 : 5;
;;                 } IFR$R_DUMMY_1_BITS;
;;             } IFR$R_DUMMY_1_OVRL;
;;         int *IFR$L_DATA;                ; pointer to data
;;         } IFR$R_DUMMY;
;;     } ;

(defconstant EPERM 1)                         ; Not owner
(defconstant ENOENT 2)                        ; No such file or directory
(defconstant ESRCH 3)                         ; No such process
(defconstant EINTR 4)                         ; Interrupted system call
(defconstant EIO 5)                           ; I/O error
(defconstant ENXIO 6)                         ; No such device or address
(defconstant E2BIG 7)                         ; Arg list too long
(defconstant ENOEXEC 8)                       ; Exec format error
(defconstant EBADF 9)                         ; Bad file number
(defconstant ECHILD 10)                       ; No children
(defconstant EAGAIN 11)                       ; No more processes
(defconstant ENOMEM 12)                       ; Not enough core
(defconstant EACCES 13)                       ; Permission denied
(defconstant EFAULT 14)                       ; Bad address
(defconstant ENOTBLK 15)                      ; Block device required
(defconstant EBUSY 16)                        ; Mount device busy
(defconstant EEXIST 17)                       ; File exists
(defconstant EXDEV 18)                        ; Cross-device link
(defconstant ENODEV 19)                       ; No such device
(defconstant ENOTDIR 20)                      ; Not a directory
(defconstant EISDIR 21)                       ; Is a directory
(defconstant EINVAL 22)                       ; Invalid argument
(defconstant ENFILE 23)                       ; File table overflow
(defconstant EMFILE 24)                       ; Too many open files
(defconstant ENOTTY 25)                       ; Not a typewriter
(defconstant ETXTBSY 26)                      ; Text file busy
(defconstant EFBIG 27)                        ; File too large
(defconstant ENOSPC 28)                       ; No space left on device
(defconstant ESPIPE 29)                       ; Illegal seek
(defconstant EROFS 30)                        ; Read-only file system
(defconstant EMLINK 31)                       ; Too many links
(defconstant EPIPE 32)                        ; Broken pipe
; math software
(defconstant EDOM 33)                         ; Argument too large
(defconstant ERANGE 34)                       ; Result too large
; non-blocking and interrupt i/o
(defconstant EWOULDBLOCK 35)                  ; Operation would block
(defconstant EINPROGRESS 36)                  ; Operation now in progress
(defconstant EALREADY 37)                     ; Operation already in progress
; ipc/network software
; argument errors
(defconstant ENOTSOCK 38)                     ; Socket operation on non-socket
(defconstant EDESTADDRREQ 39)                 ; Destination address required
(defconstant EMSGSIZE 40)                     ; Message too long
(defconstant EPROTOTYPE 41)                   ; Protocol wrong type for socket
(defconstant ENOPROTOOPT 42)                  ; Protocol not available
(defconstant EPROTONOSUPPORT 43)              ; Protocol not supported
(defconstant ESOCKTNOSUPPORT 44)              ; Socket type not supported
(defconstant EOPNOTSUPP 45)                   ; Operation not supported on socket
(defconstant EPFNOSUPPORT 46)                 ; Protocol family not supported
(defconstant EAFNOSUPPORT 47)                 ; Address family not supported by protocol family
(defconstant EADDRINUSE 48)                   ; Address already in use
(defconstant EADDRNOTAVAIL 49)                ; Can't assign requested address
; operational errors
(defconstant ENETDOWN 50)                     ; Network is down
(defconstant ENETUNREACH 51)                  ; Network is unreachable
(defconstant ENETRESET 52)                    ; Network dropped connection on reset
(defconstant ECONNABORTED 53)                 ; Software caused connection abort
(defconstant ECONNRESET 54)                   ; Connection reset by peer
(defconstant ENOBUFS 55)                      ; No buffer space available
(defconstant EISCONN 56)                      ; Socket is already connected
(defconstant ENOTCONN 57)                     ; Socket is not connected
(defconstant ESHUTDOWN 58)                    ; Can't send after socket shutdown
(defconstant ETOOMANYREFS 59)                 ; Too many references: can't splice
(defconstant ETIMEDOUT 60)                    ; Connection timed out
(defconstant ECONNREFUSED 61)                 ; Connection refused
(defconstant ELOOP 62)                        ; Too many levels of symbolic links
(defconstant ENAMETOOLONG 63)                 ; File name too long
; should be rearranged
(defconstant EHOSTDOWN 64)                    ; Host is down
(defconstant EHOSTUNREACH 65)                 ; No route to host
; quotas & mush
(defconstant EPROCLIM 67)                     ; Too many processes
(defconstant EUSERS 68)                       ; Too many users
(defconstant EDQUOT 69)                       ; Disc quota exceeded

(defconstant DVI$_ACP_TCP 10)
(defconstant INET$C_IP 0)
(defconstant INET$C_ICMP 1)
(defconstant INET$C_IGMP 2)
(defconstant INET$C_GGP 3)
(defconstant INET$C_IPIP 4)
(defconstant INET$C_IPV4 4)
(defconstant INET$C_TCP 6)
(defconstant INET$C_EGP 8)
(defconstant INET$C_PUP 12)
(defconstant INET$C_UDP 17)
(defconstant INET$C_IDP 22)
(defconstant INET$C_TP 29)
(defconstant INET$C_RSVP 46)
(defconstant INET$C_IPV6 41)
(defconstant INET$C_ROUTING 43)
(defconstant INET$C_FRAG 44)
(defconstant INET$C_ESP 50)
(defconstant INET$C_AUTH 51)
(defconstant INET$C_ICMPV6 58)
(defconstant INET$C_NONEXTHDR 59)
(defconstant INET$C_DESTNODE 60)
(defconstant INET$C_EON 80)
(defconstant INET$C_AUXS 127)
(defconstant INET$C_REXEC 128)
(defconstant INET$C_RAW_IP 255)
(defconstant INET$C_MAX 256)
(defconstant IPPROTO$C_IP 0)
(defconstant IPPROTO$C_ICMP 1)
(defconstant IPPROTO$C_IGMP 2)
(defconstant IPPROTO$C_GGP 3)
(defconstant IPPROTO$C_IPIP 4)
(defconstant IPPROTO$C_IPV4 4)
(defconstant IPPROTO$C_TCP 6)
(defconstant IPPROTO$C_EGP 8)
(defconstant IPPROTO$C_PUP 12)
(defconstant IPPROTO$C_UDP 17)
(defconstant IPPROTO$C_IDP 22)
(defconstant IPPROTO$C_TP 29)
(defconstant IPPROTO$C_RSVP 46)
(defconstant IPPROTO$C_IPV6 41)
(defconstant IPPROTO$C_ROUTING 43)
(defconstant IPPROTO$C_FRAG 44)
(defconstant IPPROTO$C_ESP 50)
(defconstant IPPROTO$C_AUTH 51)
(defconstant IPPROTO$C_ICMPV6 58)
(defconstant IPPROTO$C_NONEXTHDR 59)
(defconstant IPPROTO$C_DESTNODE 60)
(defconstant IPPROTO$C_EON 80)
(defconstant IPPROTO$C_AUXS 127)
(defconstant IPPROTO$C_REXEC 128)
(defconstant IPPROTO$C_RAW_IP 255)
(defconstant IPPROTO$C_MAX 256)
(defconstant TCPIP$C_IP 0)
(defconstant TCPIP$C_ICMP 1)
(defconstant TCPIP$C_IGMP 2)
(defconstant TCPIP$C_GGP 3)
(defconstant TCPIP$C_IPIP 4)
(defconstant TCPIP$C_IPV4 4)
(defconstant TCPIP$C_TCP 6)
(defconstant TCPIP$C_EGP 8)
(defconstant TCPIP$C_PUP 12)
(defconstant TCPIP$C_UDP 17)
(defconstant TCPIP$C_IDP 22)
(defconstant TCPIP$C_TP 29)
(defconstant TCPIP$C_RSVP 46)
(defconstant TCPIP$C_IPV6 41)
(defconstant TCPIP$C_ROUTING 43)
(defconstant TCPIP$C_FRAG 44)
(defconstant TCPIP$C_ESP 50)
(defconstant TCPIP$C_AUTH 51)
(defconstant TCPIP$C_ICMPV6 58)
(defconstant TCPIP$C_NONEXTHDR 59)
(defconstant TCPIP$C_DESTNODE 60)
(defconstant TCPIP$C_EON 80)
(defconstant TCPIP$C_AUXS 127)
(defconstant TCPIP$C_REXEC 128)
(defconstant TCPIP$C_RAW_IP 255)
(defconstant TCPIP$C_MAX 256)
;
; Ports < IP_PROTO$C_RESERVED are reserved for
; privileged processes (e.g. root).
;
(defconstant IP_PROTO$C_RESERVED 1024)
(defconstant INET_PROTYP$C_STREAM 1)          ; stream type
(defconstant INET_PROTYP$C_DGRAM 2)           ; datagram type
(defconstant INET_PROTYP$C_RAW 3)             ; raw type
;
(defconstant TCPIP$C_STREAM 1)
(defconstant TCPIP$C_DGRAM 2)
(defconstant TCPIP$C_RAW 3)
(defconstant INET$C_IPOPT 0)                  ; IP opt type parameter
(defconstant INET$C_SOCKOPT 1)                ; setsockopt type parameter
(defconstant INET$C_IOCTL 2)                  ; ioctl type parameter
(defconstant INET$C_DATA 3)                   ; data
(defconstant INET$C_SOCK_NAME 4)              ; socket name
(defconstant INET$C_RESERVE_1 5)
(defconstant INET$C_TCPOPT 6)                 ; TCP option type
;
(defconstant INET$C_IPV6OPT 41)
(defconstant TCPIP$C_IPV6OPT 41)
(defconstant INET$C_ICMPV6OPT 58)
(defconstant TCPIP$C_ICMPV6OPT 58)
(defconstant TCPIP$C_IPOPT 0)
(defconstant TCPIP$C_SOCKOPT 1)
(defconstant TCPIP$C_TCPOPT 6)
(defconstant TCPIP$C_IOCTL 2)
(defconstant TCPIP$C_DATA 3)
(defconstant TCPIP$C_SOCK_NAME 4)
(defconstant INET$C_DSC_RCV 0)                ; discard received messages
(defconstant INET$C_DSC_SND 1)                ; discard sent messages
(defconstant INET$C_DSC_ALL 2)                ; discard all messages
(defconstant TCPIP$C_DSC_RCV 0)
(defconstant TCPIP$C_DSC_SND 1)
(defconstant TCPIP$C_DSC_ALL 2)
(defconstant TCPIP$C_SO_SNDBUF 4097)          ; #x1001 send buffer size
(defconstant TCPIP$C_SO_RCVBUF 4098)          ; #x1002 receive buffer size
(defconstant TCPIP$C_SO_SNDLOWAT 4099)        ; #x1003 send low-water mark
(defconstant TCPIP$C_SO_RCVLOWAT 4100)        ; #x1004 receive low-water mark
(defconstant TCPIP$C_SO_SNDTIMEO 4101)        ; #x1005 send timeout
(defconstant TCPIP$C_SO_RCVTIMEO 4102)        ; #x1006 receive timeout
(defconstant TCPIP$C_SO_ERROR 4103)           ; #x1007 get error status and clear
(defconstant TCPIP$C_SO_TYPE 4104)            ; #x1008 get socket type
(defconstant TCPIP$C_SO_SHARE 4105)           ; #x1009 ovms Share between processes
(defconstant TCPIP$C_SO_CCL 4106)             ; #x100a ovms Carriage Control socket
(defconstant TCPIP$C_SO_STATE 4107)           ; #x100b get socket state bits
(defconstant TCPIP$C_SO_FAMILY 4108)          ; #x100c get socket address family
(defconstant TCPIP$C_SO_XSE 4109)             ; #x100d _XOPEN_SOURCE_EXTENDED socket
(defconstant TCPIP$C_SO_NO_RCV_CHKSUM 16384)
(defconstant TCPIP$C_SO_NO_SND_CHKSUM 32768)
(defconstant TCPIP$C_SO_NO_CHKSUM 49152)
(defconstant INET$C_TCPOPT_EOL 0)
(defconstant INET$C_TCPOPT_NOP 1)
(defconstant INET$C_TCPOPT_MAXSEG 2)
(defconstant INET$C_TCP_NODELAY 1)            ; don't delay send to coalesce packets
(defconstant INET$C_TCP_MAXSEG 2)             ; set maximum segment size
(defconstant INET$C_TCP_PROBE_IDLE 128)       ; probe idle timer
(defconstant INET$C_TCP_DROP_IDLE 129)        ; drop idle timer
(defconstant TCPIP$C_TCPOPT_EOL 0)
(defconstant TCPIP$C_TCPOPT_NOP 1)
(defconstant TCPIP$C_TCPOPT_MAXSEG 2)
(defconstant TCPIP$C_TCP_NODELAY 1)
(defconstant TCPIP$C_TCP_MAXSEG 2)
(defconstant TCPIP$C_TCP_PROBE_IDLE 128)
(defconstant TCPIP$C_TCP_DROP_IDLE 129)
(defconstant INET$C_IP_TOS 3)
(defconstant INET$C_IP_TTL 4)
(defconstant INET$C_IP_MULTICAST_IF 16)       ; set/get IP multicast interface
(defconstant INET$C_IP_MULTICAST_TTL 17)      ; set/get IP multicast timetolive
(defconstant INET$C_IP_MULTICAST_LOOP 18)     ; set/get IP multicast loopback
(defconstant INET$C_IP_ADD_MEMBERSHIP 19)     ; add  an IP group membership
(defconstant INET$C_IP_DROP_MEMBERSHIP 20)    ; drop an IP group membership
(defconstant INET$C_IP_MULTICAST_VIF 21)      ; set/get IP mcast vir. interface
(defconstant TCPIP$C_IP_TOS 3)
(defconstant TCPIP$C_IP_TTL 4)
(defconstant TCPIP$C_IP_MULTICAST_IF 16)      ; set/get IP multicast interface
(defconstant TCPIP$C_IP_MULTICAST_TTL 17)     ; set/get IP multicast timetolive
(defconstant TCPIP$C_IP_MULTICAST_LOOP 18)    ; set/get IP multicast loopback
(defconstant TCPIP$C_IP_ADD_MEMBERSHIP 19)    ; add  an IP group membership
(defconstant TCPIP$C_IP_DROP_MEMBERSHIP 20)   ; drop an IP group membership
(defconstant TCPIP$C_IP_MULTICAST_VIF 21)     ; set/get IP mcast vir. interface
(defconstant INET$C_AF_UNSPEC 0)              ; unspecified
(defconstant INET$C_AF_UNIX 1)                ; local to host (pipes, portals)
(defconstant INET$C_AF_INET 2)                ; internetwork: UDP, TCP, etc.
(defconstant INET$C_AF_IMPLINK 3)             ; 3 arpanet imp addresses
(defconstant INET$C_AF_PUP 4)                 ; 4 pup protocols: e.g. BSP
(defconstant INET$C_AF_CHAOS 5)               ; 5 mit CHAOS protocols
(defconstant INET$C_AF_NS 6)                  ; 6 XEROX NS protocols
(defconstant INET$C_AF_ISO 7)                 ; 7 ISO protocols
(defconstant INET$C_AF_ECMA 8)                ; 8 european computer manufacturers
(defconstant INET$C_AF_DATAKIT 9)             ; 9 datakit protocols
(defconstant INET$C_AF_CCITT 10)              ; 10 CCITT protocols, X.25 etc
(defconstant INET$C_AF_SNA 11)                ; 11 IBM SNA
(defconstant INET$C_AF_DECnet 12)             ; 12 DECnet
(defconstant INET$C_AF_DLI 13)                ; 13 DEC Direct data link interface
(defconstant INET$C_AF_LAT 14)                ; 14 LAT
(defconstant INET$C_AF_HYLINK 15)             ; 15 NSC Hyperchannel
(defconstant INET$C_AF_APPLETALK 16)          ; 16 Apple Talk
(defconstant INET$C_AF_ROUTE 17)              ; 17 Internal Routing Protocol
(defconstant INET$C_AF_LINK 18)               ; 18 Link layer interface
(defconstant INET$C_pseudo_AF_XTP 19)         ; 19 eXpress Transfer Protocol (no AF)
(defconstant INET$C_AF_NETMAN 20)             ; 20 DNA Network Management
(defconstant INET$C_AF_X25 21)                ; 21 X25 protocol
(defconstant INET$C_AF_CTF 22)                ; 22 Common Trace Facility
(defconstant INET$C_AF_WAN 23)                ; 23 Wide Area Network protocols
(defconstant INET$C_AF_USER 24)               ; 24 Wild card (user defined) protocol
(defconstant INET$C_AF_LAST 25)               ; 25 Local Area System Transport protocol
(defconstant INET$C_AF_INET6 26)              ; 26 IPV6: UDP, TCP, etc.
(defconstant INET$C_AF_AAL 27)                ; 27 Native AAL ATM
(defconstant INET$C_AF_KEY 28)                ; 28 Key management
(defconstant INET$C_AF_UNUSED1 29)
(defconstant INET$C_AF_UNUSED2 30)
(defconstant INET$C_AF_UNUSED3 31)
(defconstant INET$C_AF_UNUSED4 32)
(defconstant INET$C_AF_UNUSED5 33)
(defconstant INET$C_AF_UNUSED6 34)
(defconstant INET$C_AF_MAX 35)                ; 35 maximum value
(defconstant INET$C_INADDR_ANY 0)
(defconstant INET$C_INADDR_BROADCAST -1)

(defconstant TCPIP$C_AF_UNSPEC 0)
(defconstant TCPIP$C_AF_UNIX 1)
(defconstant TCPIP$C_AF_INET 2)
(defconstant TCPIP$C_AF_INET6 26)
(defconstant TCPIP$C_AF_MAX 35)
(defconstant TCPIP$C_INADDR_ANY 0)
(defconstant TCPIP$C_INADDR_BROADCAST -1)

(defconstant INET$M_MSG_OOB #x1)
(defconstant INET$M_MSG_PEEK #x2)
(defconstant INET$M_MSG_DONTROUTE #x4)
(defconstant INET$M_DUMMYN_4 #x8)
(defconstant INET$M_DUMMYN_5 #x10)
(defconstant INET$M_MSG_PURGE #x20)
(defconstant INET$M_MSG_NBIO #x40)
(defconstant INET$M_MSG_BLOCKALL #x80)

;; struct MSGBITS {
;;     struct  {
;; ;
;;         unsigned INET$V_MSG_OOB : 1;    ; turn on event logging, not used
;;         unsigned INET$V_MSG_PEEK : 1;   ; socket has had LISTEN
;;         unsigned INET$V_MSG_DONTROUTE : 1; ; use only the interface addr
;; ;
;;         unsigned INET$V_DUMMYN_4 : 1;   ; reserve space
;; ;
;;         unsigned INET$V_DUMMYN_5 : 1;   ; reserve space
;; ;
;;         unsigned INET$V_MSG_PURGE : 1;  ; Purge I/O
;;         unsigned INET$V_MSG_NBIO : 1;   ; NON-block I/O
;;         unsigned INET$V_MSG_BLOCKALL : 1; ; record TCP I/O
;;         } INET$R_MSG_BITS;
;;     } ;

(defconstant INET$C_MSG_OOB 1)                ; process out-of-band data
(defconstant INET$C_MSG_PEEK 2)               ; peek at incoming message
(defconstant INET$C_MSG_DONTROUTE 4)          ; send without
; using routing tables
(defconstant INET$C_MSG_PURGE 32)             ; block read until fill buffer
(defconstant INET$C_MSG_NBIO 64)              ; block read until fill buffer
(defconstant INET$C_MSG_BLOCKALL 128)         ; block read until fill buffer
(defconstant INET$C_MSG_MAXIOVLEN 16)
;
(defconstant TCPIP$C_MSG_OOB 1)               ; process out-of-band data
(defconstant TCPIP$C_MSG_PEEK 2)              ; peek at incoming message
(defconstant TCPIP$C_MSG_DONTROUTE 4)         ; send without
; using routing tables
(defconstant TCPIP$C_MSG_PURGE 32)            ; block read until fill buffer
(defconstant TCPIP$C_MSG_NBIO 64)             ; block read until fill buffer
(defconstant TCPIP$C_MSG_BLOCKALL 128)        ; block read until fill buffer
(defconstant TCPIP$C_MSG_MAXIOVLEN 16)
(defconstant TCPIP$M_MSG_OOB #x1)
(defconstant TCPIP$M_MSG_PEEK #x2)
(defconstant TCPIP$M_MSG_DONTROUTE #x4)
(defconstant TCPIP$M_DUMMYX_4 #x8)
(defconstant TCPIP$M_DUMMYX_5 #x10)
(defconstant TCPIP$M_MSG_PURGE #x20)
(defconstant TCPIP$M_MSG_NBIO #x40)
(defconstant TCPIP$M_MSG_BLOCKALL #x80)

;; struct MSGBITS_1 {
;;     struct  {
;; ;
;;         unsigned TCPIP$V_MSG_OOB : 1;   ; turn on event logging, not used
;;         unsigned TCPIP$V_MSG_PEEK : 1;  ; socket has had LISTEN
;;         unsigned TCPIP$V_MSG_DONTROUTE : 1; ; use only the interface addr
;; ;
;;         unsigned TCPIP$V_DUMMYX_4 : 1;  ; reserve space
;; ;
;;         unsigned TCPIP$V_DUMMYX_5 : 1;  ; reserve space
;; ;
;;         unsigned TCPIP$V_MSG_PURGE : 1; ; Purge I/O
;;         unsigned TCPIP$V_MSG_NBIO : 1;  ; NON-block I/O
;;         unsigned TCPIP$V_MSG_BLOCKALL : 1; ; record TCP I/O
;;         } TCPIP$R_MSG_BITS;
;;     } ;

(defconstant OPT$L_ADDRESS 4)
(defconstant OPT$C_SET_LENGTH 8)
(defconstant OPT$K_SET_LENGTH 8)
(defconstant OPT$C_GET_LENGTH 12)
(defconstant OPT$K_GET_LENGTH 12)

;; struct OPTDEF {
;;     unsigned short int OPT$W_LENGTH;    ; length
;;     unsigned short int OPT$W_NAME;      ; name
;;     int *OPT$L_ADDR;                    ; address
;;     int *OPT$L_RET_LENGTH;              ; address
;;     } ;

;
; We distinguish between routes to hosts and routes to networks,
; preferring the former if available.  For each route we infer
; the interface to use from the gateway address supplied when
; the route was entered.  Routes that forward packets through
; gateways are marked so that the output routines know to address the
; gateway rather than the ultimate destination.
;
(defconstant ORT$M_RTF_UP #x1)
(defconstant ORT$M_RTF_GATEWAY #x2)
(defconstant ORT$M_RTF_HOST #x4)
(defconstant ORT$M_RTF_DYNAMIC #x8)
(defconstant ORT$M_RTF_MODIFIED #x10)
(defconstant ORT$C_LENGTH 48)
(defconstant ORT$K_LENGTH 48)

;; struct ORTENTRYDEF {
;;     unsigned int ORT$L_HASH;            ; Hash link
;;     union  {
;;         struct  {
;;             unsigned short int ORT$W_DST_SIN_FAMILY; ; Address type
;;             unsigned short int ORT$W_DST_SIN_PORT; ; Port number
;;             unsigned int ORT$L_DST_SIN_ADDR; ; Internet address
;;             char ORT$T_DST_SIN_ZERO [8]; ; Unused space
;;             } ORT$R_DST_FIELDS;
;;         char ORT$T_DST [16];            ; Destination SOCKADDR structure
;;         } ORT$R_DST_OVRLY;
;;     union  {
;;         struct  {
;;             unsigned short int ORT$W_GATEWAY_SIN_FAMILY; ; Address type
;;             unsigned short int ORT$W_GATEWAY_SIN_PORT; ; Port number
;;             unsigned int ORT$L_GATEWAY_SIN_ADDR; ; Internet address
;;             char ORT$T_GATEWAY_SIN_ZERO [8]; ; Unused space
;;             } ORT$R_GATEWAY_FIELDS;
;;         char ORT$T_GATEWAY [16];        ; Gateway SOCKADDR structure
;;         } ORT$R_GATEWAY_OVRLY;
;;     union  {
;;         unsigned short int ORT$W_FLAGS; ; up/down?, host/net
;;         struct  {
;;             unsigned ORT$V_RTF_UP : 1;  ; route useable
;;             unsigned ORT$V_RTF_GATEWAY : 1; ; destination is a gateway
;;             unsigned ORT$V_RTF_HOST : 1; ; host entry (net otherwise)
;;             unsigned ORT$V_RTF_DYNAMIC : 1; ; created dynamically (by redirect)
;;             unsigned ORT$V_RTF_MODIFIED : 1; ; changed by redirect
;;             unsigned ORT$V_FILL_2 : 3;
;;             } ORT$R_FLAGS_BITS;
;;         } ORT$R_FLAGS_OVRLY;
;;     unsigned short int ORT$W_REFCNT;    ; # held references
;;     unsigned int ORT$L_USE;             ; raw # packets forwarded
;;     unsigned int ORT$L_IFP;             ; pointer to the IFNET interface to use
;;     } ;

;
; Only defined here for backward compatibility
;
(defconstant FIONREAD 1074030207)             ; Get # bytes to read
(defconstant OFIONREAD -2147195265)           ; Get # bytes to read
(defconstant FIONBIO -2147195266)             ; non block I/O
(defconstant FIOASYNC -2147195267)            ; asynch I/O
(defconstant SIOCSHIWAT -2147192064)          ; high water mark
(defconstant SIOCGHIWAT 1074033409)           ; high water mark
(defconstant SIOCSLOWAT -2147192062)          ; low water mark
(defconstant SIOCGLOWAT 1074033411)           ; low water mark
(defconstant SIOCATMARK 1074033415)           ; at OOB mark
(defconstant SIOCSPGRP -2147192056)           ; Process group
(defconstant SIOCGPGRP 1074033417)            ; Process group
(defconstant SIOCADDRT -2144308726)           ; add RT
(defconstant SIOCDELRT -2144308725)           ; delete RT
(defconstant SIOCGETRT -1070566869)           ; get RT
(defconstant SIOCSIFADDR -2145359604)         ; set IF address
(defconstant SIOCGIFADDR -1071617779)         ; Get IF address
(defconstant SIOCSIFDSTADDR -2145359602)      ; Destination addr
(defconstant SIOCGIFDSTADDR -1071617777)      ; BDestination addr
(defconstant SIOCSIFFLAGS -2145359600)        ; IF flags
(defconstant SIOCGIFFLAGS -1071617775)        ; IF flags
(defconstant SIOCGIFBRDADDR -1071617774)      ; Broadcast addr
(defconstant SIOCSIFBRDADDR -2145359597)      ; Broadcats addr
(defconstant SIOCGIFCONF -1073190636)         ; IF configuration
(defconstant SIOCGIFNETMASK -1071617771)      ; Network mask
(defconstant SIOCSIFNETMASK -2145359594)      ; Network mask
(defconstant SIOCSARP -2145097442)            ; set ARP
(defconstant SIOCGARP -1071355617)            ; get ARP
(defconstant SIOCDARP -2145097440)            ; delete ARP
(defconstant SIOCARPREQ -1071355608)          ; ARP request
(defconstant SIOCENABLBACK -2145359583)       ; enable loopback
(defconstant SIOCDISABLBACK -2145359582)      ; disable loopback
(defconstant SIOCSTATE -1072273117)           ; state
(defconstant I_STR 536892168)

;
; Socket options data structure.
;
(defconstant TCPIP$W_OPTIONS 0)
(defconstant INET$W_OPTIONS 0)
(defconstant SOCKOPT$M_SO_DEBUG #x1)
(defconstant SOCKOPT$M_ACCEPTCONN #x2)
(defconstant SOCKOPT$M_REUSEADDR #x4)
(defconstant SOCKOPT$M_KEEPALIVE #x8)
(defconstant SOCKOPT$M_DONTROUTE #x10)
(defconstant SOCKOPT$M_BROADCAST #x20)
(defconstant SOCKOPT$M_USELOOPBACK #x40)
(defconstant SOCKOPT$M_LINGER #x80)
(defconstant SOCKOPT$M_OOBINLINE #x100)
(defconstant SOCKOPT$M_DUMMYB_2 #x200)
(defconstant SOCKOPT$M_DUMMYB_3 #x400)
(defconstant SOCKOPT$M_DUMMYB_4 #x800)
(defconstant SOCKOPT$M_DUMMYB_5 #x1000)
(defconstant SOCKOPT$M_FULL_DUPLEX_CLOSE #x2000)
(defconstant SOCKOPT$M_NO_RCV_CHKSUM #x4000)
(defconstant SOCKOPT$M_NO_SND_CHKSUM #x8000)
(defconstant SOCKOPT$M_NO_CHKSUM 49152)       ; no checksum calculation
(defconstant SOCKOPT$C_NO_CHKSUM 49152)       ; no checksum calculation
(defconstant TCPIP$M_SO_DEBUG #x1)
(defconstant TCPIP$M_ACCEPTCONN #x2)
(defconstant TCPIP$M_REUSEADDR #x4)
(defconstant TCPIP$M_KEEPALIVE #x8)
(defconstant TCPIP$M_DONTROUTE #x10)
(defconstant TCPIP$M_BROADCAST #x20)
(defconstant TCPIP$M_USELOOPBACK #x40)
(defconstant TCPIP$M_LINGER #x80)
(defconstant TCPIP$M_OOBINLINE #x100)
(defconstant TCPIP$M_DUMMYB_2 #x200)
(defconstant TCPIP$M_DUMMYB_3 #x400)
(defconstant TCPIP$M_DUMMYB_4 #x800)
(defconstant TCPIP$M_DUMMYB_5 #x1000)
(defconstant TCPIP$M_FULL_DUPLEX_CLOSE #x2000)
(defconstant TCPIP$M_NO_RCV_CHKSUM #x4000)
(defconstant TCPIP$M_NO_SND_CHKSUM #x8000)
(defconstant TCPIP$M_NO_CHKSUM 49152)         ; no checksum calculation
(defconstant TCPIP$C_NO_CHKSUM 49152)         ; no checksum calculation
(defconstant INET$M_SO_DEBUG #x1)
(defconstant INET$M_ACCEPTCONN #x2)
(defconstant INET$M_REUSEADDR #x4)
(defconstant INET$M_KEEPALIVE #x8)
(defconstant INET$M_DONTROUTE #x10)
(defconstant INET$M_BROADCAST #x20)
(defconstant INET$M_USELOOPBACK #x40)
(defconstant INET$M_LINGER #x80)
(defconstant INET$M_OOBINLINE #x100)
(defconstant INET$M_DUMMYB_2 #x200)
(defconstant INET$M_DUMMYB_3 #x400)
(defconstant INET$M_DUMMYB_4 #x800)
(defconstant INET$M_DUMMYB_5 #x1000)
(defconstant INET$M_FULL_DUPLEX_CLOSE #x2000)
(defconstant INET$M_NO_RCV_CHKSUM #x4000)
(defconstant INET$M_NO_SND_CHKSUM #x8000)
(defconstant INET$M_NO_CHKSUM 49152)          ; no checksum calculation
(defconstant INET$C_NO_CHKSUM 49152)          ; no checksum calculation
(defconstant SOCKOPT$C_SNDBUF 4097)           ; send buffer size
(defconstant SOCKOPT$C_RCVBUF 4098)           ; receive buffer size
(defconstant SOCKOPT$C_SNDLOWAT 4099)         ; send low-water mark
(defconstant SOCKOPT$C_RCVLOWAT 4100)         ; receive low-water mark
(defconstant SOCKOPT$C_SNDTIMEO 4101)         ; send timeout
(defconstant SOCKOPT$C_RCVTIMEO 4102)         ; receive timeout
(defconstant SOCKOPT$C_ERROR 4103)            ; get error status and clear
(defconstant SOCKOPT$C_TYPE 4104)             ; get socket type
(defconstant SOCKOPT$C_SHARE 4105)            ; shared between processes
(defconstant SOCKOPT$C_CCL 4106)              ; carriage control added
(defconstant SOCKOPT$C_STATE 4107)            ; get socket state bits
(defconstant SOCKOPT$C_FAMILY 4108)           ; get socket address family
(defconstant SOCKOPT$C_XSE 4109)              ; _XOPEN_SOURCE_EXTENDED socket
(defconstant SOCKOPT$M_SNDBUF 4097)           ; send buffer size
(defconstant SOCKOPT$M_RCVBUF 4098)           ; receive buffer size
(defconstant SOCKOPT$M_SNDLOWAT 4099)         ; send low-water mark
(defconstant SOCKOPT$M_RCVLOWAT 4100)         ; receive low-water mark
(defconstant SOCKOPT$M_SNDTIMEO 4101)         ; send timeout
(defconstant SOCKOPT$M_RCVTIMEO 4102)         ; receive timeout
(defconstant SOCKOPT$M_ERROR 4103)            ; get error status and clear
(defconstant SOCKOPT$M_TYPE 4104)             ; get socket type
(defconstant SOCKOPT$M_STATE 4105)            ; get socket state bits
(defconstant SOCKOPT$M_FAMILY 4106)           ; get socket address family
(defconstant SOCKOPT$M_XSE 4107)              ; _XOPEN_SOURCE_EXTENDED socket
(defconstant SOCKOPT$M_SHARE 4105)            ; shared between processes
(defconstant SOCKOPT$M_CCL 4106)              ; carriage control added
(defconstant TCPIP$C_SNDBUF 4097)             ; send buffer size
(defconstant TCPIP$C_RCVBUF 4098)             ; receive buffer size
(defconstant TCPIP$C_SNDLOWAT 4099)           ; send low-water mark
(defconstant TCPIP$C_RCVLOWAT 4100)           ; receive low-water mark
(defconstant TCPIP$C_SNDTIMEO 4101)           ; send timeout
(defconstant TCPIP$C_RCVTIMEO 4102)           ; receive timeout
(defconstant TCPIP$C_ERROR 4103)              ; get error status and clear
(defconstant TCPIP$C_TYPE 4104)               ; get socket type
(defconstant TCPIP$C_SHARE 4105)              ; shared between processes
(defconstant TCPIP$C_CCL 4106)                ; carriage control added
(defconstant TCPIP$C_STATE 4107)              ; get socket state bits
(defconstant TCPIP$C_FAMILY 4108)             ; get socket address family
(defconstant TCPIP$C_XSE 4109)                ; _XOPEN_SOURCE_EXTENDED socket
(defconstant TCPIP$M_SNDBUF 4097)             ; send buffer size
(defconstant TCPIP$M_RCVBUF 4098)             ; receive buffer size
(defconstant TCPIP$M_SNDLOWAT 4099)           ; send low-water mark
(defconstant TCPIP$M_RCVLOWAT 4100)           ; receive low-water mark
(defconstant TCPIP$M_SNDTIMEO 4101)           ; send timeout
(defconstant TCPIP$M_RCVTIMEO 4102)           ; receive timeout
(defconstant TCPIP$M_ERROR 4103)              ; get error status and clear
(defconstant TCPIP$M_TYPE 4104)               ; get socket type
(defconstant TCPIP$M_SHARE 4105)              ; shared between processes
(defconstant TCPIP$M_CCL 4106)                ; carriage control added
(defconstant TCPIP$M_STATE 4107)              ; get socket state bits
(defconstant TCPIP$M_FAMILY 4108)             ; get socket address family
(defconstant TCPIP$M_XSE 4109)                ; _XOPEN_SOURCE_EXTENDED socket
(defconstant INET$C_SNDBUF 4097)              ; send buffer size
(defconstant INET$C_RCVBUF 4098)              ; receive buffer size
(defconstant INET$C_SNDLOWAT 4099)            ; send low-water mark
(defconstant INET$C_RCVLOWAT 4100)            ; receive low-water mark
(defconstant INET$C_SNDTIMEO 4101)            ; send timeout
(defconstant INET$C_RCVTIMEO 4102)            ; receive timeout
(defconstant INET$C_ERROR 4103)               ; get error status and clear
(defconstant INET$C_TYPE 4104)                ; get socket type
(defconstant INET$C_SHARE 4105)               ; shared between processes
(defconstant INET$C_CCL 4106)                 ; carriage control added
(defconstant INET$C_STATE 4107)               ; get socket state bits
(defconstant INET$C_FAMILY 4108)              ; get socket address family
(defconstant INET$C_XSE 4109)                 ; _XOPEN_SOURCE_EXTENDED socket
(defconstant INET$M_SNDBUF 4097)              ; send buffer size
(defconstant INET$M_RCVBUF 4098)              ; receive buffer size
(defconstant INET$M_SNDLOWAT 4099)            ; send low-water mark
(defconstant INET$M_RCVLOWAT 4100)            ; receive low-water mark
(defconstant INET$M_SNDTIMEO 4101)            ; send timeout
(defconstant INET$M_RCVTIMEO 4102)            ; receive timeout
(defconstant INET$M_ERROR 4103)               ; get error status and clear
(defconstant INET$M_TYPE 4104)                ; get socket type
(defconstant INET$M_SHARE 4105)               ; shared between processes
(defconstant INET$M_CCL 4106)                 ; carriage control added
(defconstant INET$M_STATE 4107)               ; get socket state bits
(defconstant INET$M_FAMILY 4108)              ; get socket address family
(defconstant INET$M_XSE 4109)                 ; _XOPEN_SOURCE_EXTENDED socket
(defconstant SOCKOPT$C_SO_DEBUG 1)            ; turn on event logging, not used
(defconstant SOCKOPT$C_ACCEPTCONN 2)          ; socket has had LISTEN
(defconstant SOCKOPT$C_REUSEADDR 4)           ; allow local address reuse
(defconstant SOCKOPT$C_KEEPALIVE 8)           ; keep connection alive
(defconstant SOCKOPT$C_DONTROUTE 16)          ; use only the interface addr
(defconstant SOCKOPT$C_BROADCAST 32)          ; allow broadcasting
(defconstant SOCKOPT$C_USELOOPBACK 64)        ; loopback interface, not used
(defconstant SOCKOPT$C_LINGER 128)            ; linger at close
(defconstant SOCKOPT$C_OOBINLINE 256)         ; leave received OOB data in line
(defconstant SOCKOPT$C_FULL_DUPLEX_CLOSE 8192) ; full duplex close
(defconstant SOCKOPT$C_NO_RCV_CHKSUM 16384)   ; no receive checksum calculation
(defconstant SOCKOPT$C_NO_SND_CHKSUM 32768)   ; no send checksum calculation
(defconstant TCPIP$C_SO_DEBUG 1)              ; turn on event logging, not used
(defconstant TCPIP$C_ACCEPTCONN 2)            ; socket has had LISTEN
(defconstant TCPIP$C_REUSEADDR 4)             ; allow local address reuse
(defconstant TCPIP$C_KEEPALIVE 8)             ; keep connection alive
(defconstant TCPIP$C_DONTROUTE 16)            ; use only the interface addr
(defconstant TCPIP$C_BROADCAST 32)            ; allow broadcasting
(defconstant TCPIP$C_USELOOPBACK 64)          ; loopback interface, not used
(defconstant TCPIP$C_LINGER 128)              ; linger at close
(defconstant TCPIP$C_OOBINLINE 256)           ; leave received OOB data in line
(defconstant TCPIP$C_FULL_DUPLEX_CLOSE 8192)  ; full duplex close
(defconstant TCPIP$C_NO_RCV_CHKSUM 16384)     ; no receive checksum calculation
(defconstant TCPIP$C_NO_SND_CHKSUM 32768)     ; no send checksum calculation
(defconstant INET$C_SO_DEBUG 1)               ; turn on event logging, not used
(defconstant INET$C_ACCEPTCONN 2)             ; socket has had LISTEN
(defconstant INET$C_REUSEADDR 4)              ; allow local address reuse
(defconstant INET$C_KEEPALIVE 8)              ; keep connection alive
(defconstant INET$C_DONTROUTE 16)             ; use only the interface addr
(defconstant INET$C_BROADCAST 32)             ; allow broadcasting
(defconstant INET$C_USELOOPBACK 64)           ; loopback interface, not used
(defconstant INET$C_LINGER 128)               ; linger at close
(defconstant INET$C_OOBINLINE 256)            ; leave received OOB data in line
(defconstant INET$C_FULL_DUPLEX_CLOSE 8192)   ; full duplex close
(defconstant INET$C_NO_RCV_CHKSUM 16384)      ; no receive checksum calculation
(defconstant INET$C_NO_SND_CHKSUM 32768)      ; no send checksum calculation
(defconstant SOCKOPT$C_LENGTH 2)
(defconstant SOCKOPT$K_LENGTH 2)
(defconstant INET$C_LENGTH 2)
(defconstant INET$K_LENGTH 2)

;; struct SOCKETOPTDEF {
;;     union  {                            ;
;;         unsigned short int SOCKOPT$W_OPTIONS; ; Socket options, see socket.h
;;         union  {
;;             struct  {
;; ;
;; ; Socket options bits.
;; ;
;;                 unsigned SOCKOPT$V_SO_DEBUG : 1; ; turn on event logging, not used
;;                 unsigned SOCKOPT$V_ACCEPTCONN : 1; ; socket has had LISTEN
;;                 unsigned SOCKOPT$V_REUSEADDR : 1; ; allow local address reuse
;;                 unsigned SOCKOPT$V_KEEPALIVE : 1; ; keep connection alive
;;                 unsigned SOCKOPT$V_DONTROUTE : 1; ; use only the interface addr
;;                 unsigned SOCKOPT$V_BROADCAST : 1; ; allow broadcasting
;;                 unsigned SOCKOPT$V_USELOOPBACK : 1; ; loopback interface, not used
;;                 unsigned SOCKOPT$V_LINGER : 1; ; linger at close
;;                 unsigned SOCKOPT$V_OOBINLINE : 1; ; leave received OOB data in line
;; ;
;; ;
;;                 unsigned SOCKOPT$V_DUMMYB_2 : 1; ; reserve space
;;                 unsigned SOCKOPT$V_DUMMYB_3 : 1; ; reserve space
;;                 unsigned SOCKOPT$V_DUMMYB_4 : 1; ; reserve space
;;                 unsigned SOCKOPT$V_DUMMYB_5 : 1; ; reserve space
;; ;
;;                 unsigned SOCKOPT$V_FULL_DUPLEX_CLOSE : 1; ; full duplex close
;;                 unsigned SOCKOPT$V_NO_RCV_CHKSUM : 1; ; no receive checksum calculation
;;                 unsigned SOCKOPT$V_NO_SND_CHKSUM : 1; ; no send checksum calculation
;;                 } SOCKOPT$R_SOCKOPT_OPT_BITS;
;;             struct  {
;; ;
;; ; Socket options bits.
;; ;
;;                 unsigned TCPIP$V_SO_DEBUG : 1; ; turn on event logging, not used
;;                 unsigned TCPIP$V_ACCEPTCONN : 1; ; socket has had LISTEN
;;                 unsigned TCPIP$V_REUSEADDR : 1; ; allow local address reuse
;;                 unsigned TCPIP$V_KEEPALIVE : 1; ; keep connection alive
;;                 unsigned TCPIP$V_DONTROUTE : 1; ; use only the interface addr
;;                 unsigned TCPIP$V_BROADCAST : 1; ; allow broadcasting
;;                 unsigned TCPIP$V_USELOOPBACK : 1; ; loopback interface, not used
;;                 unsigned TCPIP$V_LINGER : 1; ; linger at close
;;                 unsigned TCPIP$V_OOBINLINE : 1; ; leave received OOB data in line
;; ;
;; ;
;;                 unsigned TCPIP$V_DUMMYB_2 : 1; ; reserve space
;;                 unsigned TCPIP$V_DUMMYB_3 : 1; ; reserve space
;;                 unsigned TCPIP$V_DUMMYB_4 : 1; ; reserve space
;;                 unsigned TCPIP$V_DUMMYB_5 : 1; ; reserve space
;; ;
;;                 unsigned TCPIP$V_FULL_DUPLEX_CLOSE : 1; ; full duplex close
;;                 unsigned TCPIP$V_NO_RCV_CHKSUM : 1; ; no receive checksum calculation
;;                 unsigned TCPIP$V_NO_SND_CHKSUM : 1; ; no send checksum calculation
;;                 } SOCKOPT$R_TCPIP_OPT_BITS;
;;             struct  {
;; ;
;; ; Socket options bits.
;; ;
;;                 unsigned INET$V_SO_DEBUG : 1; ; turn on event logging, not used
;;                 unsigned INET$V_ACCEPTCONN : 1; ; socket has had LISTEN
;;                 unsigned INET$V_REUSEADDR : 1; ; allow local address reuse
;;                 unsigned INET$V_KEEPALIVE : 1; ; keep connection alive
;;                 unsigned INET$V_DONTROUTE : 1; ; use only the interface addr
;;                 unsigned INET$V_BROADCAST : 1; ; allow broadcasting
;;                 unsigned INET$V_USELOOPBACK : 1; ; loopback interface, not used
;;                 unsigned INET$V_LINGER : 1; ; linger at close
;;                 unsigned INET$V_OOBINLINE : 1; ; leave received OOB data in line
;; ;
;; ;
;;                 unsigned INET$V_DUMMYB_2 : 1; ; reserve space
;;                 unsigned INET$V_DUMMYB_3 : 1; ; reserve space
;;                 unsigned INET$V_DUMMYB_4 : 1; ; reserve space
;;                 unsigned INET$V_DUMMYB_5 : 1; ; reserve space
;; ;
;;                 unsigned INET$V_FULL_DUPLEX_CLOSE : 1; ; full duplex close
;;                 unsigned INET$V_NO_RCV_CHKSUM : 1; ; no receive checksum calculation
;;                 unsigned INET$V_NO_SND_CHKSUM : 1; ; no send checksum calculation
;;                 } SOCKOPT$R_INET_OPT_BITS;
;;             } SOCKOPT$R_OPTIONS_UNION;
;;         } SOCKOPT$R_OPT_OVRLY;
;;
;; ;
;; ; Additional options, not kept in so_options.
;; ;
;;     } ;

(defconstant AF_UNSPEC 0)                     ; unspecified socket family
(defconstant AF_INET 2)                       ; INET socket family
(defconstant SA$C_LENGTH 16)
(defconstant SA$K_LENGTH 16)

;; struct SOCKADDR {
;;     union  {
;;         unsigned short int SA$W_FAMILY; ; address family
;;         struct  {
;;             unsigned char SA$B_LEN;
;;             unsigned char SA$B_FAMILY;
;;             } SA$R_SA_STRUCT;
;;         } SA$R_SA_UNION;
;;     char SA$T_DATA [14];                ; up to 14 bytes of address
;;     } ;

(defconstant SIN$C_LENGTH 16)
(defconstant SIN$K_LENGTH 16)

;; typedef struct _SOCKADDRIN {
;;     unsigned short int SIN$W_FAMILY;    ; address family
;;     unsigned short int SIN$W_PORT;      ; 2 bytes specifying a port
;;     unsigned int SIN$L_ADDR;            ; 4 bytes specifying an IP address
;;     char SIN$T_ZERO [8];                ; 8 bytes
;;     } SOCKADDRIN;

(defconstant SIN44$C_LENGTH 16)
(defconstant SIN44$K_LENGTH 16)

;; typedef struct _SOCKADDRIN44 {
;;     unsigned char SIN44$B_LEN;
;;     unsigned char SIN44$B_FAMILY;
;;     unsigned short int SIN44$W_PORT;    ; 2 bytes specifying a port
;;     unsigned int SIN44$L_ADDR;          ; 4 bytes specifying an IP address
;;     char SIN44$T_ZERO [8];              ; 8 bytes
;;     } SOCKADDRIN44;

(defconstant SIN6$K_LENGTH 24)                ; Structure size
(defconstant SIN6$C_LENGTH 24)                ; Structure size

;; typedef struct _SOCKADDRIN6 {
;;     unsigned char SIN6$B_LEN;           ; length of this struct
;;     unsigned char SIN6$B_FAMILY;        ; AF_INET6
;;     unsigned short int SIN6$W_PORT;     ; Transport layer port #
;;     unsigned int SIN6$L_FLOWLABEL;      ; IPv6 flow information
;;     union  {
;;         char SIN6$T_ADDR [16];
;;         unsigned char SIN6$B_SA6_ADDR [16];
;;         unsigned short int SIN6$W_SA6_WADDR [8];
;;         unsigned int SIN6$L_SA6_LADDR [4];
;;         unsigned int SIN6$Q_SA6_QADDR [2] [2];
;;         } SIN6$R_ADDR_OVERLAY;
;;     } SOCKADDRIN6;

; Define ACP HOST/NET data base subroutine calls subfunction codes
;

(defconstant INETACP$C_ALIASES 1)             ; aliases
(defconstant INETACP$C_TRANS 2)               ; translate ASCII string in binary
(defconstant INETACP$C_HOSTENT 3)             ; get back a HOSTENT
(defconstant INETACP$C_NETENT 4)              ; get back a NETENT
(defconstant INETACP$C_HOSTENT_OFFSET 5)      ; get back a HOSTENT
(defconstant INETACP$C_NETENT_OFFSET 6)       ; get back a NETENT
(defconstant INETACPC$C_ALIASES 1)            ; aliases
(defconstant INETACPC$C_TRANS 2)              ; translate ASCII string in binary
(defconstant INETACPC$C_HOSTENT 3)            ; get back a HOSTENT
(defconstant INETACPC$C_NETENT 4)             ; get back a NETENT
(defconstant INETACPC$C_HOSTENT_OFFSET 5)     ; get back a HOSTENT
(defconstant INETACPC$C_NETENT_OFFSET 6)      ; get back a NETENT

; Define ACP control subfunction codes
;

(defconstant INETACP_FUNC$C_GETHOSTBYNAME 1)  ; Subroutine call of GET_HOST_BY_NAME
(defconstant INETACP_FUNC$C_GETHOSTBYADDR 2)  ; Subroutine call of GET_HOST_BY_ADDR
(defconstant INETACP_FUNC$C_GETNETBYNAME 3)   ; Subroutine call of GET_NET_BY_NAME
(defconstant INETACP_FUNC$C_GETNETBYADDR 4)   ; Subroutine call of GET_NET_BY_ADDR

(defconstant NET$C_LENGTH 16)                 ;
(defconstant NET$K_LENGTH 16)                 ;

;; struct NETENTDEF {
;;     int *NET$L_N_NAME;                  ; pointer to the network name
;;     int *NET$L_N_ALIASES;               ; pointer to array of pointers to aliases
;;     unsigned int NET$L_N_ADDRTYPE;      ; Network address type
;;     unsigned int NET$L_N_NET;           ; Network address
;;     } ;

;
; Structures returned by network
; data base library.  All addresses
; are supplied in host order, and
; returned in network order (suitable
; for use in system calls).
;

(defconstant HOST$L_H_ADDR 16)
(defconstant HOST$C_LENGTH 20)
(defconstant HOST$K_LENGTH 20)

;; struct HOSTENTDEF {
;;     int *HOST$L_H_NAME;                 ; pointer to the host name
;;     int *HOST$L_H_ALIASES;              ; pointer to array of pointers to aliases
;;     unsigned int HOST$L_H_ADDRTYPE;     ; Host address type
;;     unsigned int HOST$L_H_LENGTH;       ; Length of address
;;     int *HOST$L_H_ADDR_LIST;            ; Pointer to array of pointers to addresses
;;     } ;
