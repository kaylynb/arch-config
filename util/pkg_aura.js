'use strict'

const Pkg = require('meth/lib/command/pkg/')
const exec = require('meth/lib/util/exec')

module.exports = class PkgAura extends Pkg {
	isInstalled (packageName) {
		return exec.status(`aura -Ai ${exec.escape(packageName)}`)
	}

	install (packageName) {
		exec.run(`aura -A --noconfirm ${exec.escape(packageName)}`)
	}

	remove (packageName) {
		exec.run(`aura -Rs --noconfirm ${exec.escape(packageName)}`)
	}
}
