'use strict'

const path = require('path')

module.exports = (m, a, u) => {
	m.pkg_aura.install('xf86-input-mtrack-git')

	m.file.install('/etc/X11/xorg.conf.d/01-mtrack-touchpad.conf', {
		source: path.resolve(__dirname, '01-mtrack-touchpad.conf'),
		permissions: {
			mode: 0o644,
			owner: 'root',
			group: 'root'
		}
	})

	// Install dispad from AUR archive for now
	// https://raw.githubusercontent.com/aur-archive/dispad-git/master/PKGBUILD

	m.file.remove(u.home('.xprofile.d/dispad'))
		// source: path.resolve(__dirname, 'xprofile.d/dispad'),
		// permissions: u.mode(0o500)
	// })
}
