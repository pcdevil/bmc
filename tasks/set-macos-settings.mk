.PHONY: set-macos-settings
set-macos-settings: ## modifies and tweaks macos behaviour
set-macos-settings: .set-macos-dock-settings
set-macos-settings: .set-macos-finder-settings
set-macos-settings: .set-macos-hot-corners-settings
set-macos-settings: .set-macos-keyboard-settings
set-macos-settings: .set-macos-misc-settings
set-macos-settings: .set-macos-mouse-settings
set-macos-settings: .set-macos-screensaver-settings
set-macos-settings: .set-macos-siri-settings
set-macos-settings: .set-macos-touchpad-settings

.PHONY: .set-macos-dock-settings
.set-macos-dock-settings:
	# use scale effect on minimize instead of genie
	defaults write com.apple.Dock mineffect scale
	# disable auto space rearrange on recent use
	# source: https://www.defaults-write.com/disable-automatically-rearrange-spaces-based-on-recent-use/
	defaults write com.apple.dock mru-spaces -bool false
	# turn off recent apps on dock
	# source: https://apple.stackexchange.com/questions/224236/is-there-a-way-to-prevent-apps-from-staying-in-dock-after-quitting
	defaults write com.apple.dock show-recents -bool no
	# lock dock
	# source: http://osxdaily.com/2010/02/08/lock-the-dock-in-mac-os-x/
	defaults write com.apple.Dock size-immutable -bool yes
	# clear recent apps list on dock
	# source: https://apple.stackexchange.com/questions/224236/is-there-a-way-to-prevent-apps-from-staying-in-dock-after-quitting
	defaults write com.apple.dock recent-apps -array
	# set dock size
	defaults write com.apple.Dock tilesize -int 32

.PHONY: .set-macos-finder-settings
.set-macos-finder-settings:
	# always show the library folder
	# source: http://osxdaily.com/2012/10/09/best-defaults-write-commands-mac-os-x/
	chflags nohidden ~/Library/
	# prevent .DS_Store file creation
	# source: http://stackoverflow.com/questions/24808649/how-to-stop-ds-store-file-creation-why-its-create
	defaults write com.apple.desktopservices DSDontWriteNetworkStores true
	# always show hidden files
	# source: http://osxdaily.com/2012/10/09/best-defaults-write-commands-mac-os-x/
	defaults write com.apple.finder AppleShowAllFiles -bool true
	# show path in finder
	# source: https://gist.github.com/MatthewEppelsheimer/2269385
	defaults write com.apple.finder ShowPathbar -bool true
	# add finder quit menu item
	# source: https://www.defaults-write.com/adding-quit-option-to-os-x-finder/
	defaults write com.apple.finder QuitMenuItem -bool true
	# show extensions
	# source: https://gist.github.com/MatthewEppelsheimer/2269385
	defaults write NSGlobalDomain AppleShowAllExtensions -bool true

.PHONY: .set-macos-hot-corners-settings
.set-macos-hot-corners-settings:
	# setup hot corners
	# source: https://github.com/ymendel/dotfiles/blob/master/osx/corners.defaults
	defaults write com.apple.dock wvous-bl-corner -int 0
	defaults write com.apple.dock wvous-bl-modifier -int 0
	defaults write com.apple.dock wvous-br-corner -int 0
	defaults write com.apple.dock wvous-br-modifier -int 0
	defaults write com.apple.dock wvous-tl-corner -int 5
	defaults write com.apple.dock wvous-tl-modifier -int 0
	defaults write com.apple.dock wvous-tr-corner -int 0
	defaults write com.apple.dock wvous-tr-modifier -int 0

.PHONY: .set-macos-keyboard-settings
.set-macos-keyboard-settings:
	# turn on keyboard navigation on modals
	# source: https://gist.github.com/MatthewEppelsheimer/2269385
	defaults write NSGlobalDomain AppleKeyboardUIMode -int 3
	# turn off press and hold for repeat
	# source: https://gist.github.com/MatthewEppelsheimer/2269385
	defaults write NSGlobalDomain ApplePressAndHoldEnabled -bool false
	# reduce key repeat delay
	# source: https://gist.github.com/MatthewEppelsheimer/2269385
	defaults write NSGlobalDomain InitialKeyRepeat -int 15
	# reduce key repeat interval
	# source: https://gist.github.com/MatthewEppelsheimer/2269385
	defaults write NSGlobalDomain KeyRepeat -int 2
	# turn off auto capitalization
	defaults write NSGlobalDomain NSAutomaticCapitalizationEnabled -int 0
	# turn off smart dashes
	defaults write NSGlobalDomain NSAutomaticDashSubstitutionEnabled -int 0
	# turn off spell checker
	# source: https://gist.github.com/MatthewEppelsheimer/2269385
	defaults write NSGlobalDomain NSAutomaticSpellingCorrectionEnabled -bool false
	# turn off double space to full stop
	defaults write NSGlobalDomain NSAutomaticPeriodSubstitutionEnabled -int 0
	# turn off smart quotes
	defaults write NSGlobalDomain NSAutomaticQuoteSubstitutionEnabled -int 0

