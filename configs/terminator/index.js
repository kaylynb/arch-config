'use strict'

const path = require('path')

module.exports = (m, attr) => {
	m.pkg.install('terminator')

	const configFilePath = m.home('.config/terminator/config')

	m.directory.install(path.dirname(configFilePath), {
		permissions: {
			mode: 0o700,
			owner: attr.user,
			group: 'users'
		}
	})

	m.file.install(configFilePath, {
		source: path.resolve(__dirname, 'config'),
		permissions: {
			mode: 0o600,
			owner: attr.user,
			group: 'users'
		}
	})
}
