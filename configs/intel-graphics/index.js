'use strict'

module.exports = (m, a, u) => {
	m.pkg.install('mesa-libgl')
	m.pkg.install('xf86-video-intel')
	m.pkg.install('libva-intel-driver')
}
