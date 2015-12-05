'use strict'

const path = require('path')

module.exports = (m, attr) => {
	m.directory.install(m.home('.config'), {
		permissions: {
			mode: 0o700,
			owner: attr.user,
			group: 'users'
		}
	})
}
