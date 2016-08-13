'use strict'

const path = require('path')

module.exports = (m, a, u) => {
	m.pkg.install('rofi')

	m.file.install(u.home('.config/rofi/config'), {
		source: path.resolve(__dirname, 'config'),
		permissions: u.mode(0o600)
	})
}
