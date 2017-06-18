#!/usr/bin/node

const fs = require('fs'),
      http = require('http'),
      querystring = require('querystring');


if (process.argv[2] !== '' )
{
    var postData = querystring.stringify({
        'pubkey' : process.argv[2]
    });

    var options = {
      host: '52.59.205.23',
      path: '/pubkey',
      method: 'POST',
      headers: {
          'Content-Type': 'application/x-www-form-urlencoded',
          'Content-Length': postData.length
      }
    };

    callback = function(response) {
      var str = '';

      //another chunk of data has been recieved, so append it to `str`
      response.on('data', function (chunk) {
        str += chunk;
      });

      //the whole response has been recieved, so we just print it out here
      response.on('end', function () {
        if (str && str != '') {
            const user = JSON.parse(str);
            const userId = user._id,
                  pubKey = user.pubkey;

            process.stdout.write(`command="/etc/scripts/access-check.sh --userId=${ userId }",no-user-rc,no-X11-forwarding,no-agent-forwarding,no-pty ${ pubKey }` + `\n`);
        }else{
            process.exit(-1);
        }
      });
    }

    var req = http.request(options, callback).end();

    req.write

}else{
    process.exit(-1);
}

