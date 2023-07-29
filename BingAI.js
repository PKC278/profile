const headers = $request.headers;
console.log(headers);

if (headers["user-agent"].includes("Mobile")) {
  console.log("User-Agent contains 'Mobile'. Skipping the code.");
  $done({ headers });
} else {
  delete headers["user-agent"];
  headers['User-Agent'] = `Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/114.0.0.0 Safari/537.36 Edg/114.0.1823.51`;

  $done({ headers });
}
