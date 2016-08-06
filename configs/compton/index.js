'use strict'

const path = require('path')

module.exports = (m, a, u) => {
	m.pkg.install('compton')

	m.file.install(u.home('.xprofile.d/compton'), {
		source: path.resolve(__dirname, 'xprofile.d/compton'),
		permissions: u.mode(0o500)
	})
}
