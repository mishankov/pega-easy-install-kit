const basePath = '/usr/src/app';
const fs = require('fs');

const logFolders = [
    '/pega_logs',
    // '/database_logs',
]

const config = {
    sources: []
}

logFolders.forEach(logFolder => {
    const fullPath = basePath + logFolder;
    try {
        fs.readdirSync(fullPath).forEach(file => {
            config.sources.push({
                "name": file,
                "type": "local:file",
                "path": fullPath + '/' + file,
            });
        });
    } catch (error) {
        console.log(`Error reading ${fullPath}: ${error.toString()}`);
    }
    
});

console.log("Web-tail config: ")
console.log(JSON.stringify(config, null, 2))

fs.writeFileSync('/usr/src/app/dist/web-tail.config.json', JSON.stringify(config, null, 2));
