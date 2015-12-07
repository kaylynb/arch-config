'use strict'

const exec = require('meth/lib/util/exec')

module.exports = (m, a, u) => {
	m.pkg.install('xorg-server')
	m.pkg.install('xorg-server-utils')

	// TODO: Convert this to a script resource in the future?
	exec.run('localectl --no-convert set-x11-keymap us pc105 colemak')
}
