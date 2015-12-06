'use strict'

const path = require('path')

module.exports = (m, a, u) => {
	m.pkg.install('terminator')

	const configFilePath = u.home('.config/terminator/config')

	m.directory.install(path.dirname(configFilePath), {
		permissions: u.mode(0o700)
	})

	m.file.install(configFilePath, {
		source: path.resolve(__dirname, 'config'),
		permissions: u.mode(0o600)
	})
}
