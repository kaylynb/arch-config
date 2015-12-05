'use strict'

const path = require('path')

module.exports = meth => {
	meth.pkg.install('terminator')

	meth.file.install('/home/kaylyn/.config/terminator/config', {
		source: path.resolve(__dirname, 'config'),
		permissions: {
			mode: 0o644,
			owner: 'kaylyn',
			group: 'users'
		}
	})
}
