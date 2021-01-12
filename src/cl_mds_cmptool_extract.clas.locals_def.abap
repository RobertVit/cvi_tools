*"* use this source file for any type declarations (class
*"* definitions, interfaces or data types) you need for method
*"* implementation or private method's signature

TYPE-POOLS: szadr.

*      Address of Vendor
TYPES: BEGIN OF gsy_lfa1_addr1,
         lifnr          TYPE lifnr,
         addr1_complete TYPE szadr_addr1_complete,
       END OF gsy_lfa1_addr1.

* Address of customer
TYPES:
  BEGIN OF gsy_kna1_addr1,
    kunnr          TYPE kunnr,
    addr1_complete TYPE szadr_addr1_complete,
  END   OF gsy_kna1_addr1.

* Addresses of contact person
TYPES:
  BEGIN OF gsy_knvk_addr,
    parnr          TYPE parnr,
    kunnr          TYPE kunnr,
    addr1_complete TYPE szadr_addr1_complete,
    addr2_complete TYPE szadr_addr2_complete,
    addr3_complete TYPE szadr_addr3_complete,
  END   OF gsy_knvk_addr.
