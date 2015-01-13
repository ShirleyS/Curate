

var oauth = ChromeExOAuth.initBackgroundPage({
  'request_url': <OAuth request URL>,
  'authorize_url': <OAuth authorize URL>,
  'access_url': <OAuth access token URL>,
  'consumer_key': <OAuth consumer key>,
  'consumer_secret': <OAuth consumer secret>,
  'scope': <scope of data access, not used by all OAuth providers>,
  'app_name': <application name, not used by all OAuth providers>
});  



oauth.authorize(function() {
  // ... Ready to fetch private data ...
});



function onAuthorized() {
  var url = 'https://docs.google.com/feeds/default/private/full';
  var request = {
    'method': 'POST',
    'headers': {
      'GData-Version': '3.0',
      'Content-Type': 'application/atom+xml'
    },
    'parameters': {
      'alt': 'json'
    },
    'body': 'Data to send'
  };

  // Send: POST https://docs.google.com/feeds/default/private/full?alt=json
  oauth.sendSignedRequest(url, callback, request);
};



unction stringify(parameters) {
  var params = [];
  for(var p in parameters) {
    params.push(encodeURIComponent(p) + '=' +
                encodeURIComponent(parameters[p]));
  }
  return params.join('&');
};

function onAuthorized() {
  var method = 'POST';
  var url = 'https://docs.google.com/feeds/default/private/full';
  var params = {'alt': 'json'};

  var xhr = new XMLHttpRequest();
  xhr.onreadystatechange = function(data) {
    callback(xhr, data);
  };
  xhr.open(method, url + '?' + stringify(params), true);
  xhr.setRequestHeader('GData-Version', '3.0');
  xhr.setRequestHeader('Content-Type', 'application/atom+xml');
  xhr.setRequestHeader('Authorization', oauth.getAuthorizationHeader(url, method, params));

  xhr.send('Data to send');
};