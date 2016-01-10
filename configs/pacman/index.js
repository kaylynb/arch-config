'use strict'

const path = require('path')

module.exports = (m, a, u) => {
	m.directory.install(u.home('.config/pacman'), {
		permissions: u.mode(0o700)
	})

	m.file.install(u.home('.config/pacman/makepkg.conf'), {
		source: path.resolve(__dirname, 'makepkg.conf'),
		permissions: u.mode(0o600)
	})
}
