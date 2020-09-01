.PHONY: set-gnome-settings
set-gnome-settings: ## modifies and tweaks gnome behaviour
set-gnome-settings: .set-gnome-clock-settings
set-gnome-settings: .set-gnome-misc-settings
set-gnome-settings: .set-gnome-wm-keybindings-settings

.PHONY: .set-gnome-clock-settings
.set-gnome-clock-settings:
	gsettings set org.gnome.desktop.interface clock-show-date true
	gsettings set org.gnome.desktop.interface clock-show-seconds true
	gsettings set org.gnome.desktop.interface clock-show-weekday true

.PHONY: .set-gnome-misc-settings
.set-gnome-misc-settings:
	gsettings set org.gnome.desktop.interface enable-hot-corners true
	gsettings set org.gnome.desktop.interface icon-theme "ubuntu-mono-dark"
	gsettings set org.gnome.desktop.interface show-battery-percentage true
	gsettings set org.gnome.desktop.interface enable-animations false
	gsettings set org.gnome.desktop.peripherals.touchpad click-method "areas"

.PHONY: .set-gnome-wm-keybindings-settings
.set-gnome-wm-keybindings-settings:
	gsettings set org.gnome.desktop.wm.keybindings switch-to-workspace-1 "[]"
	gsettings set org.gnome.desktop.wm.keybindings switch-to-workspace-up "[]"
	gsettings set org.gnome.desktop.wm.keybindings switch-to-workspace-last "[]"
	gsettings set org.gnome.desktop.wm.keybindings switch-to-workspace-left "[]"
	gsettings set org.gnome.desktop.wm.keybindings switch-to-workspace-down "[]"
	gsettings set org.gnome.desktop.wm.keybindings switch-to-workspace-right "[]"

	gsettings set org.gnome.desktop.wm.keybindings move-to-workspace-up "[]"
	gsettings set org.gnome.desktop.wm.keybindings move-to-workspace-down "[]"
	gsettings set org.gnome.desktop.wm.keybindings minimize "['<Super><Shift>Down']"
	gsettings set org.gnome.desktop.wm.keybindings unmaximize "['<Super>Down']"
	gsettings set org.gnome.desktop.wm.keybindings move-to-side-e "['<Super>Right']"
	gsettings set org.gnome.desktop.wm.keybindings move-to-side-w "['<Super>Left']"
	gsettings set org.gnome.desktop.wm.keybindings cycle-group "[]"
	gsettings set org.gnome.desktop.wm.keybindings cycle-group-backward "[]"

	gsettings set org.gnome.shell.keybindings toggle-application-view "[]"
	gsettings set org.gnome.shell.keybindings toggle-message-tray "[]"
	gsettings set org.gnome.shell.keybindings toggle-overview "[]"
