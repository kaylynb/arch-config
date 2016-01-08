'use strict'

const path = require('path')
const R = require('ramda')
const os = require('os')

const command = {
	PkgAura: require('./util/pkg_aura'),
	PkgPacman: require('meth/lib/command/pkg/pacman'),
	PkgPacmanNodep: require('./util/pkg_pacman_nodep'),
	FileUnix: require('meth/lib/command/file/unix'),
	ServiceSystemd: require('meth/lib/command/service/systemd')
}

const resource = {
	Directory: require('meth/lib/resource/directory'),
	File: require('meth/lib/resource/file'),
	Pkg: require('meth/lib/resource/pkg'),
	Service: require('meth/lib/resource/service')
}

const config = {
	log (msg) {
		console.log(msg)
	},
	dryRun: false
}

const init = (resource, command) => {
	return new resource(config, new command()).getActions()
}

const hostname = os.hostname()

const attributes = R.merge(require('./default.json'), require(`./${hostname}.json`))

const meth = {
	pkg_aura: init(resource.Pkg, command.PkgAura),
	pkg: init(resource.Pkg, command.PkgPacman),
	pkgNodep: init(resource.Pkg, command.PkgPacmanNodep),
	file: init(resource.File, command.FileUnix),
	directory: init(resource.Directory, command.FileUnix),
	service: init(resource.Service, command.ServiceSystemd)
}

const util = {
	home: x => path.join('/home/kaylyn/', x),
	mode: x => { return { mode: x, owner: 'kaylyn', group: 'users' } }
}

const runConfig = configPath => {
	console.log(`Config: Begin ➜ ${configPath}`)
	require(`./configs/${configPath}`)(meth, attributes, util)
	console.log(`Config: End ➜ ${configPath}\n`)
}

runConfig('config-home')
// runConfig('libinput')
runConfig('git')
runConfig('yubikey')
runConfig('gpg')

// Install graphics drivers before X11
if (hostname === 'rho') {
	runConfig('nvidia')
}

if (hostname === 'wasat') {
	runConfig('intel-graphics')
}

runConfig('infinality')
runConfig('X11')
runConfig('lightdm')
runConfig('compton')
runConfig('i3')
runConfig('terminator')

if (hostname === 'wasat') {
	runConfig('mtrack')
	runConfig('xbindkeys')
	runConfig('tlp')
}

runConfig('sublime-text')
runConfig('firefox')
