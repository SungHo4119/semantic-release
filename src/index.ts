import axios from "axios";
import express from "express";

const app = express();
const PORT = process.env.PORT || 3000;

app.get("/", (req, res) => {
  res.status(200).json({ response: "OK" });
});

app.get("/serviceB", async (req, res) => {
  const serviceBUrl = process.env.SERVICE_B_URL;
  try {
    const response = await axios.get(serviceBUrl + "/data");
    const result = response.data;
    console.log("Service B response:", result);
    res.status(200).json({ response: result });
  } catch (error) {
    console.error("Error calling Service B");
    console.log(error);
    res.status(500).json({ response: "error" });
  }
});

app.listen(PORT, () => {
  console.log(`Service is running on port ${PORT}`);
});
