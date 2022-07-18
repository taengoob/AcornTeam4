*****************************************************************************
Oracle Universal Connection Pool Release 21.6.0.0.1

Production README
=======================================================================
Contents Of This Release
------------------------

For all platforms:

  [ORACLE_HOME]/ucp/lib contains:

  - ucp.jar
    Classes for use with JDK 8. It contains the Universal Connection Pool
    classes, as well as the built-in JDBC Pool Adapter classes for
    standalone UCP / JDBC applications.

  - ucp11.jar
    Classes for use with JDK 11. It contains the Universal Connection Pool
    classes, as well as the built-in JDBC Pool Adapter classes for
    standalone UCP / JDBC applications.

  - ucpdemos.jar
    Classes for use with JDK 8. It contains the Universal Connection Pool
    demos and code samples, sample logging configurations, and a
    quick-start toolkit for Fast Connection Failover.

  Javadoc / Documentation / Demo:

    All of the above are also available for download on OTN.


Installation
------------

The Oracle Installer puts the Universal Connection Pool files in the
[ORACLE_HOME]/ucp directory.


Setting Up Your Environment
---------------------------

On Windows platforms:
  - Add [ORACLE_HOME]\ucp\lib\ucp.jar to your CLASSPATH.

On all Unix platforms:
  - Add [ORACLE_HOME]/ucp/lib/ucp.jar to your CLASSPATH.

New Features in this Release (21c)
-------------------------------------------------------------
- Sharding Data Source for Transparent Access to Sharded Databases: A new Java data 
  source that enables Java connectivity to a sharded database without the need for
  an application to furnish a sharding key.
  
- Connection Pool Layer Error Messages:UCP exceptions displays extra message with a 
  short statistics that improves UCP diagnosability:
  
- ENH 31621233 - UCP INCURS DOUBLES CPU OVERHEAD UNDER HIGH CONCURRENCY

- Enh 31637253 - Add PDSFactory.getPoolDataSource(String pds, InputStream is) 

New Feature in This Patch Release (21.6.0.0.1)
---------------------------------------------------------------

The release 21.6.0.0.1 is a patched version on top of 21.6. 

OAUTH 2.0 authentication support specifically for Microsoft Azure Active Directory (AD) OAuth2 access tokens is added in this release. 

JDBC Thin drivers v21.6.0.0.1 can access Oracle Autonomous Database on Shared Exadata Infrastructure (ADB-S) using Microsoft Azure Active Directory (AD) OAuth2 access tokens.  

Customers who want to leverage centrally managed authentication by Microsoft Azure Active Directory (AD) can use this feature to connect to Autonomous Database Shared using OAuth2 access tokens. 

Refer to Use Azure Active Directory (Azure AD) with Autonomous Database for more details. 
(https://docs.oracle.com/en/cloud/paas/autonomous-database/adbsa/manage-users-azure-ad.html#GUID-562655CA-4D8B-41D2-9165-6515BC824E07)
 
Note: Please note that there will not be any back-port requests supported on this release. This release is exclusively for making the OAuth2.0 Token authentication feature accessible.


