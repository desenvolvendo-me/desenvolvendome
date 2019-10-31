module.exports = {
    test: /\.less$/,
    use: [
        {
            loader: 'style-loader'
        },
        {
            loader: 'css-loader', // translates CSS into CommonJS
        },
        {
            loader: 'less-loader',
            options: {
                javascriptEnabled: true
            }
        }
    ]
}
