// This is to demo the async feature in nodejs.
const fs = require('fs')

let content
console.log("sync--------Start")
try {
  content = fs.readFileSync('README1', 'utf-8')
} catch (ex) {
  console.log(ex)
}
console.log(content)
console.log("sync--------End")
console.log("##################")
console.log("async--------Start")
fs.readFile('LICENSE1', 'utf-8', function (err, content) {
  if (err) {
    return console.log(err)
  }
  console.log(content)  
})
console.log("async--------End")