const userService = require('../services/user.service')
const createError = require("http-errors");

const getUsers = async(req, res, next) => {
    try {
        const users = await userService.getAllUsers()
        res.json(users)
    } catch(err) {
        res.status(400).send("Bad request")
        throw createError(400, {
            message: "Bad request",
            error: err
        })
    }
}

const getUserById = async(req, res) => {
    const { id } = req.params

    try {
        const user = await userService.getUserById(id)
        res.json(user)
    } catch(err) {
        res.status(400).send(err.message)
        throw createError(400, {
            message: "Bad request",
            error: err
        })
    }
}

const createUser = async(req, res) => {
    const user = req.body

    try {
        const response = await userService.createUser(user)
        res.json(response)
    } catch(err) {
        res.status(400).send("Bad request")
        throw createError(400, {
            message: "Bad request",
            error: err
        })
    }
}

const deleteUsers = async(req, res) => {
    try {
        await userService.deleteAllUsers()
        res.send("Successfully deleted")
    } catch(err) {
        res.status(400).send("Bad request")
        throw createError(400, {
            message: "Bad request",
            error: err
        })
    }
}

module.exports = {
    getUsers,
    getUserById,
    createUser,
    deleteUsers
}