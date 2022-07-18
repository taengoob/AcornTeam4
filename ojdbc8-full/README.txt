======================================================
Oracle Free Use Terms and Conditions (FUTC) License 
======================================================
https://www.oracle.com/downloads/licenses/oracle-free-license.html
===================================================================

ojdbc8-full.tar.gz - JDBC Thin Driver and Companion JARS
========================================================
This TAR archive (ojdbc8-full.tar.gz) contains the 21.6.0.0.1 release of the Oracle JDBC Thin driver(ojdbc8.jar), the Universal Connection Pool (ucp.jar) and other companion JARs grouped by category. 

(1) ojdbc8.jar (5,088,810 bytes) - 
(SHA1 Checksum: 1888acd4bcb1457f1a10a3333a3d104c23283cd9)
Oracle JDBC Driver compatible with JDK8, JDK11, JDK12, JDK13, JDK14, and JDK15.
(2) ucp.jar (1,800,224 bytes) - (SHA1 Checksum: e58ad1b5fa23f3de3ecef6edd3ad33ce406b5ef0)
Universal Connection Pool classes to be used with ojdbc8.jar -- for performance, scalability, high availability, sharded and multitenant databases.
(3) rsi.jar (345,038 bytes) - (SHA1 Checksum: b311fd774f433f6f293ecb01a7594573628bae34)
Reactive Streams Ingestion (RSI) 
(4) ojdbc.policy (11,515 bytes) - Sample security policy file for Oracle Database JDBC drivers

======================
Security Related JARs
======================
Java applications require some additional jars to use Oracle Wallets. 
You need to use all the three jars while using Oracle Wallets. 

(5) oraclepki.jar (307,594 bytes) - (SHA1 Checksum: bcd51a4813981196a6f748903671377838c69f6d)
Additional jar required to access Oracle Wallets from Java
(6) osdt_cert.jar (210,835 bytes) - (SHA1 Checksum: 9903f9ce8451148dd2dde4ee872edd5ddd7fdaec)
Additional jar required to access Oracle Wallets from Java
(7) osdt_core.jar (312,756 bytes) - (SHA1 Checksum: 069a77c81069354fe8aff4a0dfb58fb87bfc955a)
Additional jar required to access Oracle Wallets from Java

=============================
JARs for NLS and XDK support 
=============================
(8) orai18n.jar (1,664,456 bytes) - (SHA1 Checksum: ca73dc569af648a39bdfbeaca656862e17d458e2) 
Classes for NLS support
(9) xdb.jar (265,864 bytes) - (SHA1 Checksum: 3940fc1730f2952ba927ab1a2edb4e0065252fc9)
Classes to support standard JDBC 4.x java.sql.SQLXML interface 
(10) xmlparserv2.jar (1,953,726 bytes) - (SHA1 Checksum: 27b9afd26f0a9e46480a9748ca2782807baab550)
Classes to support standard JDBC 4.x java.sql.SQLXML interface 
(11) xmlparserv2_sans_jaxp_services.jar (1,948,956 bytes) - (SHA1 Checksum: 3f594bbb96190f6388128a880cd79c1803fd9965) 
Classes to support standard JDBC 4.x java.sql.SQLXML interface

====================================================
JARs for Real Application Clusters(RAC), ADG, or DG 
====================================================
(12) ons.jar (198,457 bytes) - (SHA1 Checksum: 4c1952569a00fadd272d30c66380781b242f00dc)
for use by the pure Java client-side Oracle Notification Services (ONS) daemon
(13) simplefan.jar (32,204 bytes) - (SHA1 Checksum: 348c0d24ac53e95085693bd3fbdc340c260e6735)
Java APIs for subscribing to RAC events via ONS; simplefan policy and javadoc


==================================================================================
NOTE: The diagnosability JARs **SHOULD NOT** be used in the production environment. 
These JARs (ojdbc8_g.jar,ojdbc8dms.jar, ojdbc8dms_g.jar) are meant to be used in the 
development, testing, or pre-production environment to diagnose any JDBC related issues. 

=====================================
OJDBC - Diagnosability Related JARs
===================================== 

(14) ojdbc8_g.jar (8,458,340 bytes) - (SHA1 Checksum: 6405acae434f876966ceb44e88692dcf281f4b88)
Same as ojdbc8.jar except compiled with "javac -g" and contains tracing code.

(15) ojdbc8dms.jar (7,058,503 bytes) - (SHA1 Checksum: f3c994a79cefc5ee012b0dee44a85abf8f8aecc3)
Same as ojdbc8.jar, except that it contains instrumentation to support DMS and limited java.util.logging calls.

(16) ojdbc8dms_g.jar (8,460,169 bytes) - (SHA1 Checksum: f6b6dda45800161a08b30e1d62a4dfda220f6e84)
Same as ojdbc8_g.jar except that it contains instrumentation to support DMS.

(17) dms.jar (2,194,305 bytes) - (SHA1 Checksum: faf1dc4b8cbfeaf744cab838e361b8e86a61b251)
dms.jar required for DMS-enabled JAR files.

==================================================================
Oracle JDBC and UCP - Javadoc and README
==================================================================

(18) JDBC-Javadoc-21c.jar (1,982,245 bytes) - JDBC API Reference 21c

(19) UCP-Javadoc-21c.jar (395,049 bytes) - UCP Java API Reference 21c

(20) RSI-Javadoc-21c.jar (425,701 bytes) - RSI Java API Reference 21c

(21) simplefan-Javadoc-21c.jar (86,724 bytes) - Simplefan API Reference 21c 

(22) xdb-Javadoc-21c.jar (2,630,872 bytes) - XDB API Reference 21c 

(23) xmlparserv2-Javadoc-21c.jar (2,630,872 bytes) - xmlparserv2 API Reference 21c 

(24) JDBC-Readme.txt: It contains general information about the JDBC driver and bugs that have been fixed in the 21.6.0.0.1 release. 

(25) UCP-Readme.txt: It contains general information about UCP and bugs that are fixed in the 21.6.0.0.1 release. 

(26) Bugs-fixed-in-216.txt: It contains the new feature added on top of the 21.6 release. 

=================
USAGE GUIDELINES
=================
Refer to the JDBC Developers Guide (https://docs.oracle.com/en/database/oracle/oracle-database/21/jjdbc/index.html) and Universal Connection Pool Developers Guide (https://docs.oracle.com/en/database/oracle/oracle-database/21/jjucp/index.html) for more details. 