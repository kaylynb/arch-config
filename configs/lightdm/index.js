'use strict'

module.exports = (m, a, u) => {
	m.pkg.install('lightdm')
	m.pkg.install('lightdm-gtk-greeter')

	m.service.enable('lightdm')
}
