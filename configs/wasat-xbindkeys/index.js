'use strict'

const path = require('path')

module.exports = (m, a, u) => {
	m.pkg_aura.install('xbindkeys')

	m.file.install(u.home('.xbindkeysrc'), {
		source: path.resolve(__dirname, 'xbindkeysrc'),
		permissions: u.mode(0o400)
	})

	m.file.install(u.home('.xprofile.d/xbindkeys'), {
		source: path.resolve(__dirname, 'xbindkeys'),
		permissions: u.mode(0o500)
	})
}
