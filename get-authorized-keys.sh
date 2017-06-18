#!/usr/bin/node

fs = require('fs');

var args = '';
var userId = 0;

process.argv.forEach((val, index) => {
    args += val + ' ---> ' + index + '\n';
});

if (process.argv[2] !== '' )
{
    userId = 1;
}


fs.writeFile('/home/ubuntu/message.txt', args, (err) => {
    if (err) throw err;
console.log('The file has been saved!');
});


process.stdout.write(`command="/etc/scripts/access-check.sh --userId=${ userId }",no-user-rc,no-X11-forwarding,no-agent-forwarding,no-pty ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABAQDQQx/XqPb6/em8fLwDCQBnCtMwevOtP4pMe43R2OyNDrUMAPxb9InZTocMDIaVV0Lir2mPTxYawMcOQlDnXT0bgECMXt5K2c2NwgUPK0obSOXZ42bA7LpcOEpUYW8SZmzR29V2R6QrUN/nBk6u6GWtvN9UGY28TzWWSh21d60tKyoyXi00IbWvzC3XaJR64GItfODxCFBv3I0JYMKk61o78N2tWFhCEp2wN7hpCM7EqbKG+nHDAGYTBqNTEWXkSAxqQB+uAH5TRfkifLae+WYF68VOxk0ncVZ4yC643YMPrUYBtoU4mu+WjCMK+np7u4QhaSjo93Z3T/lQSQ/5+uZl devran@devrans-MacBook-Pro.local` + `\n`);