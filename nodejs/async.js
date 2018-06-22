// This is to demo the async feature in nodejs.
const fs = require('fs')

let content
console.log("sync--------Start")
try {
  content = fs.readFileSync('README1', 'utf-8')
  console.log(content)
} catch (ex) {
  console.log("sync err-"+ex)
}

console.log("sync--------End")
console.log("async--------Read---Start")
fs.readFile('LICENSE1', 'utf-8', function (err, content) {
  if (err) {
    return console.log("async read err-"+err)
  }
  console.log(content)  
})
console.log("async--------Read---End")
console.log("async--------Write---Start")
fs.writeFile('target.txt', 'a witty message', function (err) {
if (err) {
	return console.log("async write err-"+err)
}
	console.log("File saved!")
})
console.log("async--------Write---End")