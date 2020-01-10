Rails.application.config.session_store :redis_store, {
    servers: [
        { host: "0.0.0.0", port: 6379, db: 1 },
    ],
    key: '_devise_session_key'
}