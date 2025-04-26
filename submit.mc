divert(-1)dnl
#-----------------------------------------------------------------------------
# $Sendmail: submit.mc,v 8.15.2 2018-01-13 23:43:05 cowboy Exp $
#
# Copyright (c) 2000-2010 Richard Nelson.  All Rights Reserved.
#
# cf/debian/submit.mc.  Generated from submit.mc.in by configure.
#
# submit.mc prototype config file for building Sendmail 8.15.2
#
# Note: the .in file supports 8.7.6 - 9.0.0, but the generated
#	file is customized to the version noted above.
#
# This file is used to configure Sendmail for use with Debian systems.
#
# If you modify this file, you will have to regenerate /etc/mail/submit.cf
# by running this file through the m4 preprocessor via one of the following:
#	* make  (or make -C /etc/mail)
#	* sendmailconfig
#	* m4 /etc/mail/submit.mc > /etc/mail/submit.cf
# The first two options are preferred as they will also update other files
# that depend upon the contents of this file.
#
# The best documentation for this .mc file is:
# /usr/share/doc/sendmail-doc/cf.README.gz
#
#-----------------------------------------------------------------------------
divert(0)dnl
#
#   Copyright (c) 2000-2002 Richard Nelson.  All Rights Reserved.
#
#  This file is used to configure Sendmail for use with Debian systems.
#
define(`_USE_ETC_MAIL_')dnl
include(`/usr/share/sendmail/cf/m4/cf.m4')dnl
OSTYPE(`debian')dnl
DOMAIN(`debian-msp')dnl
dnl #
dnl #---------------------------------------------------------------------
dnl # Masquerading information, if needed, should go here
dnl # You likely will not need this, as the MTA will do it
dnl #---------------------------------------------------------------------
dnl MASQUERADE_AS()dnl
dnl FEATURE(`masquerade_envelope')dnl
dnl #
dnl #---------------------------------------------------------------------
dnl # The real reason we're here: the FEATURE(msp)
dnl # NOTE WELL:  MSA (587) should have M=Ea, so we need to use stock 25
dnl #---------------------------------------------------------------------
dnl #
dnl #---------------------------------------------------------------------
dnl # Some minor cleanup from FEATURE(msp)
dnl #---------------------------------------------------------------------
dnl #
dnl #---------------------------------------------------------------------
VERSIONID(`client.mc Robert Harker, info at harker dot com 060424')
define(`confCF_VERSION', `client')dnl
dnl dirty hack to keep proto.m4 from complaining
define(`__OSTYPE__',`')
define(`confTIME_ZONE', `USE_TZ')dnl
MASQUERADE_AS(`192.168.0.71')dnl
FEATURE(`allmasquerade')dnl
FEATURE(`masquerade_envelope')dnl
FEATURE(always_add_domain)dnl
EXPOSED_USER(`root operator monitoring')dnl
define(`SMART_HOST',`cs.newgoloka.local')dnl
define(`confMAX_MESSAGE_SIZE',`10000000')dnl
define(`confDONT_INIT_GROUPS', `True')dnl
define(`confDEF_USER_ID',``8:112'')dnl
define(`confDONT_PROBE_INTERFACES',true)dnl
define(`confTO_QUEUEWARN_DSN',`')dnl
define(`confTO_QUEUERETURN_DSN',`12h')dnl
FEATURE(`msp', `192.168.0.71')dnl
define(`confRUN_AS_USER', `monitoring:smmsp')

