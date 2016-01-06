'use strict'

const path = require('path')

module.exports = (m, a, u) => {
	m.pkg.install('nvidia-libgl')
	m.pkg.install('nvidia')

	m.file.install('/etc/X11/xorg.conf.d/20-nvidia.conf', {
		source: path.resolve(__dirname, '20-nvidia.conf'),
		permissions: {
			mode: 0o644,
			owner: 'root',
			group: 'root'
		}
	})
}
