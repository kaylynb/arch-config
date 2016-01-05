'use strict'

const path = require('path')
const fs = require('fs')
const exec = require('meth/lib/util/exec')

module.exports = (m, a, u) => {
	m.pkg_aura.install('sublime-text-dev')

	// Need to create each dir in tree until this is fixed in meth~
	m.directory.install(u.home('.config/sublime-text-3'), {
		permissions: u.mode(0o700)
	})

	m.directory.install(u.home('.config/sublime-text-3/Packages'), {
		permissions: u.mode(0o700)
	})

	m.directory.install(u.home('.config/sublime-text-3/Packages/User'), {
		permissions: u.mode(0o700)
	})

	m.directory.install(u.home('.config/sublime-text-3/Installed Packages'), {
		permissions: u.mode(0o700)
	})

	// Install package control settings
	m.file.install(u.home('.config/sublime-text-3/Packages/User/Package Control.sublime-settings'), {
		source: path.resolve(__dirname, 'Package Control.sublime-settings'),
		permissions: u.mode(0o600)
	})

	// Install package control (doing this manually until it can be done with meth)
	const packageControlLocation = u.home('.config/sublime-text-3/Installed Packages/Package Control.sublime-package')
	try {
		fs.statSync(packageControlLocation)
	} catch (err) {
		// If caught it doesn't exist
		console.log('Installing package control')
		exec.run(`curl https://packagecontrol.io/Package%20Control.sublime-package -o ${exec.escape(packageControlLocation)}`)
		exec.run(`chmod 600 ${exec.escape(packageControlLocation)}`)
		exec.run(`chown kaylyn:users ${exec.escape(packageControlLocation)}`)
	}

	// Install sublime text settings
	m.file.install(u.home('.config/sublime-text-3/Packages/User/Preferences.sublime-settings'), {
		source: path.resolve(__dirname, 'Preferences.sublime-settings'),
		permissions: u.mode(0o600)
	})
}
