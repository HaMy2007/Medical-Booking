const mongoose = require('mongoose');
const Schema = mongoose.Schema;

const UserSchema = new Schema(
    {
        id: { type: mongoose.Schema.Types.ObjectId, require: true },
        name: { type: String, required: true },
        role: {
            type: String,
            enum: ['doctor', 'patient', 'admin'], 
            required: true
        },
        gender: { type: String, enum: ['Nam', 'Nữ', 'Khác'], required: true },
        phone_number: { type: String, required: true },
        address: { type: String },
        date_of_birth: { type: Date, required: true },
        password_hash: { type: String, }
    },
    {
        timestamps: true
    }
);

module.exports = mongoose.model('users', UserSchema);


