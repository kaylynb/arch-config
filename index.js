'use strict'

const path = require('path')
const R = require('ramda')
const os = require('os')

const command = {
	PkgAura: require('./util/pkg_aura'),
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


const attributes = require(`./${os.hostname()}.json`)

const meth = {
	pkg_aura: init(resource.Pkg, command.PkgAura),
	pkg: init(resource.Pkg, command.PkgPacman),
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
runConfig('yubikey')
runConfig('X11')
runConfig('lightdm')
runConfig('compton')
runConfig('i3')
runConfig('terminator')
