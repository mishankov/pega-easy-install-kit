const basePath = "/usr/src/app";
const fs = require("fs");

const logFolders = [
  "/pega_logs",
  // '/database_logs',
];

var config = "";

logFolders.forEach((logFolder) => {
  const fullPath = basePath + logFolder;
  try {
    fs.readdirSync(fullPath)
      .filter((file) => file.endsWith(".log"))
      .forEach((file) => {
        config = config + `[[sources]]\nname = \"${file}\"\ntype = \"local:file\"\npath = \"${fullPath + "/" + file}\"\n\n`;
      });
  } catch (error) {
    console.log(`Error reading ${fullPath}: ${error.toString()}`);
  }
});

console.log("Web-tail config: ");
console.log(config);

fs.writeFileSync("/usr/src/app/dist/web-tail.config.toml", config);
