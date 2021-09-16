require('dotenv').config()

const appConfig = {
    environment: process.env.NODE_ENV,
    db: {
        development: {
            username: process.env.DB_USERNAME,
            password: process.env.DB_PASSWORD,
            database: process.env.DB_DEV,
            host: process.env.DB_HOST,
            dialect: process.env.DB_DIALECT,
        },
        test: {
            username: process.env.DB_USERNAME,
            password: process.env.DB_PASSWORD,
            database: process.env.DB_TEST,
            host: process.env.DB_HOST,
            dialect: process.env.DB_DIALECT,
        },
        production: {
            username: process.env.DB_USERNAME,
            password: process.env.DB_PASSWORD,
            database: process.env.DB_PROD,
            host: process.env.DB_HOST,
            dialect: process.env.DB_DIALECT,
        }
    }
}

module.exports = appConfig