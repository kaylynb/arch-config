'use strict'

const exec = require('meth/lib/util/exec')
const path = require('path')

module.exports = (m, a, u) => {
	// TODO: workaround for removing the replaced packages without checking for dependencies.
	// We're re-installing the infinality versions below
	m.pkgNodep.remove('freetype2')
	m.pkgNodep.remove('fontconfig')
	m.pkgNodep.remove('cairo')
	m.pkg.install('ttf-hack')

	m.pkg.install('freetype2-infinality-ultimate')
	m.pkg.install('fontconfig-infinality-ultimate')
	m.pkg.install('cairo-infinality-ultimate')
	m.pkg.install('ibfonts-meta-extended')

	exec.status('echo 1 | fc-presets set')

	m.file.install('/etc/fonts/conf.avail.infinality/combi/60-latin-combi.conf', {
		source: path.join(__dirname, 'combi/60-latin-combi.conf'),
		permissions: {
			mode: 0o644,
			owner: 'root',
			group: 'root'
		}
	})
}
