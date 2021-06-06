console.log(process.argv);

const grab = flag => {
    let indexAfterFlag = process.argv.indexOf(flag) + 1;
    return process.argv[indexAfterFlag];
}

const user = grab("--user"); 
console.log(user);
console.log(`${user}`);