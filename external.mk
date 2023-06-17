flash-boot:
	heimdall flash --BOOT ${BINARIES_DIR}/boot.img
flash-system:
	heimdall flash --SYSTEM ${BINARIES_DIR}/system.img
flash-all:
	heimdall flash --BOOT ${BINARIES_DIR}/boot.img --SYSTEM ${BINARIES_DIR}/system.img