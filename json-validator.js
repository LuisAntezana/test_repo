const fs = require('fs')
const Ajv = require("ajv")
const argv = require('minimist')(process.argv.slice(2));
const ajv = new Ajv({
  allErrors: true
})

const schemaFile = argv["schema"];
const jsonFile = argv["json"];

if (!fs.existsSync(schemaFile)) {
  console.log(`The json schema file "${schemaFile}" was not found!`);
  process.exit(1);
}

if (!fs.existsSync(jsonFile)) {
  console.log(`The json file to validate "${jsonFile}" was not found!`);
  process.exit(1);
}

var schema = JSON.parse(fs.readFileSync(schemaFile));
var data = JSON.parse(fs.readFileSync(jsonFile));

const validate = ajv.compile(schema)

const valid = validate(data)
if (!valid) {
  console.log(ajv.errorsText(validate.errors));
  process.exit(1);
} else console.log("valid!");
