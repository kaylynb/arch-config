'use strict'

const path = require('path')

module.exports = (m, a, u) => {
	m.pkg.install('xf86-input-libinput')

	m.file.install('/etc/X11/xorg.conf.d/01-libinput-trackpad.conf', {
		source: path.resolve(__dirname, '01-libinput-trackpad.conf'),
		permissions: {
			mode: 0o644,
			owner: 'root',
			group: 'root'
		}
	})
}
