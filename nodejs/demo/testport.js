var net = require('net');

if (process.argv[2]) {
	var server = net.createServer(function(socket) {
		socket.write('Echo server\r\n');
		socket.write('Type something to disconnect...\r\n');
		//socket.pipe(socket);
		socket.on('data', function(data){
			console.log(data);
			var textChunk = data.toString('utf8');
			console.log(textChunk);
			console.log("Disconnecting client connection.");
			socket.destroy();
		});		
	});
    console.log("Listen to port: " + process.argv[2]);
	server.listen(process.argv[2], '0.0.0.0');
} else {
	console.log("Command: node socket.js <portnumber>");
}	
