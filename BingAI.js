const headers = $request.headers;

if (headers["user-agent"].includes("Mobile")) {
  delete headers["user-agent"];
  delete headers["sec-ch-ua-full-version"];
  delete headers["sec-ch-ua-full-version-list"];
  let ua = 'iPhone';

  headers['User-Agent'] = `Mozilla/5.0 (iPhone; CPU iPhone OS 17_0_2 like Mac OS X) AppleWebKit/605.1.15 (KHTML, like Gecko) Version/17.0.2 Mobile/15E148 Safari/605.1.15 BingSapphire/1.0.410926003`;
  headers['sec-ch-ua'] = '"Chromium";v="110", "Not A(Brand";v="24", "Microsoft Edge";v="110"'
  headers['sec-ch-ua-mobile'] = '?0'
  headers['sec-ch-ua-platform'] = 'macOS'

  $done({ headers });
} else {
  delete headers["user-agent"];
  headers['User-Agent'] = `Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/114.0.0.0 Safari/537.36 Edg/114.0.1823.51`;

  $done({ headers });
}
