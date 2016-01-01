'use strict'

const path = require('path')
const tpl = require('../../util/tpl')

module.exports = (m, a, u) => {
	m.pkg.install('git')

	m.directory.install(u.home('.config/git'), {
		permissions: u.mode(0o700)
	})

	m.file.install(u.home('.config/git/config'), {
		content: tpl.render(
			path.resolve(__dirname, 'config'),
			{
				git: a.git,
				gpg: a.gpg
			}
		),
		permissions: u.mode(0o600)
	})
}
