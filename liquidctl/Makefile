INSTALL_DIR=/usr/local/bin
SYSTEMD_DIR=/etc/systemd/system

install: liquidcfg liquidcfg.service _phony
	mkdir -p "$(INSTALL_DIR)"
	cp liquid*cfg "$(INSTALL_DIR)"
	cp liquid*cfg.service "$(SYSTEMD_DIR)"
	systemctl daemon-reload

.PHONY: _phony
