import express from "express";
export async function main() {
  console.log("Hello, world!");
}

const PORT = process.env.PORT || 3000;

// Create an express app

const app = express();

// Add a route

app.get("/", (req, res) => {
  res.send("Hello, world!");
});

// Start the server

app.listen(PORT, () => {
  console.log("Server is running on http://localhost:3000");
});
