'use strict'

const PkgPacman = require('meth/lib/command/pkg/pacman')
const exec = require('meth/lib/util/exec')

module.exports = class PkgAura extends PkgPacman {
	install (packageName) {
		exec.run(`aura -Aa --noconfirm ${exec.escape(packageName)}`)
	}
}
