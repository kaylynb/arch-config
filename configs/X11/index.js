'use strict'

const exec = require('meth/lib/util/exec')
const tpl = require('../../util/tpl')
const path = require('path')

module.exports = (m, a, u) => {
	m.pkg.install('xorg-server')
	m.pkg.install('xorg-server-utils')

	// TODO: Convert this to a script resource in the future?
	exec.run('localectl --no-convert set-x11-keymap us pc105 colemak')

	if (a.X11 && a.X11.displaySize) {
		m.file.install('/etc/X11/xorg.conf.d/90-monitor-scale.conf', {
			content: tpl.render(
				path.resolve(__dirname, '90-monitor-scale.conf'),
				a.X11
			),
			permissions: {
				mode: 0o644,
				owner: 'root',
				group: 'root'
			}
		})
	}

	if (a.X11 && a.X11.leftHandedMouse) {
		m.file.install('/etc/X11/xorg.conf.d/10-left-handed-mouse.conf', {
			source: path.resolve(__dirname, '10-left-handed-mouse.conf'),
			permissions: {
				mode: 0o644,
				owner: 'root',
				group: 'root'
			}
		})
	}
}
