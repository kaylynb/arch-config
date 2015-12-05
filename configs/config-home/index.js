'use strict'

const path = require('path')

module.exports = (m, attr) => {
	m.directory.install(m.home('.config'), {
		permissions: {
			mode: 0o755,
			owner: attr.user,
			group: 'users'
		}
	})
}
