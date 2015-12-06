'use strict'

const path = require('path')

module.exports = (m, a, u) => {
	m.directory.install(u.home('.config'), {
		permissions: u.mode(0o700)
	})

	// Setup xprofile.d
	m.directory.install(u.home('.xprofile.d'), {
		permissions: u.mode(0o500)
	})

	m.file.install(u.home('.xprofile'), {
		source: path.resolve(__dirname, 'xprofile'),
		permissions: u.mode(0o500)
	})
}
