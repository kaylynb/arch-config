'use strict'

module.exports = (m, a, u) => {
	// TODO: workaround for removing the replaced packages without checking for dependencies.
	// We're re-installing the infinality versions below
	m.pkgNodep.remove('freetype2')
	m.pkgNodep.remove('fontconfig')
	m.pkgNodep.remove('cairo')

	m.pkg.install('freetype2-infinality-ultimate')
	m.pkg.install('fontconfig-infinality-ultimate')
	m.pkg.install('cairo-infinality-ultimate')
	m.pkg.install('ibfonts-meta-extended')
}
