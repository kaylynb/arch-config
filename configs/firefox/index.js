'use strict'

const path = require('path')

module.exports = (m, a, u) => {
	m.pkg.install('firefox')

	const directories = [
		'.mozilla',
		'.mozilla/firefox',
		'.mozilla/firefox/profile'
	]

	for (const directory of directories) {
		m.directory.install(u.home(directory), {
			permissions: u.mode(0o700)
		})
	}

	m.file.install(u.home('.mozilla/firefox/profiles.ini'), {
		source: path.resolve(__dirname, 'profiles.ini'),
		permissions: u.mode(0o644)
	})

	m.file.install(u.home('.mozilla/firefox/profile/user.js'), {
		source: path.resolve(__dirname, 'profile/user.js'),
		permissions: u.mode(0o644)
	})
}
