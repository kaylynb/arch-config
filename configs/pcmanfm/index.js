'use strict'

const path = require('path')

module.exports = (m, a, u) => {
	m.pkg.install('pcmanfm')
	m.pkg.install('gvfs')
	m.pkg.install('gvfs-smb')

	m.file.install(u.home('.xprofile.d/pcmanfm'), {
		source: path.resolve(__dirname, 'xprofile.d/pcmanfm'),
		permissions: u.mode(0o500)
	})

	m.directory.install(u.home('.config/pcmanfm'), {
		permissions: u.mode(0o700)
	})

	m.directory.install(u.home('.config/pcmanfm/default'), {
		permissions: u.mode(0o700)
	})

	m.file.install(u.home('.config/pcmanfm/default/pcmanfm.conf'), {
		source: path.resolve(__dirname, 'pcmanfm.conf'),
		permissions: u.mode(0o600)
	})
}
