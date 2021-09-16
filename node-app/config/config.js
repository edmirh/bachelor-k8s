const appConfig = require("./index")

module.exports = {
  development: appConfig.db.development,
  test: appConfig.db.test,
  production: appConfig.db.production
}
