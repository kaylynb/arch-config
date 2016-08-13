'use strict'

const path = require('path')
const tpl = require('../../util/tpl')

module.exports = (m, a, u) => {
	m.pkg_aura.install('ttf-font-awesome')
	m.pkg.install('i3status')
	m.pkg.install('i3-wm')

	// i3status
	m.directory.install(u.home('.config/i3status'), {
		permissions: u.mode(0o700)
	})

	const i3statusConfig = tpl.render(
		path.resolve(__dirname, 'i3status/config'),
		a.i3status
	)

	m.file.install(u.home('.config/i3status/config'), {
		content: i3statusConfig,
		permissions: u.mode(0o600)
	})

	// i3
	m.directory.install(u.home('.config/i3'), {
		permissions: u.mode(0o700)
	})

	const i3config = tpl.render(
		path.resolve(__dirname, 'i3/config'),
		a.i3
	)

	m.file.install(u.home('.config/i3/config'), {
		content: i3config,
		permissions: u.mode(0o600)
	})

	;['i3statusmem.sh', 'mem.sh'].forEach(filename => {
		m.file.install(u.home(`.config/i3/${filename}`), {
			source: path.resolve(__dirname, `i3/${filename}`),
			permissions: u.mode(0o700)
		})
	})
}
