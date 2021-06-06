const waitTime = 5000;
const waitInterval = 500;
let currentTime = 0;

const incTime = () => {
    currentTime += waitInterval;
    const p = Math.floor((currentTime / waitTime) * 100);
    process.stdout.clearLine();
    process.stdout.cursorTo(0);
    process.stdout.write(`waiting ... ${p}%`);
}

console.log(`setting a ${waitTime / 1000} second delay`);

const timerFinished = () => {
    // This is to clear the interval function from async queue
    clearInterval(interval);
    process.stdout.clearLine();
    process.stdout.cursorTo(0);
    console.log("done");
}

let interval = setInterval(incTime, waitInterval);
console.log(interval);
setTimeout(timerFinished, waitTime);