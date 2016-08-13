'use strict'

const path = require('path')
const tpl = require('../../util/tpl')

module.exports = (m, a, u) => {
	m.pkg.install('rofi')

	m.directory.install(u.home('.config/rofi'), {
		permissions: u.mode(0o700)
	})

	const rofiConfig = tpl.render(
		path.resolve(__dirname, 'config'),
		a.rofi
	)

	m.file.install(u.home('.config/rofi/config'), {
		content: rofiConfig,
		permissions: u.mode(0o600)
	})
}
