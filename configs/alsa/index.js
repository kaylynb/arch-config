'use strict'

const path = require('path')

module.exports = (m, a, u) => {
	m.pkg.install('alsa-utils')

	if(a.alsa && a.alsa.disableIntelHdmi) {
		m.file.install('/etc/modprobe.d/disable-intel-hdmi-sound.conf', {
			source: path.resolve(__dirname, 'disable-intel-hdmi-sound.conf'),
			permissions: {
				mode: 0o644,
				owner: 'root',
				group: 'root'
			}
		})
	}
}
