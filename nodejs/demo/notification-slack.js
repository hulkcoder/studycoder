
// This is a nodejs script to send message to slack release channel, via incoming webhook.

// Constant
var weekday = new Array(7);
weekday[0] =  "Sunday";
weekday[1] = "Monday";
weekday[2] = "Tuesday";
weekday[3] = "Wednesday";
weekday[4] = "Thursday";
weekday[5] = "Friday";
weekday[6] = "Saturday";

var monthname = new Array(12);
monthname[0] = "January";
monthname[1] = "February";
monthname[2] = "March";
monthname[3] = "April";
monthname[4] = "May";
monthname[5] = "June";
monthname[6] = "July";
monthname[7] = "August";
monthname[8] = "September";
monthname[9] = "October";
monthname[10] = "November";
monthname[11] = "December";

var gate = new Array(4);
gate[0] = "Product Deployment Kick Off";
gate[1] = "Product Deployment In Progress";
gate[2] = "Product Deployment Completed";
gate[3] = "Product Deployment Sign Off";

var remark = new Array(5);
remark[0] = "We will continue to provide updates throughout the release. Please post your question to <https://release.slack.com/messages/K7G8220KM|#release> directly if you have any questions.";
remark[1] = "We will continue to provide updates throughout the release. Please post your question to <https://release.slack.com/messages/K7G8220KM|#release> directly if you have any questions.";
remark[2] = "We will continue to provide updates throughout the release. Please post your question to <https://release.slack.com/messages/K7G8220KM|#release> directly if you have any questions.";
remark[3] = "Release completed. Please post your question to <https://release.slack.com/messages/K7G8220KM|#release> directly if you have any questions.";
remark[4] = "Partial Release completed. Only 'Bug 1' fix are included in this release. Please post your question to <https://release.slack.com/messages/K7G8220KM|#release> directly if you have any questions.";


const argv = require('minimist')(process.argv.slice(2));
const current = new Date();

if (!argv.title) {
	console.log("--title value missing. Example: --title 'Feature 1 + Help Update'");
	process.exit();
}	

if (!argv.version) {
	console.log("--version value missing. Example: --version 10.1.0");
	process.exit();
}	

if (!argv.mclass) {
	console.log("--mclass value missing. Example: --mclass automation,services");
	process.exit();	
}

if (!argv.detailurl) {
	console.log("--detailurl value missing. Example: --detailurl https://confluence.release.com");
	process.exit();	
}

if (argv.gate) {	
	if (argv.gate > 0 && argv.gate <= 4) {
		postToInternalWebHookSlack();
	} else {
		console.log("--gate value is between 1 to 4");		
	}
} else {
    if (argv.mode) {
        postToInternalWebHookSlack();
    } else {
	   console.log("--gate value missing. Example: --gate [1 or 2 or 3 or 4]");	
    }
}

if (!argv.starttime) {
    argv.starttime = "10.00pm UTC";
    console.log("Set to default: 10.00pm UTC");
}

function postToInternalWebHookSlack() {
    var currentgate = gate[argv.gate - 1];
    var d = weekday[current.getDay()-1]+", "+monthname[current.getMonth()]+" "+(current.getDate()-1)+", "+current.getFullYear()+" "+argv.starttime;
    var epochts = Math.round(current.getTime() / 1000);
    var version = "Release App " + argv.version + ": Release.";
    var subject = "Release App: Deploy " + argv.version + " - GATE" + (argv.gate) + ": " + currentgate + " - '" + argv.title + "'";
    var gatenumber = argv.gate;
    var gateremark = remark[argv.gate - 1];
    //var gateremark = remark[4];

    if (argv.mode === "test") {
        currentgate = "Product Deployment <Status>";
        d = "<Day of Week>, <Month> <Day>, <Year>";        
        subject = argv.title;
        gatenumber = "<Number>";
    }

    console.log("Message Heading: " + subject);
    console.log("Date: "+d);
    console.log("Epoch: "+epochts);
    console.log("Version: "+version);
    console.log("Gate: "+gatenumber);
    console.log("Gate Status: "+currentgate);
    console.log("Machine Class: "+argv.mclass);
    console.log("Detail Url: "+argv.detailurl);
    console.log("Gate Remark: " + gateremark);

	var unirest = require('unirest');
	unirest.post('https://hooks.slack.com/services/KRNDP9ARE/YUFB6KU6K/tWFQYri9p1YnOnI6yDMqbzya')
	.headers({'Accept': 'application/json', 'Content-Type': 'application/json'})
	.send({"attachments": [
		{
			"fallback": "Required plain-text summary of the attachment.",
			"color": "#36a64f",
			"pretext": subject,
			"title": "Release Notice - Release 10.1.0",
			"text": version,			
            	"fields": [
                	{
                    	"title": "Date",
                    	"value": d,
                    	"short": false					
                	},
                	{
                    	"title": "Current Status: ",
                    	"value": currentgate,
                    	"short": false					
                	},
                	{
                    	"title": "Gate: ",
                    	"value": gatenumber,
                    	"short": false					
                	},				
                	{
                    	"title": "Affected Hosttypes: ",
                    	"value": argv.mclass,
                    	"short": false	
                	},
                	{
                    	"title": "Notes: ",
                    	"value": "The following are the high level Gates and Milestones",
                    	"short": false	
                	},
                	{
                    	"title": "Gate 1: Product Deployment Kick Off",
                    	"value": "Application is accessible, no impact expected.",
                    	"short": false	
                	},
                	{
                    	"title": "Gate 2: Product Deployment In Progress",
                    	"value": "Code deployment to impacted hosts, services are restarted on impacted hosts.",
                    	"short": false	
                	},
                	{
                    	"title": "Gate 3: Product Deployment Completed",
                    	"value": "QA testing kickoff, application support verification kickoff.",
                    	"short": false	
                	},				
                	{
                    	"title": "Gate 4: Product Deployment Sign Off",
                    	"value": "QA sign off, Application Support sign off.",
                    	"short": false	
                	},
                	{
                    	"title": "Remarks:",
                    	"value": gateremark,
                    	"short": false	
                	},
                	{
                    	"title": "Detailed Release Plan:",
                    	"value": argv.detailurl,
                    	"short": false	
                	}				
				],
            	"ts": epochts
    	}]
	})
	.end(function (response) {
  		console.log(response.body);
	});
}
