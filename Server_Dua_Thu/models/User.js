const mongoose = require("mongoose");

const userSchema = new mongoose.Schema({
    Username: String,
    Password:  String,
    Avatar:  String,
    Email:  String,
    Active: Boolean,
    RegisterDate: Date
});

module.exports = mongoose.model("User", userSchema);