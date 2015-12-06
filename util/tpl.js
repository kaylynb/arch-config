'use strict'

const nunjucks = require('nunjucks')

nunjucks.configure({
	autoescape: false,
	throwOnUndefined: true
})

module.exports = nunjucks
