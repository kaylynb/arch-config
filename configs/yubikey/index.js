'use strict'

const path = require('path')

module.exports = (m, attr) => {
	m.pkg.install('pcsclite')
	m.pkg.install('libusb-compat')

	// Add udev rules for permissions on smartcard for yubikey
	// This config also fixes a bug related to scdaemon not working when
	// replugging the key, so the workaround for now is have udev kill
	// scdaemon on plug.
	//https://bugs.gnupg.org/gnupg/issue2167
	m.file.install('/etc/udev/rules.d/yubikey.rules', {
		source: path.resolve(__dirname, 'yubikey.rules'),
		permissions: {
			mode: 0o644,
			owner: 'root',
			group: 'root'
		}
	})
}

