################################################################################
#
# exfat
#
################################################################################

EXFAT_VERSION = 1.1.0
EXFAT_SITE = http://distfiles.gentoo.org/distfiles
EXFAT_SOURCE = fuse-exfat-$(EXFAT_VERSION).tar.gz
EXFAT_DEPENDENCIES = host-scons libfuse
EXFAT_LICENSE = GPLv3+
EXFAT_LICENSE_FILES = COPYING

define EXFAT_BUILD_CMDS
	(cd $(@D); \
		$(TARGET_CONFIGURE_OPTS) CCFLAGS="$(TARGET_CFLAGS) -std=c99" $(SCONS))
endef

define EXFAT_INSTALL_TARGET_CMDS
	(cd $(@D); \
		$(TARGET_CONFIGURE_OPTS) CCFLAGS="$(TARGET_CFLAGS) -std=c99" $(SCONS) \
		DESTDIR=$(TARGET_DIR)/sbin install)
endef

$(eval $(generic-package))
