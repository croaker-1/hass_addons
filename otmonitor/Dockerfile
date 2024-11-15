ARG BUILD_FROM
FROM $BUILD_FROM as BUILD

WORKDIR /usr/src
ARG OTMONITOR_VERSION

ARG BUILD_ARCH
COPY tclurl_helper.sh ./

RUN apt-get update \
    && apt-get install -qy --no-install-recommends \
        git \
    && git clone https://github.com/hvxl/otmonitor.git  -b "${OTMONITOR_VERSION}"  \
    && cd otmonitor  \
    && curl https://otgw.tclcode.com/download/sdx-20110317.kit --output sdx.kit \
    && curl $(../tclurl_helper.sh "${BUILD_ARCH}") --output tclkit \
    && cp tclkit /usr/local/bin/tclkit \
    && chmod +x /usr/local/bin/tclkit \
    && tclkit sdx.kit  wrap otmonitor -vfs otmonitor.vfs -runtime tclkit

FROM $BUILD_FROM

COPY --from=BUILD /usr/src/otmonitor /usr/local/bin/

RUN chmod +x /usr/local/bin/otmonitor
# Copy rootfs
COPY root /

WORKDIR /log
ENTRYPOINT [ "/init" ]
CMD []
