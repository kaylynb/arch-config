#!/bin/bash

BASEDIR=$(dirname $0)

# Get baseline security config
curl https://raw.githubusercontent.com/pyllyukko/user.js/master/user.js -o $BASEDIR/user.js

# Remove some of the settings we don't want
removedconfigs=(
	'javascript.options.methodjit.chrome'           # JIT for js
	'javascript.options.methodjit.content'
	'security.xpconnect.plugin.unrestricted'        # Plugin mods (keysnail mostly)
	'browser.privatebrowsing.autostart'             # No default private browsing
	'extensions.ghostery.privateBrowsing'
	'privacy.clearOnShutdown.downloads'
	'privacy.clearOnShutdown.history'
	'privacy.clearOnShutdown.offlineApps'
	'privacy.clearOnShutdown.passwords'
	'privacy.clearOnShutdown.sessions'
	'places.history.enabled'
	'browser.history_expire_days'
	'browser.history_expire_sites'
	'browser.history_expire_visits'
	'browser.download.manager.retention'
	'privacy.sanitize.sanitizeOnShutdown'
	'signon.rememberSignons'                        # I want to use credential storage for some sites
	'browser.urlbar.autocomplete.enabled'           # Don't disable uri autocomplete
	'plugins.update.notifyUser'                     # Hide awful plugin check window
	'browser.urlbar.maxRichResults'
	'keyword.enabled'                               # We want keyword search enabled as a convienience
	'privacy.clearOnShutdown.cookies'               # Don't clear cookies (using uMatrix or something here)
	'network.cookie.cookieBehavior'
	'network.cookie.lifetimePolicy'
	'dom.event.clipboardevents.enabled'             # Don't disable clipboard events (mostly interferes with facebook)
	'security.ssl3.rsa_camellia_128_sha'            # Don't disable a bunch of ciphers
	'security.ssl3.ecdhe_rsa_aes_128_sha'
	'security.ssl3.ecdhe_ecdsa_aes_128_sha'
	'security.ssl3.ecdh_rsa_aes_128_sha'
	'security.ssl3.ecdh_ecdsa_aes_128_sha'
	'security.ssl3.dhe_rsa_camellia_128_sha'
	'security.ssl3.dhe_rsa_aes_128_sha'
	'security.ssl3.ecdh_rsa_aes_256_sha'
	'security.ssl3.ecdh_ecdsa_aes_256_sha'
	'security.ssl3.dhe_rsa_camellia_256_sha'
	'security.ssl3.dhe_rsa_aes_256_sha'
	'security.ssl3.dhe_dss_aes_128_sha'
	'security.ssl3.dhe_dss_aes_256_sha'
	'security.ssl3.dhe_dss_camellia_128_sha'
	'security.ssl3.dhe_dss_camellia_256_sha'
)

for config in ${removedconfigs[@]}; do
	sed -i "/$config/s/^/\/\//g" $BASEDIR/user.js
done

# Now add a few extra configs
cat << EOF >> $BASEDIR/user.js
{% if firefox_dpi_scale is defined %}
// Setup DPI
user_pref("layout.css.devPixelsPerPx", "{{ firefox_dpi_scale }}");
{% endif %}

// Fullscreen shouldn't animate. Just no.
user_pref("browser.fullscreen.animate", false);

// Select arc theme (this will get nuked if user.js is updated)
user_pref("general.skins.selectedSkin", "arc-darker-theme");

// Disable 'first run' page on startup
user_pref("browser.startup.homepage_override.mstone","ignore");

// Don't warn on closing tabs
user_pref("browser.tabs.warnOnClose", false);

// Disable middle mouse from opening pasted text
user_pref("middlemouse.contentLoadURL", false);

// Use multiple process windows
user_pref("dom.ipc.processCount", 7);

EOF
