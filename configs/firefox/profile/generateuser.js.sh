#!/bin/bash

# Get baseline security config
curl -O https://raw.githubusercontent.com/pyllyukko/user.js/master/user.js

# Remove some of the settings we don't want
removedconfigs=(
	'javascript.options.methodjit.chrome'				# JIT for js
	'javascript.options.methodjit.content'
	'security.xpconnect.plugin.unrestricted'		# Plugin mods (keysnail mostly)
	'browser.privatebrowsing.autostart'					# No default private browsing
	'extensions.ghostery.privateBrowsing'
	'privacy.clearOnShutdown.cache'							# Don't clear cache on close
	'privacy.clearOnShutdown.cookies'
	'privacy.clearOnShutdown.downloads'
	'privacy.clearOnShutdown.formdata'
	'privacy.clearOnShutdown.history'
	'privacy.clearOnShutdown.offlineApps'
	'privacy.clearOnShutdown.passwords'
	'privacy.clearOnShutdown.sessions'
	'places.history.enabled'
	'browser.history_expire_days'
	'browser.history_expire_sites'
	'browser.history_expire_visits'
	'browser.download.manager.retention'
	'network.cookie.lifetimePolicy'							# Don't clear cookies on exit
	'signon.rememberSignons'										# I want to use credential storage for some sites
	'browser.urlbar.autocomplete.enabled'				# Don't disable uri autocomplete
)

for config in ${removedconfigs[@]}; do
	sed -i "/$config/s/^/\/\//g" user.js
done

# Now add a few extra configs
# cat << EOF >> user.js

# EOF
