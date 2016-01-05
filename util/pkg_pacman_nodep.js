'use strict'

const PkgPacman = require('meth/lib/command/pkg/pacman')
const exec = require('meth/lib/util/exec')

// TODO: figure out how to do this sort of thing in meth. Just a workaround here now
module.exports = class PkgAura extends PkgPacman {
	remove (packageName) {
		exec.run(`pacman -Rdd --noconfirm ${exec.escape(packageName)}`)
	}
}
