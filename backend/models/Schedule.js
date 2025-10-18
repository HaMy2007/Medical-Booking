import mongoose from "mongoose";

const doctorScheduleSchema = new mongoose.Schema({
  doctor: { type: mongoose.Schema.Types.ObjectId, ref: "User", required: true },
  workDate: { type: Date, required: true },
  startTime: { type: String, required: true }, // ví dụ: "09:00"
  endTime: { type: String, required: true },
  room: { type: String },
  maxPatients: { type: Number, default: 10 },
}, { timestamps: true });

export default mongoose.model("DoctorSchedule", doctorScheduleSchema);
