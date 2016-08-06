'use strict'

module.exports = (m, a, u) => {
	m.pkg.install('networkmanager')
	m.pkg.install('network-manager-applet')
	m.pkg.install('dhclient')
	m.pkg.install('gnome-keyring')	// Needed to store Wi-Fi passwords

	// Must ensure dhcpcd is disabled as network manager uses dhclient
	m.service.stop('dhcpcd')
	m.service.disable('dhcpcd')

	m.service.enable('NetworkManager')
	m.service.start('NetworkManager')
}
