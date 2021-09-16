const express = require('express');
const userController = require('../controllers/user.controller')
const userRoutes = express.Router();
const asyncHandler = require('express-async-handler')

userRoutes.get("/", asyncHandler(userController.getUsers))
userRoutes.post("/", asyncHandler(userController.createUser))
userRoutes.delete("/", asyncHandler(userController.deleteUsers))
userRoutes.get("/:id", asyncHandler(userController.getUserById))

module.exports = userRoutes;
