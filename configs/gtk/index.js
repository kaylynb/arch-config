'use strict'

const path = require('path')

module.exports = (m, a, u) => {
	m.pkg_aura.install('gtk-theme-arc')

	m.directory.install(u.home('.config/gtk-3.0'), {
		permissions: u.mode(0o700)
	})

	m.file.install(u.home('.config/gtk-3.0/settings.ini'), {
		source: path.resolve(__dirname, 'settings.ini'),
		permissions: u.mode(0o600)
	})

	m.file.install(u.home('.gtkrc-2.0'), {
		source: path.resolve(__dirname, 'gtkrc-2.0'),
		permissions: u.mode(0o600)
	})
}
