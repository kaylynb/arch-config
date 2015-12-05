'use strict'

const path = require('path')
const R = require('ramda')

const command = {
	PkgAura: require('./pkg_aura'),
	PkgPacman: require('meth/lib/command/pkg/pacman'),
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

const attributes = {
	user: 'kaylyn'
}

const meth = {
	pkg_aura: init(resource.Pkg, command.PkgAura),
	pkg: init(resource.Pkg, command.PkgPacman),
	file: init(resource.File, command.FileUnix),
	directory: init(resource.Directory, command.FileUnix),
	service: init(resource.Service, command.ServiceSystemd),
	home: x => path.join(`/home/${attributes.user}/`, x)
}

const runConfig = configPath => {
	require(`./configs/${configPath}`)(meth, attributes)
}

runConfig('yubikey')
runConfig('config-home')
runConfig('terminator')
