SYSTEMD_DIR=/etc/systemd/system

install: openrgb.service _phony
	cp openrgb.service "$(SYSTEMD_DIR)"
	systemctl daemon-reload

.PHONY: _phony
