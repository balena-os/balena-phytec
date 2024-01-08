deviceTypesCommon = require '@resin.io/device-types/common'
{ networkOptions, commonImg, instructions } = deviceTypesCommon

module.exports =
	version: 1
	slug: 'phyboard-lyra-am62xx-2'
	aliases: [ 'phyboard-lyra-am62xx-2' ]
	name: 'phyBOARD-AM62x'
	arch: 'aarch64'
	state: 'released'

	instructions: commonImg.instructions
	gettingStartedLink:
		windows: 'https://www.balena.io/docs/learn/getting-started/phyboard-lyra-am62xx-2/nodejs/'
		osx: 'https://www.balena.io/docs/learn/getting-started/phyboard-lyra-am62xx-2/nodejs/'
		linux: 'https://www.balena.io/docs/learn/getting-started/phyboard-lyra-am62xx-2/nodejs/'
	supportsBlink: true

	options: [ networkOptions.group ]

	yocto:
		machine: 'phyboard-lyra-am62xx-2'
		image: 'balena-image-flasher'
		fstype: 'balenaos-img'
		version: 'yocto-kirkstone'
		deployArtifact: 'balena-image-flasher-phyboard-lyra-am62xx-2.balenaos-img'
		compressed: true

	configuration:
		config:
			partition:
				primary: 1
			path: '/config.json'

	initialization: commonImg.initialization
