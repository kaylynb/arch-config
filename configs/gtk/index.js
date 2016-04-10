'use strict'

const path = require('path')
const tpl = require('../../util/tpl')

module.exports = (m, a, u) => {
	// Bug in Arc theme and a few others with text highlight not showing
	// m.pkg_aura.install('gtk-theme-arc')
	m.pkg.install('gtk-engines')

	m.directory.install(u.home('.config/gtk-3.0'), {
		permissions: u.mode(0o700)
	})

	m.file.install(u.home('.config/gtk-3.0/settings.ini'), {
		content: tpl.render(
			path.resolve(__dirname, 'settings.ini'),
			a.gtk
		),
		permissions: u.mode(0o600)
	})

	m.file.install(u.home('.gtkrc-2.0'), {
		content: tpl.render(
			path.resolve(__dirname, 'gtkrc-2.0'),
			a.gtk
		),
		permissions: u.mode(0o600)
	})
}
