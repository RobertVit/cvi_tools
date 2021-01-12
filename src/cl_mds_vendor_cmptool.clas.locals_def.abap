*"* use this source file for any type declarations (class
*"* definitions, interfaces or data types) you need for method
*"* implementation or private method's signature
TYPE-POOLS: szadr.

*      Address of vendor
TYPES: BEGIN OF gsy_lfa1_addr1,
         lifnr          TYPE lifnr,
         addr1_complete TYPE szadr_addr1_complete,
       END OF gsy_lfa1_addr1.