.PHONY: .set-macos-misc-settings
.set-macos-misc-settings:
	# disable crash report dialog
	# source: https://superuser.com/questions/305099/mac-disable-you-have-forced-appname-to-quit-popup
	defaults write com.apple.CrashReporter DialogType none
	# turn off auto dictation
	defaults write com.apple.HIToolbox AppleDictationAutoEnable -int 0
	# clock format
	defaults write com.apple.menuextra.clock DateFormat "MMM d., EEE  H:mm:ss"
	# remove screenshot shadow
	# source: http://osxdaily.com/2011/05/23/disable-shadow-screen-shots-mac/
	defaults write com.apple.screencapture disable-shadow -bool true
	# modify screenshot folder
	# source: https://www.macworld.co.uk/how-to/mac-software/change-where-mac-screenshots-saved-3682381/
	defaults write com.apple.screencapture location ${HOME}/Downloads
	# disable screenshot floating thubmnail
	defaults write com.apple.screencapture show-thumbnail -bool false
	# turn off semi-transparent menu bars
	defaults write com.apple.universalaccess reduceTransparency -bool true
	# google chrome fix
	# source: https://brandonb.io/fix-google-chrome-from-crashing-in-os-x-10-10-yosemite
	defaults write com.google.Chrome AppleShowScrollBars always
	defaults write com.google.Chrome.canary AppleShowScrollBars always
	# turn on subpixel render for non-apple displays
	# source: https://gist.github.com/MatthewEppelsheimer/2269385
	defaults write NSGlobalDomain AppleFontSmoothing -int 2
	# expand save panel by default
	# source: https://www.defaults-write.com/expand-save-panel-default/
	defaults write NSGlobalDomain NSNavPanelExpandedStateForSaveMode -bool true
	defaults write NSGlobalDomain NSNavPanelExpandedStateForSaveMode2 -bool true

.PHONY: .set-macos-mouse-settings
.set-macos-mouse-settings:
	# disable hardware mount sounds
	# source: https://apple.stackexchange.com/questions/265759/how-to-disable-plug-in-sound-on-late-2016-macbook-pro
	defaults write com.apple.PowerChime ChimeOnAllHardware -bool false
	# turn off dictionary search
	# source: https://apple.stackexchange.com/questions/22785/how-do-i-disable-the-command-control-d-word-definition-keyboard-shortcut-in-os-x
	defaults write com.apple.symbolichotkeys AppleSymbolicHotKeys -dict-add 70 '<dict><key>enabled</key><false/></dict>'
	# zoom always follows the point
	defaults write com.apple.universalaccess closeViewPanningMode -integer 0
	# zoom modifier key (command)
	defaults write com.apple.universalaccess closeViewScrollWheelModifiersInt -integer 1048576
	# zoom with mouse
	defaults write com.apple.universalaccess closeViewScrollWheelToggle -bool true
	# turn off mouse shake to locate pointer
	defaults write NSGlobalDomain CGDisableCursorLocationMagnification -bool true
	# turn off elastic scrolling
	# source: http://osxdaily.com/2012/05/10/disable-elastic-rubber-band-scrolling-in-mac-os-x/
	defaults write NSGlobalDomain NSScrollViewRubberbanding -int 0

.PHONY: .set-macos-screensaver-settings
.set-macos-screensaver-settings:
	# turn on password challenge when screensaver is on
	defaults write com.apple.screensaver askForPassword -int 1
	# make password challenge immediately asked when screensaver is on
	defaults write com.apple.screensaver askForPasswordDelay -int 0
	defaults write com.apple.screensaver tokenRemovalAction 0

.PHONY: .set-macos-siri-settings
.set-macos-siri-settings:
	# turn off Siri
	defaults write com.apple.assistant.support "Assistant Enabled" -int 0
	defaults write com.apple.Siri StatusMenuVisible -int 0
	defaults write com.apple.Siri UserHasDeclinedEnable -int 1

.PHONY: .set-macos-touchpad-settings
.set-macos-touchpad-settings:
	# turn on tap to click
	defaults write com.apple.AppleMultitouchTrackpad Clicking -int 1
	# turn off rotate
	defaults write com.apple.AppleMultitouchTrackpad TrackpadRotate -int 0
	# turn on right click
	defaults write com.apple.AppleMultitouchTrackpad TrackpadRightClick -int 1
	# turn off look up
	defaults write com.apple.AppleMultitouchTrackpad TrackpadThreeFingerTapGesture -int 0
	# turn off smart zoom
	defaults write com.apple.AppleMultitouchTrackpad TrackpadTwoFingerDoubleTapGesture -int 0
	# turn off show desktop gesture
	defaults write com.apple.dock showDesktopGestureEnabled -int 0
	# turn off mission control gesture
	defaults write com.apple.dock showMissionControlGestureEnabled -int 0
	#
	defaults write com.apple.dock TrackpadFiveFingerPinchGesture -int 0
	# turn off swipe between fullscreen apps
	defaults write com.apple.dock TrackpadFourFingerHorizSwipeGesture -int 0
	# turn off launchpad gesture
	defaults write com.apple.dock TrackpadFourFingerPinchGesture -int 0
	# turn off exposé gesture
	defaults write com.apple.dock TrackpadFourFingerVertSwipeGesture -int 0
	# turn off swipe between pages gesture
	defaults write com.apple.dock TrackpadThreeFingerHorizSwipeGesture -int 0
	# turn off exposé gesture
	defaults write com.apple.dock TrackpadThreeFingerVertSwipeGesture -int 0
	# turn off notification center gesture
	defaults write com.apple.dock TrackpadTwoFingerFromRightEdgeSwipeGesture -int 0
