const {environment} = require('@rails/webpacker')
const webpack = require('webpack')
const less = require('./loaders/less')

environment.loaders.prepend('less', less)

environment.plugins.append("Provide", new webpack.ProvidePlugin({
    $: 'jquery',
    jQuery: 'jquery',
    Popper: ['popper.js', 'default'],
    noUiSlider: "nouislider"
}))

module.exports = environment
