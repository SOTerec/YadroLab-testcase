SUMMARY = "Yadro hello application"
LICENSE = "MIT"
LIC_FILES_CHKSUM = "file://${COMMON_LICENSE_DIR}/MIT;md5=0835ade698e0bcf8506ecda2f7b4f302"

SRC_URI = "file://yadro_hello.c"
TARGET_CC_ARCH += "${LDFLAGS}"

S = "${WORKDIR}"

do_compile() {
    ${CC} yadro_hello.c -o yadro_hello
}

do_install() {
    install -d ${D}${bindir}
    install -m 0755 yadro_hello ${D}${bindir}
}
