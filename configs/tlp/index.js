'use strict'

const path = require('path')

module.exports = (m, a, u) => {
	m.pkg.install('tlp')

	m.file.install('/etc/default/tlp', {
		source: path.resolve(__dirname, 'tlp'),
		permissions: u.mode(0o644)
	})

	m.service.enable('tlp')
	m.service.enable('tlp-sleep')

	m.service.start('tlp')
}
