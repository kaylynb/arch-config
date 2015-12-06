'use strict'

const path = require('path')

module.exports = (m, a, u) => {
	m.pkg.install('gnupg')
	m.pkg.install('openssh')

	m.directory.install(u.home('.gnupg'), {
		permissions: u.mode(0o700)
	})

	m.file.install(u.home('.gnupg/gpg.conf'), {
		source: path.resolve(__dirname, 'gpg.conf'),
		permissions: u.mode(0o400)
	})

	m.file.install(u.home('.gnupg/gpg-agent.conf'), {
		source: path.resolve(__dirname, 'gpg-agent.conf'),
		permissions: u.mode(0o400)
	})

	m.file.install(u.home('.gnupg/sshcontrol'), {
		content: `${a.gpg.sshKeygrip}\n`,
		permissions: u.mode(0o400)
	})

	m.file.install(u.home('.xprofile.d/gpg-agent'), {
		source: path.resolve(__dirname, 'gpg-agent'),
		permissions: u.mode(0o500)
	})
}
