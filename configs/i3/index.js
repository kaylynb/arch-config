'use strict'

const path = require('path')

module.exports = (m, attr) => {
	m.pkg.install('i3status')

	m.directory.install(m.home('.config/i3status'), {
		permissions: {
			mode: 0o700,
			owner: attr.user,
			group: 'users'
		}
	})

	m.file.install(m.home('.config/i3status/config'), {
		source: path.resolve(__dirname, 'i3status/config'),
		permissions: {
			mode: 0o600,
			owner: attr.user,
			group: 'users'
		}
	})

	m.pkg.install('i3-wm')

	m.directory.install(m.home('.config/i3'), {
		permissions: {
			mode: 0o700,
			owner: attr.user,
			group: 'users'
		}
	})

	m.file.install(m.home('.config/i3/config'), {
		source: path.resolve(__dirname, 'i3/config'),
		permissions: {
			mode: 0o600,
			owner: attr.user,
			group: 'users'
		}
	})

	;['i3statusmem.sh', 'mem.sh'].forEach(filename => {
		m.file.install(m.home(`.config/i3/${filename}`), {
			source: path.resolve(__dirname, `i3/${filename}`),
			permissions: {
				mode: 0o700,
				owner: attr.user,
				group: 'users'
			}
		})
	})
}
