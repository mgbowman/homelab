FROM alpine:latest
LABEL maintainer="Matthew Bowman <mgb@otr.mx>"
ARG arch=x86_64-pcbios
COPY ipxe /ipxe
RUN apk add --no-cache tftp-hpa \
	&& mv /ipxe/bin/${arch}/undionly.kpxe /var/tftpboot/undionly.kpxe \
	&& chmod 0444 /var/tftpboot/undionly.kpxe \
	&& chmod 0555 /var/tftpboot \
	&& chown -R nobody:nobody /var/tftpboot \
	&& rm -rf /ipxe
EXPOSE 69/udp
ENTRYPOINT ["in.tftpd"]
CMD ["-L", "--secure", "/var/tftpboot"]
