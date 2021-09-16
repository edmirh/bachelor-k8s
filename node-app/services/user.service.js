const db = require("../db/models")

const getAllUsers = async() => {
    return await db.User.findAll().catch(console.log)
}

const getUserById = async(id) => {
    return await db.User.findOne({where: {id}})
}

const createUser = async(user) => {
    return await db.User.create(user).catch(console.log)
}

const deleteAllUsers = async() => {
    return db.User.destroy({
        where: {},
        truncate: true
      }).catch(console.log)
}

module.exports = {
    getAllUsers,
    getUserById,
    createUser,
    deleteAllUsers
}