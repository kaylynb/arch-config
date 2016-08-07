'use strict'

const path = require('path')

module.exports = (m, a, u) => {
	m.pkg.install('nvidia-libgl')
	m.pkg.install('nvidia')
	m.pkg.install('nvidia-settings')

	m.file.install('/etc/X11/xorg.conf.d/20-nvidia.conf', {
		source: path.resolve(__dirname, '20-nvidia.conf'),
		permissions: {
			mode: 0o644,
			owner: 'root',
			group: 'root'
		}
	})

	// Need to set metamodes at login instead of XORG conf due to bug in nvidia drivers
	// See: https://devtalk.nvidia.com/default/topic/950647/linux/black-screen-with-367-35/
	m.file.install(u.home('.xprofile.d/nvidia-metamode-set'), {
		source: path.resolve(__dirname, 'xprofile.d/nvidia-metamode-set'),
		permissions: u.mode(0o500)
	})
}
