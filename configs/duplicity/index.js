'use strict'

const tpl = require('../../util/tpl')
const path = require('path')

module.exports = (m, a, u) => {
	m.pkg.install('duplicity')
	m.pkg_aur.install('python2-pydrive')
}
